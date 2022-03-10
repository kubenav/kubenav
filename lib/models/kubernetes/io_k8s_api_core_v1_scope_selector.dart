//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_scoped_resource_selector_requirement.dart';

class IoK8sApiCoreV1ScopeSelector {
  /// Returns a new [IoK8sApiCoreV1ScopeSelector] instance.
  IoK8sApiCoreV1ScopeSelector({
    this.matchExpressions = const [],
  });

  /// A list of scope selector requirements by scope of the resources.
  List<IoK8sApiCoreV1ScopedResourceSelectorRequirement> matchExpressions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ScopeSelector &&
          other.matchExpressions == matchExpressions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (matchExpressions.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ScopeSelector[matchExpressions=$matchExpressions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'matchExpressions'] = matchExpressions;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ScopeSelector] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ScopeSelector? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ScopeSelector[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ScopeSelector[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ScopeSelector(
        matchExpressions:
            IoK8sApiCoreV1ScopedResourceSelectorRequirement.listFromJson(
                    json[r'matchExpressions']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ScopeSelector>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ScopeSelector>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ScopeSelector.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ScopeSelector> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ScopeSelector>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ScopeSelector.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ScopeSelector-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ScopeSelector>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ScopeSelector>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ScopeSelector.listFromJson(
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
