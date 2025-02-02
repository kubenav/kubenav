//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationStatusConditionsInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusConditionsInner] instance.
  IoArgoprojV1alpha1ApplicationStatusConditionsInner({
    this.lastTransitionTime,
    required this.message,
    required this.type,
  });

  /// LastTransitionTime is the time the condition was last observed
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  /// Message contains human-readable message indicating details about condition
  String message;

  /// Type is an application condition type
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusConditionsInner &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusConditionsInner[lastTransitionTime=$lastTransitionTime, message=$message, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          this.lastTransitionTime!.toUtc().toIso8601String();
    } else {
      json[r'lastTransitionTime'] = null;
    }
    json[r'message'] = this.message;
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusConditionsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusConditionsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusConditionsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusConditionsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusConditionsInner(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r''),
        message: mapValueOfType<String>(json, r'message')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusConditionsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatusConditionsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusConditionsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusConditionsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatusConditionsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusConditionsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusConditionsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatusConditionsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationStatusConditionsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusConditionsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'type',
  };
}
