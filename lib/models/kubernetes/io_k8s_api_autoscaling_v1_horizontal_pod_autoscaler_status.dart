//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus {
  /// Returns a new [IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus] instance.
  IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus({
    this.currentCPUUtilizationPercentage,
    required this.currentReplicas,
    required this.desiredReplicas,
    this.lastScaleTime,
    this.observedGeneration,
  });

  /// current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g. 70 means that an average pod is using now 70% of its requested CPU.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentCPUUtilizationPercentage;

  /// current number of replicas of pods managed by this autoscaler.
  int currentReplicas;

  /// desired number of replicas of pods managed by this autoscaler.
  int desiredReplicas;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastScaleTime;

  /// most recent generation observed by this autoscaler.
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
      other is IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus &&
          other.currentCPUUtilizationPercentage ==
              currentCPUUtilizationPercentage &&
          other.currentReplicas == currentReplicas &&
          other.desiredReplicas == desiredReplicas &&
          other.lastScaleTime == lastScaleTime &&
          other.observedGeneration == observedGeneration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (currentCPUUtilizationPercentage == null
          ? 0
          : currentCPUUtilizationPercentage!.hashCode) +
      (currentReplicas.hashCode) +
      (desiredReplicas.hashCode) +
      (lastScaleTime == null ? 0 : lastScaleTime!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus[currentCPUUtilizationPercentage=$currentCPUUtilizationPercentage, currentReplicas=$currentReplicas, desiredReplicas=$desiredReplicas, lastScaleTime=$lastScaleTime, observedGeneration=$observedGeneration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (currentCPUUtilizationPercentage != null) {
      json[r'currentCPUUtilizationPercentage'] =
          currentCPUUtilizationPercentage;
    }
    json[r'currentReplicas'] = currentReplicas;
    json[r'desiredReplicas'] = desiredReplicas;
    if (lastScaleTime != null) {
      json[r'lastScaleTime'] = lastScaleTime!.toUtc().toIso8601String();
    }
    if (observedGeneration != null) {
      json[r'observedGeneration'] = observedGeneration;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus(
        currentCPUUtilizationPercentage:
            mapValueOfType<int>(json, r'currentCPUUtilizationPercentage'),
        currentReplicas: mapValueOfType<int>(json, r'currentReplicas')!,
        desiredReplicas: mapValueOfType<int>(json, r'desiredReplicas')!,
        lastScaleTime: mapDateTime(json, r'lastScaleTime', ''),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus.listFromJson(
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
    'currentReplicas',
    'desiredReplicas',
  };
}
