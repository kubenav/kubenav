//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV2HPAScalingRules {
  /// Returns a new [IoK8sApiAutoscalingV2HPAScalingRules] instance.
  IoK8sApiAutoscalingV2HPAScalingRules({
    this.policies = const [],
    this.selectPolicy,
    this.stabilizationWindowSeconds,
  });

  /// policies is a list of potential scaling polices which can be used during scaling. At least one policy must be specified, otherwise the HPAScalingRules will be discarded as invalid
  List<IoK8sApiAutoscalingV2HPAScalingPolicy> policies;

  /// selectPolicy is used to specify which policy should be used. If not set, the default value Max is used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? selectPolicy;

  /// StabilizationWindowSeconds is the number of seconds for which past recommendations should be considered while scaling up or scaling down. StabilizationWindowSeconds must be greater than or equal to zero and less than or equal to 3600 (one hour). If not set, use the default values: - For scale up: 0 (i.e. no stabilization is done). - For scale down: 300 (i.e. the stabilization window is 300 seconds long).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? stabilizationWindowSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2HPAScalingRules &&
          other.policies == policies &&
          other.selectPolicy == selectPolicy &&
          other.stabilizationWindowSeconds == stabilizationWindowSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (policies.hashCode) +
      (selectPolicy == null ? 0 : selectPolicy!.hashCode) +
      (stabilizationWindowSeconds == null
          ? 0
          : stabilizationWindowSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2HPAScalingRules[policies=$policies, selectPolicy=$selectPolicy, stabilizationWindowSeconds=$stabilizationWindowSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'policies'] = policies;
    if (selectPolicy != null) {
      json[r'selectPolicy'] = selectPolicy;
    }
    if (stabilizationWindowSeconds != null) {
      json[r'stabilizationWindowSeconds'] = stabilizationWindowSeconds;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2HPAScalingRules] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2HPAScalingRules? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2HPAScalingRules[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2HPAScalingRules[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2HPAScalingRules(
        policies: IoK8sApiAutoscalingV2HPAScalingPolicy.listFromJson(
                json[r'policies']) ??
            const [],
        selectPolicy: mapValueOfType<String>(json, r'selectPolicy'),
        stabilizationWindowSeconds:
            mapValueOfType<int>(json, r'stabilizationWindowSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2HPAScalingRules>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2HPAScalingRules>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAutoscalingV2HPAScalingRules.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2HPAScalingRules> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2HPAScalingRules>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HPAScalingRules.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2HPAScalingRules-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2HPAScalingRules>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAutoscalingV2HPAScalingRules>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2HPAScalingRules.listFromJson(
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
