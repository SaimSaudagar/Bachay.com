import 'package:app/Screens/Home/Homepage.dart';
import 'package:app/Screens/Onboarding/Loading_Screen.dart';
import 'package:app/Screens/Product/All_Producst_Screen.dart';
import 'package:app/Screens/Product/Category_Screen.dart';
import 'package:app/Screens/Product/Single_Products_Screen.dart';
import 'package:flutter/material.dart';
import 'Screens/Profile/Profile_Initial.dart';

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
      home: HomePage(),
    );
  }
}
