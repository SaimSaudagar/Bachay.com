import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<String> getToken() async {
  final SharedPreferences localStorage = await SharedPreferences.getInstance();

  String? currentToken = localStorage.getString('token');

  if (currentToken != null) {
    return 'Bearer $currentToken';
  } else {
    return '';
  }
}

const String jwtToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzFhODg5YThmZGIyMmIxZDgzNDgzMmU0MDZhNzU5MzA5NTFhOWMxOGRlNjFhNWU5ZWE1YjY4MGMxZjMxMmI1ZGI4YzVkNzNkN2Q0OGQ2ZmEiLCJpYXQiOjE3MjY3NTcyNDQuNDQ1MTYxLCJuYmYiOjE3MjY3NTcyNDQuNDQ1MTYzLCJleHAiOjE3NDIzOTU2NDQuNDMyNTYxLCJzdWIiOiIxMDUiLCJzY29wZXMiOltdfQ.Sh542ClUPZVVwhb3s0x_00zimAL-l8M60VfuTKz_JoUAQkbSo6AcMD7tjLUWZmn8KBJFfTbZIL-Myzmy9IgdvIOX9OFZbks73rVUMBfOJ2XiYfLPwM91Pz1sbSYud39kULyiI7QpjxQJOUcrc0t20wU8W6ToGT5gQl_kKH7tOsX2ST6goHXpjLIJx9AehV04xSbiVRZDrOrKkO9fYM1hzHLHeFZzBVMDvprnG1QkJSirfwBxUKzgZ3jFVzjloSJ2E9Jh8hsFz5glkYVrrAmZrOD1-b_PMM_lJMt9Rd5_o75TK9pU_kRaxZkt5J5yDGyPtQ1O-vCt_A4uMe5-v7QfBAL0-DzGEpwE5tVDbPQ2nUqzgtQo9oJoQDX_o3Evto1oi1Yl2OgrxzNAbI-H9m1kDwFwhcOz4chFtYjdErAjfvQXeV08Xv2WCZ8qCY2F1wsUkeGjrmXlZC-HcQo37V7EAjhR-hcFJxtkmRCVV7SAPj4T2K3q-uEG1HRP9PvFr4J97Zrngr6Fl4jVTvjobI_XtMHSZBjXzwL4l4N2XBCeQo6-HS86LhsF8d1E0R6l2CbCrsMX_ZPyiWggUfXRtfXntS3HJqYWfCDePAJPVgkiIqNi3AleOwWsst7V54bb8SNE-aKSjKur4DaHch4hTcGKqoJ0DDfh96m2RKQXaloB7XY';

