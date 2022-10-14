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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_config_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_taint.dart';

class IoK8sApiCoreV1NodeSpec {
  /// Returns a new [IoK8sApiCoreV1NodeSpec] instance.
  IoK8sApiCoreV1NodeSpec({
    this.configSource,
    this.externalID,
    this.podCIDR,
    this.podCIDRs = const [],
    this.providerID,
    this.taints = const [],
    this.unschedulable,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeConfigSource? configSource;

  /// Deprecated. Not all kubelets will set this field. Remove field after 1.13. see: https://issues.k8s.io/61966
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalID;

  /// PodCIDR represents the pod IP range assigned to the node.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? podCIDR;

  /// podCIDRs represents the IP ranges assigned to the node for usage by Pods on that node. If this field is specified, the 0th entry must match the podCIDR field. It may contain at most 1 value for each of IPv4 and IPv6.
  List<String> podCIDRs;

  /// ID of the node assigned by the cloud provider in the format: <ProviderName>://<ProviderSpecificNodeID>
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? providerID;

  /// If specified, the node's taints.
  List<IoK8sApiCoreV1Taint> taints;

  /// Unschedulable controls node schedulability of new pods. By default, node is schedulable. More info: https://kubernetes.io/docs/concepts/nodes/node/#manual-node-administration
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? unschedulable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeSpec &&
          other.configSource == configSource &&
          other.externalID == externalID &&
          other.podCIDR == podCIDR &&
          other.podCIDRs == podCIDRs &&
          other.providerID == providerID &&
          other.taints == taints &&
          other.unschedulable == unschedulable;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (configSource == null ? 0 : configSource!.hashCode) +
      (externalID == null ? 0 : externalID!.hashCode) +
      (podCIDR == null ? 0 : podCIDR!.hashCode) +
      (podCIDRs.hashCode) +
      (providerID == null ? 0 : providerID!.hashCode) +
      (taints.hashCode) +
      (unschedulable == null ? 0 : unschedulable!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeSpec[configSource=$configSource, externalID=$externalID, podCIDR=$podCIDR, podCIDRs=$podCIDRs, providerID=$providerID, taints=$taints, unschedulable=$unschedulable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configSource != null) {
      json[r'configSource'] = this.configSource;
    } else {
      json[r'configSource'] = null;
    }
    if (this.externalID != null) {
      json[r'externalID'] = this.externalID;
    } else {
      json[r'externalID'] = null;
    }
    if (this.podCIDR != null) {
      json[r'podCIDR'] = this.podCIDR;
    } else {
      json[r'podCIDR'] = null;
    }
    json[r'podCIDRs'] = this.podCIDRs;
    if (this.providerID != null) {
      json[r'providerID'] = this.providerID;
    } else {
      json[r'providerID'] = null;
    }
    json[r'taints'] = this.taints;
    if (this.unschedulable != null) {
      json[r'unschedulable'] = this.unschedulable;
    } else {
      json[r'unschedulable'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeSpec(
        configSource:
            IoK8sApiCoreV1NodeConfigSource.fromJson(json[r'configSource']),
        externalID: mapValueOfType<String>(json, r'externalID'),
        podCIDR: mapValueOfType<String>(json, r'podCIDR'),
        podCIDRs: json[r'podCIDRs'] is List
            ? (json[r'podCIDRs'] as List).cast<String>()
            : const [],
        providerID: mapValueOfType<String>(json, r'providerID'),
        taints: IoK8sApiCoreV1Taint.listFromJson(json[r'taints']) ?? const [],
        unschedulable: mapValueOfType<bool>(json, r'unschedulable'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeSpec.listFromJson(
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
