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
import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta1_limited_priority_level_configuration.dart';

class IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec] instance.
  IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec({
    this.limited,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration? limited;

  /// `type` indicates whether this priority level is subject to limitation on request execution.  A value of `\"Exempt\"` means that requests of this priority level are not subject to a limit (and thus are never queued) and do not detract from the capacity made available to other priority levels.  A value of `\"Limited\"` means that (a) requests of this priority level _are_ subject to limits and (b) some of the server's limited capacity is made available exclusively to this priority level. Required.
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec &&
          other.limited == limited &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (limited == null ? 0 : limited!.hashCode) + (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec[limited=$limited, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (limited != null) {
      json[r'limited'] = limited;
    }
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec(
        limited: IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration
            .fromJson(json[r'limited']),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec-objects as value to a dart map
  static Map<String,
          List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta1PriorityLevelConfigurationSpec
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
  static const requiredKeys = <String>{
    'type',
  };
}
