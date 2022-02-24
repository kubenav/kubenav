//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAuthorizationV1ResourceRule {
  /// Returns a new [IoK8sApiAuthorizationV1ResourceRule] instance.
  IoK8sApiAuthorizationV1ResourceRule({
    this.apiGroups = const [],
    this.resourceNames = const [],
    this.resources = const [],
    this.verbs = const [],
  });

  /// APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  \"*\" means all.
  List<String> apiGroups;

  /// ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  \"*\" means all.
  List<String> resourceNames;

  /// Resources is a list of resources this rule applies to.  \"*\" means all in the specified apiGroups.  \"*_/foo\" represents the subresource 'foo' for all resources in the specified apiGroups.
  List<String> resources;

  /// Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  \"*\" means all.
  List<String> verbs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1ResourceRule &&
          other.apiGroups == apiGroups &&
          other.resourceNames == resourceNames &&
          other.resources == resources &&
          other.verbs == verbs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiGroups.hashCode) +
      (resourceNames.hashCode) +
      (resources.hashCode) +
      (verbs.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1ResourceRule[apiGroups=$apiGroups, resourceNames=$resourceNames, resources=$resources, verbs=$verbs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiGroups'] = apiGroups;
    json[r'resourceNames'] = resourceNames;
    json[r'resources'] = resources;
    json[r'verbs'] = verbs;
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1ResourceRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1ResourceRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1ResourceRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1ResourceRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1ResourceRule(
        apiGroups: json[r'apiGroups'] is List
            ? (json[r'apiGroups'] as List).cast<String>()
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

  static List<IoK8sApiAuthorizationV1ResourceRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1ResourceRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthorizationV1ResourceRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1ResourceRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1ResourceRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1ResourceRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1ResourceRule-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1ResourceRule>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthorizationV1ResourceRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1ResourceRule.listFromJson(
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
