import 'dart:io' show Platform;
import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/themes.dart';

/// [normalTextStyle] applies our default styles for normal text.
TextStyle normalTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? Theme.of(context).extension<CustomColors>()!.textPrimary,
    decoration: decoration,
  );
}

/// [primaryTextStyle] applies our default styles for primary text.
TextStyle primaryTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextPrimary,
    color: color ?? Theme.of(context).extension<CustomColors>()!.textPrimary,
    fontWeight: FontWeight.bold,
    decoration: decoration,
  );
}

/// [secondaryTextStyle] applies our default styles for secondary text.
TextStyle secondaryTextStyle(
  BuildContext context, {
  double? size,
  Color? color,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: size ?? Constants.sizeTextSecondary,
    color: color ?? Theme.of(context).extension<CustomColors>()!.textSecondary,
    fontWeight: FontWeight.normal,
    decoration: decoration,
  );
}

/// [openUrl] opens the given [url] in the systems default browser.
Future<void> openUrl(String url) async {
  var launchMode = LaunchMode.platformDefault;

  if (Platform.isAndroid) {
    launchMode = LaunchMode.externalApplication;
  }

  await launchUrl(Uri.parse(url), mode: launchMode);
}

String getMonospaceFontFamily() {
  if (Platform.isIOS) {
    return 'Courier';
  }

  return 'monospace';
}

/// [generateRandomString] generates a random string with the given [len]
/// length. The generated string contains only lowercase letters and numbers,
/// so it can be used within Kubernetes resource names.
String generateRandomString(int len) {
  var r = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

/// [isTablet] returns `true` if the current screen size is is a table. For that
/// we check if the width of the screen is greater than 600.
bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}

Future<void> hapticFeedback() async {
  if (Platform.isIOS) {
    await HapticFeedback.heavyImpact();
  } else {
    await HapticFeedback.vibrate();
  }
}

/// [removeNull] removes all null values from the given [params] map or list.
dynamic removeNull(dynamic params) {
  if (params is Map) {
    var map = {};
    params.forEach((key, val) {
      var value = removeNull(val);
      if (value != null) {
        map[key] = value;
      }
    });
    if (map.isNotEmpty) return map;
  } else if (params is List) {
    var list = [];
    for (var val in params) {
      var value = removeNull(val);
      if (value != null) {
        list.add(value);
      }
    }
    if (list.isNotEmpty) return list;
  } else if (params != null) {
    return params;
  }
  return null;
}
