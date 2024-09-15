import 'package:app/API/Bloc/Login/Login_Event.dart';
import 'package:app/API/Bloc/Login/Login_State.dart';
import 'package:app/API/Bloc/Login/Login_Bloc.dart';
import 'package:app/API/Repository/Login_Repo.dart';
import 'package:app/Screens/Authentication/Verify_OTP_Screen.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/Social_Button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.2;
    double spacingMultiplier = 2;
    return BlocProvider(
      create: (context) => LoginBloc(loginRepository: LoginRepository()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getPadding(context)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logoSection(containerSize),
                  SizedBox(height: getSpacing(context)),
                  _welcomeTextSection(context),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _authTextSection(context),
                  SizedBox(
                      height: getSpacing(context) *
                          spacingMultiplier *
                          spacingMultiplier),
                  _emailInputSection(context, spacingMultiplier),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _continueButtonSection(context),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _dividerWithTextSection(),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _socialButtonSection("Continue as Apple",
                      FontAwesomeIcons.apple, Colors.white),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _socialButtonSection("Continue as Google",
                      FontAwesomeIcons.google, Colors.white),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _socialButtonSection("Continue as Facebook",
                      FontAwesomeIcons.facebook, Colors.white),
                  SizedBox(height: getSpacing(context) * spacingMultiplier),
                  _termsTextSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoSection(double containerSize) {
    return SizedBox(
      height: containerSize,
      width: containerSize,
      child: Center(
        child: SvgPicture.asset('assets/logo/Logo.svg'),
      ),
    );
  }

  Widget _welcomeTextSection(BuildContext context) {
    return Text("Welcome to Bachay",
        style: outfitBold.copyWith(fontSize: getBigFontSize(context)));
  }

  Widget _authTextSection(BuildContext context) {
    return Text(
      "Please enter your email address or connect to your social accounts to continue.",
      textAlign: TextAlign.center,
      style: contentC5.copyWith(fontSize: getFontSize(context)),
    );
  }

  Widget _emailInputSection(BuildContext context, double spacingMultiplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email/Phone",
            style: outfitBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context) * spacingMultiplier),
        TextField(
          controller: control,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black),
            ),
            hintText: "Enter your Email or Phone",
            hintStyle: contentC5.copyWith(
                fontSize: getFontSize(context), color: fontcolor),
            prefixIcon: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: SvgPicture.asset('assets/images/sms.svg'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _continueButtonSection(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to PasswordScreen if login is successful
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(
                userId: control.text,
              ),
            ),
          );
        } else if (state is LoginFailure) {
          // Show a SnackBar with the error message if login fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state is! LoginLoading
                ? () {
                    // Dispatch the LoginSubmitted event when the button is pressed
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginRequested(control.text));
                  }
                : null, // Disable the button when loading
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: state is LoginLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    "Continue",
                    style: buttonTextStyle(context),
                  ),
          ),
        );
      },
    );
  }

  Widget _dividerWithTextSection() {
    return Row(
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
        const Text("Or Join With",
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(212, 212, 216, 1))),
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
    );
  }

  Widget _socialButtonSection(String text, IconData icon, Color color) {
    return SocialButton(
      text: text,
      icon: icon,
      color: color,
      onPressed: () {},
    );
  }

  Widget _termsTextSection() {
    return const Text(
      "By clicking Continue, you agree to WHM Terms of Use and Privacy Policy.",
      textAlign: TextAlign.center,
      style: contentC5,
    );
  }
}
