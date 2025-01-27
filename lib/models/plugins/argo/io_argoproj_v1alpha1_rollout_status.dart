//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_status_conditions_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_alb.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_blue_green.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_canary.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_pause_conditions_inner.dart';

class IoArgoprojV1alpha1RolloutStatus {
  /// Returns a new [IoArgoprojV1alpha1RolloutStatus] instance.
  IoArgoprojV1alpha1RolloutStatus({
    this.hPAReplicas,
    this.abort,
    this.abortedAt,
    this.alb,
    this.availableReplicas,
    this.blueGreen,
    this.canary,
    this.collisionCount,
    this.conditions = const [],
    this.controllerPause,
    this.currentPodHash,
    this.currentStepHash,
    this.currentStepIndex,
    this.message,
    this.observedGeneration,
    this.pauseConditions = const [],
    this.phase,
    this.promoteFull,
    this.readyReplicas,
    this.replicas,
    this.restartedAt,
    this.selector,
    this.stableRS,
    this.updatedReplicas,
    this.workloadObservedGeneration,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hPAReplicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? abort;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? abortedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusAlb? alb;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? availableReplicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusBlueGreen? blueGreen;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusCanary? canary;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collisionCount;

  List<IoArgoprojV1alpha1ExperimentStatusConditionsInner> conditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? controllerPause;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currentPodHash;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currentStepHash;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? currentStepIndex;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedGeneration;

  List<IoArgoprojV1alpha1RolloutStatusPauseConditionsInner> pauseConditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phase;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? promoteFull;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? readyReplicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? restartedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stableRS;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedReplicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workloadObservedGeneration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutStatus &&
          other.hPAReplicas == hPAReplicas &&
          other.abort == abort &&
          other.abortedAt == abortedAt &&
          other.alb == alb &&
          other.availableReplicas == availableReplicas &&
          other.blueGreen == blueGreen &&
          other.canary == canary &&
          other.collisionCount == collisionCount &&
          deepEquality.equals(other.conditions, conditions) &&
          other.controllerPause == controllerPause &&
          other.currentPodHash == currentPodHash &&
          other.currentStepHash == currentStepHash &&
          other.currentStepIndex == currentStepIndex &&
          other.message == message &&
          other.observedGeneration == observedGeneration &&
          deepEquality.equals(other.pauseConditions, pauseConditions) &&
          other.phase == phase &&
          other.promoteFull == promoteFull &&
          other.readyReplicas == readyReplicas &&
          other.replicas == replicas &&
          other.restartedAt == restartedAt &&
          other.selector == selector &&
          other.stableRS == stableRS &&
          other.updatedReplicas == updatedReplicas &&
          other.workloadObservedGeneration == workloadObservedGeneration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (hPAReplicas == null ? 0 : hPAReplicas!.hashCode) +
      (abort == null ? 0 : abort!.hashCode) +
      (abortedAt == null ? 0 : abortedAt!.hashCode) +
      (alb == null ? 0 : alb!.hashCode) +
      (availableReplicas == null ? 0 : availableReplicas!.hashCode) +
      (blueGreen == null ? 0 : blueGreen!.hashCode) +
      (canary == null ? 0 : canary!.hashCode) +
      (collisionCount == null ? 0 : collisionCount!.hashCode) +
      (conditions.hashCode) +
      (controllerPause == null ? 0 : controllerPause!.hashCode) +
      (currentPodHash == null ? 0 : currentPodHash!.hashCode) +
      (currentStepHash == null ? 0 : currentStepHash!.hashCode) +
      (currentStepIndex == null ? 0 : currentStepIndex!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (pauseConditions.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (promoteFull == null ? 0 : promoteFull!.hashCode) +
      (readyReplicas == null ? 0 : readyReplicas!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (restartedAt == null ? 0 : restartedAt!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (stableRS == null ? 0 : stableRS!.hashCode) +
      (updatedReplicas == null ? 0 : updatedReplicas!.hashCode) +
      (workloadObservedGeneration == null
          ? 0
          : workloadObservedGeneration!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutStatus[hPAReplicas=$hPAReplicas, abort=$abort, abortedAt=$abortedAt, alb=$alb, availableReplicas=$availableReplicas, blueGreen=$blueGreen, canary=$canary, collisionCount=$collisionCount, conditions=$conditions, controllerPause=$controllerPause, currentPodHash=$currentPodHash, currentStepHash=$currentStepHash, currentStepIndex=$currentStepIndex, message=$message, observedGeneration=$observedGeneration, pauseConditions=$pauseConditions, phase=$phase, promoteFull=$promoteFull, readyReplicas=$readyReplicas, replicas=$replicas, restartedAt=$restartedAt, selector=$selector, stableRS=$stableRS, updatedReplicas=$updatedReplicas, workloadObservedGeneration=$workloadObservedGeneration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hPAReplicas != null) {
      json[r'HPAReplicas'] = this.hPAReplicas;
    } else {
      json[r'HPAReplicas'] = null;
    }
    if (this.abort != null) {
      json[r'abort'] = this.abort;
    } else {
      json[r'abort'] = null;
    }
    if (this.abortedAt != null) {
      json[r'abortedAt'] = this.abortedAt!.toUtc().toIso8601String();
    } else {
      json[r'abortedAt'] = null;
    }
    if (this.alb != null) {
      json[r'alb'] = this.alb;
    } else {
      json[r'alb'] = null;
    }
    if (this.availableReplicas != null) {
      json[r'availableReplicas'] = this.availableReplicas;
    } else {
      json[r'availableReplicas'] = null;
    }
    if (this.blueGreen != null) {
      json[r'blueGreen'] = this.blueGreen;
    } else {
      json[r'blueGreen'] = null;
    }
    if (this.canary != null) {
      json[r'canary'] = this.canary;
    } else {
      json[r'canary'] = null;
    }
    if (this.collisionCount != null) {
      json[r'collisionCount'] = this.collisionCount;
    } else {
      json[r'collisionCount'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.controllerPause != null) {
      json[r'controllerPause'] = this.controllerPause;
    } else {
      json[r'controllerPause'] = null;
    }
    if (this.currentPodHash != null) {
      json[r'currentPodHash'] = this.currentPodHash;
    } else {
      json[r'currentPodHash'] = null;
    }
    if (this.currentStepHash != null) {
      json[r'currentStepHash'] = this.currentStepHash;
    } else {
      json[r'currentStepHash'] = null;
    }
    if (this.currentStepIndex != null) {
      json[r'currentStepIndex'] = this.currentStepIndex;
    } else {
      json[r'currentStepIndex'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    json[r'pauseConditions'] = this.pauseConditions;
    if (this.phase != null) {
      json[r'phase'] = this.phase;
    } else {
      json[r'phase'] = null;
    }
    if (this.promoteFull != null) {
      json[r'promoteFull'] = this.promoteFull;
    } else {
      json[r'promoteFull'] = null;
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
    if (this.restartedAt != null) {
      json[r'restartedAt'] = this.restartedAt!.toUtc().toIso8601String();
    } else {
      json[r'restartedAt'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    if (this.stableRS != null) {
      json[r'stableRS'] = this.stableRS;
    } else {
      json[r'stableRS'] = null;
    }
    if (this.updatedReplicas != null) {
      json[r'updatedReplicas'] = this.updatedReplicas;
    } else {
      json[r'updatedReplicas'] = null;
    }
    if (this.workloadObservedGeneration != null) {
      json[r'workloadObservedGeneration'] = this.workloadObservedGeneration;
    } else {
      json[r'workloadObservedGeneration'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutStatus(
        hPAReplicas: mapValueOfType<int>(json, r'HPAReplicas'),
        abort: mapValueOfType<bool>(json, r'abort'),
        abortedAt: mapDateTime(json, r'abortedAt', r''),
        alb: IoArgoprojV1alpha1RolloutStatusAlb.fromJson(json[r'alb']),
        availableReplicas: mapValueOfType<int>(json, r'availableReplicas'),
        blueGreen: IoArgoprojV1alpha1RolloutStatusBlueGreen.fromJson(
            json[r'blueGreen']),
        canary: IoArgoprojV1alpha1RolloutStatusCanary.fromJson(json[r'canary']),
        collisionCount: mapValueOfType<int>(json, r'collisionCount'),
        conditions:
            IoArgoprojV1alpha1ExperimentStatusConditionsInner.listFromJson(
                json[r'conditions']),
        controllerPause: mapValueOfType<bool>(json, r'controllerPause'),
        currentPodHash: mapValueOfType<String>(json, r'currentPodHash'),
        currentStepHash: mapValueOfType<String>(json, r'currentStepHash'),
        currentStepIndex: mapValueOfType<int>(json, r'currentStepIndex'),
        message: mapValueOfType<String>(json, r'message'),
        observedGeneration: mapValueOfType<String>(json, r'observedGeneration'),
        pauseConditions:
            IoArgoprojV1alpha1RolloutStatusPauseConditionsInner.listFromJson(
                json[r'pauseConditions']),
        phase: mapValueOfType<String>(json, r'phase'),
        promoteFull: mapValueOfType<bool>(json, r'promoteFull'),
        readyReplicas: mapValueOfType<int>(json, r'readyReplicas'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        restartedAt: mapDateTime(json, r'restartedAt', r''),
        selector: mapValueOfType<String>(json, r'selector'),
        stableRS: mapValueOfType<String>(json, r'stableRS'),
        updatedReplicas: mapValueOfType<int>(json, r'updatedReplicas'),
        workloadObservedGeneration:
            mapValueOfType<String>(json, r'workloadObservedGeneration'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1RolloutStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1RolloutStatus.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
