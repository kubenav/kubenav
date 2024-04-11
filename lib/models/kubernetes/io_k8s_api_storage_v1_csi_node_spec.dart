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

import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_csi_node_driver.dart';

class IoK8sApiStorageV1CSINodeSpec {
  /// Returns a new [IoK8sApiStorageV1CSINodeSpec] instance.
  IoK8sApiStorageV1CSINodeSpec({
    this.drivers = const [],
  });

  /// drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty.
  List<IoK8sApiStorageV1CSINodeDriver> drivers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1CSINodeSpec && other.drivers == drivers;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (drivers.hashCode);

  @override
  String toString() => 'IoK8sApiStorageV1CSINodeSpec[drivers=$drivers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'drivers'] = this.drivers;
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1CSINodeSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1CSINodeSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1CSINodeSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1CSINodeSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1CSINodeSpec(
        drivers: IoK8sApiStorageV1CSINodeDriver.listFromJson(json[r'drivers'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1CSINodeSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1CSINodeSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1CSINodeSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1CSINodeSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiStorageV1CSINodeSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSINodeSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1CSINodeSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1CSINodeSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1CSINodeSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSINodeSpec.listFromJson(
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
    'drivers',
  };
}
