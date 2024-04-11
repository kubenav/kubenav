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

class IoK8sApiFlowcontrolV1beta1ServiceAccountSubject {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1ServiceAccountSubject] instance.
  IoK8sApiFlowcontrolV1beta1ServiceAccountSubject({
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
      other is IoK8sApiFlowcontrolV1beta1ServiceAccountSubject &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (namespace.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1ServiceAccountSubject[name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'namespace'] = this.namespace;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1ServiceAccountSubject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1ServiceAccountSubject? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1ServiceAccountSubject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1ServiceAccountSubject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1ServiceAccountSubject(
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1ServiceAccountSubject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta1ServiceAccountSubject.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1ServiceAccountSubject-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiFlowcontrolV1beta1ServiceAccountSubject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1ServiceAccountSubject.listFromJson(
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
