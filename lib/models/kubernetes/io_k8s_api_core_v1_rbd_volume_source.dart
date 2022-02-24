//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1RBDVolumeSource {
  /// Returns a new [IoK8sApiCoreV1RBDVolumeSource] instance.
  IoK8sApiCoreV1RBDVolumeSource({
    this.fsType,
    required this.image,
    this.keyring,
    this.monitors = const [],
    this.pool,
    this.readOnly,
    this.secretRef,
    this.user,
  });

  /// Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// The rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  String image;

  /// Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? keyring;

  /// A collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  List<String> monitors;

  /// The rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pool;

  /// ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1LocalObjectReference? secretRef;

  /// The rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
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
      other is IoK8sApiCoreV1RBDVolumeSource &&
          other.fsType == fsType &&
          other.image == image &&
          other.keyring == keyring &&
          other.monitors == monitors &&
          other.pool == pool &&
          other.readOnly == readOnly &&
          other.secretRef == secretRef &&
          other.user == user;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (image.hashCode) +
      (keyring == null ? 0 : keyring!.hashCode) +
      (monitors.hashCode) +
      (pool == null ? 0 : pool!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (user == null ? 0 : user!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1RBDVolumeSource[fsType=$fsType, image=$image, keyring=$keyring, monitors=$monitors, pool=$pool, readOnly=$readOnly, secretRef=$secretRef, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    json[r'image'] = image;
    if (keyring != null) {
      json[r'keyring'] = keyring;
    }
    json[r'monitors'] = monitors;
    if (pool != null) {
      json[r'pool'] = pool;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    if (secretRef != null) {
      json[r'secretRef'] = secretRef;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1RBDVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1RBDVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1RBDVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1RBDVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1RBDVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        image: mapValueOfType<String>(json, r'image')!,
        keyring: mapValueOfType<String>(json, r'keyring'),
        monitors: json[r'monitors'] is List
            ? (json[r'monitors'] as List).cast<String>()
            : const [],
        pool: mapValueOfType<String>(json, r'pool'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        secretRef:
            IoK8sApiCoreV1LocalObjectReference.fromJson(json[r'secretRef']),
        user: mapValueOfType<String>(json, r'user'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1RBDVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1RBDVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1RBDVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1RBDVolumeSource> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1RBDVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1RBDVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1RBDVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1RBDVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1RBDVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1RBDVolumeSource.listFromJson(
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
    'image',
    'monitors',
  };
}
