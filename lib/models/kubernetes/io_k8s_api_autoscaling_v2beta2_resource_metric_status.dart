//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV2beta2ResourceMetricStatus {
  /// Returns a new [IoK8sApiAutoscalingV2beta2ResourceMetricStatus] instance.
  IoK8sApiAutoscalingV2beta2ResourceMetricStatus({
    required this.current,
    required this.name,
  });

  IoK8sApiAutoscalingV2beta2MetricValueStatus current;

  /// Name is the name of the resource in question.
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2ResourceMetricStatus &&
          other.current == current &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (current.hashCode) + (name.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2ResourceMetricStatus[current=$current, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'current'] = current;
    json[r'name'] = name;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2ResourceMetricStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2ResourceMetricStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2ResourceMetricStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2ResourceMetricStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2ResourceMetricStatus(
        current: IoK8sApiAutoscalingV2beta2MetricValueStatus.fromJson(
            json[r'current'])!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2ResourceMetricStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2ResourceMetricStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2ResourceMetricStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2ResourceMetricStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2beta2ResourceMetricStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta2ResourceMetricStatus.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2ResourceMetricStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2beta2ResourceMetricStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV2beta2ResourceMetricStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2ResourceMetricStatus.listFromJson(
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
    'current',
    'name',
  };
}
