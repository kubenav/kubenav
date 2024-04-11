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

import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_identifier.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_value_status.dart';

class IoK8sApiAutoscalingV2beta2ExternalMetricStatus {
  /// Returns a new [IoK8sApiAutoscalingV2beta2ExternalMetricStatus] instance.
  IoK8sApiAutoscalingV2beta2ExternalMetricStatus({
    required this.current,
    required this.metric,
  });

  IoK8sApiAutoscalingV2beta2MetricValueStatus current;

  IoK8sApiAutoscalingV2beta2MetricIdentifier metric;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2ExternalMetricStatus &&
          other.current == current &&
          other.metric == metric;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (current.hashCode) + (metric.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2ExternalMetricStatus[current=$current, metric=$metric]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'current'] = this.current;
    json[r'metric'] = this.metric;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2ExternalMetricStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2ExternalMetricStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2ExternalMetricStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2ExternalMetricStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2ExternalMetricStatus(
        current: IoK8sApiAutoscalingV2beta2MetricValueStatus.fromJson(
            json[r'current'])!,
        metric: IoK8sApiAutoscalingV2beta2MetricIdentifier.fromJson(
            json[r'metric'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2ExternalMetricStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2ExternalMetricStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2ExternalMetricStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2ExternalMetricStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2beta2ExternalMetricStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta2ExternalMetricStatus.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2ExternalMetricStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2beta2ExternalMetricStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV2beta2ExternalMetricStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2ExternalMetricStatus.listFromJson(
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
    'metric',
  };
}
