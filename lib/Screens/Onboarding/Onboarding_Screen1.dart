import 'package:app/Screens/Onboarding/Onboarding_Screen2.dart';
import 'package:flutter/material.dart';
import 'package:app/Utils/app_constants.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

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
                  'assets/images/Celebrate.png',
                  height: MediaQuery.of(context).size.height * 1,
                  // width: MediaQuery.of(context).size.width * 1,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enjoy Shopping,\nParenting, Education.',
                  style: outfitBold.copyWith(
                      fontSize: getBigFontSize(context) * 1.5),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context)),
                Text(
                  'Find everything for your child\'s development and \n your parenting journey - shop, learn, connect, all \n in one place.',
                  style: outfitRegular.copyWith(fontSize: getFontSize(context)),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context) * 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const OnboardingScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundBorderRadius),
                      ),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * buttonWidth,
                      child: Padding(
                        padding: buttonPadding,
                        child: Center(
                          child: Text(
                            'Let’s Start',
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
