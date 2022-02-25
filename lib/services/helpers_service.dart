import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpersService {
  static const platform = MethodChannel('kubenav.io');

  HelpersService();

  Future<String> prettifyYAML(dynamic jsonObj) async {
    try {
      final jsonStr = json.encode(jsonObj);

      final String result = await platform.invokeMethod(
        'prettifyYAML',
        <String, dynamic>{
          'jsonStr': jsonStr,
        },
      );

      debugPrint('prettifyYAML result: $result');
      return result;
    } catch (err) {
      debugPrint('prettifyYAML error: $err');
      return Future.error(err);
    }
  }
}
