import 'package:flutter/material.dart';
import 'package:app/Utils/app_constants.dart';

import '../Authentication/SignIn_Screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                  'assets/images/Shopper.png',
                  height: MediaQuery.of(context).size.height * 1,
                  // width: MediaQuery.of(context).size.width * 1,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop all Kind of\nProducts on Bachay.',
                  style: outfitBold.copyWith(
                      fontSize: getBoldFontSize(context) * 1.5),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context)),
                Text(
                  'Shop products from kids, parents, medical more of\nthese products from Bachay.',
                  style: outfitRegular.copyWith(fontSize: getFontSize(context)),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: getSpacing(context) * 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
