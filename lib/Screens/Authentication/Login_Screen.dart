import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/Social_Button.dart';
import 'Password_Screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.2;
    double spacingMultiplier = 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: containerSize,
                  width: containerSize,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/logo/Logo.svg',
                    ),
                  ),
                ),
                SizedBox(height: getSpacing(context)),
                Text("Welcome to Bachay",
                    style:
                        outfitBold.copyWith(fontSize: getBigFontSize(context))),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
                Text(
                    "Please enter your email address or connect to your social accounts to continue.",
                    textAlign: TextAlign.center,
                    style: contentC5.copyWith(fontSize: getFontSize(context))),
                SizedBox(
                    height: getSpacing(context) *
                        spacingMultiplier *
                        spacingMultiplier),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email/Phone",
                      style:
                          outfitBold.copyWith(fontSize: getFontSize(context)),
                    ),
                    SizedBox(height: getSpacing(context) * spacingMultiplier),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter your Email or Phone",
                        hintStyle: contentC5.copyWith(
                            fontSize: getFontSize(context) * 1.5,
                            color: fontcolor),
                        prefixIcon: SvgPicture.asset('assets/images/sms.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
                SizedBox(
                  width: double.infinity,
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
                    child: Text("Continue",
                        style: outfitBold.copyWith(color: Colors.white)),
                  ),
                ),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
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
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(212, 212, 216, 1)),
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
                SizedBox(height: getSpacing(context) * spacingMultiplier),
                SocialButton(
                  text: "Continue as Apple",
                  icon: FontAwesomeIcons.apple,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
                SocialButton(
                  text: "Continue as Google",
                  icon: FontAwesomeIcons.google,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
                SocialButton(
                  text: "Continue as Facebook",
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: getSpacing(context) * spacingMultiplier),
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
