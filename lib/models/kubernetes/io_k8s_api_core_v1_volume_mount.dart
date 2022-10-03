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

class IoK8sApiCoreV1VolumeMount {
  /// Returns a new [IoK8sApiCoreV1VolumeMount] instance.
  IoK8sApiCoreV1VolumeMount({
    required this.mountPath,
    this.mountPropagation,
    required this.name,
    this.readOnly,
    this.subPath,
    this.subPathExpr,
  });

  /// Path within the container at which the volume should be mounted.  Must not contain ':'.
  String mountPath;

  /// mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mountPropagation;

  /// This must match the Name of a Volume.
  String name;

  /// Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// Path within the volume from which the container's volume should be mounted. Defaults to \"\" (volume's root).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subPath;

  /// Expanded path within the volume from which the container's volume should be mounted. Behaves similarly to SubPath but environment variable references $(VAR_NAME) are expanded using the container's environment. Defaults to \"\" (volume's root). SubPathExpr and SubPath are mutually exclusive.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subPathExpr;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1VolumeMount &&
          other.mountPath == mountPath &&
          other.mountPropagation == mountPropagation &&
          other.name == name &&
          other.readOnly == readOnly &&
          other.subPath == subPath &&
          other.subPathExpr == subPathExpr;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mountPath.hashCode) +
      (mountPropagation == null ? 0 : mountPropagation!.hashCode) +
      (name.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (subPath == null ? 0 : subPath!.hashCode) +
      (subPathExpr == null ? 0 : subPathExpr!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1VolumeMount[mountPath=$mountPath, mountPropagation=$mountPropagation, name=$name, readOnly=$readOnly, subPath=$subPath, subPathExpr=$subPathExpr]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'mountPath'] = this.mountPath;
    if (this.mountPropagation != null) {
      json[r'mountPropagation'] = this.mountPropagation;
    } else {
      json[r'mountPropagation'] = null;
    }
    json[r'name'] = this.name;
    if (this.readOnly != null) {
      json[r'readOnly'] = this.readOnly;
    } else {
      json[r'readOnly'] = null;
    }
    if (this.subPath != null) {
      json[r'subPath'] = this.subPath;
    } else {
      json[r'subPath'] = null;
    }
    if (this.subPathExpr != null) {
      json[r'subPathExpr'] = this.subPathExpr;
    } else {
      json[r'subPathExpr'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1VolumeMount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1VolumeMount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1VolumeMount[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1VolumeMount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1VolumeMount(
        mountPath: mapValueOfType<String>(json, r'mountPath')!,
        mountPropagation: mapValueOfType<String>(json, r'mountPropagation'),
        name: mapValueOfType<String>(json, r'name')!,
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        subPath: mapValueOfType<String>(json, r'subPath'),
        subPathExpr: mapValueOfType<String>(json, r'subPathExpr'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1VolumeMount>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1VolumeMount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1VolumeMount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1VolumeMount> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1VolumeMount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1VolumeMount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1VolumeMount-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1VolumeMount>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1VolumeMount>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1VolumeMount.listFromJson(
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
    'mountPath',
    'name',
  };
}
