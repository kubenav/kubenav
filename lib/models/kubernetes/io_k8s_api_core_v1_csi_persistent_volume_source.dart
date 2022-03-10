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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret_reference.dart';

class IoK8sApiCoreV1CSIPersistentVolumeSource {
  /// Returns a new [IoK8sApiCoreV1CSIPersistentVolumeSource] instance.
  IoK8sApiCoreV1CSIPersistentVolumeSource({
    this.controllerExpandSecretRef,
    this.controllerPublishSecretRef,
    required this.driver,
    this.fsType,
    this.nodePublishSecretRef,
    this.nodeStageSecretRef,
    this.readOnly,
    this.volumeAttributes = const {},
    required this.volumeHandle,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretReference? controllerExpandSecretRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretReference? controllerPublishSecretRef;

  /// Driver is the name of the driver to use for this volume. Required.
  String driver;

  /// Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretReference? nodePublishSecretRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretReference? nodeStageSecretRef;

  /// Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// Attributes of the volume to publish.
  Map<String, String> volumeAttributes;

  /// VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
  String volumeHandle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1CSIPersistentVolumeSource &&
          other.controllerExpandSecretRef == controllerExpandSecretRef &&
          other.controllerPublishSecretRef == controllerPublishSecretRef &&
          other.driver == driver &&
          other.fsType == fsType &&
          other.nodePublishSecretRef == nodePublishSecretRef &&
          other.nodeStageSecretRef == nodeStageSecretRef &&
          other.readOnly == readOnly &&
          other.volumeAttributes == volumeAttributes &&
          other.volumeHandle == volumeHandle;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (controllerExpandSecretRef == null
          ? 0
          : controllerExpandSecretRef!.hashCode) +
      (controllerPublishSecretRef == null
          ? 0
          : controllerPublishSecretRef!.hashCode) +
      (driver.hashCode) +
      (fsType == null ? 0 : fsType!.hashCode) +
      (nodePublishSecretRef == null ? 0 : nodePublishSecretRef!.hashCode) +
      (nodeStageSecretRef == null ? 0 : nodeStageSecretRef!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (volumeAttributes.hashCode) +
      (volumeHandle.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1CSIPersistentVolumeSource[controllerExpandSecretRef=$controllerExpandSecretRef, controllerPublishSecretRef=$controllerPublishSecretRef, driver=$driver, fsType=$fsType, nodePublishSecretRef=$nodePublishSecretRef, nodeStageSecretRef=$nodeStageSecretRef, readOnly=$readOnly, volumeAttributes=$volumeAttributes, volumeHandle=$volumeHandle]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (controllerExpandSecretRef != null) {
      json[r'controllerExpandSecretRef'] = controllerExpandSecretRef;
    }
    if (controllerPublishSecretRef != null) {
      json[r'controllerPublishSecretRef'] = controllerPublishSecretRef;
    }
    json[r'driver'] = driver;
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    if (nodePublishSecretRef != null) {
      json[r'nodePublishSecretRef'] = nodePublishSecretRef;
    }
    if (nodeStageSecretRef != null) {
      json[r'nodeStageSecretRef'] = nodeStageSecretRef;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'volumeAttributes'] = volumeAttributes;
    json[r'volumeHandle'] = volumeHandle;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1CSIPersistentVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1CSIPersistentVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1CSIPersistentVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1CSIPersistentVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1CSIPersistentVolumeSource(
        controllerExpandSecretRef: IoK8sApiCoreV1SecretReference.fromJson(
            json[r'controllerExpandSecretRef']),
        controllerPublishSecretRef: IoK8sApiCoreV1SecretReference.fromJson(
            json[r'controllerPublishSecretRef']),
        driver: mapValueOfType<String>(json, r'driver')!,
        fsType: mapValueOfType<String>(json, r'fsType'),
        nodePublishSecretRef: IoK8sApiCoreV1SecretReference.fromJson(
            json[r'nodePublishSecretRef']),
        nodeStageSecretRef:
            IoK8sApiCoreV1SecretReference.fromJson(json[r'nodeStageSecretRef']),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        volumeAttributes:
            mapCastOfType<String, String>(json, r'volumeAttributes') ??
                const {},
        volumeHandle: mapValueOfType<String>(json, r'volumeHandle')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1CSIPersistentVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1CSIPersistentVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1CSIPersistentVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1CSIPersistentVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1CSIPersistentVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1CSIPersistentVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1CSIPersistentVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1CSIPersistentVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1CSIPersistentVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1CSIPersistentVolumeSource.listFromJson(
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
    'driver',
    'volumeHandle',
  };
}
