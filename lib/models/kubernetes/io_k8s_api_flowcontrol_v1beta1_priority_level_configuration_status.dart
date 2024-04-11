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

import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta1_priority_level_configuration_condition.dart';

class IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus] instance.
  IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus({
    this.conditions = const [],
  });

  /// `conditions` is the current state of \"request-priority\".
  List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationCondition>
      conditions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus &&
          other.conditions == conditions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus[conditions=$conditions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus(
        conditions:
            IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationCondition
                    .listFromJson(json[r'conditions']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus-objects as value to a dart map
  static Map<String,
          List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationStatus
            .listFromJson(
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
