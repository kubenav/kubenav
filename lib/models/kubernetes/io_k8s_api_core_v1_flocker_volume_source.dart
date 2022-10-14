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

class IoK8sApiCoreV1FlockerVolumeSource {
  /// Returns a new [IoK8sApiCoreV1FlockerVolumeSource] instance.
  IoK8sApiCoreV1FlockerVolumeSource({
    this.datasetName,
    this.datasetUUID,
  });

  /// datasetName is Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? datasetName;

  /// datasetUUID is the UUID of the dataset. This is unique identifier of a Flocker dataset
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? datasetUUID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1FlockerVolumeSource &&
          other.datasetName == datasetName &&
          other.datasetUUID == datasetUUID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (datasetName == null ? 0 : datasetName!.hashCode) +
      (datasetUUID == null ? 0 : datasetUUID!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1FlockerVolumeSource[datasetName=$datasetName, datasetUUID=$datasetUUID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.datasetName != null) {
      json[r'datasetName'] = this.datasetName;
    } else {
      json[r'datasetName'] = null;
    }
    if (this.datasetUUID != null) {
      json[r'datasetUUID'] = this.datasetUUID;
    } else {
      json[r'datasetUUID'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1FlockerVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1FlockerVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1FlockerVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1FlockerVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1FlockerVolumeSource(
        datasetName: mapValueOfType<String>(json, r'datasetName'),
        datasetUUID: mapValueOfType<String>(json, r'datasetUUID'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1FlockerVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1FlockerVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1FlockerVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1FlockerVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1FlockerVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1FlockerVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1FlockerVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1FlockerVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1FlockerVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1FlockerVolumeSource.listFromJson(
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
