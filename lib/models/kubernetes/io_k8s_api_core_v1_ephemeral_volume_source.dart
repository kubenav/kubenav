//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1EphemeralVolumeSource {
  /// Returns a new [IoK8sApiCoreV1EphemeralVolumeSource] instance.
  IoK8sApiCoreV1EphemeralVolumeSource({
    this.volumeClaimTemplate,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PersistentVolumeClaimTemplate? volumeClaimTemplate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EphemeralVolumeSource &&
          other.volumeClaimTemplate == volumeClaimTemplate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (volumeClaimTemplate == null ? 0 : volumeClaimTemplate!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EphemeralVolumeSource[volumeClaimTemplate=$volumeClaimTemplate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (volumeClaimTemplate != null) {
      json[r'volumeClaimTemplate'] = volumeClaimTemplate;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EphemeralVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EphemeralVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EphemeralVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EphemeralVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EphemeralVolumeSource(
        volumeClaimTemplate:
            IoK8sApiCoreV1PersistentVolumeClaimTemplate.fromJson(
                json[r'volumeClaimTemplate']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EphemeralVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EphemeralVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EphemeralVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EphemeralVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1EphemeralVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EphemeralVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EphemeralVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EphemeralVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EphemeralVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EphemeralVolumeSource.listFromJson(
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
