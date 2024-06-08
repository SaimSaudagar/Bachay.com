import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SignUp_Screen.dart';
import 'Verify_OTP_Screen.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                'Enter Password',
                style: outfitBold.copyWith(fontSize: getBoldFontSize(context)*2),
              ),
               SizedBox(height: getSpacing(context)),
               Text(
                'Please enter your password.',
                style: contentC5.copyWith(fontSize:getFontSize(context)*1.5)
              ),
               SizedBox(height: getSpacing(context)),
              Align(
  alignment: Alignment.centerLeft,
  child: Text('Email', style: outfitBold)
),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'example@company.com', hintStyle: contentC5,
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
               SizedBox(height: getSpacing(context)*4),
                Align(
  alignment: Alignment.centerLeft,
  child: Text('Password', style: outfitBold)
),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Password', hintStyle: contentC5,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
               SizedBox(height: getSpacing(context)),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?',style: outfitBold),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetupAccountScreen()),
                    );},
         
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundBorderRadius),
                      ),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * buttonWidth,
                      child: Padding(
                        padding: buttonPadding,
                        child: Center(
                          child:  Text(
                            'Sign in',
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
               SizedBox(height: getSpacing(context)),
              TextButton(
                onPressed: () {
             Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
                                  );
                                },
                child: const Text(
                  'Sign in Without Password',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





