import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

// HelpersService implements a service to interactiv with the helper functions from our Go code. The implementation
// details of each Go function can be found in the 'cmd/kubenav/helpers.go' file.
class HelpersService {
  static const platform = MethodChannel('kubenav.io');

  HelpersService();

  // prettifyYAML can be used to pretty print the given json object. This is implemented in Go, because Dart lacks a
  // good package to work with YAML.
  Future<String> prettifyYAML(dynamic jsonObj) async {
    try {
      final jsonStr = json.encode(jsonObj);

      final String result = await platform.invokeMethod(
        'prettifyYAML',
        <String, dynamic>{
          'jsonStr': jsonStr,
        },
      );

      Logger.log(
        'HelpersService prettifyYAML',
        'Yaml was prettifyed',
        result,
      );
      return result;
    } catch (err) {
      Logger.log(
        'HelpersService prettifyYAML',
        'Could not prettify',
        err,
      );
      return Future.error(err);
    }
  }
}
