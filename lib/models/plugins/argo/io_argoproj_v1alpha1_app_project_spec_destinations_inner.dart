//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, avoid_function_literals_in_foreach_calls, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1AppProjectSpecDestinationsInner {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecDestinationsInner] instance.
  IoArgoprojV1alpha1AppProjectSpecDestinationsInner({
    this.name,
    this.namespace,
    this.server,
  });

  /// Name is an alternate way of specifying the target cluster by its symbolic name. This must be set if Server is not set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Namespace specifies the target namespace for the application's resources. The namespace will only be set for namespace-scoped resources that have not set a value for .metadata.namespace
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  /// Server specifies the URL of the target cluster's Kubernetes control plane API. This must be set if Name is not set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? server;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecDestinationsInner &&
          other.name == name &&
          other.namespace == namespace &&
          other.server == server;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (server == null ? 0 : server!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecDestinationsInner[name=$name, namespace=$namespace, server=$server]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    if (this.server != null) {
      json[r'server'] = this.server;
    } else {
      json[r'server'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecDestinationsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecDestinationsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecDestinationsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecDestinationsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecDestinationsInner(
        name: mapValueOfType<String>(json, r'name'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        server: mapValueOfType<String>(json, r'server'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecDestinationsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpecDestinationsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecDestinationsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpecDestinationsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectSpecDestinationsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecDestinationsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecDestinationsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectSpecDestinationsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AppProjectSpecDestinationsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecDestinationsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
