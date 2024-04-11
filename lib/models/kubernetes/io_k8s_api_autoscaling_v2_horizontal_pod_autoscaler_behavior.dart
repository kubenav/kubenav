//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2_hpa_scaling_rules.dart';

class IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior {
  /// Returns a new [IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior] instance.
  IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior({
    this.scaleDown,
    this.scaleUp,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAutoscalingV2HPAScalingRules? scaleDown;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAutoscalingV2HPAScalingRules? scaleUp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior &&
          other.scaleDown == scaleDown &&
          other.scaleUp == scaleUp;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (scaleDown == null ? 0 : scaleDown!.hashCode) +
      (scaleUp == null ? 0 : scaleUp!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior[scaleDown=$scaleDown, scaleUp=$scaleUp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.scaleDown != null) {
      json[r'scaleDown'] = this.scaleDown;
    } else {
      json[r'scaleDown'] = null;
    }
    if (this.scaleUp != null) {
      json[r'scaleUp'] = this.scaleUp;
    } else {
      json[r'scaleUp'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior(
        scaleDown:
            IoK8sApiAutoscalingV2HPAScalingRules.fromJson(json[r'scaleDown']),
        scaleUp:
            IoK8sApiAutoscalingV2HPAScalingRules.fromJson(json[r'scaleUp']),
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerBehavior.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
