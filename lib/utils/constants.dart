import 'package:flutter/material.dart';

/// [Constants] contains the most important values for our app. For example it contains the primary color which should
/// be used or the values for the spacing (padding/margin) between components.
class Constants {
  static const colorPrimary = Color(0xff326ce5);
  static const colorCanvas = Colors.white;
  static const colorAppBarBackground = Color(0xff326ce5);
  static const colorAppBarForeground = Colors.white;
  static const colorSuccess = Colors.green;
  static const colorWarning = Colors.yellow;
  static const colorDanger = Colors.red;
  static const colorTextPrimary = Color(0xFF2E3033);
  static const colorTextSecondary = Color(0xFF757575);

  static var shadowColorGlobal = Colors.grey.withOpacity(0.2);

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

  static const googleRedirectURI = 'https://kubenav.io/google.html';
  static const oidcRedirectURI = 'https://kubenav.io/oidcv4.html';
}
