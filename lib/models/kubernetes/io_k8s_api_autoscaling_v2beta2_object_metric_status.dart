//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV2beta2ObjectMetricStatus {
  /// Returns a new [IoK8sApiAutoscalingV2beta2ObjectMetricStatus] instance.
  IoK8sApiAutoscalingV2beta2ObjectMetricStatus({
    required this.current,
    required this.describedObject,
    required this.metric,
  });

  IoK8sApiAutoscalingV2beta2MetricValueStatus current;

  IoK8sApiAutoscalingV2beta2CrossVersionObjectReference describedObject;

  IoK8sApiAutoscalingV2beta2MetricIdentifier metric;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2ObjectMetricStatus &&
          other.current == current &&
          other.describedObject == describedObject &&
          other.metric == metric;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (current.hashCode) + (describedObject.hashCode) + (metric.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2ObjectMetricStatus[current=$current, describedObject=$describedObject, metric=$metric]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'current'] = current;
    json[r'describedObject'] = describedObject;
    json[r'metric'] = metric;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2ObjectMetricStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2ObjectMetricStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2ObjectMetricStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2ObjectMetricStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2ObjectMetricStatus(
        current: IoK8sApiAutoscalingV2beta2MetricValueStatus.fromJson(
            json[r'current'])!,
        describedObject:
            IoK8sApiAutoscalingV2beta2CrossVersionObjectReference.fromJson(
                json[r'describedObject'])!,
        metric: IoK8sApiAutoscalingV2beta2MetricIdentifier.fromJson(
            json[r'metric'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2ObjectMetricStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2ObjectMetricStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2ObjectMetricStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2ObjectMetricStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2beta2ObjectMetricStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2ObjectMetricStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2ObjectMetricStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2beta2ObjectMetricStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAutoscalingV2beta2ObjectMetricStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta2ObjectMetricStatus.listFromJson(
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
    'describedObject',
    'metric',
  };
}
