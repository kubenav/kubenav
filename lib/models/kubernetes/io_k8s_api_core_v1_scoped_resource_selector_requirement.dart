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

class IoK8sApiCoreV1ScopedResourceSelectorRequirement {
  /// Returns a new [IoK8sApiCoreV1ScopedResourceSelectorRequirement] instance.
  IoK8sApiCoreV1ScopedResourceSelectorRequirement({
    required this.operator_,
    required this.scopeName,
    this.values = const [],
  });

  /// Represents a scope's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.
  String operator_;

  /// The name of the scope that the selector applies to.
  String scopeName;

  /// An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
  List<String> values;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ScopedResourceSelectorRequirement &&
          other.operator_ == operator_ &&
          other.scopeName == scopeName &&
          other.values == values;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (operator_.hashCode) + (scopeName.hashCode) + (values.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ScopedResourceSelectorRequirement[operator_=$operator_, scopeName=$scopeName, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'operator'] = this.operator_;
    json[r'scopeName'] = this.scopeName;
    json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ScopedResourceSelectorRequirement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ScopedResourceSelectorRequirement? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ScopedResourceSelectorRequirement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ScopedResourceSelectorRequirement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ScopedResourceSelectorRequirement(
        operator_: mapValueOfType<String>(json, r'operator')!,
        scopeName: mapValueOfType<String>(json, r'scopeName')!,
        values: json[r'values'] is List
            ? (json[r'values'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ScopedResourceSelectorRequirement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ScopedResourceSelectorRequirement>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ScopedResourceSelectorRequirement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ScopedResourceSelectorRequirement.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ScopedResourceSelectorRequirement-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirement.listFromJson(
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
    'scopeName',
  };
}
