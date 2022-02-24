//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1DownwardAPIProjection {
  /// Returns a new [IoK8sApiCoreV1DownwardAPIProjection] instance.
  IoK8sApiCoreV1DownwardAPIProjection({
    this.items = const [],
  });

  /// Items is a list of DownwardAPIVolume file
  List<IoK8sApiCoreV1DownwardAPIVolumeFile> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1DownwardAPIProjection && other.items == items;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (items.hashCode);

  @override
  String toString() => 'IoK8sApiCoreV1DownwardAPIProjection[items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'items'] = items;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1DownwardAPIProjection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1DownwardAPIProjection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1DownwardAPIProjection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1DownwardAPIProjection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1DownwardAPIProjection(
        items:
            IoK8sApiCoreV1DownwardAPIVolumeFile.listFromJson(json[r'items']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1DownwardAPIProjection>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1DownwardAPIProjection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1DownwardAPIProjection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1DownwardAPIProjection> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1DownwardAPIProjection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1DownwardAPIProjection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1DownwardAPIProjection-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1DownwardAPIProjection>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1DownwardAPIProjection>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1DownwardAPIProjection.listFromJson(
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
