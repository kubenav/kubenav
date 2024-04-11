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
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set_condition.dart';

class IoK8sApiAppsV1StatefulSetStatus {
  /// Returns a new [IoK8sApiAppsV1StatefulSetStatus] instance.
  IoK8sApiAppsV1StatefulSetStatus({
    this.availableReplicas,
    this.collisionCount,
    this.conditions = const [],
    this.currentReplicas,
    this.currentRevision,
    this.observedGeneration,
    this.readyReplicas,
    required this.replicas,
    this.updateRevision,
    this.updatedReplicas,
  });

  /// Total number of available pods (ready for at least minReadySeconds) targeted by this statefulset.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? availableReplicas;

  /// collisionCount is the count of hash collisions for the StatefulSet. The StatefulSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collisionCount;

  /// Represents the latest available observations of a statefulset's current state.
  List<IoK8sApiAppsV1StatefulSetCondition> conditions;

  /// currentReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by currentRevision.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentReplicas;

  /// currentRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [0,currentReplicas).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currentRevision;

  /// observedGeneration is the most recent generation observed for this StatefulSet. It corresponds to the StatefulSet's generation, which is updated on mutation by the API Server.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// readyReplicas is the number of pods created for this StatefulSet with a Ready Condition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? readyReplicas;

  /// replicas is the number of Pods created by the StatefulSet controller.
  int replicas;

  /// updateRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [replicas-updatedReplicas,replicas)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? updateRevision;

  /// updatedReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by updateRevision.
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
      other is IoK8sApiAppsV1StatefulSetStatus &&
          other.availableReplicas == availableReplicas &&
          other.collisionCount == collisionCount &&
          other.conditions == conditions &&
          other.currentReplicas == currentReplicas &&
          other.currentRevision == currentRevision &&
          other.observedGeneration == observedGeneration &&
          other.readyReplicas == readyReplicas &&
          other.replicas == replicas &&
          other.updateRevision == updateRevision &&
          other.updatedReplicas == updatedReplicas;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (availableReplicas == null ? 0 : availableReplicas!.hashCode) +
      (collisionCount == null ? 0 : collisionCount!.hashCode) +
      (conditions.hashCode) +
      (currentReplicas == null ? 0 : currentReplicas!.hashCode) +
      (currentRevision == null ? 0 : currentRevision!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (readyReplicas == null ? 0 : readyReplicas!.hashCode) +
      (replicas.hashCode) +
      (updateRevision == null ? 0 : updateRevision!.hashCode) +
      (updatedReplicas == null ? 0 : updatedReplicas!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1StatefulSetStatus[availableReplicas=$availableReplicas, collisionCount=$collisionCount, conditions=$conditions, currentReplicas=$currentReplicas, currentRevision=$currentRevision, observedGeneration=$observedGeneration, readyReplicas=$readyReplicas, replicas=$replicas, updateRevision=$updateRevision, updatedReplicas=$updatedReplicas]';

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
    if (this.currentReplicas != null) {
      json[r'currentReplicas'] = this.currentReplicas;
    } else {
      json[r'currentReplicas'] = null;
    }
    if (this.currentRevision != null) {
      json[r'currentRevision'] = this.currentRevision;
    } else {
      json[r'currentRevision'] = null;
    }
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
    json[r'replicas'] = this.replicas;
    if (this.updateRevision != null) {
      json[r'updateRevision'] = this.updateRevision;
    } else {
      json[r'updateRevision'] = null;
    }
    if (this.updatedReplicas != null) {
      json[r'updatedReplicas'] = this.updatedReplicas;
    } else {
      json[r'updatedReplicas'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1StatefulSetStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1StatefulSetStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1StatefulSetStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1StatefulSetStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1StatefulSetStatus(
        availableReplicas: mapValueOfType<int>(json, r'availableReplicas'),
        collisionCount: mapValueOfType<int>(json, r'collisionCount'),
        conditions: IoK8sApiAppsV1StatefulSetCondition.listFromJson(
                json[r'conditions']) ??
            const [],
        currentReplicas: mapValueOfType<int>(json, r'currentReplicas'),
        currentRevision: mapValueOfType<String>(json, r'currentRevision'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        readyReplicas: mapValueOfType<int>(json, r'readyReplicas'),
        replicas: mapValueOfType<int>(json, r'replicas')!,
        updateRevision: mapValueOfType<String>(json, r'updateRevision'),
        updatedReplicas: mapValueOfType<int>(json, r'updatedReplicas'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1StatefulSetStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1StatefulSetStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1StatefulSetStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1StatefulSetStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1StatefulSetStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1StatefulSetStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1StatefulSetStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1StatefulSetStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1StatefulSetStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1StatefulSetStatus.listFromJson(
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
    'replicas',
  };
}
