//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, unnecessary_this, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationOperationRetryBackoff {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationRetryBackoff] instance.
  IoArgoprojV1alpha1ApplicationOperationRetryBackoff({
    this.duration,
    this.factor,
    this.maxDuration,
  });

  /// Duration is the amount to back off. Default unit is seconds, but could also be a duration (e.g. \"2m\", \"1h\")
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  /// Factor is a factor to multiply the base duration after each failed retry
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? factor;

  /// MaxDuration is the maximum amount of time allowed for the backoff strategy
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? maxDuration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationOperationRetryBackoff &&
          other.duration == duration &&
          other.factor == factor &&
          other.maxDuration == maxDuration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (duration == null ? 0 : duration!.hashCode) +
      (factor == null ? 0 : factor!.hashCode) +
      (maxDuration == null ? 0 : maxDuration!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationOperationRetryBackoff[duration=$duration, factor=$factor, maxDuration=$maxDuration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.factor != null) {
      json[r'factor'] = this.factor;
    } else {
      json[r'factor'] = null;
    }
    if (this.maxDuration != null) {
      json[r'maxDuration'] = this.maxDuration;
    } else {
      json[r'maxDuration'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationRetryBackoff] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationRetryBackoff? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationRetryBackoff[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationRetryBackoff[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationRetryBackoff(
        duration: mapValueOfType<String>(json, r'duration'),
        factor: mapValueOfType<int>(json, r'factor'),
        maxDuration: mapValueOfType<String>(json, r'maxDuration'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationOperationRetryBackoff> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationOperationRetryBackoff>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationRetryBackoff.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationOperationRetryBackoff>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationOperationRetryBackoff>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationRetryBackoff.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationRetryBackoff-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationOperationRetryBackoff>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationOperationRetryBackoff>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationRetryBackoff.listFromJson(
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
