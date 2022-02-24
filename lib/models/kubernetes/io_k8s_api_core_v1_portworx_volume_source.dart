//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PortworxVolumeSource {
  /// Returns a new [IoK8sApiCoreV1PortworxVolumeSource] instance.
  IoK8sApiCoreV1PortworxVolumeSource({
    this.fsType,
    this.readOnly,
    required this.volumeID,
  });

  /// FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\". Implicitly inferred to be \"ext4\" if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// VolumeID uniquely identifies a Portworx volume
  String volumeID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PortworxVolumeSource &&
          other.fsType == fsType &&
          other.readOnly == readOnly &&
          other.volumeID == volumeID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (volumeID.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PortworxVolumeSource[fsType=$fsType, readOnly=$readOnly, volumeID=$volumeID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'volumeID'] = volumeID;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PortworxVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PortworxVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PortworxVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PortworxVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PortworxVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        volumeID: mapValueOfType<String>(json, r'volumeID')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PortworxVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PortworxVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PortworxVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PortworxVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PortworxVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PortworxVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PortworxVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PortworxVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PortworxVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PortworxVolumeSource.listFromJson(
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
    'volumeID',
  };
}
