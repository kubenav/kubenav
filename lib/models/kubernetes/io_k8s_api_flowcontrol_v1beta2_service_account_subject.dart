//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiFlowcontrolV1beta2ServiceAccountSubject {
  /// Returns a new [IoK8sApiFlowcontrolV1beta2ServiceAccountSubject] instance.
  IoK8sApiFlowcontrolV1beta2ServiceAccountSubject({
    required this.name,
    required this.namespace,
  });

  /// `name` is the name of matching ServiceAccount objects, or \"*\" to match regardless of name. Required.
  String name;

  /// `namespace` is the namespace of matching ServiceAccount objects. Required.
  String namespace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta2ServiceAccountSubject &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (namespace.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta2ServiceAccountSubject[name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = name;
    json[r'namespace'] = namespace;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta2ServiceAccountSubject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta2ServiceAccountSubject? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta2ServiceAccountSubject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta2ServiceAccountSubject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta2ServiceAccountSubject(
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta2ServiceAccountSubject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta2ServiceAccountSubject.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta2ServiceAccountSubject-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiFlowcontrolV1beta2ServiceAccountSubject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta2ServiceAccountSubject.listFromJson(
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
    'name',
    'namespace',
  };
}
