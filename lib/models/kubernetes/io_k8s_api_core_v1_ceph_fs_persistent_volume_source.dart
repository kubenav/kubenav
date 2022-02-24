//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1CephFSPersistentVolumeSource {
  /// Returns a new [IoK8sApiCoreV1CephFSPersistentVolumeSource] instance.
  IoK8sApiCoreV1CephFSPersistentVolumeSource({
    this.monitors = const [],
    this.path,
    this.readOnly,
    this.secretFile,
    this.secretRef,
    this.user,
  });

  /// Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  List<String> monitors;

  /// Optional: Used as the mounted root, rather than the full Ceph tree, default is /
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? secretFile;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretReference? secretRef;

  /// Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1CephFSPersistentVolumeSource &&
          other.monitors == monitors &&
          other.path == path &&
          other.readOnly == readOnly &&
          other.secretFile == secretFile &&
          other.secretRef == secretRef &&
          other.user == user;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (monitors.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (secretFile == null ? 0 : secretFile!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (user == null ? 0 : user!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1CephFSPersistentVolumeSource[monitors=$monitors, path=$path, readOnly=$readOnly, secretFile=$secretFile, secretRef=$secretRef, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'monitors'] = monitors;
    if (path != null) {
      json[r'path'] = path;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    if (secretFile != null) {
      json[r'secretFile'] = secretFile;
    }
    if (secretRef != null) {
      json[r'secretRef'] = secretRef;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1CephFSPersistentVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1CephFSPersistentVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1CephFSPersistentVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1CephFSPersistentVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1CephFSPersistentVolumeSource(
        monitors: json[r'monitors'] is List
            ? (json[r'monitors'] as List).cast<String>()
            : const [],
        path: mapValueOfType<String>(json, r'path'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        secretFile: mapValueOfType<String>(json, r'secretFile'),
        secretRef: IoK8sApiCoreV1SecretReference.fromJson(json[r'secretRef']),
        user: mapValueOfType<String>(json, r'user'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1CephFSPersistentVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1CephFSPersistentVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1CephFSPersistentVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1CephFSPersistentVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1CephFSPersistentVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1CephFSPersistentVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1CephFSPersistentVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1CephFSPersistentVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1CephFSPersistentVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1CephFSPersistentVolumeSource.listFromJson(
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
    'monitors',
  };
}
