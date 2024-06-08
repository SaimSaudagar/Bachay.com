import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OtpVerificationScreen(),
    );
  }
}

class OtpVerificationScreen extends StatefulWidget {
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
    Duration oneSecond = Duration(seconds: 1);
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
              Text(
                'Verify OTP',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We send you OTP to your email please enter 4 digit code to verify.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 40,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
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
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't Receive Code?",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Text(
                  _timerText,
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Resend OTP code logic here
                  },
                  child: Text('Resend'),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    ),);
  }
}
