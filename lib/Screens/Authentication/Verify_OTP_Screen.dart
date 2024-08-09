import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils/app_constants.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

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
                'We send you OTP to your email please enter 4 digit code to verify.',
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
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't Receive Code?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                Text(
                  _timerText,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Resend OTP code logic here
                  },
                  child: const Text('Resend', style:TextStyle(color:buttonColorPurple) ), 
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
                  style: outfitBold.copyWith(fontSize: getFontSize(context)*2),
                ),
              ],
            ),
          ],
        ),
      ),
    ),);
  }
}
