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

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_daemon_set_condition.dart';

class IoK8sApiAppsV1DaemonSetStatus {
  /// Returns a new [IoK8sApiAppsV1DaemonSetStatus] instance.
  IoK8sApiAppsV1DaemonSetStatus({
    this.collisionCount,
    this.conditions = const [],
    required this.currentNumberScheduled,
    required this.desiredNumberScheduled,
    this.numberAvailable,
    required this.numberMisscheduled,
    required this.numberReady,
    this.numberUnavailable,
    this.observedGeneration,
    this.updatedNumberScheduled,
  });

  /// Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collisionCount;

  /// Represents the latest available observations of a DaemonSet's current state.
  List<IoK8sApiAppsV1DaemonSetCondition> conditions;

  /// The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
  int currentNumberScheduled;

  /// The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
  int desiredNumberScheduled;

  /// The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numberAvailable;

  /// The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
  int numberMisscheduled;

  /// numberReady is the number of nodes that should be running the daemon pod and have one or more of the daemon pod running with a Ready Condition.
  int numberReady;

  /// The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numberUnavailable;

  /// The most recent generation observed by the daemon set controller.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// The total number of nodes that are running updated daemon pod
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedNumberScheduled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DaemonSetStatus &&
          other.collisionCount == collisionCount &&
          other.conditions == conditions &&
          other.currentNumberScheduled == currentNumberScheduled &&
          other.desiredNumberScheduled == desiredNumberScheduled &&
          other.numberAvailable == numberAvailable &&
          other.numberMisscheduled == numberMisscheduled &&
          other.numberReady == numberReady &&
          other.numberUnavailable == numberUnavailable &&
          other.observedGeneration == observedGeneration &&
          other.updatedNumberScheduled == updatedNumberScheduled;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (collisionCount == null ? 0 : collisionCount!.hashCode) +
      (conditions.hashCode) +
      (currentNumberScheduled.hashCode) +
      (desiredNumberScheduled.hashCode) +
      (numberAvailable == null ? 0 : numberAvailable!.hashCode) +
      (numberMisscheduled.hashCode) +
      (numberReady.hashCode) +
      (numberUnavailable == null ? 0 : numberUnavailable!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (updatedNumberScheduled == null ? 0 : updatedNumberScheduled!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DaemonSetStatus[collisionCount=$collisionCount, conditions=$conditions, currentNumberScheduled=$currentNumberScheduled, desiredNumberScheduled=$desiredNumberScheduled, numberAvailable=$numberAvailable, numberMisscheduled=$numberMisscheduled, numberReady=$numberReady, numberUnavailable=$numberUnavailable, observedGeneration=$observedGeneration, updatedNumberScheduled=$updatedNumberScheduled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.collisionCount != null) {
      json[r'collisionCount'] = this.collisionCount;
    } else {
      json[r'collisionCount'] = null;
    }
    json[r'conditions'] = this.conditions;
    json[r'currentNumberScheduled'] = this.currentNumberScheduled;
    json[r'desiredNumberScheduled'] = this.desiredNumberScheduled;
    if (this.numberAvailable != null) {
      json[r'numberAvailable'] = this.numberAvailable;
    } else {
      json[r'numberAvailable'] = null;
    }
    json[r'numberMisscheduled'] = this.numberMisscheduled;
    json[r'numberReady'] = this.numberReady;
    if (this.numberUnavailable != null) {
      json[r'numberUnavailable'] = this.numberUnavailable;
    } else {
      json[r'numberUnavailable'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.updatedNumberScheduled != null) {
      json[r'updatedNumberScheduled'] = this.updatedNumberScheduled;
    } else {
      json[r'updatedNumberScheduled'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1DaemonSetStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DaemonSetStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DaemonSetStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DaemonSetStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DaemonSetStatus(
        collisionCount: mapValueOfType<int>(json, r'collisionCount'),
        conditions: IoK8sApiAppsV1DaemonSetCondition.listFromJson(
                json[r'conditions']) ??
            const [],
        currentNumberScheduled:
            mapValueOfType<int>(json, r'currentNumberScheduled')!,
        desiredNumberScheduled:
            mapValueOfType<int>(json, r'desiredNumberScheduled')!,
        numberAvailable: mapValueOfType<int>(json, r'numberAvailable'),
        numberMisscheduled: mapValueOfType<int>(json, r'numberMisscheduled')!,
        numberReady: mapValueOfType<int>(json, r'numberReady')!,
        numberUnavailable: mapValueOfType<int>(json, r'numberUnavailable'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        updatedNumberScheduled:
            mapValueOfType<int>(json, r'updatedNumberScheduled'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DaemonSetStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DaemonSetStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DaemonSetStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DaemonSetStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1DaemonSetStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DaemonSetStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DaemonSetStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DaemonSetStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DaemonSetStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DaemonSetStatus.listFromJson(
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
    'currentNumberScheduled',
    'desiredNumberScheduled',
    'numberMisscheduled',
    'numberReady',
  };
}
