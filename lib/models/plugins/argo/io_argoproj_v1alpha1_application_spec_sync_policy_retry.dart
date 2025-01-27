//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_retry_backoff.dart';

class IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry] instance.
  IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry({
    this.backoff,
    this.limit,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationRetryBackoff? backoff;

  /// Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? limit;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry &&
          other.backoff == backoff &&
          other.limit == limit;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (backoff == null ? 0 : backoff!.hashCode) +
      (limit == null ? 0 : limit!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry[backoff=$backoff, limit=$limit]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.backoff != null) {
      json[r'backoff'] = this.backoff;
    } else {
      json[r'backoff'] = null;
    }
    if (this.limit != null) {
      json[r'limit'] = this.limit;
    } else {
      json[r'limit'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry(
        backoff: IoArgoprojV1alpha1ApplicationOperationRetryBackoff.fromJson(
            json[r'backoff']),
        limit: mapValueOfType<int>(json, r'limit'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry.listFromJson(
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
