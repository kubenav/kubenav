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

class IoK8sApiCoreV1ContainerPort {
  /// Returns a new [IoK8sApiCoreV1ContainerPort] instance.
  IoK8sApiCoreV1ContainerPort({
    required this.containerPort,
    this.hostIP,
    this.hostPort,
    this.name,
    this.protocol,
  });

  /// Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.
  int containerPort;

  /// What host IP to bind the external port to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostIP;

  /// Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hostPort;

  /// If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Protocol for port. Must be UDP, TCP, or SCTP. Defaults to \"TCP\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? protocol;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ContainerPort &&
          other.containerPort == containerPort &&
          other.hostIP == hostIP &&
          other.hostPort == hostPort &&
          other.name == name &&
          other.protocol == protocol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (containerPort.hashCode) +
      (hostIP == null ? 0 : hostIP!.hashCode) +
      (hostPort == null ? 0 : hostPort!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ContainerPort[containerPort=$containerPort, hostIP=$hostIP, hostPort=$hostPort, name=$name, protocol=$protocol]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'containerPort'] = this.containerPort;
    if (this.hostIP != null) {
      json[r'hostIP'] = this.hostIP;
    } else {
      json[r'hostIP'] = null;
    }
    if (this.hostPort != null) {
      json[r'hostPort'] = this.hostPort;
    } else {
      json[r'hostPort'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.protocol != null) {
      json[r'protocol'] = this.protocol;
    } else {
      json[r'protocol'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ContainerPort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ContainerPort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ContainerPort[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ContainerPort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ContainerPort(
        containerPort: mapValueOfType<int>(json, r'containerPort')!,
        hostIP: mapValueOfType<String>(json, r'hostIP'),
        hostPort: mapValueOfType<int>(json, r'hostPort'),
        name: mapValueOfType<String>(json, r'name'),
        protocol: mapValueOfType<String>(json, r'protocol'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ContainerPort>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerPort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ContainerPort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ContainerPort> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ContainerPort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ContainerPort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ContainerPort-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ContainerPort>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ContainerPort>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ContainerPort.listFromJson(
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
    'containerPort',
  };
}
