//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ProjectedVolumeSource {
  /// Returns a new [IoK8sApiCoreV1ProjectedVolumeSource] instance.
  IoK8sApiCoreV1ProjectedVolumeSource({
    this.defaultMode,
    this.sources = const [],
  });

  /// Mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultMode;

  /// list of volume projections
  List<IoK8sApiCoreV1VolumeProjection> sources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ProjectedVolumeSource &&
          other.defaultMode == defaultMode &&
          other.sources == sources;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultMode == null ? 0 : defaultMode!.hashCode) + (sources.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ProjectedVolumeSource[defaultMode=$defaultMode, sources=$sources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (defaultMode != null) {
      json[r'defaultMode'] = defaultMode;
    }
    json[r'sources'] = sources;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ProjectedVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ProjectedVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ProjectedVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ProjectedVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ProjectedVolumeSource(
        defaultMode: mapValueOfType<int>(json, r'defaultMode'),
        sources:
            IoK8sApiCoreV1VolumeProjection.listFromJson(json[r'sources']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ProjectedVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ProjectedVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ProjectedVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ProjectedVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ProjectedVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ProjectedVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ProjectedVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ProjectedVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ProjectedVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ProjectedVolumeSource.listFromJson(
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
