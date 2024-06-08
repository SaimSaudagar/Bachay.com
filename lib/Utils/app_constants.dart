import 'package:flutter/material.dart';

//Colors
const LinearGradient appGradient = LinearGradient(
  colors: [
    Color.fromRGBO(132, 93, 194, 1),
    Color.fromRGBO(209, 94, 170, 1),
    Color.fromRGBO(248, 147, 27, 1),
    Color.fromRGBO(255, 198, 95, 1),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const Color buttonColorPurple = Color.fromRGBO(132, 93, 194, 1);
const Color buttonColorPink = Color.fromRGBO(209, 94, 170, 1);
const Color fontcolor= Color.fromRGBO(212, 212, 216, 1);

//Fonts
const TextStyle interRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);

const TextStyle contentC5 = TextStyle(
  fontFamily: 'Content',
  fontWeight: FontWeight.w300,

);
const TextStyle interBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);

const TextStyle outfitRegular = TextStyle(
  fontFamily: 'Outfit',
  fontWeight: FontWeight.w400,
);

const TextStyle outfitBold = TextStyle(
  fontFamily: 'Outfit',
  fontWeight: FontWeight.w700,
);

//Functions
double getFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.025;
}

double getBoldFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.03;
}

double getSpacing(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.005;
}

double getBarWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.5;
}

double getBarHeight(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.005;
}

//Other
const double buttonPaddingValue = 16.0;
const double borderRadius = 8.0;
const double roundBorderRadius = 80.0;

const double buttonWidth = 0.9;
const double buttonHeight = 0.08;

const EdgeInsetsGeometry buttonPadding =
    EdgeInsets.symmetric(vertical: buttonPaddingValue);
const TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Outfit',
  fontWeight: FontWeight.w600,
  fontSize: 16,
);
