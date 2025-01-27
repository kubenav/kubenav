//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule({
    required this.canarySubsetName,
    required this.name,
    required this.stableSubsetName,
  });

  String canarySubsetName;

  String name;

  String stableSubsetName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule &&
          other.canarySubsetName == canarySubsetName &&
          other.name == name &&
          other.stableSubsetName == stableSubsetName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (canarySubsetName.hashCode) +
      (name.hashCode) +
      (stableSubsetName.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule[canarySubsetName=$canarySubsetName, name=$name, stableSubsetName=$stableSubsetName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'canarySubsetName'] = this.canarySubsetName;
    json[r'name'] = this.name;
    json[r'stableSubsetName'] = this.stableSubsetName;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule(
        canarySubsetName: mapValueOfType<String>(json, r'canarySubsetName')!,
        name: mapValueOfType<String>(json, r'name')!,
        stableSubsetName: mapValueOfType<String>(json, r'stableSubsetName')!,
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstioDestinationRule
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'canarySubsetName',
    'name',
    'stableSubsetName',
  };
}
