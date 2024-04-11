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

class IoK8sApiAdmissionregistrationV1ServiceReference {
  /// Returns a new [IoK8sApiAdmissionregistrationV1ServiceReference] instance.
  IoK8sApiAdmissionregistrationV1ServiceReference({
    required this.name,
    required this.namespace,
    this.path,
    this.port,
  });

  /// `name` is the name of the service. Required
  String name;

  /// `namespace` is the namespace of the service. Required
  String namespace;

  /// `path` is an optional URL path which will be sent in any request to this service.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? port;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAdmissionregistrationV1ServiceReference &&
          other.name == name &&
          other.namespace == namespace &&
          other.path == path &&
          other.port == port;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) +
      (namespace.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (port == null ? 0 : port!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAdmissionregistrationV1ServiceReference[name=$name, namespace=$namespace, path=$path, port=$port]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    json[r'namespace'] = this.namespace;
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.port != null) {
      json[r'port'] = this.port;
    } else {
      json[r'port'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAdmissionregistrationV1ServiceReference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAdmissionregistrationV1ServiceReference? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAdmissionregistrationV1ServiceReference[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAdmissionregistrationV1ServiceReference[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAdmissionregistrationV1ServiceReference(
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
        path: mapValueOfType<String>(json, r'path'),
        port: mapValueOfType<int>(json, r'port'),
      );
    }
    return null;
  }

  static List<IoK8sApiAdmissionregistrationV1ServiceReference>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAdmissionregistrationV1ServiceReference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAdmissionregistrationV1ServiceReference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAdmissionregistrationV1ServiceReference>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAdmissionregistrationV1ServiceReference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAdmissionregistrationV1ServiceReference.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAdmissionregistrationV1ServiceReference-objects as value to a dart map
  static Map<String, List<IoK8sApiAdmissionregistrationV1ServiceReference>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAdmissionregistrationV1ServiceReference>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1ServiceReference.listFromJson(
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
