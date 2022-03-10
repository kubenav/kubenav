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

class IoK8sApiCoreV1AzureDiskVolumeSource {
  /// Returns a new [IoK8sApiCoreV1AzureDiskVolumeSource] instance.
  IoK8sApiCoreV1AzureDiskVolumeSource({
    this.cachingMode,
    required this.diskName,
    required this.diskURI,
    this.fsType,
    this.kind,
    this.readOnly,
  });

  /// Host Caching mode: None, Read Only, Read Write.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cachingMode;

  /// The Name of the data disk in the blob storage
  String diskName;

  /// The URI the data disk in the blob storage
  String diskURI;

  /// Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// Expected values Shared: multiple blob disks per storage account  Dedicated: single blob disk per storage account  Managed: azure managed data disk (only in managed availability set). defaults to shared
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
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
      other is IoK8sApiCoreV1AzureDiskVolumeSource &&
          other.cachingMode == cachingMode &&
          other.diskName == diskName &&
          other.diskURI == diskURI &&
          other.fsType == fsType &&
          other.kind == kind &&
          other.readOnly == readOnly;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cachingMode == null ? 0 : cachingMode!.hashCode) +
      (diskName.hashCode) +
      (diskURI.hashCode) +
      (fsType == null ? 0 : fsType!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1AzureDiskVolumeSource[cachingMode=$cachingMode, diskName=$diskName, diskURI=$diskURI, fsType=$fsType, kind=$kind, readOnly=$readOnly]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (cachingMode != null) {
      json[r'cachingMode'] = cachingMode;
    }
    json[r'diskName'] = diskName;
    json[r'diskURI'] = diskURI;
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1AzureDiskVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1AzureDiskVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1AzureDiskVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1AzureDiskVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1AzureDiskVolumeSource(
        cachingMode: mapValueOfType<String>(json, r'cachingMode'),
        diskName: mapValueOfType<String>(json, r'diskName')!,
        diskURI: mapValueOfType<String>(json, r'diskURI')!,
        fsType: mapValueOfType<String>(json, r'fsType'),
        kind: mapValueOfType<String>(json, r'kind'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1AzureDiskVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1AzureDiskVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1AzureDiskVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1AzureDiskVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1AzureDiskVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1AzureDiskVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1AzureDiskVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1AzureDiskVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1AzureDiskVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1AzureDiskVolumeSource.listFromJson(
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
    'diskName',
    'diskURI',
  };
}
