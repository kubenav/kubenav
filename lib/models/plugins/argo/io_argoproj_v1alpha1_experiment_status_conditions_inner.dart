//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ExperimentStatusConditionsInner {
  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusConditionsInner] instance.
  IoArgoprojV1alpha1ExperimentStatusConditionsInner({
    required this.lastTransitionTime,
    required this.lastUpdateTime,
    required this.message,
    required this.reason,
    required this.status,
    required this.type,
  });

  DateTime lastTransitionTime;

  DateTime lastUpdateTime;

  String message;

  String reason;

  String status;

  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentStatusConditionsInner &&
          other.lastTransitionTime == lastTransitionTime &&
          other.lastUpdateTime == lastUpdateTime &&
          other.message == message &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime.hashCode) +
      (lastUpdateTime.hashCode) +
      (message.hashCode) +
      (reason.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentStatusConditionsInner[lastTransitionTime=$lastTransitionTime, lastUpdateTime=$lastUpdateTime, message=$message, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'lastTransitionTime'] =
        this.lastTransitionTime.toUtc().toIso8601String();
    json[r'lastUpdateTime'] = this.lastUpdateTime.toUtc().toIso8601String();
    json[r'message'] = this.message;
    json[r'reason'] = this.reason;
    json[r'status'] = this.status;
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusConditionsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentStatusConditionsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentStatusConditionsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentStatusConditionsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentStatusConditionsInner(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r'')!,
        lastUpdateTime: mapDateTime(json, r'lastUpdateTime', r'')!,
        message: mapValueOfType<String>(json, r'message')!,
        reason: mapValueOfType<String>(json, r'reason')!,
        status: mapValueOfType<String>(json, r'status')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentStatusConditionsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentStatusConditionsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusConditionsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentStatusConditionsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentStatusConditionsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusConditionsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentStatusConditionsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentStatusConditionsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ExperimentStatusConditionsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ExperimentStatusConditionsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'lastTransitionTime',
    'lastUpdateTime',
    'message',
    'reason',
    'status',
    'type',
  };
}
