//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale({
    this.matchTrafficWeight,
    this.replicas,
    this.weight,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? matchTrafficWeight;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? weight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale &&
          other.matchTrafficWeight == matchTrafficWeight &&
          other.replicas == replicas &&
          other.weight == weight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (matchTrafficWeight == null ? 0 : matchTrafficWeight!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (weight == null ? 0 : weight!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale[matchTrafficWeight=$matchTrafficWeight, replicas=$replicas, weight=$weight]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.matchTrafficWeight != null) {
      json[r'matchTrafficWeight'] = this.matchTrafficWeight;
    } else {
      json[r'matchTrafficWeight'] = null;
    }
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.weight != null) {
      json[r'weight'] = this.weight;
    } else {
      json[r'weight'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale(
        matchTrafficWeight: mapValueOfType<bool>(json, r'matchTrafficWeight'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        weight: mapValueOfType<int>(json, r'weight'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale
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
