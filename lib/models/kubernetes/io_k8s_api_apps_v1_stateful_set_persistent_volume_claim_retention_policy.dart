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

class IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy {
  /// Returns a new [IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy] instance.
  IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy({
    this.whenDeleted,
    this.whenScaled,
  });

  /// WhenDeleted specifies what happens to PVCs created from StatefulSet VolumeClaimTemplates when the StatefulSet is deleted. The default policy of `Retain` causes PVCs to not be affected by StatefulSet deletion. The `Delete` policy causes those PVCs to be deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? whenDeleted;

  /// WhenScaled specifies what happens to PVCs created from StatefulSet VolumeClaimTemplates when the StatefulSet is scaled down. The default policy of `Retain` causes PVCs to not be affected by a scaledown. The `Delete` policy causes the associated PVCs for any excess pods above the replica count to be deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? whenScaled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy &&
          other.whenDeleted == whenDeleted &&
          other.whenScaled == whenScaled;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (whenDeleted == null ? 0 : whenDeleted!.hashCode) +
      (whenScaled == null ? 0 : whenScaled!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy[whenDeleted=$whenDeleted, whenScaled=$whenScaled]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (whenDeleted != null) {
      json[r'whenDeleted'] = whenDeleted;
    }
    if (whenScaled != null) {
      json[r'whenScaled'] = whenScaled;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy(
        whenDeleted: mapValueOfType<String>(json, r'whenDeleted'),
        whenScaled: mapValueOfType<String>(json, r'whenScaled'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy-objects as value to a dart map
  static Map<String,
          List<IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy
                .listFromJson(
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
