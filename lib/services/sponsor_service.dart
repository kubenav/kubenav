import 'dart:async';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

class SponsorService {
  static const platform = MethodChannel('kubenav.io');

  Future<String> verifyIAP() async {
    Logger.log('KubenavMobile verifyIAP', 'Run verifyIAP function');

    final String result = await platform.invokeMethod('verifyIAP');

    Logger.log(
      'KubenavMobile verifyIAP',
      'Verify In-App Purchase was ok',
      result,
    );

    return result;
  }
}
