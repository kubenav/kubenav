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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_downward_api_volume_file.dart';

class IoK8sApiCoreV1DownwardAPIVolumeSource {
  /// Returns a new [IoK8sApiCoreV1DownwardAPIVolumeSource] instance.
  IoK8sApiCoreV1DownwardAPIVolumeSource({
    this.defaultMode,
    this.items = const [],
  });

  /// Optional: mode bits to use on created files by default. Must be a Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultMode;

  /// Items is a list of downward API volume file
  List<IoK8sApiCoreV1DownwardAPIVolumeFile> items;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1DownwardAPIVolumeSource &&
          other.defaultMode == defaultMode &&
          other.items == items;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultMode == null ? 0 : defaultMode!.hashCode) + (items.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1DownwardAPIVolumeSource[defaultMode=$defaultMode, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultMode != null) {
      json[r'defaultMode'] = this.defaultMode;
    } else {
      json[r'defaultMode'] = null;
    }
    json[r'items'] = this.items;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1DownwardAPIVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1DownwardAPIVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1DownwardAPIVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1DownwardAPIVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1DownwardAPIVolumeSource(
        defaultMode: mapValueOfType<int>(json, r'defaultMode'),
        items:
            IoK8sApiCoreV1DownwardAPIVolumeFile.listFromJson(json[r'items']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1DownwardAPIVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1DownwardAPIVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1DownwardAPIVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1DownwardAPIVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1DownwardAPIVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1DownwardAPIVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1DownwardAPIVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1DownwardAPIVolumeSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1DownwardAPIVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1DownwardAPIVolumeSource.listFromJson(
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
