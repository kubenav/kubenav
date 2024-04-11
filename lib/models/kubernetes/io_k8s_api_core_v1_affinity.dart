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

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_affinity.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_affinity.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_anti_affinity.dart';

class IoK8sApiCoreV1Affinity {
  /// Returns a new [IoK8sApiCoreV1Affinity] instance.
  IoK8sApiCoreV1Affinity({
    this.nodeAffinity,
    this.podAffinity,
    this.podAntiAffinity,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeAffinity? nodeAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodAffinity? podAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodAntiAffinity? podAntiAffinity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Affinity &&
          other.nodeAffinity == nodeAffinity &&
          other.podAffinity == podAffinity &&
          other.podAntiAffinity == podAntiAffinity;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nodeAffinity == null ? 0 : nodeAffinity!.hashCode) +
      (podAffinity == null ? 0 : podAffinity!.hashCode) +
      (podAntiAffinity == null ? 0 : podAntiAffinity!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Affinity[nodeAffinity=$nodeAffinity, podAffinity=$podAffinity, podAntiAffinity=$podAntiAffinity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nodeAffinity != null) {
      json[r'nodeAffinity'] = this.nodeAffinity;
    } else {
      json[r'nodeAffinity'] = null;
    }
    if (this.podAffinity != null) {
      json[r'podAffinity'] = this.podAffinity;
    } else {
      json[r'podAffinity'] = null;
    }
    if (this.podAntiAffinity != null) {
      json[r'podAntiAffinity'] = this.podAntiAffinity;
    } else {
      json[r'podAntiAffinity'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Affinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Affinity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Affinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Affinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Affinity(
        nodeAffinity:
            IoK8sApiCoreV1NodeAffinity.fromJson(json[r'nodeAffinity']),
        podAffinity: IoK8sApiCoreV1PodAffinity.fromJson(json[r'podAffinity']),
        podAntiAffinity:
            IoK8sApiCoreV1PodAntiAffinity.fromJson(json[r'podAntiAffinity']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Affinity>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Affinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Affinity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Affinity> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Affinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Affinity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Affinity-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Affinity>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Affinity>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Affinity.listFromJson(
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
