import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/Social_Button.dart';
import 'Password_Screen.dart';
import 'SignUp_Screen.dart';
import 'Verify_OTP_Screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/logo/Logo.svg',
                    ),
                  ),
                ),
                SizedBox(height: getSpacing(context)*2),
                 Text(
                  "Welcome to Bachay",
                    style: outfitBold.copyWith(fontSize: getBoldFontSize(context)*2)
                ),
                SizedBox(height: getSpacing(context)*2),
                const Text(
                  "Please enter your email address or connect to your social accounts to continue.",
                  textAlign: TextAlign.center,
                  style: contentC5
                ),
                SizedBox(height: getSpacing(context)*2*2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email/Phone", style: outfitBold,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter your Email or Phone",
                        hintStyle:contentC5.copyWith(fontSize:getFontSize(context)*1.5,color:fontcolor),      
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSpacing(context)*2),
                SizedBox(
                  width: double.infinity, // Set the width to match the TextField
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:  Text(
                      "Continue",
                      style: outfitBold.copyWith(color: Colors.white) 
                    ),
                  ),
                ),
                SizedBox(height: getSpacing(context)*2),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: const Divider(
                          color: Color.fromRGBO(212, 212, 216, 1),
                          height: 30,
                        ),
                      ),
                    ),
                    const Text(
                      "Or Joined With",
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(212, 212, 216, 1)),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: const Divider(
                          color: Color.fromRGBO(212, 212, 216, 1),
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSpacing(context)*2),
                SocialButton(
                  text: "Continue as Apple",
                  icon: FontAwesomeIcons.apple,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context)*2),
                SocialButton(
                  text: "Continue as Google",
                  icon: FontAwesomeIcons.google,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context)*2),
                SocialButton(
                  text: "Continue as Facebook",
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context)*2),
                const Text(
                  "By clicking Continue, you agree to WHM Terms of Use and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: contentC5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



