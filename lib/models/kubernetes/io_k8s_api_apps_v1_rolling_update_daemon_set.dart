//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiAppsV1RollingUpdateDaemonSet {
  /// Returns a new [IoK8sApiAppsV1RollingUpdateDaemonSet] instance.
  IoK8sApiAppsV1RollingUpdateDaemonSet({
    this.maxSurge,
    this.maxUnavailable,
  });

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  dynamic maxSurge;

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  dynamic maxUnavailable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1RollingUpdateDaemonSet &&
          other.maxSurge == maxSurge &&
          other.maxUnavailable == maxUnavailable;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (maxSurge == null ? 0 : maxSurge!.hashCode) +
      (maxUnavailable == null ? 0 : maxUnavailable!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1RollingUpdateDaemonSet[maxSurge=$maxSurge, maxUnavailable=$maxUnavailable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maxSurge != null) {
      json[r'maxSurge'] = this.maxSurge;
    } else {
      json[r'maxSurge'] = null;
    }
    if (this.maxUnavailable != null) {
      json[r'maxUnavailable'] = this.maxUnavailable;
    } else {
      json[r'maxUnavailable'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1RollingUpdateDaemonSet] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1RollingUpdateDaemonSet? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1RollingUpdateDaemonSet[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1RollingUpdateDaemonSet[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1RollingUpdateDaemonSet(
        maxSurge: mapValueOfType<dynamic>(json, r'maxSurge'),
        maxUnavailable: mapValueOfType<dynamic>(json, r'maxUnavailable'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1RollingUpdateDaemonSet>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1RollingUpdateDaemonSet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1RollingUpdateDaemonSet.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1RollingUpdateDaemonSet> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1RollingUpdateDaemonSet>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1RollingUpdateDaemonSet.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1RollingUpdateDaemonSet-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1RollingUpdateDaemonSet>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1RollingUpdateDaemonSet>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1RollingUpdateDaemonSet.listFromJson(
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
