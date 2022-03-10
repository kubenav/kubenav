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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_local_object_reference.dart';

class IoK8sApiCoreV1CSIVolumeSource {
  /// Returns a new [IoK8sApiCoreV1CSIVolumeSource] instance.
  IoK8sApiCoreV1CSIVolumeSource({
    required this.driver,
    this.fsType,
    this.nodePublishSecretRef,
    this.readOnly,
    this.volumeAttributes = const {},
  });

  /// Driver is the name of the CSI driver that handles this volume. Consult with your admin for the correct name as registered in the cluster.
  String driver;

  /// Filesystem type to mount. Ex. \"ext4\", \"xfs\", \"ntfs\". If not provided, the empty value is passed to the associated CSI driver which will determine the default filesystem to apply.
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
  IoK8sApiCoreV1LocalObjectReference? nodePublishSecretRef;

  /// Specifies a read-only configuration for the volume. Defaults to false (read/write).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// VolumeAttributes stores driver-specific properties that are passed to the CSI driver. Consult your driver's documentation for supported values.
  Map<String, String> volumeAttributes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1CSIVolumeSource &&
          other.driver == driver &&
          other.fsType == fsType &&
          other.nodePublishSecretRef == nodePublishSecretRef &&
          other.readOnly == readOnly &&
          other.volumeAttributes == volumeAttributes;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (driver.hashCode) +
      (fsType == null ? 0 : fsType!.hashCode) +
      (nodePublishSecretRef == null ? 0 : nodePublishSecretRef!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (volumeAttributes.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1CSIVolumeSource[driver=$driver, fsType=$fsType, nodePublishSecretRef=$nodePublishSecretRef, readOnly=$readOnly, volumeAttributes=$volumeAttributes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'driver'] = driver;
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    if (nodePublishSecretRef != null) {
      json[r'nodePublishSecretRef'] = nodePublishSecretRef;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'volumeAttributes'] = volumeAttributes;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1CSIVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1CSIVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1CSIVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1CSIVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1CSIVolumeSource(
        driver: mapValueOfType<String>(json, r'driver')!,
        fsType: mapValueOfType<String>(json, r'fsType'),
        nodePublishSecretRef: IoK8sApiCoreV1LocalObjectReference.fromJson(
            json[r'nodePublishSecretRef']),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        volumeAttributes:
            mapCastOfType<String, String>(json, r'volumeAttributes') ??
                const {},
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1CSIVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1CSIVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1CSIVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1CSIVolumeSource> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1CSIVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1CSIVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1CSIVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1CSIVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1CSIVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1CSIVolumeSource.listFromJson(
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
  };
}
