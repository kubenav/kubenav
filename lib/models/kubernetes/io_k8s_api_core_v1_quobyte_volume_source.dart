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

class IoK8sApiCoreV1QuobyteVolumeSource {
  /// Returns a new [IoK8sApiCoreV1QuobyteVolumeSource] instance.
  IoK8sApiCoreV1QuobyteVolumeSource({
    this.group,
    this.readOnly,
    required this.registry,
    this.tenant,
    this.user,
    required this.volume,
  });

  /// Group to map volume access to Default is no group
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  /// ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  /// Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
  String registry;

  /// Tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tenant;

  /// User to map volume access to Defaults to serivceaccount user
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  /// Volume is a string that references an already created Quobyte volume by name.
  String volume;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1QuobyteVolumeSource &&
          other.group == group &&
          other.readOnly == readOnly &&
          other.registry == registry &&
          other.tenant == tenant &&
          other.user == user &&
          other.volume == volume;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (group == null ? 0 : group!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode) +
      (registry.hashCode) +
      (tenant == null ? 0 : tenant!.hashCode) +
      (user == null ? 0 : user!.hashCode) +
      (volume.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1QuobyteVolumeSource[group=$group, readOnly=$readOnly, registry=$registry, tenant=$tenant, user=$user, volume=$volume]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (group != null) {
      json[r'group'] = group;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    json[r'registry'] = registry;
    if (tenant != null) {
      json[r'tenant'] = tenant;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    json[r'volume'] = volume;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1QuobyteVolumeSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1QuobyteVolumeSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1QuobyteVolumeSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1QuobyteVolumeSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1QuobyteVolumeSource(
        group: mapValueOfType<String>(json, r'group'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
        registry: mapValueOfType<String>(json, r'registry')!,
        tenant: mapValueOfType<String>(json, r'tenant'),
        user: mapValueOfType<String>(json, r'user'),
        volume: mapValueOfType<String>(json, r'volume')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1QuobyteVolumeSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1QuobyteVolumeSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1QuobyteVolumeSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1QuobyteVolumeSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1QuobyteVolumeSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1QuobyteVolumeSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1QuobyteVolumeSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1QuobyteVolumeSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1QuobyteVolumeSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1QuobyteVolumeSource.listFromJson(
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
    'registry',
    'volume',
  };
}
