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

class IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource {
  /// Returns a new [IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource] instance.
  IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource({
    this.fsType,
    this.partition,
    this.readOnly,
    required this.volumeID,
  });

  /// Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsType;

  /// The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as \"1\". Similarly, the volume partition for /dev/sda is \"0\" (or you can leave the property empty).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? partition;

  /// Specify \"true\" to force and set the ReadOnly property in VolumeMounts to \"true\". If omitted, the default is \"false\". More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  String volumeID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource &&
          other.fsType == fsType &&
          other.partition == partition &&
          other.readOnly == readOnly &&
          other.volumeID == volumeID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsType == null ? 0 : fsType!.hashCode) +
      (partition == null ? 0 : partition!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (volumeID.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource[fsType=$fsType, partition=$partition, readOnly=$readOnly, volumeID=$volumeID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (fsType != null) {
      json[r'fsType'] = fsType;
    }
    if (partition != null) {
      json[r'partition'] = partition;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'volumeID'] = volumeID;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource(
        fsType: mapValueOfType<String>(json, r'fsType'),
        partition: mapValueOfType<int>(json, r'partition'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        volumeID: mapValueOfType<String>(json, r'volumeID')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource.listFromJson(
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
