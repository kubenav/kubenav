import 'dart:async';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [HelpersService] implements a service to interactiv with the helper
/// functions from our Go code. The implementation details of each Go function
/// can be found in the `cmd//kubenav/helpers.go` file.
class HelpersService {
  static const platform = MethodChannel('kubenav.io');

  HelpersService();

  /// [prettifyYAML] can be used to pretty print the given json object. This is
  /// implemented in Go, because Dart lacks a good package to work with YAML.
  Future<String> prettifyYAML(String json) async {
    try {
      Logger.log('HelperService prettifyYAML', 'Run prettifyYAML', json);

      final String result = await platform.invokeMethod(
        'prettifyYAML',
        <String, dynamic>{'jsonStr': json},
      );

      Logger.log(
        'HelperService prettifyYAML',
        'prettifyYAML Succeeded',
        result,
      );

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      return result;
    } catch (err) {
      Logger.log('HelpersService prettifyYAML', 'prettifyYAML Failed', err);
      rethrow;
    }
  }

  /// [createJSONPatch] creates a json patch from a [source] and a [target]
  /// document by computing the diff between the two json documents via
  /// github.com/wI2L/jsondiff. The returned patch can then be send to the
  /// Kubernetes API server to change a edit a resource.
  Future<String> createJSONPatch(String source, String target) async {
    try {
      Logger.log(
        'HelperService createJSONPatch',
        'Run createJSONPatch',
        '$source, $target',
      );

      final String result = await platform.invokeMethod(
        'createJSONPatch',
        <String, dynamic>{'source': source, 'target': target},
      );

      Logger.log(
        'HelperService createJSONPatch',
        'createJSONPatch Succeeded',
        result,
      );

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      return result;
    } catch (err) {
      Logger.log(
        'HelpersService createJSONPatch',
        'createJSONPatch Failed',
        err,
      );
      rethrow;
    }
  }
}
