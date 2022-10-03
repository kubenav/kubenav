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

import 'package:kubenav/models/kubernetes/io_k8s_api_discovery_v1_for_zone.dart';

class IoK8sApiDiscoveryV1EndpointHints {
  /// Returns a new [IoK8sApiDiscoveryV1EndpointHints] instance.
  IoK8sApiDiscoveryV1EndpointHints({
    this.forZones = const [],
  });

  /// forZones indicates the zone(s) this endpoint should be consumed by to enable topology aware routing.
  List<IoK8sApiDiscoveryV1ForZone> forZones;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiDiscoveryV1EndpointHints && other.forZones == forZones;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (forZones.hashCode);

  @override
  String toString() => 'IoK8sApiDiscoveryV1EndpointHints[forZones=$forZones]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'forZones'] = this.forZones;
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1EndpointHints] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1EndpointHints? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1EndpointHints[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1EndpointHints[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1EndpointHints(
        forZones: IoK8sApiDiscoveryV1ForZone.listFromJson(json[r'forZones']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1EndpointHints>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1EndpointHints>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1EndpointHints.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1EndpointHints> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1EndpointHints>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1EndpointHints.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1EndpointHints-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1EndpointHints>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1EndpointHints>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1EndpointHints.listFromJson(
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
