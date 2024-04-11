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

class IoK8sApiCoreV1PersistentVolumeClaimVolumeSource {
  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimVolumeSource] instance.
  IoK8sApiCoreV1PersistentVolumeClaimVolumeSource({
    required this.claimName,
    this.readOnly,
  });

  /// claimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
  String claimName;

  /// readOnly Will force the ReadOnly setting in VolumeMounts. Default false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PersistentVolumeClaimVolumeSource &&
          other.claimName == claimName &&
          other.readOnly == readOnly;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (claimName.hashCode) + (readOnly == null ? 0 : readOnly!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PersistentVolumeClaimVolumeSource[claimName=$claimName, readOnly=$readOnly]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'claimName'] = this.claimName;
    if (this.readOnly != null) {
      json[r'readOnly'] = this.readOnly;
    } else {
      json[r'readOnly'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PersistentVolumeClaimVolumeSource? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PersistentVolumeClaimVolumeSource(
        claimName: mapValueOfType<String>(json, r'claimName')!,
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1PersistentVolumeClaimVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeClaimVolumeSource.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PersistentVolumeClaimVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCoreV1PersistentVolumeClaimVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1PersistentVolumeClaimVolumeSource.listFromJson(
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
    'claimName',
  };
}
