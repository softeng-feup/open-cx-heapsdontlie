import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(255, 255, 255, 1.0);
const Color primaryColorVariant = Color.fromRGBO(206, 235, 237, 1.0);
const Color secondaryColor = Color.fromRGBO(0, 168, 181, 1.0);
const Color secondaryColorVariant = Color.fromRGBO(179, 229, 233, 1.0);
const Color accentColor = Color.fromRGBO(0, 168, 181, 1.0);
const Color buttonColor = Color.fromRGBO(0, 168, 181, 1.0);
const Color hintColor = Color.fromRGBO(128, 212, 218, 1.0);
const Color navyBlueColor = Color.fromRGBO(0, 52, 89, 1.0);
const Color communRedColor = Color.fromRGBO(255, 95, 95, 1.0);
const Color blackColor = Color.fromRGBO(0, 0, 0, 1.0);

ThemeData applicationTheme = new ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  accentColor: accentColor,
  fontFamily: 'Nunito',
  buttonColor: buttonColor,
  colorScheme: ColorScheme(
    primary:  primaryColor,
    primaryVariant: primaryColorVariant,
    onPrimary: secondaryColor,
    secondary: secondaryColor,
    secondaryVariant: secondaryColorVariant,
    onSecondary: navyBlueColor,
    surface: primaryColor,
    onSurface: navyBlueColor,
    background: navyBlueColor,
    onBackground: primaryColor,
    error: communRedColor,
    onError: blackColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headline: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: primaryColor),
    title: TextStyle(fontSize: 36.0, color: accentColor),
    body1: TextStyle(fontSize: 18.0, color: primaryColor),
    caption: TextStyle(fontSize: 18.0, color: accentColor)
  ),
);
