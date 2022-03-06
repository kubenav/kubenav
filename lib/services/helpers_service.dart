import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [HelpersService] implements a service to interactiv with the helper functions from our Go code. The implementation
/// details of each Go function can be found in the `cmd/kubenav/helpers.go` file.
class HelpersService {
  static const platform = MethodChannel('kubenav.io');

  HelpersService();

  /// [prettifyYAML] can be used to pretty print the given json object. This is implemented in Go, because Dart lacks a
  /// good package to work with YAML.
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

  /// [createJSONPatch] creates a json patch from a [source] and a [target] document by computing the diff between the
  /// two json documents via github.com/wI2L/jsondiff. The returned patch can then be send to the Kubernetes API server
  /// to change a edit a resource.
  Future<String> createJSONPatch(dynamic source, dynamic target) async {
    try {
      final sourceStr = json.encode(source);
      final targetStr = json.encode(target);

      final String result = await platform.invokeMethod(
        'createJSONPatch',
        <String, dynamic>{
          'source': sourceStr,
          'target': targetStr,
        },
      );

      Logger.log(
        'HelpersService createJSONPatch',
        'Json patch was created',
        result,
      );
      return result;
    } catch (err) {
      Logger.log(
        'HelpersService createJSONPatch',
        'Could not create json patch',
        err,
      );
      return Future.error(err);
    }
  }
}
