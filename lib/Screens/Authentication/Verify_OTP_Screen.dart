import 'package:app/Screens/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/API/Bloc/Login/Login_Bloc.dart';
import 'package:app/API/Bloc/Login/Login_Event.dart';
import 'package:app/API/Bloc/Login/Login_State.dart';
import 'package:app/Utils/app_constants.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String userId; // Accept userId as a parameter

  const OtpVerificationScreen({super.key, required this.userId});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  bool _rememberMe = false;
  int _timerSeconds = 159;
  String _timerText = "02:39";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Duration oneSecond = const Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
          _timerText =
              "${_timerSeconds ~/ 60}:${(_timerSeconds % 60).toString().padLeft(2, '0')}";
        });
        startTimer();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  // Combine the OTP values entered into one string
  String _getOtpCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  void _handleKeyEvent(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verify OTP',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We sent you an OTP to your email. Please enter the 4-digit code to verify.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      onChanged: (value) => _handleKeyEvent(index, value),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _timerText,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: _timerSeconds == 0
                        ? () {
                            // Resend OTP logic here, using widget.userId
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginRequested(widget
                                  .userId), // Trigger resend OTP using userId
                            );
                          }
                        : null, // Disable button until timer finishes
                    child: const Text(
                      'Resend',
                      style: TextStyle(color: buttonColorPurple),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style:
                        outfitBold.copyWith(fontSize: getFontSize(context) * 2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _submitOtpButton(context), // Add the submit button for OTP
            ],
          ),
        ),
      ),
    );
  }

  // BLoC-integrated OTP Submit Button
  Widget _submitOtpButton(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          // Handle OTP success, maybe navigate to another screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('OTP Verified Successfully!')),
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (state is OtpFailure) {
          // Show error if OTP verification failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state is! OtpLoading
                ? () {
                    // Combine the OTP input fields into one string and dispatch the LoginOtpRequested event
                    final otpCode = _getOtpCode();

                    if (otpCode.length == 4) {
                      print("I am here");
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginOtpRequested(
                            otpCode, widget.userId), // Use userId from widget
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter a valid 4-digit OTP')),
                      );
                    }
                  }
                : null, // Disable button while loading
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: state is OtpLoading
                ? CircularProgressIndicator(color: Colors.white)
                : const Text(
                    "Verify OTP",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
          ),
        );
      },
    );
  }
}
