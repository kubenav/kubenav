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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_attached_volume.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_image.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_address.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_config_status.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_daemon_endpoints.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_system_info.dart';

class IoK8sApiCoreV1NodeStatus {
  /// Returns a new [IoK8sApiCoreV1NodeStatus] instance.
  IoK8sApiCoreV1NodeStatus({
    this.addresses = const [],
    this.allocatable = const {},
    this.capacity = const {},
    this.conditions = const [],
    this.config,
    this.daemonEndpoints,
    this.images = const [],
    this.nodeInfo,
    this.phase,
    this.volumesAttached = const [],
    this.volumesInUse = const [],
  });

  /// List of addresses reachable to the node. Queried from cloud provider, if available. More info: https://kubernetes.io/docs/concepts/nodes/node/#addresses Note: This field is declared as mergeable, but the merge key is not sufficiently unique, which can cause data corruption when it is merged. Callers should instead use a full-replacement patch. See http://pr.k8s.io/79391 for an example.
  List<IoK8sApiCoreV1NodeAddress> addresses;

  /// Allocatable represents the resources of a node that are available for scheduling. Defaults to Capacity.
  Map<String, String> allocatable;

  /// Capacity represents the total resources of a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
  Map<String, String> capacity;

  /// Conditions is an array of current observed node conditions. More info: https://kubernetes.io/docs/concepts/nodes/node/#condition
  List<IoK8sApiCoreV1NodeCondition> conditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeConfigStatus? config;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeDaemonEndpoints? daemonEndpoints;

  /// List of container images on this node
  List<IoK8sApiCoreV1ContainerImage> images;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeSystemInfo? nodeInfo;

  /// NodePhase is the recently observed lifecycle phase of the node. More info: https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never populated, and now is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phase;

  /// List of volumes that are attached to the node.
  List<IoK8sApiCoreV1AttachedVolume> volumesAttached;

  /// List of attachable volumes in use (mounted) by the node.
  List<String> volumesInUse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeStatus &&
          other.addresses == addresses &&
          other.allocatable == allocatable &&
          other.capacity == capacity &&
          other.conditions == conditions &&
          other.config == config &&
          other.daemonEndpoints == daemonEndpoints &&
          other.images == images &&
          other.nodeInfo == nodeInfo &&
          other.phase == phase &&
          other.volumesAttached == volumesAttached &&
          other.volumesInUse == volumesInUse;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addresses.hashCode) +
      (allocatable.hashCode) +
      (capacity.hashCode) +
      (conditions.hashCode) +
      (config == null ? 0 : config!.hashCode) +
      (daemonEndpoints == null ? 0 : daemonEndpoints!.hashCode) +
      (images.hashCode) +
      (nodeInfo == null ? 0 : nodeInfo!.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (volumesAttached.hashCode) +
      (volumesInUse.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeStatus[addresses=$addresses, allocatable=$allocatable, capacity=$capacity, conditions=$conditions, config=$config, daemonEndpoints=$daemonEndpoints, images=$images, nodeInfo=$nodeInfo, phase=$phase, volumesAttached=$volumesAttached, volumesInUse=$volumesInUse]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'addresses'] = this.addresses;
    json[r'allocatable'] = this.allocatable;
    json[r'capacity'] = this.capacity;
    json[r'conditions'] = this.conditions;
    if (this.config != null) {
      json[r'config'] = this.config;
    } else {
      json[r'config'] = null;
    }
    if (this.daemonEndpoints != null) {
      json[r'daemonEndpoints'] = this.daemonEndpoints;
    } else {
      json[r'daemonEndpoints'] = null;
    }
    json[r'images'] = this.images;
    if (this.nodeInfo != null) {
      json[r'nodeInfo'] = this.nodeInfo;
    } else {
      json[r'nodeInfo'] = null;
    }
    if (this.phase != null) {
      json[r'phase'] = this.phase;
    } else {
      json[r'phase'] = null;
    }
    json[r'volumesAttached'] = this.volumesAttached;
    json[r'volumesInUse'] = this.volumesInUse;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeStatus(
        addresses: IoK8sApiCoreV1NodeAddress.listFromJson(json[r'addresses']) ??
            const [],
        allocatable:
            mapCastOfType<String, String>(json, r'allocatable') ?? const {},
        capacity: mapCastOfType<String, String>(json, r'capacity') ?? const {},
        conditions:
            IoK8sApiCoreV1NodeCondition.listFromJson(json[r'conditions']) ??
                const [],
        config: IoK8sApiCoreV1NodeConfigStatus.fromJson(json[r'config']),
        daemonEndpoints: IoK8sApiCoreV1NodeDaemonEndpoints.fromJson(
            json[r'daemonEndpoints']),
        images: IoK8sApiCoreV1ContainerImage.listFromJson(json[r'images']) ??
            const [],
        nodeInfo: IoK8sApiCoreV1NodeSystemInfo.fromJson(json[r'nodeInfo']),
        phase: mapValueOfType<String>(json, r'phase'),
        volumesAttached: IoK8sApiCoreV1AttachedVolume.listFromJson(
                json[r'volumesAttached']) ??
            const [],
        volumesInUse: json[r'volumesInUse'] is List
            ? (json[r'volumesInUse'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeStatus.listFromJson(
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
