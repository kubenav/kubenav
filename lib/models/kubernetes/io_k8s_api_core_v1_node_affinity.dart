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

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_selector.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_preferred_scheduling_term.dart';

class IoK8sApiCoreV1NodeAffinity {
  /// Returns a new [IoK8sApiCoreV1NodeAffinity] instance.
  IoK8sApiCoreV1NodeAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution = const [],
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  /// The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
  List<IoK8sApiCoreV1PreferredSchedulingTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeSelector? requiredDuringSchedulingIgnoredDuringExecution;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeAffinity &&
          other.preferredDuringSchedulingIgnoredDuringExecution ==
              preferredDuringSchedulingIgnoredDuringExecution &&
          other.requiredDuringSchedulingIgnoredDuringExecution ==
              requiredDuringSchedulingIgnoredDuringExecution;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (preferredDuringSchedulingIgnoredDuringExecution.hashCode) +
      (requiredDuringSchedulingIgnoredDuringExecution == null
          ? 0
          : requiredDuringSchedulingIgnoredDuringExecution!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeAffinity[preferredDuringSchedulingIgnoredDuringExecution=$preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution=$requiredDuringSchedulingIgnoredDuringExecution]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'preferredDuringSchedulingIgnoredDuringExecution'] =
        this.preferredDuringSchedulingIgnoredDuringExecution;
    if (this.requiredDuringSchedulingIgnoredDuringExecution != null) {
      json[r'requiredDuringSchedulingIgnoredDuringExecution'] =
          this.requiredDuringSchedulingIgnoredDuringExecution;
    } else {
      json[r'requiredDuringSchedulingIgnoredDuringExecution'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeAffinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeAffinity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeAffinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeAffinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeAffinity(
        preferredDuringSchedulingIgnoredDuringExecution:
            IoK8sApiCoreV1PreferredSchedulingTerm.listFromJson(
                    json[r'preferredDuringSchedulingIgnoredDuringExecution']) ??
                const [],
        requiredDuringSchedulingIgnoredDuringExecution:
            IoK8sApiCoreV1NodeSelector.fromJson(
                json[r'requiredDuringSchedulingIgnoredDuringExecution']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeAffinity>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeAffinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeAffinity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeAffinity> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeAffinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeAffinity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeAffinity-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeAffinity>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeAffinity>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeAffinity.listFromJson(
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
