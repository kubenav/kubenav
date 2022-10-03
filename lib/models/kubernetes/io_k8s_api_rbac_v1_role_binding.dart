//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_role_ref.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_subject.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiRbacV1RoleBinding {
  /// Returns a new [IoK8sApiRbacV1RoleBinding] instance.
  IoK8sApiRbacV1RoleBinding({
    this.apiVersion,
    this.kind,
    this.metadata,
    required this.roleRef,
    this.subjects = const [],
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  IoK8sApiRbacV1RoleRef roleRef;

  /// Subjects holds references to the objects the role applies to.
  List<IoK8sApiRbacV1Subject> subjects;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiRbacV1RoleBinding &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.roleRef == roleRef &&
          other.subjects == subjects;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (roleRef.hashCode) +
      (subjects.hashCode);

  @override
  String toString() =>
      'IoK8sApiRbacV1RoleBinding[apiVersion=$apiVersion, kind=$kind, metadata=$metadata, roleRef=$roleRef, subjects=$subjects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    json[r'roleRef'] = this.roleRef;
    json[r'subjects'] = this.subjects;
    return json;
  }

  /// Returns a new [IoK8sApiRbacV1RoleBinding] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiRbacV1RoleBinding? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiRbacV1RoleBinding[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiRbacV1RoleBinding[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiRbacV1RoleBinding(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        roleRef: IoK8sApiRbacV1RoleRef.fromJson(json[r'roleRef'])!,
        subjects:
            IoK8sApiRbacV1Subject.listFromJson(json[r'subjects']) ?? const [],
      );
    }
    return null;
  }

  static List<IoK8sApiRbacV1RoleBinding>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiRbacV1RoleBinding>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiRbacV1RoleBinding.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiRbacV1RoleBinding> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiRbacV1RoleBinding>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1RoleBinding.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiRbacV1RoleBinding-objects as value to a dart map
  static Map<String, List<IoK8sApiRbacV1RoleBinding>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiRbacV1RoleBinding>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1RoleBinding.listFromJson(
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
    'roleRef',
  };
}
