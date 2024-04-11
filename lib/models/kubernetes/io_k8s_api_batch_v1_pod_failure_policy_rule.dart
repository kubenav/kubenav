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
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_pod_failure_policy_on_exit_codes_requirement.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_pod_failure_policy_on_pod_conditions_pattern.dart';

class IoK8sApiBatchV1PodFailurePolicyRule {
  /// Returns a new [IoK8sApiBatchV1PodFailurePolicyRule] instance.
  IoK8sApiBatchV1PodFailurePolicyRule({
    required this.action,
    this.onExitCodes,
    this.onPodConditions = const [],
  });

  /// Specifies the action taken on a pod failure when the requirements are satisfied. Possible values are: - FailJob: indicates that the pod's job is marked as Failed and all   running pods are terminated. - Ignore: indicates that the counter towards the .backoffLimit is not   incremented and a replacement pod is created. - Count: indicates that the pod is handled in the default way - the   counter towards the .backoffLimit is incremented. Additional values are considered to be added in the future. Clients should react to an unknown action by skipping the rule.
  String action;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement? onExitCodes;

  /// Represents the requirement on the pod conditions. The requirement is represented as a list of pod condition patterns. The requirement is satisfied if at least one pattern matches an actual pod condition. At most 20 elements are allowed.
  List<IoK8sApiBatchV1PodFailurePolicyOnPodConditionsPattern> onPodConditions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1PodFailurePolicyRule &&
          other.action == action &&
          other.onExitCodes == onExitCodes &&
          other.onPodConditions == onPodConditions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (action.hashCode) +
      (onExitCodes == null ? 0 : onExitCodes!.hashCode) +
      (onPodConditions.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1PodFailurePolicyRule[action=$action, onExitCodes=$onExitCodes, onPodConditions=$onPodConditions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'action'] = this.action;
    if (this.onExitCodes != null) {
      json[r'onExitCodes'] = this.onExitCodes;
    } else {
      json[r'onExitCodes'] = null;
    }
    json[r'onPodConditions'] = this.onPodConditions;
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1PodFailurePolicyRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1PodFailurePolicyRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1PodFailurePolicyRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1PodFailurePolicyRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1PodFailurePolicyRule(
        action: mapValueOfType<String>(json, r'action')!,
        onExitCodes:
            IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement.fromJson(
                json[r'onExitCodes']),
        onPodConditions:
            IoK8sApiBatchV1PodFailurePolicyOnPodConditionsPattern.listFromJson(
                json[r'onPodConditions'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1PodFailurePolicyRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1PodFailurePolicyRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1PodFailurePolicyRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1PodFailurePolicyRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiBatchV1PodFailurePolicyRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1PodFailurePolicyRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1PodFailurePolicyRule-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1PodFailurePolicyRule>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1PodFailurePolicyRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1PodFailurePolicyRule.listFromJson(
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
    'action',
    'onPodConditions',
  };
}
