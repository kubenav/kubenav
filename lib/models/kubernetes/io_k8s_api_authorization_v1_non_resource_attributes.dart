//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAuthorizationV1NonResourceAttributes {
  /// Returns a new [IoK8sApiAuthorizationV1NonResourceAttributes] instance.
  IoK8sApiAuthorizationV1NonResourceAttributes({
    this.path,
    this.verb,
  });

  /// Path is the URL path of the request
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// Verb is the standard HTTP verb
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? verb;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1NonResourceAttributes &&
          other.path == path &&
          other.verb == verb;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (path == null ? 0 : path!.hashCode) + (verb == null ? 0 : verb!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1NonResourceAttributes[path=$path, verb=$verb]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (path != null) {
      json[r'path'] = path;
    }
    if (verb != null) {
      json[r'verb'] = verb;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1NonResourceAttributes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1NonResourceAttributes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1NonResourceAttributes[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1NonResourceAttributes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1NonResourceAttributes(
        path: mapValueOfType<String>(json, r'path'),
        verb: mapValueOfType<String>(json, r'verb'),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthorizationV1NonResourceAttributes>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1NonResourceAttributes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAuthorizationV1NonResourceAttributes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1NonResourceAttributes> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1NonResourceAttributes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1NonResourceAttributes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1NonResourceAttributes-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1NonResourceAttributes>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthorizationV1NonResourceAttributes>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1NonResourceAttributes.listFromJson(
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
