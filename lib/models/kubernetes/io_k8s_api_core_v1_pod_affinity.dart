//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PodAffinity {
  /// Returns a new [IoK8sApiCoreV1PodAffinity] instance.
  IoK8sApiCoreV1PodAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution = const [],
    this.requiredDuringSchedulingIgnoredDuringExecution = const [],
  });

  /// The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
  List<IoK8sApiCoreV1WeightedPodAffinityTerm>
      preferredDuringSchedulingIgnoredDuringExecution;

  /// If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
  List<IoK8sApiCoreV1PodAffinityTerm>
      requiredDuringSchedulingIgnoredDuringExecution;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodAffinity &&
          other.preferredDuringSchedulingIgnoredDuringExecution ==
              preferredDuringSchedulingIgnoredDuringExecution &&
          other.requiredDuringSchedulingIgnoredDuringExecution ==
              requiredDuringSchedulingIgnoredDuringExecution;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (preferredDuringSchedulingIgnoredDuringExecution.hashCode) +
      (requiredDuringSchedulingIgnoredDuringExecution.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodAffinity[preferredDuringSchedulingIgnoredDuringExecution=$preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution=$requiredDuringSchedulingIgnoredDuringExecution]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'preferredDuringSchedulingIgnoredDuringExecution'] =
        preferredDuringSchedulingIgnoredDuringExecution;
    json[r'requiredDuringSchedulingIgnoredDuringExecution'] =
        requiredDuringSchedulingIgnoredDuringExecution;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodAffinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodAffinity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodAffinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodAffinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodAffinity(
        preferredDuringSchedulingIgnoredDuringExecution:
            IoK8sApiCoreV1WeightedPodAffinityTerm.listFromJson(
                    json[r'preferredDuringSchedulingIgnoredDuringExecution']) ??
                const [],
        requiredDuringSchedulingIgnoredDuringExecution:
            IoK8sApiCoreV1PodAffinityTerm.listFromJson(
                    json[r'requiredDuringSchedulingIgnoredDuringExecution']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodAffinity>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodAffinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodAffinity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodAffinity> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodAffinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodAffinity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodAffinity-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodAffinity>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodAffinity>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodAffinity.listFromJson(
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
