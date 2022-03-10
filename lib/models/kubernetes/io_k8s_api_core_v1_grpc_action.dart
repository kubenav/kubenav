//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiCoreV1GRPCAction {
  /// Returns a new [IoK8sApiCoreV1GRPCAction] instance.
  IoK8sApiCoreV1GRPCAction({
    required this.port,
    this.service,
  });

  /// Port number of the gRPC service. Number must be in the range 1 to 65535.
  int port;

  /// Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md).  If this is not specified, the default behavior is defined by gRPC.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? service;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1GRPCAction &&
          other.port == port &&
          other.service == service;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (port.hashCode) + (service == null ? 0 : service!.hashCode);

  @override
  String toString() => 'IoK8sApiCoreV1GRPCAction[port=$port, service=$service]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'port'] = port;
    if (service != null) {
      json[r'service'] = service;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1GRPCAction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1GRPCAction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1GRPCAction[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1GRPCAction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1GRPCAction(
        port: mapValueOfType<int>(json, r'port')!,
        service: mapValueOfType<String>(json, r'service'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1GRPCAction>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1GRPCAction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1GRPCAction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1GRPCAction> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1GRPCAction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1GRPCAction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1GRPCAction-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1GRPCAction>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1GRPCAction>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1GRPCAction.listFromJson(
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
    'port',
  };
}
