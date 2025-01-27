//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state_operation.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state_sync_result.dart';

class IoArgoprojV1alpha1ApplicationStatusOperationState {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationState] instance.
  IoArgoprojV1alpha1ApplicationStatusOperationState({
    this.finishedAt,
    this.message,
    required this.operation,
    required this.phase,
    this.retryCount,
    required this.startedAt,
    this.syncResult,
  });

  /// FinishedAt contains time of operation completion
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? finishedAt;

  /// Message holds any pertinent messages when attempting to perform operation (typically errors).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  IoArgoprojV1alpha1ApplicationStatusOperationStateOperation operation;

  /// Phase is the current phase of the operation
  String phase;

  /// RetryCount contains time of operation retries
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retryCount;

  /// StartedAt contains time of operation start
  DateTime startedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult? syncResult;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusOperationState &&
          other.finishedAt == finishedAt &&
          other.message == message &&
          other.operation == operation &&
          other.phase == phase &&
          other.retryCount == retryCount &&
          other.startedAt == startedAt &&
          other.syncResult == syncResult;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (finishedAt == null ? 0 : finishedAt!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (operation.hashCode) +
      (phase.hashCode) +
      (retryCount == null ? 0 : retryCount!.hashCode) +
      (startedAt.hashCode) +
      (syncResult == null ? 0 : syncResult!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusOperationState[finishedAt=$finishedAt, message=$message, operation=$operation, phase=$phase, retryCount=$retryCount, startedAt=$startedAt, syncResult=$syncResult]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.finishedAt != null) {
      json[r'finishedAt'] = this.finishedAt!.toUtc().toIso8601String();
    } else {
      json[r'finishedAt'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'operation'] = this.operation;
    json[r'phase'] = this.phase;
    if (this.retryCount != null) {
      json[r'retryCount'] = this.retryCount;
    } else {
      json[r'retryCount'] = null;
    }
    json[r'startedAt'] = this.startedAt.toUtc().toIso8601String();
    if (this.syncResult != null) {
      json[r'syncResult'] = this.syncResult;
    } else {
      json[r'syncResult'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationState] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusOperationState? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationState[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationState[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusOperationState(
        finishedAt: mapDateTime(json, r'finishedAt', r''),
        message: mapValueOfType<String>(json, r'message'),
        operation:
            IoArgoprojV1alpha1ApplicationStatusOperationStateOperation.fromJson(
                json[r'operation'])!,
        phase: mapValueOfType<String>(json, r'phase')!,
        retryCount: mapValueOfType<int>(json, r'retryCount'),
        startedAt: mapDateTime(json, r'startedAt', r'')!,
        syncResult: IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult
            .fromJson(json[r'syncResult']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusOperationState> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatusOperationState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusOperationState>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatusOperationState>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationState.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusOperationState-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatusOperationState>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationStatusOperationState>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusOperationState.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'operation',
    'phase',
    'startedAt',
  };
}
