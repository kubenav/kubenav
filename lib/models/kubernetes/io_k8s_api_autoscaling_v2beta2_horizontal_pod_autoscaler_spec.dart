//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_cross_version_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_horizontal_pod_autoscaler_behavior.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_spec.dart';

class IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec {
  /// Returns a new [IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec] instance.
  IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec({
    this.behavior,
    required this.maxReplicas,
    this.metrics = const [],
    this.minReplicas,
    required this.scaleTargetRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerBehavior? behavior;

  /// maxReplicas is the upper limit for the number of replicas to which the autoscaler can scale up. It cannot be less that minReplicas.
  int maxReplicas;

  /// metrics contains the specifications for which to use to calculate the desired replica count (the maximum replica count across all metrics will be used).  The desired replica count is calculated multiplying the ratio between the target value and the current value by the current number of pods.  Ergo, metrics used must decrease as the pod count is increased, and vice-versa.  See the individual metric source types for more information about how each type of metric must respond. If not set, the default metric will be set to 80% average CPU utilization.
  List<IoK8sApiAutoscalingV2beta2MetricSpec> metrics;

  /// minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down.  It defaults to 1 pod.  minReplicas is allowed to be 0 if the alpha feature gate HPAScaleToZero is enabled and at least one Object or External metric is configured.  Scaling is active as long as at least one metric value is available.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReplicas;

  IoK8sApiAutoscalingV2beta2CrossVersionObjectReference scaleTargetRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec &&
          other.behavior == behavior &&
          other.maxReplicas == maxReplicas &&
          other.metrics == metrics &&
          other.minReplicas == minReplicas &&
          other.scaleTargetRef == scaleTargetRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (behavior == null ? 0 : behavior!.hashCode) +
      (maxReplicas.hashCode) +
      (metrics.hashCode) +
      (minReplicas == null ? 0 : minReplicas!.hashCode) +
      (scaleTargetRef.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec[behavior=$behavior, maxReplicas=$maxReplicas, metrics=$metrics, minReplicas=$minReplicas, scaleTargetRef=$scaleTargetRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (behavior != null) {
      json[r'behavior'] = behavior;
    }
    json[r'maxReplicas'] = maxReplicas;
    json[r'metrics'] = metrics;
    if (minReplicas != null) {
      json[r'minReplicas'] = minReplicas;
    }
    json[r'scaleTargetRef'] = scaleTargetRef;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec(
        behavior:
            IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerBehavior.fromJson(
                json[r'behavior']),
        maxReplicas: mapValueOfType<int>(json, r'maxReplicas')!,
        metrics: IoK8sApiAutoscalingV2beta2MetricSpec.listFromJson(
                json[r'metrics']) ??
            const [],
        minReplicas: mapValueOfType<int>(json, r'minReplicas'),
        scaleTargetRef:
            IoK8sApiAutoscalingV2beta2CrossVersionObjectReference.fromJson(
                json[r'scaleTargetRef'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec-objects as value to a dart map
  static Map<String,
          List<IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec.listFromJson(
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
    'maxReplicas',
    'scaleTargetRef',
  };
}
