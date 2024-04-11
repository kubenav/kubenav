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

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_pod_failure_policy_rule.dart';

class IoK8sApiBatchV1PodFailurePolicy {
  /// Returns a new [IoK8sApiBatchV1PodFailurePolicy] instance.
  IoK8sApiBatchV1PodFailurePolicy({
    this.rules = const [],
  });

  /// A list of pod failure policy rules. The rules are evaluated in order. Once a rule matches a Pod failure, the remaining of the rules are ignored. When no rule matches the Pod failure, the default handling applies - the counter of pod failures is incremented and it is checked against the backoffLimit. At most 20 elements are allowed.
  List<IoK8sApiBatchV1PodFailurePolicyRule> rules;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1PodFailurePolicy && other.rules == rules;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rules.hashCode);

  @override
  String toString() => 'IoK8sApiBatchV1PodFailurePolicy[rules=$rules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'rules'] = this.rules;
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1PodFailurePolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1PodFailurePolicy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1PodFailurePolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1PodFailurePolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1PodFailurePolicy(
        rules:
            IoK8sApiBatchV1PodFailurePolicyRule.listFromJson(json[r'rules'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1PodFailurePolicy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1PodFailurePolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1PodFailurePolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1PodFailurePolicy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiBatchV1PodFailurePolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1PodFailurePolicy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1PodFailurePolicy-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1PodFailurePolicy>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1PodFailurePolicy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1PodFailurePolicy.listFromJson(
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
    'rules',
  };
}
