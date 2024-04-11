//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiCoreV1AzureFileVolumeSource {
  /// Returns a new [IoK8sApiCoreV1AzureFileVolumeSource] instance.
  IoK8sApiCoreV1AzureFileVolumeSource({
    this.readOnly,
    required this.secretName,
    required this.shareName,
  });

  /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// secretName is the  name of secret that contains Azure Storage Account Name and Key
  String secretName;

  /// shareName is the azure share Name
  String shareName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1AzureFileVolumeSource &&
          other.readOnly == readOnly &&
          other.secretName == secretName &&
          other.shareName == shareName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (secretName.hashCode) +
      (shareName.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1AzureFileVolumeSource[readOnly=$readOnly, secretName=$secretName, shareName=$shareName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.readOnly != null) {
      json[r'readOnly'] = this.readOnly;
    } else {
      json[r'readOnly'] = null;
    }
    json[r'secretName'] = this.secretName;
    json[r'shareName'] = this.shareName;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1AzureFileVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1AzureFileVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1AzureFileVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1AzureFileVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1AzureFileVolumeSource(
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        secretName: mapValueOfType<String>(json, r'secretName')!,
        shareName: mapValueOfType<String>(json, r'shareName')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1AzureFileVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1AzureFileVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1AzureFileVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1AzureFileVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1AzureFileVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1AzureFileVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1AzureFileVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1AzureFileVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1AzureFileVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1AzureFileVolumeSource.listFromJson(
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
    'secretName',
    'shareName',
  };
}
