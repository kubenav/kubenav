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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_spec.dart';

class IoK8sApiStorageV1VolumeAttachmentSource {
  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentSource] instance.
  IoK8sApiStorageV1VolumeAttachmentSource({
    this.inlineVolumeSpec,
    this.persistentVolumeName,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PersistentVolumeSpec? inlineVolumeSpec;

  /// Name of the persistent volume to attach.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? persistentVolumeName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1VolumeAttachmentSource &&
          other.inlineVolumeSpec == inlineVolumeSpec &&
          other.persistentVolumeName == persistentVolumeName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (inlineVolumeSpec == null ? 0 : inlineVolumeSpec!.hashCode) +
      (persistentVolumeName == null ? 0 : persistentVolumeName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1VolumeAttachmentSource[inlineVolumeSpec=$inlineVolumeSpec, persistentVolumeName=$persistentVolumeName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.inlineVolumeSpec != null) {
      json[r'inlineVolumeSpec'] = this.inlineVolumeSpec;
    } else {
      json[r'inlineVolumeSpec'] = null;
    }
    if (this.persistentVolumeName != null) {
      json[r'persistentVolumeName'] = this.persistentVolumeName;
    } else {
      json[r'persistentVolumeName'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1VolumeAttachmentSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1VolumeAttachmentSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1VolumeAttachmentSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1VolumeAttachmentSource(
        inlineVolumeSpec: IoK8sApiCoreV1PersistentVolumeSpec.fromJson(
            json[r'inlineVolumeSpec']),
        persistentVolumeName:
            mapValueOfType<String>(json, r'persistentVolumeName'),
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1VolumeAttachmentSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1VolumeAttachmentSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1VolumeAttachmentSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1VolumeAttachmentSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiStorageV1VolumeAttachmentSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiStorageV1VolumeAttachmentSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1VolumeAttachmentSource-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1VolumeAttachmentSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1VolumeAttachmentSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1VolumeAttachmentSource.listFromJson(
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
