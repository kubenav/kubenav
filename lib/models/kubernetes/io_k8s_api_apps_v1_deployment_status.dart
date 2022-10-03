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
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment_condition.dart';

class IoK8sApiAppsV1DeploymentStatus {
  /// Returns a new [IoK8sApiAppsV1DeploymentStatus] instance.
  IoK8sApiAppsV1DeploymentStatus({
    this.availableReplicas,
    this.collisionCount,
    this.conditions = const [],
    this.observedGeneration,
    this.readyReplicas,
    this.replicas,
    this.unavailableReplicas,
    this.updatedReplicas,
  });

  /// Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? availableReplicas;

  /// Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collisionCount;

  /// Represents the latest available observations of a deployment's current state.
  List<IoK8sApiAppsV1DeploymentCondition> conditions;

  /// The generation observed by the deployment controller.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// readyReplicas is the number of pods targeted by this Deployment with a Ready Condition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? readyReplicas;

  /// Total number of non-terminated pods targeted by this deployment (their labels match the selector).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  /// Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? unavailableReplicas;

  /// Total number of non-terminated pods targeted by this deployment that have the desired template spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedReplicas;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DeploymentStatus &&
          other.availableReplicas == availableReplicas &&
          other.collisionCount == collisionCount &&
          other.conditions == conditions &&
          other.observedGeneration == observedGeneration &&
          other.readyReplicas == readyReplicas &&
          other.replicas == replicas &&
          other.unavailableReplicas == unavailableReplicas &&
          other.updatedReplicas == updatedReplicas;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (availableReplicas == null ? 0 : availableReplicas!.hashCode) +
      (collisionCount == null ? 0 : collisionCount!.hashCode) +
      (conditions.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (readyReplicas == null ? 0 : readyReplicas!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (unavailableReplicas == null ? 0 : unavailableReplicas!.hashCode) +
      (updatedReplicas == null ? 0 : updatedReplicas!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DeploymentStatus[availableReplicas=$availableReplicas, collisionCount=$collisionCount, conditions=$conditions, observedGeneration=$observedGeneration, readyReplicas=$readyReplicas, replicas=$replicas, unavailableReplicas=$unavailableReplicas, updatedReplicas=$updatedReplicas]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.availableReplicas != null) {
      json[r'availableReplicas'] = this.availableReplicas;
    } else {
      json[r'availableReplicas'] = null;
    }
    if (this.collisionCount != null) {
      json[r'collisionCount'] = this.collisionCount;
    } else {
      json[r'collisionCount'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.readyReplicas != null) {
      json[r'readyReplicas'] = this.readyReplicas;
    } else {
      json[r'readyReplicas'] = null;
    }
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.unavailableReplicas != null) {
      json[r'unavailableReplicas'] = this.unavailableReplicas;
    } else {
      json[r'unavailableReplicas'] = null;
    }
    if (this.updatedReplicas != null) {
      json[r'updatedReplicas'] = this.updatedReplicas;
    } else {
      json[r'updatedReplicas'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1DeploymentStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DeploymentStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DeploymentStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DeploymentStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DeploymentStatus(
        availableReplicas: mapValueOfType<int>(json, r'availableReplicas'),
        collisionCount: mapValueOfType<int>(json, r'collisionCount'),
        conditions: IoK8sApiAppsV1DeploymentCondition.listFromJson(
                json[r'conditions']) ??
            const [],
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        readyReplicas: mapValueOfType<int>(json, r'readyReplicas'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        unavailableReplicas: mapValueOfType<int>(json, r'unavailableReplicas'),
        updatedReplicas: mapValueOfType<int>(json, r'updatedReplicas'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DeploymentStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DeploymentStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DeploymentStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DeploymentStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1DeploymentStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DeploymentStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DeploymentStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DeploymentStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStatus.listFromJson(
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
