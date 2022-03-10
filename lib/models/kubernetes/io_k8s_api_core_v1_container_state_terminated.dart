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

class IoK8sApiCoreV1ContainerStateTerminated {
  /// Returns a new [IoK8sApiCoreV1ContainerStateTerminated] instance.
  IoK8sApiCoreV1ContainerStateTerminated({
    this.containerID,
    required this.exitCode,
    this.finishedAt,
    this.message,
    this.reason,
    this.signal,
    this.startedAt,
  });

  /// Container's ID in the format 'docker://<container_id>'
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? containerID;

  /// Exit status from the last termination of the container
  int exitCode;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? finishedAt;

  /// Message regarding the last termination of the container
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// (brief) reason from the last termination of the container
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Signal from the last termination of the container
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? signal;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ContainerStateTerminated &&
          other.containerID == containerID &&
          other.exitCode == exitCode &&
          other.finishedAt == finishedAt &&
          other.message == message &&
          other.reason == reason &&
          other.signal == signal &&
          other.startedAt == startedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (containerID == null ? 0 : containerID!.hashCode) +
      (exitCode.hashCode) +
      (finishedAt == null ? 0 : finishedAt!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (signal == null ? 0 : signal!.hashCode) +
      (startedAt == null ? 0 : startedAt!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ContainerStateTerminated[containerID=$containerID, exitCode=$exitCode, finishedAt=$finishedAt, message=$message, reason=$reason, signal=$signal, startedAt=$startedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (containerID != null) {
      json[r'containerID'] = containerID;
    }
    json[r'exitCode'] = exitCode;
    if (finishedAt != null) {
      json[r'finishedAt'] = finishedAt!.toUtc().toIso8601String();
    }
    if (message != null) {
      json[r'message'] = message;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    if (signal != null) {
      json[r'signal'] = signal;
    }
    if (startedAt != null) {
      json[r'startedAt'] = startedAt!.toUtc().toIso8601String();
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ContainerStateTerminated] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ContainerStateTerminated? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ContainerStateTerminated[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ContainerStateTerminated[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ContainerStateTerminated(
        containerID: mapValueOfType<String>(json, r'containerID'),
        exitCode: mapValueOfType<int>(json, r'exitCode')!,
        finishedAt: mapDateTime(json, r'finishedAt', ''),
        message: mapValueOfType<String>(json, r'message'),
        reason: mapValueOfType<String>(json, r'reason'),
        signal: mapValueOfType<int>(json, r'signal'),
        startedAt: mapDateTime(json, r'startedAt', ''),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ContainerStateTerminated>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerStateTerminated>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ContainerStateTerminated.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ContainerStateTerminated> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ContainerStateTerminated>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ContainerStateTerminated.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ContainerStateTerminated-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ContainerStateTerminated>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ContainerStateTerminated>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ContainerStateTerminated.listFromJson(
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
    'exitCode',
  };
}
