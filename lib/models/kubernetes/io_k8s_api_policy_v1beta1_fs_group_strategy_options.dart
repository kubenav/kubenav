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
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_id_range.dart';

class IoK8sApiPolicyV1beta1FSGroupStrategyOptions {
  /// Returns a new [IoK8sApiPolicyV1beta1FSGroupStrategyOptions] instance.
  IoK8sApiPolicyV1beta1FSGroupStrategyOptions({
    this.ranges = const [],
    this.rule,
  });

  /// ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
  List<IoK8sApiPolicyV1beta1IDRange> ranges;

  /// rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rule;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiPolicyV1beta1FSGroupStrategyOptions &&
          other.ranges == ranges &&
          other.rule == rule;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ranges.hashCode) + (rule == null ? 0 : rule!.hashCode);

  @override
  String toString() =>
      'IoK8sApiPolicyV1beta1FSGroupStrategyOptions[ranges=$ranges, rule=$rule]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'ranges'] = ranges;
    if (rule != null) {
      json[r'rule'] = rule;
    }
    return json;
  }

  /// Returns a new [IoK8sApiPolicyV1beta1FSGroupStrategyOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiPolicyV1beta1FSGroupStrategyOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiPolicyV1beta1FSGroupStrategyOptions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiPolicyV1beta1FSGroupStrategyOptions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiPolicyV1beta1FSGroupStrategyOptions(
        ranges: IoK8sApiPolicyV1beta1IDRange.listFromJson(json[r'ranges']) ??
            const [],
        rule: mapValueOfType<String>(json, r'rule'),
      );
    }
    return null;
  }

  static List<IoK8sApiPolicyV1beta1FSGroupStrategyOptions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiPolicyV1beta1FSGroupStrategyOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiPolicyV1beta1FSGroupStrategyOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiPolicyV1beta1FSGroupStrategyOptions> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiPolicyV1beta1FSGroupStrategyOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiPolicyV1beta1FSGroupStrategyOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiPolicyV1beta1FSGroupStrategyOptions-objects as value to a dart map
  static Map<String, List<IoK8sApiPolicyV1beta1FSGroupStrategyOptions>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiPolicyV1beta1FSGroupStrategyOptions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiPolicyV1beta1FSGroupStrategyOptions.listFromJson(
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
