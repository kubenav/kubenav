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

class IoK8sApiFlowcontrolV1beta1ResourcePolicyRule {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1ResourcePolicyRule] instance.
  IoK8sApiFlowcontrolV1beta1ResourcePolicyRule({
    this.apiGroups = const [],
    this.clusterScope,
    this.namespaces = const [],
    this.resources = const [],
    this.verbs = const [],
  });

  /// `apiGroups` is a list of matching API groups and may not be empty. \"*\" matches all API groups and, if present, must be the only entry. Required.
  List<String> apiGroups;

  /// `clusterScope` indicates whether to match requests that do not specify a namespace (which happens either because the resource is not namespaced or the request targets all namespaces). If this field is omitted or false then the `namespaces` field must contain a non-empty list.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? clusterScope;

  /// `namespaces` is a list of target namespaces that restricts matches.  A request that specifies a target namespace matches only if either (a) this list contains that target namespace or (b) this list contains \"*\".  Note that \"*\" matches any specified namespace but does not match a request that _does not specify_ a namespace (see the `clusterScope` field for that). This list may be empty, but only if `clusterScope` is true.
  List<String> namespaces;

  /// `resources` is a list of matching resources (i.e., lowercase and plural) with, if desired, subresource.  For example, [ \"services\", \"nodes/status\" ].  This list may not be empty. \"*\" matches all resources and, if present, must be the only entry. Required.
  List<String> resources;

  /// `verbs` is a list of matching verbs and may not be empty. \"*\" matches all verbs and, if present, must be the only entry. Required.
  List<String> verbs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta1ResourcePolicyRule &&
          other.apiGroups == apiGroups &&
          other.clusterScope == clusterScope &&
          other.namespaces == namespaces &&
          other.resources == resources &&
          other.verbs == verbs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroups.hashCode) +
      (clusterScope == null ? 0 : clusterScope!.hashCode) +
      (namespaces.hashCode) +
      (resources.hashCode) +
      (verbs.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1ResourcePolicyRule[apiGroups=$apiGroups, clusterScope=$clusterScope, namespaces=$namespaces, resources=$resources, verbs=$verbs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiGroups'] = apiGroups;
    if (clusterScope != null) {
      json[r'clusterScope'] = clusterScope;
    }
    json[r'namespaces'] = namespaces;
    json[r'resources'] = resources;
    json[r'verbs'] = verbs;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1ResourcePolicyRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1ResourcePolicyRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1ResourcePolicyRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1ResourcePolicyRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1ResourcePolicyRule(
        apiGroups: json[r'apiGroups'] is List
            ? (json[r'apiGroups'] as List).cast<String>()
            : const [],
        clusterScope: mapValueOfType<bool>(json, r'clusterScope'),
        namespaces: json[r'namespaces'] is List
            ? (json[r'namespaces'] as List).cast<String>()
            : const [],
        resources: json[r'resources'] is List
            ? (json[r'resources'] as List).cast<String>()
            : const [],
        verbs: json[r'verbs'] is List
            ? (json[r'verbs'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1ResourcePolicyRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta1ResourcePolicyRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1ResourcePolicyRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta1ResourcePolicyRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta1ResourcePolicyRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1ResourcePolicyRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1ResourcePolicyRule-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta1ResourcePolicyRule>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiFlowcontrolV1beta1ResourcePolicyRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta1ResourcePolicyRule.listFromJson(
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
    'apiGroups',
    'resources',
    'verbs',
  };
}
