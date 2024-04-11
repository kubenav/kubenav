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

class IoK8sApiAppsV1RollingUpdateStatefulSetStrategy {
  /// Returns a new [IoK8sApiAppsV1RollingUpdateStatefulSetStrategy] instance.
  IoK8sApiAppsV1RollingUpdateStatefulSetStrategy({
    this.maxUnavailable,
    this.partition,
  });

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  dynamic maxUnavailable;

  /// Partition indicates the ordinal at which the StatefulSet should be partitioned for updates. During a rolling update, all pods from ordinal Replicas-1 to Partition are updated. All pods from ordinal Partition-1 to 0 remain untouched. This is helpful in being able to do a canary based deployment. The default value is 0.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? partition;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1RollingUpdateStatefulSetStrategy &&
          other.maxUnavailable == maxUnavailable &&
          other.partition == partition;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (maxUnavailable == null ? 0 : maxUnavailable!.hashCode) +
      (partition == null ? 0 : partition!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1RollingUpdateStatefulSetStrategy[maxUnavailable=$maxUnavailable, partition=$partition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maxUnavailable != null) {
      json[r'maxUnavailable'] = this.maxUnavailable;
    } else {
      json[r'maxUnavailable'] = null;
    }
    if (this.partition != null) {
      json[r'partition'] = this.partition;
    } else {
      json[r'partition'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1RollingUpdateStatefulSetStrategy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1RollingUpdateStatefulSetStrategy? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1RollingUpdateStatefulSetStrategy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1RollingUpdateStatefulSetStrategy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1RollingUpdateStatefulSetStrategy(
        maxUnavailable: mapValueOfType<dynamic>(json, r'maxUnavailable'),
        partition: mapValueOfType<int>(json, r'partition'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAppsV1RollingUpdateStatefulSetStrategy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1RollingUpdateStatefulSetStrategy.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1RollingUpdateStatefulSetStrategy-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAppsV1RollingUpdateStatefulSetStrategy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1RollingUpdateStatefulSetStrategy.listFromJson(
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
