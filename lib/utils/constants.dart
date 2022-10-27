import 'package:flutter/material.dart';

/// [Constants] contains the most important values for our app. For example it contains the primary color which should
/// be used or the values for the spacing (padding/margin) between components.
class Constants {
  static const colorPrimary = Color(0xff326ce5);
  static const colorSuccess = Colors.green;
  static const colorWarning = Colors.yellow;
  static const colorDanger = Colors.red;
  static const colorTextPrimary = Color(0xFF2E3033);
  static const colorTextSecondary = Color(0xFF757575);

  static const sizeTextPrimary = 16.0;
  static const sizeTextSecondary = 14.0;
  static const sizeBorderRadius = 12.0;
  static const sizeBorderBlurRadius = 4.0;
  static const sizeBorderSpreadRadius = 1.0;

  static const spacingExtraSmall = 4.0;
  static const spacingSmall = 8.0;
  static const spacingMiddle = 16.0;
  static const spacingLarge = 24.0;
  static const spacingExtraLarge = 32.0;

  static const opacityLight = 0.75;
  static const opacityHeavy = 0.25;

  static const googleRedirectURI = 'https://kubenav.io/auth/google.html';
  static const oidcRedirectURI = 'https://kubenav.io/auth/oidc.html';
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Constants.colorPrimary,
  canvasColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff326ce5),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardColor: Colors.white,
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: Constants.colorPrimary,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Constants.colorPrimary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xFF2E3033),
      ),
    ),
    labelStyle: TextStyle(
      color: Color(0xFF2E3033),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Constants.colorPrimary,
    selectionColor: Constants.colorPrimary.withOpacity(0.25),
    selectionHandleColor: Constants.colorPrimary,
  ),
  shadowColor: Colors.grey.withOpacity(0.2),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color(0xFF2E3033),
    ),
    displayMedium: TextStyle(
      color: Color(0xFF2E3033),
    ),
    displaySmall: TextStyle(
      color: Color(0xFF757575),
    ),
    bodyLarge: TextStyle(
      color: Color(0xFF2E3033),
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF2E3033),
    ),
    bodySmall: TextStyle(
      color: Color(0xFF2E3033),
    ),
    titleLarge: TextStyle(
      color: Color(0xFF2E3033),
    ),
    titleMedium: TextStyle(
      color: Color(0xFF2E3033),
    ),
    titleSmall: TextStyle(
      color: Color(0xFF2E3033),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Constants.colorPrimary,
  canvasColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff326ce5),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardColor: Colors.black,
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: Constants.colorPrimary,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Constants.colorPrimary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xFFD1CFCC),
      ),
    ),
    labelStyle: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Constants.colorPrimary,
    selectionColor: Constants.colorPrimary.withOpacity(0.25),
    selectionHandleColor: Constants.colorPrimary,
  ),
  shadowColor: Colors.grey.withOpacity(0.4),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    displayMedium: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    displaySmall: TextStyle(
      color: Color(0xFF8A8A8A),
    ),
    bodyLarge: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    bodyMedium: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    bodySmall: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    titleLarge: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    titleMedium: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
    titleSmall: TextStyle(
      color: Color(0xFFD1CFCC),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
    ),
  ),
);
