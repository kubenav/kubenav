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
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_uncounted_terminated_pods.dart';

class IoK8sApiBatchV1JobStatus {
  /// Returns a new [IoK8sApiBatchV1JobStatus] instance.
  IoK8sApiBatchV1JobStatus({
    this.active,
    this.completedIndexes,
    this.completionTime,
    this.conditions = const [],
    this.failed,
    this.ready,
    this.startTime,
    this.succeeded,
    this.uncountedTerminatedPods,
  });

  /// The number of pending and running pods.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? active;

  /// CompletedIndexes holds the completed indexes when .spec.completionMode = \"Indexed\" in a text format. The indexes are represented as decimal integers separated by commas. The numbers are listed in increasing order. Three or more consecutive numbers are compressed and represented by the first and last element of the series, separated by a hyphen. For example, if the completed indexes are 1, 3, 4, 5 and 7, they are represented as \"1,3-5,7\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? completedIndexes;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? completionTime;

  /// The latest available observations of an object's current state. When a Job fails, one of the conditions will have type \"Failed\" and status true. When a Job is suspended, one of the conditions will have type \"Suspended\" and status true; when the Job is resumed, the status of this condition will become false. When a Job is completed, one of the conditions will have type \"Complete\" and status true. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
  List<IoK8sApiBatchV1JobCondition> conditions;

  /// The number of pods which reached phase Failed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failed;

  /// The number of pods which have a Ready condition.  This field is beta-level. The job controller populates the field when the feature gate JobReadyPods is enabled (enabled by default).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ready;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  /// The number of pods which reached phase Succeeded.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? succeeded;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiBatchV1UncountedTerminatedPods? uncountedTerminatedPods;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1JobStatus &&
          other.active == active &&
          other.completedIndexes == completedIndexes &&
          other.completionTime == completionTime &&
          other.conditions == conditions &&
          other.failed == failed &&
          other.ready == ready &&
          other.startTime == startTime &&
          other.succeeded == succeeded &&
          other.uncountedTerminatedPods == uncountedTerminatedPods;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (active == null ? 0 : active!.hashCode) +
      (completedIndexes == null ? 0 : completedIndexes!.hashCode) +
      (completionTime == null ? 0 : completionTime!.hashCode) +
      (conditions.hashCode) +
      (failed == null ? 0 : failed!.hashCode) +
      (ready == null ? 0 : ready!.hashCode) +
      (startTime == null ? 0 : startTime!.hashCode) +
      (succeeded == null ? 0 : succeeded!.hashCode) +
      (uncountedTerminatedPods == null ? 0 : uncountedTerminatedPods!.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1JobStatus[active=$active, completedIndexes=$completedIndexes, completionTime=$completionTime, conditions=$conditions, failed=$failed, ready=$ready, startTime=$startTime, succeeded=$succeeded, uncountedTerminatedPods=$uncountedTerminatedPods]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.completedIndexes != null) {
      json[r'completedIndexes'] = this.completedIndexes;
    } else {
      json[r'completedIndexes'] = null;
    }
    if (this.completionTime != null) {
      json[r'completionTime'] = this.completionTime!.toUtc().toIso8601String();
    } else {
      json[r'completionTime'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.failed != null) {
      json[r'failed'] = this.failed;
    } else {
      json[r'failed'] = null;
    }
    if (this.ready != null) {
      json[r'ready'] = this.ready;
    } else {
      json[r'ready'] = null;
    }
    if (this.startTime != null) {
      json[r'startTime'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'startTime'] = null;
    }
    if (this.succeeded != null) {
      json[r'succeeded'] = this.succeeded;
    } else {
      json[r'succeeded'] = null;
    }
    if (this.uncountedTerminatedPods != null) {
      json[r'uncountedTerminatedPods'] = this.uncountedTerminatedPods;
    } else {
      json[r'uncountedTerminatedPods'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1JobStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1JobStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1JobStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1JobStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1JobStatus(
        active: mapValueOfType<int>(json, r'active'),
        completedIndexes: mapValueOfType<String>(json, r'completedIndexes'),
        completionTime: mapDateTime(json, r'completionTime', ''),
        conditions:
            IoK8sApiBatchV1JobCondition.listFromJson(json[r'conditions']) ??
                const [],
        failed: mapValueOfType<int>(json, r'failed'),
        ready: mapValueOfType<int>(json, r'ready'),
        startTime: mapDateTime(json, r'startTime', ''),
        succeeded: mapValueOfType<int>(json, r'succeeded'),
        uncountedTerminatedPods:
            IoK8sApiBatchV1UncountedTerminatedPods.fromJson(
                json[r'uncountedTerminatedPods']),
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1JobStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1JobStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1JobStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1JobStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiBatchV1JobStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1JobStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1JobStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1JobStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1JobStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1JobStatus.listFromJson(
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
