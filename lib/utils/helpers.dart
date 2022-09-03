import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:kubenav/utils/constants.dart';

/// [finish] can be used to go back to previous screen. For example this can be used to close a modal bottom sheet
/// programmatically.
void finish(BuildContext context, [Object? result]) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context, result);
  }
}

/// [noramlTextStyle] applies our default styles for normal text.
TextStyle noramlTextStyle({
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? Constants.colorTextPrimary,
  );
}

/// [primaryTextStyle] applies our default styles for primary text.
TextStyle primaryTextStyle({
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? Constants.colorTextPrimary,
    fontWeight: FontWeight.bold,
  );
}

/// [secondaryTextStyle] applies our default styles for secondary text.
TextStyle secondaryTextStyle({
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextSecondary,
    color: color ?? Constants.colorTextSecondary,
    fontWeight: FontWeight.normal,
  );
}

/// [snackbar] creates a new snackbar with the given title and message. This wraps the `Get.snackbar` function to apply
/// our custom styling, so that we have the same appearance for the snackbar accross all components in our app.
void snackbar(
  String title,
  String message, {
  Widget? titleText,
  Widget? messageText,
  Widget? icon,
  void Function()? onTap,
}) {
  Get.snackbar(
    title,
    message,
    titleText: titleText,
    messageText: messageText,
    icon: icon,
    onTap: (GetSnackBar getSnackBar) {
      if (onTap != null) {
        onTap();
      }
    },
    backgroundColor: Colors.white,
    boxShadows: [
      BoxShadow(
        color: Constants.shadowColorGlobal,
        blurRadius: Constants.sizeBorderBlurRadius,
        spreadRadius: Constants.sizeBorderSpreadRadius,
        offset: const Offset(0.0, 0.0),
      ),
    ],
  );
}

Future<void> openUrl(String url) async {
  var launchMode = LaunchMode.platformDefault;

  if (Platform.isAndroid) {
    launchMode = LaunchMode.externalApplication;
  }

  await launchUrl(
    Uri.parse(url),
    mode: launchMode,
  );
}
