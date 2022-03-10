//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoint_address.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoint_port.dart';

class IoK8sApiCoreV1EndpointSubset {
  /// Returns a new [IoK8sApiCoreV1EndpointSubset] instance.
  IoK8sApiCoreV1EndpointSubset({
    this.addresses = const [],
    this.notReadyAddresses = const [],
    this.ports = const [],
  });

  /// IP addresses which offer the related ports that are marked as ready. These endpoints should be considered safe for load balancers and clients to utilize.
  List<IoK8sApiCoreV1EndpointAddress> addresses;

  /// IP addresses which offer the related ports but are not currently marked as ready because they have not yet finished starting, have recently failed a readiness check, or have recently failed a liveness check.
  List<IoK8sApiCoreV1EndpointAddress> notReadyAddresses;

  /// Port numbers available on the related IP addresses.
  List<IoK8sApiCoreV1EndpointPort> ports;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EndpointSubset &&
          other.addresses == addresses &&
          other.notReadyAddresses == notReadyAddresses &&
          other.ports == ports;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addresses.hashCode) + (notReadyAddresses.hashCode) + (ports.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EndpointSubset[addresses=$addresses, notReadyAddresses=$notReadyAddresses, ports=$ports]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'addresses'] = addresses;
    json[r'notReadyAddresses'] = notReadyAddresses;
    json[r'ports'] = ports;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EndpointSubset] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EndpointSubset? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EndpointSubset[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EndpointSubset[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EndpointSubset(
        addresses:
            IoK8sApiCoreV1EndpointAddress.listFromJson(json[r'addresses']) ??
                const [],
        notReadyAddresses: IoK8sApiCoreV1EndpointAddress.listFromJson(
                json[r'notReadyAddresses']) ??
            const [],
        ports:
            IoK8sApiCoreV1EndpointPort.listFromJson(json[r'ports']) ?? const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EndpointSubset>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EndpointSubset>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EndpointSubset.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EndpointSubset> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1EndpointSubset>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointSubset.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EndpointSubset-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EndpointSubset>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EndpointSubset>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointSubset.listFromJson(
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
