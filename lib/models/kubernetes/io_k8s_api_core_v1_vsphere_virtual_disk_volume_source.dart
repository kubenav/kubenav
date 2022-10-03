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

class IoK8sApiCoreV1VsphereVirtualDiskVolumeSource {
  /// Returns a new [IoK8sApiCoreV1VsphereVirtualDiskVolumeSource] instance.
  IoK8sApiCoreV1VsphereVirtualDiskVolumeSource({
    this.fsType,
    this.storagePolicyID,
    this.storagePolicyName,
    required this.volumePath,
  });

  /// fsType is filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// storagePolicyID is the storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storagePolicyID;

  /// storagePolicyName is the storage Policy Based Management (SPBM) profile name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storagePolicyName;

  /// volumePath is the path that identifies vSphere volume vmdk
  String volumePath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1VsphereVirtualDiskVolumeSource &&
          other.fsType == fsType &&
          other.storagePolicyID == storagePolicyID &&
          other.storagePolicyName == storagePolicyName &&
          other.volumePath == volumePath;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (storagePolicyID == null ? 0 : storagePolicyID!.hashCode) +
      (storagePolicyName == null ? 0 : storagePolicyName!.hashCode) +
      (volumePath.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1VsphereVirtualDiskVolumeSource[fsType=$fsType, storagePolicyID=$storagePolicyID, storagePolicyName=$storagePolicyName, volumePath=$volumePath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fsType != null) {
      json[r'fsType'] = this.fsType;
    } else {
      json[r'fsType'] = null;
    }
    if (this.storagePolicyID != null) {
      json[r'storagePolicyID'] = this.storagePolicyID;
    } else {
      json[r'storagePolicyID'] = null;
    }
    if (this.storagePolicyName != null) {
      json[r'storagePolicyName'] = this.storagePolicyName;
    } else {
      json[r'storagePolicyName'] = null;
    }
    json[r'volumePath'] = this.volumePath;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1VsphereVirtualDiskVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1VsphereVirtualDiskVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1VsphereVirtualDiskVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1VsphereVirtualDiskVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1VsphereVirtualDiskVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        storagePolicyID: mapValueOfType<String>(json, r'storagePolicyID'),
        storagePolicyName: mapValueOfType<String>(json, r'storagePolicyName'),
        volumePath: mapValueOfType<String>(json, r'volumePath')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1VsphereVirtualDiskVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1VsphereVirtualDiskVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1VsphereVirtualDiskVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1VsphereVirtualDiskVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1VsphereVirtualDiskVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1VsphereVirtualDiskVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1VsphereVirtualDiskVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1VsphereVirtualDiskVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1VsphereVirtualDiskVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1VsphereVirtualDiskVolumeSource.listFromJson(
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
    'volumePath',
  };
}
