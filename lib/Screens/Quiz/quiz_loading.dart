import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/app_constants.dart';
import 'quiz_home.dart';

class QuizLoading extends StatefulWidget {
  @override
  _QuizLoadingState createState() => _QuizLoadingState();
}

class _QuizLoadingState extends State<QuizLoading> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _progress += 0.01;
        if (_progress >= 1.0) {
          timer.cancel();
          _navigateToNextScreen();
        }
      });
    });
  }

  void _navigateToNextScreen() {
    // Replace with your desired screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => QuizHome()), // Replace with your next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/logo/BACKGROUND.png',
              fit: BoxFit.cover,
            ),
          ),
          // Objects SVG covering the entire screen
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/logo/OBJECTS.svg',
              fit: BoxFit.cover,
            ),
          ),
          // Logo at the top with some padding
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05, // Adjust the top padding as needed
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(
                'assets/logo/bachay_education.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Center logo and progress bar with text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/logo/quizlogo.svg',
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                // Progress bar with percentage
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: LinearProgressIndicator(
                          value: _progress,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                          minHeight: 20, // Adjust height for a larger progress bar
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            '${(_progress * 100).round()}%',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Text below the progress bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "Discover Our Quizzes and Enjoy",
                        style: outfitBold.copyWith(fontSize: getBigFontSize(context))
                      ),
                      SizedBox(height: 8),
                      Text(
                        "join us on a journey of discovery as you unlock the secrets of the world through Bachay Quiz!",
                        style: outfitRegular.copyWith(fontSize: getBigFontSize(context)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: QuizLoading(),
  ));
}
