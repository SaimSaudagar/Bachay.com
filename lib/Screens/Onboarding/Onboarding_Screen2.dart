import 'package:app/Screens/Onboarding/Onboarding_Screen3.dart';
import 'package:flutter/material.dart';
import 'package:app/Utils/app_constants.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/Planning.png',
                  height: MediaQuery.of(context).size.height * 1,
                  // width: MediaQuery.of(context).size.width * 1,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monitor Your Childs \nVaccine and Growth.',
                  style: outfitBold.copyWith(
                      fontSize: getBigFontSize(context) * 1.5),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context)),
                Text(
                  'From Vaccination monitoring and growth tracking\nto child age, height, weight and health.',
                  style: outfitRegular.copyWith(fontSize: getFontSize(context)),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context) * 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => OnboardingScreen3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundBorderRadius),
                      ),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * buttonHeight,
                      width: MediaQuery.of(context).size.width * buttonWidth,
                      child: Padding(
                        padding: buttonPadding,
                        child: Center(
                          child: Text(
                            'Next',
                            style: buttonTextStyle(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
