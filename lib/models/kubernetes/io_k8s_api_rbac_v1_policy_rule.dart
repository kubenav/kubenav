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

class IoK8sApiRbacV1PolicyRule {
  /// Returns a new [IoK8sApiRbacV1PolicyRule] instance.
  IoK8sApiRbacV1PolicyRule({
    this.apiGroups = const [],
    this.nonResourceURLs = const [],
    this.resourceNames = const [],
    this.resources = const [],
    this.verbs = const [],
  });

  /// APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed. \"\" represents the core API group and \"*\" represents all API groups.
  List<String> apiGroups;

  /// NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as \"pods\" or \"secrets\") or non-resource URL paths (such as \"/api\"),  but not both.
  List<String> nonResourceURLs;

  /// ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
  List<String> resourceNames;

  /// Resources is a list of resources this rule applies to. '*' represents all resources.
  List<String> resources;

  /// Verbs is a list of Verbs that apply to ALL the ResourceKinds contained in this rule. '*' represents all verbs.
  List<String> verbs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiRbacV1PolicyRule &&
          other.apiGroups == apiGroups &&
          other.nonResourceURLs == nonResourceURLs &&
          other.resourceNames == resourceNames &&
          other.resources == resources &&
          other.verbs == verbs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroups.hashCode) +
      (nonResourceURLs.hashCode) +
      (resourceNames.hashCode) +
      (resources.hashCode) +
      (verbs.hashCode);

  @override
  String toString() =>
      'IoK8sApiRbacV1PolicyRule[apiGroups=$apiGroups, nonResourceURLs=$nonResourceURLs, resourceNames=$resourceNames, resources=$resources, verbs=$verbs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiGroups'] = this.apiGroups;
    json[r'nonResourceURLs'] = this.nonResourceURLs;
    json[r'resourceNames'] = this.resourceNames;
    json[r'resources'] = this.resources;
    json[r'verbs'] = this.verbs;
    return json;
  }

  /// Returns a new [IoK8sApiRbacV1PolicyRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiRbacV1PolicyRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiRbacV1PolicyRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiRbacV1PolicyRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiRbacV1PolicyRule(
        apiGroups: json[r'apiGroups'] is List
            ? (json[r'apiGroups'] as List).cast<String>()
            : const [],
        nonResourceURLs: json[r'nonResourceURLs'] is List
            ? (json[r'nonResourceURLs'] as List).cast<String>()
            : const [],
        resourceNames: json[r'resourceNames'] is List
            ? (json[r'resourceNames'] as List).cast<String>()
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

  static List<IoK8sApiRbacV1PolicyRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiRbacV1PolicyRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiRbacV1PolicyRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiRbacV1PolicyRule> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiRbacV1PolicyRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1PolicyRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiRbacV1PolicyRule-objects as value to a dart map
  static Map<String, List<IoK8sApiRbacV1PolicyRule>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiRbacV1PolicyRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1PolicyRule.listFromJson(
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
    'verbs',
  };
}
