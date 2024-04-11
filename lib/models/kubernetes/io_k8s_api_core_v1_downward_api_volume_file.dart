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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_field_selector.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_field_selector.dart';

class IoK8sApiCoreV1DownwardAPIVolumeFile {
  /// Returns a new [IoK8sApiCoreV1DownwardAPIVolumeFile] instance.
  IoK8sApiCoreV1DownwardAPIVolumeFile({
    this.fieldRef,
    this.mode,
    required this.path,
    this.resourceFieldRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectFieldSelector? fieldRef;

  /// Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? mode;

  /// Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'
  String path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ResourceFieldSelector? resourceFieldRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1DownwardAPIVolumeFile &&
          other.fieldRef == fieldRef &&
          other.mode == mode &&
          other.path == path &&
          other.resourceFieldRef == resourceFieldRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fieldRef == null ? 0 : fieldRef!.hashCode) +
      (mode == null ? 0 : mode!.hashCode) +
      (path.hashCode) +
      (resourceFieldRef == null ? 0 : resourceFieldRef!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1DownwardAPIVolumeFile[fieldRef=$fieldRef, mode=$mode, path=$path, resourceFieldRef=$resourceFieldRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fieldRef != null) {
      json[r'fieldRef'] = this.fieldRef;
    } else {
      json[r'fieldRef'] = null;
    }
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    json[r'path'] = this.path;
    if (this.resourceFieldRef != null) {
      json[r'resourceFieldRef'] = this.resourceFieldRef;
    } else {
      json[r'resourceFieldRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1DownwardAPIVolumeFile] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1DownwardAPIVolumeFile? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1DownwardAPIVolumeFile[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1DownwardAPIVolumeFile[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1DownwardAPIVolumeFile(
        fieldRef: IoK8sApiCoreV1ObjectFieldSelector.fromJson(json[r'fieldRef']),
        mode: mapValueOfType<int>(json, r'mode'),
        path: mapValueOfType<String>(json, r'path')!,
        resourceFieldRef: IoK8sApiCoreV1ResourceFieldSelector.fromJson(
            json[r'resourceFieldRef']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1DownwardAPIVolumeFile>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1DownwardAPIVolumeFile>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1DownwardAPIVolumeFile.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1DownwardAPIVolumeFile> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1DownwardAPIVolumeFile>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1DownwardAPIVolumeFile.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1DownwardAPIVolumeFile-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1DownwardAPIVolumeFile>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1DownwardAPIVolumeFile>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1DownwardAPIVolumeFile.listFromJson(
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
    'path',
  };
}
