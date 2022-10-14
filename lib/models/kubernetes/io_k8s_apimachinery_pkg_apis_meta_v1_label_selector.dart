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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector_requirement.dart';

class IoK8sApimachineryPkgApisMetaV1LabelSelector {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1LabelSelector] instance.
  IoK8sApimachineryPkgApisMetaV1LabelSelector({
    this.matchExpressions = const [],
    this.matchLabels = const {},
  });

  /// matchExpressions is a list of label selector requirements. The requirements are ANDed.
  List<IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement> matchExpressions;

  /// matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed.
  Map<String, String> matchLabels;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1LabelSelector &&
          other.matchExpressions == matchExpressions &&
          other.matchLabels == matchLabels;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (matchExpressions.hashCode) + (matchLabels.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1LabelSelector[matchExpressions=$matchExpressions, matchLabels=$matchLabels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'matchExpressions'] = this.matchExpressions;
    json[r'matchLabels'] = this.matchLabels;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1LabelSelector] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1LabelSelector? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1LabelSelector[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1LabelSelector[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1LabelSelector(
        matchExpressions:
            IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement.listFromJson(
                    json[r'matchExpressions']) ??
                const [],
        matchLabels:
            mapCastOfType<String, String>(json, r'matchLabels') ?? const {},
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1LabelSelector>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1LabelSelector>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1LabelSelector> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1LabelSelector>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1LabelSelector-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1LabelSelector>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1LabelSelector>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1LabelSelector.listFromJson(
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
