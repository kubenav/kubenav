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

class IoK8sApiCoreV1ScaleIOPersistentVolumeSource {
  /// Returns a new [IoK8sApiCoreV1ScaleIOPersistentVolumeSource] instance.
  IoK8sApiCoreV1ScaleIOPersistentVolumeSource({
    this.fsType,
    required this.gateway,
    this.protectionDomain,
    this.readOnly,
    required this.secretRef,
    this.sslEnabled,
    this.storageMode,
    this.storagePool,
    required this.system,
    this.volumeName,
  });

  /// Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Default is \"xfs\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// The host address of the ScaleIO API Gateway.
  String gateway;

  /// The name of the ScaleIO Protection Domain for the configured storage.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? protectionDomain;

  /// Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  IoK8sApiCoreV1SecretReference secretRef;

  /// Flag to enable/disable SSL communication with Gateway, default false
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? sslEnabled;

  /// Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageMode;

  /// The ScaleIO Storage Pool associated with the protection domain.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storagePool;

  /// The name of the storage system as configured in ScaleIO.
  String system;

  /// The name of a volume already created in the ScaleIO system that is associated with this volume source.
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
      other is IoK8sApiCoreV1ScaleIOPersistentVolumeSource &&
          other.fsType == fsType &&
          other.gateway == gateway &&
          other.protectionDomain == protectionDomain &&
          other.readOnly == readOnly &&
          other.secretRef == secretRef &&
          other.sslEnabled == sslEnabled &&
          other.storageMode == storageMode &&
          other.storagePool == storagePool &&
          other.system == system &&
          other.volumeName == volumeName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (gateway.hashCode) +
      (protectionDomain == null ? 0 : protectionDomain!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (secretRef.hashCode) +
      (sslEnabled == null ? 0 : sslEnabled!.hashCode) +
      (storageMode == null ? 0 : storageMode!.hashCode) +
      (storagePool == null ? 0 : storagePool!.hashCode) +
      (system.hashCode) +
      (volumeName == null ? 0 : volumeName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ScaleIOPersistentVolumeSource[fsType=$fsType, gateway=$gateway, protectionDomain=$protectionDomain, readOnly=$readOnly, secretRef=$secretRef, sslEnabled=$sslEnabled, storageMode=$storageMode, storagePool=$storagePool, system=$system, volumeName=$volumeName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    json[r'gateway'] = gateway;
    if (protectionDomain != null) {
      json[r'protectionDomain'] = protectionDomain;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'secretRef'] = secretRef;
    if (sslEnabled != null) {
      json[r'sslEnabled'] = sslEnabled;
    }
    if (storageMode != null) {
      json[r'storageMode'] = storageMode;
    }
    if (storagePool != null) {
      json[r'storagePool'] = storagePool;
    }
    json[r'system'] = system;
    if (volumeName != null) {
      json[r'volumeName'] = volumeName;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ScaleIOPersistentVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ScaleIOPersistentVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ScaleIOPersistentVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ScaleIOPersistentVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ScaleIOPersistentVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        gateway: mapValueOfType<String>(json, r'gateway')!,
        protectionDomain: mapValueOfType<String>(json, r'protectionDomain'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        secretRef: IoK8sApiCoreV1SecretReference.fromJson(json[r'secretRef'])!,
        sslEnabled: mapValueOfType<bool>(json, r'sslEnabled'),
        storageMode: mapValueOfType<String>(json, r'storageMode'),
        storagePool: mapValueOfType<String>(json, r'storagePool'),
        system: mapValueOfType<String>(json, r'system')!,
        volumeName: mapValueOfType<String>(json, r'volumeName'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ScaleIOPersistentVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ScaleIOPersistentVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ScaleIOPersistentVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ScaleIOPersistentVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ScaleIOPersistentVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ScaleIOPersistentVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ScaleIOPersistentVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ScaleIOPersistentVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ScaleIOPersistentVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ScaleIOPersistentVolumeSource.listFromJson(
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
    'gateway',
    'secretRef',
    'system',
  };
}