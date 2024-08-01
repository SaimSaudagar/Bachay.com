import 'package:flutter/material.dart';

//API
const String baseUrl = 'https://bachay.com/api/v1/';

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
const Color fontcolor = Color.fromRGBO(212, 212, 216, 1);

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

double getBigFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.04;
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

double getPadding(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.025;
}

//Other
const double buttonPaddingValue = 16.0;
const double borderRadius = 8.0;
const double roundBorderRadius = 80.0;

const double buttonWidth = 0.9;
const double buttonHeight = 0.08;

const EdgeInsetsGeometry buttonPadding =
    EdgeInsets.symmetric(vertical: buttonPaddingValue);

TextStyle buttonTextStyle(BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(context),
  );
}

const String jwtToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjYxMmEzMDVlYzlhZTQ5NjE4NzM0ZGMyZjVmMjdiNTY1MTJkMmI2ZWRhNWYxYTNmZTkxYjBhZWVjYjFkZjAwZDJhZmJmMDM4NWFjZmU0MDUiLCJpYXQiOjE3MTk0NzI4MzEuMTA4Nzg2LCJuYmYiOjE3MTk0NzI4MzEuMTA4Nzg4LCJleHAiOjE3MzUyODQwMzEuMTAxMzkyLCJzdWIiOiIyMCIsInNjb3BlcyI6W119.glMpr_q9RBK8OY-1Ut98KDdFJFJXI2-QKBiBYvKUC9ENpGc_ViN65xkAYlfpuNKHy4uFeNvLJd1xIaCO4LfQEXtLL9ayeQ8UDoH5NBGfzJlz5pububZpClZsjFnnmLC-QiJ3Wq9yeD0Sw4Yrl4Yn94cI2Tg8ad-FMXnBM2EMU5vgftj18IdK7Y1xk6lSWfXGooNfVO32GrHO6Tn8S5wcvJDcdDZQWpQX5xumrjvN42CitxWJhKPRdYWEw-hXfjGAADOb5fnm69e2u4nWkTSjvLJ9HJy8DVYEwwUPWzJ0W-qhu4HM8V8bc3toFltJk9uKtxZcFpWw-hynZAkUdb011NgOkQKRdyDeAMHqW8gFfhXQj1uoiiXLpCPr9kYyvhY8pimHNe0-h2SuXzf4T-Qza8XIiIaz1s6ITx1HPtkB_nlD5wzmFgo3BvV0LueWxjQ0wA5O0oU6UWEwWVkFS-47HRjTLDPvx9ul53JUXw2y1xaZbBlVnlknjnc_JWszMbk-C6jCWwn9J_fxMAhIF-hUO-AYHTvJ_MBC4W6u8xyN7gA_7Wn2haS_B42dirou3uYlBV8B-C9du46EOK5A898mkrycFXfjG93LgcoWOxlbqBNxg_Yyr5ftOTXxLqjsMynHMTXjmAx8Y7yevg5OfpVvv3uVrE0_LBhT91pitJQKq58';
