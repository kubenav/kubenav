//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated] instance.
  IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated({
    this.allowEmpty,
    this.prune,
    this.selfHeal,
  });

  /// AllowEmpty allows apps have zero live resources (default: false)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowEmpty;

  /// Prune specifies whether to delete resources from the cluster that are not found in the sources anymore as part of automated sync (default: false)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? prune;

  /// SelfHeal specifies whether to revert resources back to their desired state upon modification in the cluster (default: false)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? selfHeal;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated &&
          other.allowEmpty == allowEmpty &&
          other.prune == prune &&
          other.selfHeal == selfHeal;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowEmpty == null ? 0 : allowEmpty!.hashCode) +
      (prune == null ? 0 : prune!.hashCode) +
      (selfHeal == null ? 0 : selfHeal!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated[allowEmpty=$allowEmpty, prune=$prune, selfHeal=$selfHeal]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowEmpty != null) {
      json[r'allowEmpty'] = this.allowEmpty;
    } else {
      json[r'allowEmpty'] = null;
    }
    if (this.prune != null) {
      json[r'prune'] = this.prune;
    } else {
      json[r'prune'] = null;
    }
    if (this.selfHeal != null) {
      json[r'selfHeal'] = this.selfHeal;
    } else {
      json[r'selfHeal'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated(
        allowEmpty: mapValueOfType<bool>(json, r'allowEmpty'),
        prune: mapValueOfType<bool>(json, r'prune'),
        selfHeal: mapValueOfType<bool>(json, r'selfHeal'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
