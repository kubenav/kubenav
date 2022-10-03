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

class IoK8sApiCoreV1FCVolumeSource {
  /// Returns a new [IoK8sApiCoreV1FCVolumeSource] instance.
  IoK8sApiCoreV1FCVolumeSource({
    this.fsType,
    this.lun,
    this.readOnly,
    this.targetWWNs = const [],
    this.wwids = const [],
  });

  /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// lun is Optional: FC target lun number
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lun;

  /// readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// targetWWNs is Optional: FC target worldwide names (WWNs)
  List<String> targetWWNs;

  /// wwids Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
  List<String> wwids;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1FCVolumeSource &&
          other.fsType == fsType &&
          other.lun == lun &&
          other.readOnly == readOnly &&
          other.targetWWNs == targetWWNs &&
          other.wwids == wwids;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (lun == null ? 0 : lun!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (targetWWNs.hashCode) +
      (wwids.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1FCVolumeSource[fsType=$fsType, lun=$lun, readOnly=$readOnly, targetWWNs=$targetWWNs, wwids=$wwids]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fsType != null) {
      json[r'fsType'] = this.fsType;
    } else {
      json[r'fsType'] = null;
    }
    if (this.lun != null) {
      json[r'lun'] = this.lun;
    } else {
      json[r'lun'] = null;
    }
    if (this.readOnly != null) {
      json[r'readOnly'] = this.readOnly;
    } else {
      json[r'readOnly'] = null;
    }
    json[r'targetWWNs'] = this.targetWWNs;
    json[r'wwids'] = this.wwids;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1FCVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1FCVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1FCVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1FCVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1FCVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        lun: mapValueOfType<int>(json, r'lun'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        targetWWNs: json[r'targetWWNs'] is List
            ? (json[r'targetWWNs'] as List).cast<String>()
            : const [],
        wwids: json[r'wwids'] is List
            ? (json[r'wwids'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1FCVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1FCVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1FCVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1FCVolumeSource> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1FCVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1FCVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1FCVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1FCVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1FCVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1FCVolumeSource.listFromJson(
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
