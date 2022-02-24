//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiRbacV1AggregationRule {
  /// Returns a new [IoK8sApiRbacV1AggregationRule] instance.
  IoK8sApiRbacV1AggregationRule({
    this.clusterRoleSelectors = const [],
  });

  /// ClusterRoleSelectors holds a list of selectors which will be used to find ClusterRoles and create the rules. If any of the selectors match, then the ClusterRole's permissions will be added
  List<IoK8sApimachineryPkgApisMetaV1LabelSelector> clusterRoleSelectors;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiRbacV1AggregationRule &&
          other.clusterRoleSelectors == clusterRoleSelectors;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clusterRoleSelectors.hashCode);

  @override
  String toString() =>
      'IoK8sApiRbacV1AggregationRule[clusterRoleSelectors=$clusterRoleSelectors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'clusterRoleSelectors'] = clusterRoleSelectors;
    return json;
  }

  /// Returns a new [IoK8sApiRbacV1AggregationRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiRbacV1AggregationRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiRbacV1AggregationRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiRbacV1AggregationRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiRbacV1AggregationRule(
        clusterRoleSelectors:
            IoK8sApimachineryPkgApisMetaV1LabelSelector.listFromJson(
                    json[r'clusterRoleSelectors']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiRbacV1AggregationRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiRbacV1AggregationRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiRbacV1AggregationRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiRbacV1AggregationRule> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiRbacV1AggregationRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1AggregationRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiRbacV1AggregationRule-objects as value to a dart map
  static Map<String, List<IoK8sApiRbacV1AggregationRule>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiRbacV1AggregationRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiRbacV1AggregationRule.listFromJson(
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
