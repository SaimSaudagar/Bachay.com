import 'package:app/Screens/Onboarding/Loading_Screen.dart';
// import 'package:app/Screens/Onboarding/Onboarding_Screen1.dart';
// import 'package:app/Screens/Onboarding/Onboarding_Screen2.dart';
// import 'package:app/Screens/Onboarding/Onboarding_Screen3.dart';
import 'package:flutter/material.dart';
// import 'Screens/Authentication/SignIn_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
  }
}
