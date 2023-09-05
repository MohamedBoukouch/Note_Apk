import 'package:flutter/material.dart';

Color primaryColor = Color.fromARGB(255, 38, 38, 39);

// Color background=Colors.black;
Color reallyLightGrey = Colors.grey.withAlpha(25);
ThemeData appThemeLight =
    ThemeData.light().copyWith(primaryColor: primaryColor);
ThemeData appThemeDark = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  toggleableActiveColor: primaryColor,
  // accentColor: primaryColor,
  // buttonColor: primaryColor,
  // textSelectionColor: primaryColor,
  // textSelectionHandleColor: primaryColor
);
