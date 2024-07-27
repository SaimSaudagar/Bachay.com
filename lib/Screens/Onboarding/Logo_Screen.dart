import 'package:app/Screens/Onboarding/Onboarding_Screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen1()),
          );
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double logoSize = MediaQuery.of(context).size.width * 0.2;

    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: SvgPicture.asset(
            'assets/logo/Logo.svg',
            width: logoSize,
            height: logoSize,
          ),
        ),
      ),
    );
  }
}
