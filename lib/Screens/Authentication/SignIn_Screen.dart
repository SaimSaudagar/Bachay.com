import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                SizedBox(height: 20),
                Text(
                  "Welcome to Bachay",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Please enter your email address or connect to your social accounts to continue.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email/Phone"),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Enter your Email or Phone",
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Set the width to match the TextField
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
  children: <Widget>[
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
        child: const Divider(
          color: Colors.grey,
          height: 30,
        ),
      ),
    ),
    const Text(
      "Or Joined With",
      style: TextStyle(fontSize: 14, color: Colors.grey),
    ),
    Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
        child: const Divider(
          color: Colors.grey,
          height: 30,
        ),
      ),
    ),
  ],
),
                SizedBox(height: 20),
                SocialButton(
                  text: "Continue as Apple",
                  icon: FontAwesomeIcons.apple,
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                SocialButton(
                  text: "Continue as Google",
                  icon: FontAwesomeIcons.google,
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                SocialButton(
                  text: "Continue as Facebook",
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                Text(
                  "By clicking Continue, you agree to WHM Terms of Use and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
