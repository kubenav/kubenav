//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PersistentVolumeClaimSpec {
  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimSpec] instance.
  IoK8sApiCoreV1PersistentVolumeClaimSpec({
    this.accessModes = const [],
    this.dataSource,
    this.dataSourceRef,
    this.resources,
    this.selector,
    this.storageClassName,
    this.volumeMode,
    this.volumeName,
  });

  /// AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
  List<String> accessModes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1TypedLocalObjectReference? dataSource;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1TypedLocalObjectReference? dataSourceRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ResourceRequirements? resources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? selector;

  /// Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageClassName;

  /// volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? volumeMode;

  /// VolumeName is the binding reference to the PersistentVolume backing this claim.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? volumeName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PersistentVolumeClaimSpec &&
          other.accessModes == accessModes &&
          other.dataSource == dataSource &&
          other.dataSourceRef == dataSourceRef &&
          other.resources == resources &&
          other.selector == selector &&
          other.storageClassName == storageClassName &&
          other.volumeMode == volumeMode &&
          other.volumeName == volumeName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessModes.hashCode) +
      (dataSource == null ? 0 : dataSource!.hashCode) +
      (dataSourceRef == null ? 0 : dataSourceRef!.hashCode) +
      (resources == null ? 0 : resources!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (storageClassName == null ? 0 : storageClassName!.hashCode) +
      (volumeMode == null ? 0 : volumeMode!.hashCode) +
      (volumeName == null ? 0 : volumeName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PersistentVolumeClaimSpec[accessModes=$accessModes, dataSource=$dataSource, dataSourceRef=$dataSourceRef, resources=$resources, selector=$selector, storageClassName=$storageClassName, volumeMode=$volumeMode, volumeName=$volumeName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'accessModes'] = accessModes;
    if (dataSource != null) {
      json[r'dataSource'] = dataSource;
    }
    if (dataSourceRef != null) {
      json[r'dataSourceRef'] = dataSourceRef;
    }
    if (resources != null) {
      json[r'resources'] = resources;
    }
    if (selector != null) {
      json[r'selector'] = selector;
    }
    if (storageClassName != null) {
      json[r'storageClassName'] = storageClassName;
    }
    if (volumeMode != null) {
      json[r'volumeMode'] = volumeMode;
    }
    if (volumeName != null) {
      json[r'volumeName'] = volumeName;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PersistentVolumeClaimSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PersistentVolumeClaimSpec(
        accessModes: json[r'accessModes'] is List
            ? (json[r'accessModes'] as List).cast<String>()
            : const [],
        dataSource: IoK8sApiCoreV1TypedLocalObjectReference.fromJson(
            json[r'dataSource']),
        dataSourceRef: IoK8sApiCoreV1TypedLocalObjectReference.fromJson(
            json[r'dataSourceRef']),
        resources:
            IoK8sApiCoreV1ResourceRequirements.fromJson(json[r'resources']),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector']),
        storageClassName: mapValueOfType<String>(json, r'storageClassName'),
        volumeMode: mapValueOfType<String>(json, r'volumeMode'),
        volumeName: mapValueOfType<String>(json, r'volumeName'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PersistentVolumeClaimSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeClaimSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PersistentVolumeClaimSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PersistentVolumeClaimSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PersistentVolumeClaimSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1PersistentVolumeClaimSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PersistentVolumeClaimSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PersistentVolumeClaimSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PersistentVolumeClaimSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeClaimSpec.listFromJson(
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
