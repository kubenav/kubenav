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

class IoK8sApiAdmissionregistrationV1RuleWithOperations {
  /// Returns a new [IoK8sApiAdmissionregistrationV1RuleWithOperations] instance.
  IoK8sApiAdmissionregistrationV1RuleWithOperations({
    this.apiGroups = const [],
    this.apiVersions = const [],
    this.operations = const [],
    this.resources = const [],
    this.scope,
  });

  /// APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is present, the length of the slice must be one. Required.
  List<String> apiGroups;

  /// APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is present, the length of the slice must be one. Required.
  List<String> apiVersions;

  /// Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE, CONNECT or * for all of those operations and any future admission operations that are added. If '*' is present, the length of the slice must be one. Required.
  List<String> operations;

  /// Resources is a list of resources this rule applies to.  For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means all resources, but not subresources. 'pods/_*' means all subresources of pods. '*_/scale' means all scale subresources. '*_/_*' means all resources and their subresources.  If wildcard is present, the validation rule will ensure resources do not overlap with each other.  Depending on the enclosing object, subresources might not be allowed. Required.
  List<String> resources;

  /// scope specifies the scope of this rule. Valid values are \"Cluster\", \"Namespaced\", and \"*\" \"Cluster\" means that only cluster-scoped resources will match this rule. Namespace API objects are cluster-scoped. \"Namespaced\" means that only namespaced resources will match this rule. \"*\" means that there are no scope restrictions. Subresources match the scope of their parent resource. Default is \"*\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scope;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAdmissionregistrationV1RuleWithOperations &&
          other.apiGroups == apiGroups &&
          other.apiVersions == apiVersions &&
          other.operations == operations &&
          other.resources == resources &&
          other.scope == scope;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroups.hashCode) +
      (apiVersions.hashCode) +
      (operations.hashCode) +
      (resources.hashCode) +
      (scope == null ? 0 : scope!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAdmissionregistrationV1RuleWithOperations[apiGroups=$apiGroups, apiVersions=$apiVersions, operations=$operations, resources=$resources, scope=$scope]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiGroups'] = apiGroups;
    json[r'apiVersions'] = apiVersions;
    json[r'operations'] = operations;
    json[r'resources'] = resources;
    if (scope != null) {
      json[r'scope'] = scope;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAdmissionregistrationV1RuleWithOperations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAdmissionregistrationV1RuleWithOperations? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAdmissionregistrationV1RuleWithOperations[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAdmissionregistrationV1RuleWithOperations[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAdmissionregistrationV1RuleWithOperations(
        apiGroups: json[r'apiGroups'] is List
            ? (json[r'apiGroups'] as List).cast<String>()
            : const [],
        apiVersions: json[r'apiVersions'] is List
            ? (json[r'apiVersions'] as List).cast<String>()
            : const [],
        operations: json[r'operations'] is List
            ? (json[r'operations'] as List).cast<String>()
            : const [],
        resources: json[r'resources'] is List
            ? (json[r'resources'] as List).cast<String>()
            : const [],
        scope: mapValueOfType<String>(json, r'scope'),
      );
    }
    return null;
  }

  static List<IoK8sApiAdmissionregistrationV1RuleWithOperations>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAdmissionregistrationV1RuleWithOperations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAdmissionregistrationV1RuleWithOperations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAdmissionregistrationV1RuleWithOperations>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAdmissionregistrationV1RuleWithOperations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1RuleWithOperations.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAdmissionregistrationV1RuleWithOperations-objects as value to a dart map
  static Map<String, List<IoK8sApiAdmissionregistrationV1RuleWithOperations>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAdmissionregistrationV1RuleWithOperations>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1RuleWithOperations.listFromJson(
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
