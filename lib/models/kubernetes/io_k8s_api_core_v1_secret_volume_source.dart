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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_key_to_path.dart';

class IoK8sApiCoreV1SecretVolumeSource {
  /// Returns a new [IoK8sApiCoreV1SecretVolumeSource] instance.
  IoK8sApiCoreV1SecretVolumeSource({
    this.defaultMode,
    this.items = const [],
    this.optional,
    this.secretName,
  });

  /// defaultMode is Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultMode;

  /// items If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
  List<IoK8sApiCoreV1KeyToPath> items;

  /// optional field specify whether the Secret or its keys must be defined
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? optional;

  /// secretName is the name of the secret in the pod's namespace to use. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? secretName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1SecretVolumeSource &&
          other.defaultMode == defaultMode &&
          other.items == items &&
          other.optional == optional &&
          other.secretName == secretName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultMode == null ? 0 : defaultMode!.hashCode) +
      (items.hashCode) +
      (optional == null ? 0 : optional!.hashCode) +
      (secretName == null ? 0 : secretName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1SecretVolumeSource[defaultMode=$defaultMode, items=$items, optional=$optional, secretName=$secretName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultMode != null) {
      json[r'defaultMode'] = this.defaultMode;
    } else {
      json[r'defaultMode'] = null;
    }
    json[r'items'] = this.items;
    if (this.optional != null) {
      json[r'optional'] = this.optional;
    } else {
      json[r'optional'] = null;
    }
    if (this.secretName != null) {
      json[r'secretName'] = this.secretName;
    } else {
      json[r'secretName'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1SecretVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1SecretVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1SecretVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1SecretVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1SecretVolumeSource(
        defaultMode: mapValueOfType<int>(json, r'defaultMode'),
        items: IoK8sApiCoreV1KeyToPath.listFromJson(json[r'items']) ?? const [],
        optional: mapValueOfType<bool>(json, r'optional'),
        secretName: mapValueOfType<String>(json, r'secretName'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1SecretVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1SecretVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1SecretVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1SecretVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1SecretVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SecretVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1SecretVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1SecretVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1SecretVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SecretVolumeSource.listFromJson(
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
