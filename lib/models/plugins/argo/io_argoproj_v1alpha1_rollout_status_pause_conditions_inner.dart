//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1RolloutStatusPauseConditionsInner {
  /// Returns a new [IoArgoprojV1alpha1RolloutStatusPauseConditionsInner] instance.
  IoArgoprojV1alpha1RolloutStatusPauseConditionsInner({
    required this.reason,
    required this.startTime,
  });

  String reason;

  DateTime startTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutStatusPauseConditionsInner &&
          other.reason == reason &&
          other.startTime == startTime;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (reason.hashCode) + (startTime.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutStatusPauseConditionsInner[reason=$reason, startTime=$startTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'reason'] = this.reason;
    json[r'startTime'] = this.startTime.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutStatusPauseConditionsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutStatusPauseConditionsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutStatusPauseConditionsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutStatusPauseConditionsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutStatusPauseConditionsInner(
        reason: mapValueOfType<String>(json, r'reason')!,
        startTime: mapDateTime(json, r'startTime', r'')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutStatusPauseConditionsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutStatusPauseConditionsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutStatusPauseConditionsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutStatusPauseConditionsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutStatusPauseConditionsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutStatusPauseConditionsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutStatusPauseConditionsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutStatusPauseConditionsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1RolloutStatusPauseConditionsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutStatusPauseConditionsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'reason',
    'startTime',
  };
}
