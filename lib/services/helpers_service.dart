import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:kubenav/services/kubenav_desktop.dart';
import 'package:kubenav/services/kubenav_mobile.dart';
import 'package:kubenav/utils/logger.dart';

/// [HelpersService] implements a service to interactiv with the helper
/// functions from our Go code. The implementation details of each Go function
/// can be found in the `cmd/kubenav/helpers.go` file.
class HelpersService {
  static const platform = MethodChannel('kubenav.io');

  HelpersService();

  /// [prettifyYAML] can be used to pretty print the given json object. This is
  /// implemented in Go, because Dart lacks a good package to work with YAML.
  Future<String> prettifyYAML(dynamic jsonObj) async {
    try {
      final jsonStr = jsonObj is String ? jsonObj : json.encode(jsonObj);

      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        return await KubenavDesktop().prettifyYAML(jsonStr);
      } else {
        return await KubenavMobile().prettifyYAML(jsonStr);
      }
    } catch (err) {
      Logger.log(
        'HelpersService prettifyYAML',
        'Could not prettify',
        err,
      );
      rethrow;
    }
  }

  /// [createJSONPatch] creates a json patch from a [source] and a [target]
  /// document by computing the diff between the two json documents via
  /// github.com/wI2L/jsondiff. The returned patch can then be send to the
  /// Kubernetes API server to change a edit a resource.
  Future<String> createJSONPatch(dynamic source, dynamic target) async {
    try {
      final sourceStr = json.encode(source);
      final targetStr = json.encode(target);

      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        return await KubenavDesktop().createJSONPatch(sourceStr, targetStr);
      } else {
        return await KubenavMobile().createJSONPatch(sourceStr, targetStr);
      }
    } catch (err) {
      Logger.log(
        'HelpersService createJSONPatch',
        'Could not create json patch',
        err,
      );
      rethrow;
    }
  }
}
