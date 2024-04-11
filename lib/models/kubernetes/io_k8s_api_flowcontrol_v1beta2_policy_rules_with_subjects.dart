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

import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta2_non_resource_policy_rule.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta2_resource_policy_rule.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta2_subject.dart';

class IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects {
  /// Returns a new [IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects] instance.
  IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects({
    this.nonResourceRules = const [],
    this.resourceRules = const [],
    this.subjects = const [],
  });

  /// `nonResourceRules` is a list of NonResourcePolicyRules that identify matching requests according to their verb and the target non-resource URL.
  List<IoK8sApiFlowcontrolV1beta2NonResourcePolicyRule> nonResourceRules;

  /// `resourceRules` is a slice of ResourcePolicyRules that identify matching requests according to their verb and the target resource. At least one of `resourceRules` and `nonResourceRules` has to be non-empty.
  List<IoK8sApiFlowcontrolV1beta2ResourcePolicyRule> resourceRules;

  /// subjects is the list of normal user, serviceaccount, or group that this rule cares about. There must be at least one member in this slice. A slice that includes both the system:authenticated and system:unauthenticated user groups matches every request. Required.
  List<IoK8sApiFlowcontrolV1beta2Subject> subjects;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects &&
          other.nonResourceRules == nonResourceRules &&
          other.resourceRules == resourceRules &&
          other.subjects == subjects;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nonResourceRules.hashCode) +
      (resourceRules.hashCode) +
      (subjects.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects[nonResourceRules=$nonResourceRules, resourceRules=$resourceRules, subjects=$subjects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'nonResourceRules'] = this.nonResourceRules;
    json[r'resourceRules'] = this.resourceRules;
    json[r'subjects'] = this.subjects;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects(
        nonResourceRules:
            IoK8sApiFlowcontrolV1beta2NonResourcePolicyRule.listFromJson(
                    json[r'nonResourceRules']) ??
                const [],
        resourceRules:
            IoK8sApiFlowcontrolV1beta2ResourcePolicyRule.listFromJson(
                    json[r'resourceRules']) ??
                const [],
        subjects:
            IoK8sApiFlowcontrolV1beta2Subject.listFromJson(json[r'subjects'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta2PolicyRulesWithSubjects.listFromJson(
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
    'subjects',
  };
}
