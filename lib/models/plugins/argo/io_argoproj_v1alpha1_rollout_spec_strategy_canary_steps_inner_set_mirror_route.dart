//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_set_mirror_route_match_inner.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute({
    this.match = const [],
    required this.name,
    this.percentage,
  });

  List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner>
      match;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? percentage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute &&
          deepEquality.equals(other.match, match) &&
          other.name == name &&
          other.percentage == percentage;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (match.hashCode) +
      (name.hashCode) +
      (percentage == null ? 0 : percentage!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute[match=$match, name=$name, percentage=$percentage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'match'] = this.match;
    json[r'name'] = this.name;
    if (this.percentage != null) {
      json[r'percentage'] = this.percentage;
    } else {
      json[r'percentage'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute(
        match:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRouteMatchInner
                .listFromJson(json[r'match']),
        name: mapValueOfType<String>(json, r'name')!,
        percentage: mapValueOfType<int>(json, r'percentage'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}
