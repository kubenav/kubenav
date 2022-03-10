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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';

class IoK8sApiBatchV1CronJobStatus {
  /// Returns a new [IoK8sApiBatchV1CronJobStatus] instance.
  IoK8sApiBatchV1CronJobStatus({
    this.active = const [],
    this.lastScheduleTime,
    this.lastSuccessfulTime,
  });

  /// A list of pointers to currently running jobs.
  List<IoK8sApiCoreV1ObjectReference> active;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastScheduleTime;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastSuccessfulTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1CronJobStatus &&
          other.active == active &&
          other.lastScheduleTime == lastScheduleTime &&
          other.lastSuccessfulTime == lastSuccessfulTime;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (active.hashCode) +
      (lastScheduleTime == null ? 0 : lastScheduleTime!.hashCode) +
      (lastSuccessfulTime == null ? 0 : lastSuccessfulTime!.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1CronJobStatus[active=$active, lastScheduleTime=$lastScheduleTime, lastSuccessfulTime=$lastSuccessfulTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'active'] = active;
    if (lastScheduleTime != null) {
      json[r'lastScheduleTime'] = lastScheduleTime!.toUtc().toIso8601String();
    }
    if (lastSuccessfulTime != null) {
      json[r'lastSuccessfulTime'] =
          lastSuccessfulTime!.toUtc().toIso8601String();
    }
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1CronJobStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1CronJobStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1CronJobStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1CronJobStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1CronJobStatus(
        active: IoK8sApiCoreV1ObjectReference.listFromJson(json[r'active']) ??
            const [],
        lastScheduleTime: mapDateTime(json, r'lastScheduleTime', ''),
        lastSuccessfulTime: mapDateTime(json, r'lastSuccessfulTime', ''),
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1CronJobStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1CronJobStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1CronJobStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1CronJobStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiBatchV1CronJobStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1CronJobStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1CronJobStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1CronJobStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1CronJobStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1CronJobStatus.listFromJson(
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
