//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_set_header_route_match_inner_header_value.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner({
    this.headers = const {},
    this.method,
    this.path,
  });

  Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue>
      headers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue?
      method;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue?
      path;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner &&
          deepEquality.equals(other.headers, headers) &&
          other.method == method &&
          other.path == path;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (headers.hashCode) +
      (method == null ? 0 : method!.hashCode) +
      (path == null ? 0 : path!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner[headers=$headers, method=$method, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'headers'] = this.headers;
    if (this.method != null) {
      json[r'method'] = this.method;
    } else {
      json[r'method'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner(
        headers:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue
                .mapFromJson(json[r'headers']),
        method:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue
                .fromJson(json[r'method']),
        path:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRouteMatchInnerHeaderValue
                .fromJson(json[r'path']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
