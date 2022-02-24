//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV2HPAScalingPolicy {
  /// Returns a new [IoK8sApiAutoscalingV2HPAScalingPolicy] instance.
  IoK8sApiAutoscalingV2HPAScalingPolicy({
    required this.periodSeconds,
    required this.type,
    required this.value,
  });

  /// PeriodSeconds specifies the window of time for which the policy should hold true. PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min).
  int periodSeconds;

  /// Type is used to specify the scaling policy.
  String type;

  /// Value contains the amount of change which is permitted by the policy. It must be greater than zero
  int value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2HPAScalingPolicy &&
          other.periodSeconds == periodSeconds &&
          other.type == type &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (periodSeconds.hashCode) + (type.hashCode) + (value.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2HPAScalingPolicy[periodSeconds=$periodSeconds, type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'periodSeconds'] = periodSeconds;
    json[r'type'] = type;
    json[r'value'] = value;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2HPAScalingPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2HPAScalingPolicy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2HPAScalingPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2HPAScalingPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2HPAScalingPolicy(
        periodSeconds: mapValueOfType<int>(json, r'periodSeconds')!,
        type: mapValueOfType<String>(json, r'type')!,
        value: mapValueOfType<int>(json, r'value')!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2HPAScalingPolicy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2HPAScalingPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAutoscalingV2HPAScalingPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2HPAScalingPolicy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2HPAScalingPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HPAScalingPolicy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2HPAScalingPolicy-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2HPAScalingPolicy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAutoscalingV2HPAScalingPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2HPAScalingPolicy.listFromJson(
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
  static const requiredKeys = <String>{
    'periodSeconds',
    'type',
    'value',
  };
}
