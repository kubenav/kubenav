//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiRbacV1RoleRef {
  /// Returns a new [IoK8sApiRbacV1RoleRef] instance.
  IoK8sApiRbacV1RoleRef({
    required this.apiGroup,
    required this.kind,
    required this.name,
  });

  /// APIGroup is the group for the resource being referenced
  String apiGroup;

  /// Kind is the type of resource being referenced
  String kind;

  /// Name is the name of resource being referenced
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiRbacV1RoleRef &&
          other.apiGroup == apiGroup &&
          other.kind == kind &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroup.hashCode) + (kind.hashCode) + (name.hashCode);

  @override
  String toString() =>
      'IoK8sApiRbacV1RoleRef[apiGroup=$apiGroup, kind=$kind, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiGroup'] = apiGroup;
    json[r'kind'] = kind;
    json[r'name'] = name;
    return json;
  }

  /// Returns a new [IoK8sApiRbacV1RoleRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiRbacV1RoleRef? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiRbacV1RoleRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiRbacV1RoleRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiRbacV1RoleRef(
        apiGroup: mapValueOfType<String>(json, r'apiGroup')!,
        kind: mapValueOfType<String>(json, r'kind')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IoK8sApiRbacV1RoleRef>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiRbacV1RoleRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiRbacV1RoleRef.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiRbacV1RoleRef> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiRbacV1RoleRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1RoleRef.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiRbacV1RoleRef-objects as value to a dart map
  static Map<String, List<IoK8sApiRbacV1RoleRef>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiRbacV1RoleRef>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1RoleRef.listFromJson(
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
    'apiGroup',
    'kind',
    'name',
  };
}
