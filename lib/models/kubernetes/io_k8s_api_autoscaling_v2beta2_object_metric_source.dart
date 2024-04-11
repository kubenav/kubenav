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

import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_cross_version_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_identifier.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_target.dart';

class IoK8sApiAutoscalingV2beta2ObjectMetricSource {
  /// Returns a new [IoK8sApiAutoscalingV2beta2ObjectMetricSource] instance.
  IoK8sApiAutoscalingV2beta2ObjectMetricSource({
    required this.describedObject,
    required this.metric,
    required this.target,
  });

  IoK8sApiAutoscalingV2beta2CrossVersionObjectReference describedObject;

  IoK8sApiAutoscalingV2beta2MetricIdentifier metric;

  IoK8sApiAutoscalingV2beta2MetricTarget target;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2ObjectMetricSource &&
          other.describedObject == describedObject &&
          other.metric == metric &&
          other.target == target;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (describedObject.hashCode) + (metric.hashCode) + (target.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2ObjectMetricSource[describedObject=$describedObject, metric=$metric, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'describedObject'] = this.describedObject;
    json[r'metric'] = this.metric;
    json[r'target'] = this.target;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2ObjectMetricSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2ObjectMetricSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2ObjectMetricSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2ObjectMetricSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2ObjectMetricSource(
        describedObject:
            IoK8sApiAutoscalingV2beta2CrossVersionObjectReference.fromJson(
                json[r'describedObject'])!,
        metric: IoK8sApiAutoscalingV2beta2MetricIdentifier.fromJson(
            json[r'metric'])!,
        target:
            IoK8sApiAutoscalingV2beta2MetricTarget.fromJson(json[r'target'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2ObjectMetricSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2ObjectMetricSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2ObjectMetricSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2ObjectMetricSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2beta2ObjectMetricSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2ObjectMetricSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2ObjectMetricSource-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2beta2ObjectMetricSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAutoscalingV2beta2ObjectMetricSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta2ObjectMetricSource.listFromJson(
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
    'describedObject',
    'metric',
    'target',
  };
}
