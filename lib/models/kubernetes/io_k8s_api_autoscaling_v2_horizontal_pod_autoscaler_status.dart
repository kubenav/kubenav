//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2_horizontal_pod_autoscaler_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2_metric_status.dart';

class IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus {
  /// Returns a new [IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus] instance.
  IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus({
    this.conditions = const [],
    this.currentMetrics = const [],
    this.currentReplicas,
    required this.desiredReplicas,
    this.lastScaleTime,
    this.observedGeneration,
  });

  /// conditions is the set of conditions required for this autoscaler to scale its target, and indicates whether or not those conditions are met.
  List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerCondition> conditions;

  /// currentMetrics is the last read state of the metrics used by this autoscaler.
  List<IoK8sApiAutoscalingV2MetricStatus> currentMetrics;

  /// currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentReplicas;

  /// desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.
  int desiredReplicas;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastScaleTime;

  /// observedGeneration is the most recent generation observed by this autoscaler.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus &&
          other.conditions == conditions &&
          other.currentMetrics == currentMetrics &&
          other.currentReplicas == currentReplicas &&
          other.desiredReplicas == desiredReplicas &&
          other.lastScaleTime == lastScaleTime &&
          other.observedGeneration == observedGeneration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (currentMetrics.hashCode) +
      (currentReplicas == null ? 0 : currentReplicas!.hashCode) +
      (desiredReplicas.hashCode) +
      (lastScaleTime == null ? 0 : lastScaleTime!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus[conditions=$conditions, currentMetrics=$currentMetrics, currentReplicas=$currentReplicas, desiredReplicas=$desiredReplicas, lastScaleTime=$lastScaleTime, observedGeneration=$observedGeneration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    json[r'currentMetrics'] = this.currentMetrics;
    if (this.currentReplicas != null) {
      json[r'currentReplicas'] = this.currentReplicas;
    } else {
      json[r'currentReplicas'] = null;
    }
    json[r'desiredReplicas'] = this.desiredReplicas;
    if (this.lastScaleTime != null) {
      json[r'lastScaleTime'] = this.lastScaleTime!.toUtc().toIso8601String();
    } else {
      json[r'lastScaleTime'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus(
        conditions:
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerCondition.listFromJson(
                    json[r'conditions']) ??
                const [],
        currentMetrics: IoK8sApiAutoscalingV2MetricStatus.listFromJson(
                json[r'currentMetrics']) ??
            const [],
        currentReplicas: mapValueOfType<int>(json, r'currentReplicas'),
        desiredReplicas: mapValueOfType<int>(json, r'desiredReplicas')!,
        lastScaleTime: mapDateTime(json, r'lastScaleTime', ''),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2HorizontalPodAutoscalerStatus.listFromJson(
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
    'desiredReplicas',
  };
}
