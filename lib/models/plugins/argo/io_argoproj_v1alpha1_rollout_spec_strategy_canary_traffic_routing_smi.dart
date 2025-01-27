//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi({
    this.rootService,
    this.trafficSplitName,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rootService;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? trafficSplitName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi &&
          other.rootService == rootService &&
          other.trafficSplitName == trafficSplitName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rootService == null ? 0 : rootService!.hashCode) +
      (trafficSplitName == null ? 0 : trafficSplitName!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi[rootService=$rootService, trafficSplitName=$trafficSplitName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.rootService != null) {
      json[r'rootService'] = this.rootService;
    } else {
      json[r'rootService'] = null;
    }
    if (this.trafficSplitName != null) {
      json[r'trafficSplitName'] = this.trafficSplitName;
    } else {
      json[r'trafficSplitName'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi(
        rootService: mapValueOfType<String>(json, r'rootService'),
        trafficSplitName: mapValueOfType<String>(json, r'trafficSplitName'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi
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
