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

class IoK8sApiRbacV1Subject {
  /// Returns a new [IoK8sApiRbacV1Subject] instance.
  IoK8sApiRbacV1Subject({
    this.apiGroup,
    required this.kind,
    required this.name,
    this.namespace,
  });

  /// APIGroup holds the API group of the referenced subject. Defaults to \"\" for ServiceAccount subjects. Defaults to \"rbac.authorization.k8s.io\" for User and Group subjects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiGroup;

  /// Kind of object being referenced. Values defined by this API group are \"User\", \"Group\", and \"ServiceAccount\". If the Authorizer does not recognized the kind value, the Authorizer should report an error.
  String kind;

  /// Name of the object being referenced.
  String name;

  /// Namespace of the referenced object.  If the object kind is non-namespace, such as \"User\" or \"Group\", and this value is not empty the Authorizer should report an error.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiRbacV1Subject &&
          other.apiGroup == apiGroup &&
          other.kind == kind &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroup == null ? 0 : apiGroup!.hashCode) +
      (kind.hashCode) +
      (name.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoK8sApiRbacV1Subject[apiGroup=$apiGroup, kind=$kind, name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiGroup != null) {
      json[r'apiGroup'] = this.apiGroup;
    } else {
      json[r'apiGroup'] = null;
    }
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiRbacV1Subject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiRbacV1Subject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiRbacV1Subject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiRbacV1Subject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiRbacV1Subject(
        apiGroup: mapValueOfType<String>(json, r'apiGroup'),
        kind: mapValueOfType<String>(json, r'kind')!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoK8sApiRbacV1Subject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiRbacV1Subject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiRbacV1Subject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiRbacV1Subject> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiRbacV1Subject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1Subject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiRbacV1Subject-objects as value to a dart map
  static Map<String, List<IoK8sApiRbacV1Subject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiRbacV1Subject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1Subject.listFromJson(
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
    'kind',
    'name',
  };
}
