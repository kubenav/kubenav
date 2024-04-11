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
import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_volume_node_resources.dart';

class IoK8sApiStorageV1CSINodeDriver {
  /// Returns a new [IoK8sApiStorageV1CSINodeDriver] instance.
  IoK8sApiStorageV1CSINodeDriver({
    this.allocatable,
    required this.name,
    required this.nodeID,
    this.topologyKeys = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiStorageV1VolumeNodeResources? allocatable;

  /// This is the name of the CSI driver that this object refers to. This MUST be the same name returned by the CSI GetPluginName() call for that driver.
  String name;

  /// nodeID of the node from the driver point of view. This field enables Kubernetes to communicate with storage systems that do not share the same nomenclature for nodes. For example, Kubernetes may refer to a given node as \"node1\", but the storage system may refer to the same node as \"nodeA\". When Kubernetes issues a command to the storage system to attach a volume to a specific node, it can use this field to refer to the node name using the ID that the storage system will understand, e.g. \"nodeA\" instead of \"node1\". This field is required.
  String nodeID;

  /// topologyKeys is the list of keys supported by the driver. When a driver is initialized on a cluster, it provides a set of topology keys that it understands (e.g. \"company.com/zone\", \"company.com/region\"). When a driver is initialized on a node, it provides the same topology keys along with values. Kubelet will expose these topology keys as labels on its own node object. When Kubernetes does topology aware provisioning, it can use this list to determine which labels it should retrieve from the node object and pass back to the driver. It is possible for different nodes to use different topology keys. This can be empty if driver does not support topology.
  List<String> topologyKeys;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1CSINodeDriver &&
          other.allocatable == allocatable &&
          other.name == name &&
          other.nodeID == nodeID &&
          other.topologyKeys == topologyKeys;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allocatable == null ? 0 : allocatable!.hashCode) +
      (name.hashCode) +
      (nodeID.hashCode) +
      (topologyKeys.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1CSINodeDriver[allocatable=$allocatable, name=$name, nodeID=$nodeID, topologyKeys=$topologyKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allocatable != null) {
      json[r'allocatable'] = this.allocatable;
    } else {
      json[r'allocatable'] = null;
    }
    json[r'name'] = this.name;
    json[r'nodeID'] = this.nodeID;
    json[r'topologyKeys'] = this.topologyKeys;
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1CSINodeDriver] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1CSINodeDriver? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1CSINodeDriver[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1CSINodeDriver[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1CSINodeDriver(
        allocatable:
            IoK8sApiStorageV1VolumeNodeResources.fromJson(json[r'allocatable']),
        name: mapValueOfType<String>(json, r'name')!,
        nodeID: mapValueOfType<String>(json, r'nodeID')!,
        topologyKeys: json[r'topologyKeys'] is List
            ? (json[r'topologyKeys'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1CSINodeDriver>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1CSINodeDriver>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1CSINodeDriver.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1CSINodeDriver> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiStorageV1CSINodeDriver>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSINodeDriver.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1CSINodeDriver-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1CSINodeDriver>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1CSINodeDriver>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSINodeDriver.listFromJson(
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
    'name',
    'nodeID',
  };
}
