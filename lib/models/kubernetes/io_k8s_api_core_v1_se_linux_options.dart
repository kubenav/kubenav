//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1SELinuxOptions {
  /// Returns a new [IoK8sApiCoreV1SELinuxOptions] instance.
  IoK8sApiCoreV1SELinuxOptions({
    this.level,
    this.role,
    this.type,
    this.user,
  });

  /// Level is SELinux level label that applies to the container.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? level;

  /// Role is a SELinux role label that applies to the container.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? role;

  /// Type is a SELinux type label that applies to the container.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// User is a SELinux user label that applies to the container.
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
      other is IoK8sApiCoreV1SELinuxOptions &&
          other.level == level &&
          other.role == role &&
          other.type == type &&
          other.user == user;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (level == null ? 0 : level!.hashCode) +
      (role == null ? 0 : role!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (user == null ? 0 : user!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1SELinuxOptions[level=$level, role=$role, type=$type, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (level != null) {
      json[r'level'] = level;
    }
    if (role != null) {
      json[r'role'] = role;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1SELinuxOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1SELinuxOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1SELinuxOptions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1SELinuxOptions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1SELinuxOptions(
        level: mapValueOfType<String>(json, r'level'),
        role: mapValueOfType<String>(json, r'role'),
        type: mapValueOfType<String>(json, r'type'),
        user: mapValueOfType<String>(json, r'user'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1SELinuxOptions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1SELinuxOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1SELinuxOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1SELinuxOptions> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1SELinuxOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SELinuxOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1SELinuxOptions-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1SELinuxOptions>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1SELinuxOptions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SELinuxOptions.listFromJson(
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
