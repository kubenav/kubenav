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

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement {
  /// Returns a new [IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement] instance.
  IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement({
    this.containerName,
    required this.operator_,
    this.values = const [],
  });

  /// Restricts the check for exit codes to the container with the specified name. When null, the rule applies to all containers. When specified, it should match one the container or initContainer names in the pod template.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? containerName;

  /// Represents the relationship between the container exit code(s) and the specified values. Containers completed with success (exit code 0) are excluded from the requirement check. Possible values are: - In: the requirement is satisfied if at least one container exit code   (might be multiple if there are multiple containers not restricted   by the 'containerName' field) is in the set of specified values. - NotIn: the requirement is satisfied if at least one container exit code   (might be multiple if there are multiple containers not restricted   by the 'containerName' field) is not in the set of specified values. Additional values are considered to be added in the future. Clients should react to an unknown operator by assuming the requirement is not satisfied.
  String operator_;

  /// Specifies the set of values. Each returned container exit code (might be multiple in case of multiple containers) is checked against this set of values with respect to the operator. The list of values must be ordered and must not contain duplicates. Value '0' cannot be used for the In operator. At least one element is required. At most 255 elements are allowed.
  List<int> values;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement &&
          other.containerName == containerName &&
          other.operator_ == operator_ &&
          other.values == values;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (containerName == null ? 0 : containerName!.hashCode) +
      (operator_.hashCode) +
      (values.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement[containerName=$containerName, operator_=$operator_, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.containerName != null) {
      json[r'containerName'] = this.containerName;
    } else {
      json[r'containerName'] = null;
    }
    json[r'operator'] = this.operator_;
    json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement(
        containerName: mapValueOfType<String>(json, r'containerName'),
        operator_: mapValueOfType<String>(json, r'operator')!,
        values: json[r'values'] is List
            ? (json[r'values'] as List).cast<int>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement-objects as value to a dart map
  static Map<String,
          List<IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirement.listFromJson(
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
    'operator',
    'values',
  };
}
