import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';

/// [noramlTextStyle] applies our default styles for normal text.
TextStyle noramlTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? theme(context).textPrimary,
  );
}

/// [primaryTextStyle] applies our default styles for primary text.
TextStyle primaryTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? theme(context).textPrimary,
    fontWeight: FontWeight.bold,
  );
}

/// [secondaryTextStyle] applies our default styles for secondary text.
TextStyle secondaryTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextSecondary,
    color: color ?? theme(context).textSecondary,
    fontWeight: FontWeight.normal,
  );
}

/// [openUrl] opens the given [url] in the systems default browser.
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

String getMonospaceFontFamily() {
  if (Platform.isIOS) {
    return 'Courier';
  }

  return 'monospace';
}
