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

class IoK8sApiCoreV1ServicePort {
  /// Returns a new [IoK8sApiCoreV1ServicePort] instance.
  IoK8sApiCoreV1ServicePort({
    this.appProtocol,
    this.name,
    this.nodePort,
    required this.port,
    this.protocol,
    this.targetPort,
  });

  /// The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appProtocol;

  /// The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not in use it will be used, otherwise the operation will fail.  If not specified, a port will be allocated if this Service requires one.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP). More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nodePort;

  /// The port that will be exposed by this service.
  int port;

  /// The IP protocol for this port. Supports \"TCP\", \"UDP\", and \"SCTP\". Default is TCP.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? protocol;

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  dynamic targetPort;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ServicePort &&
          other.appProtocol == appProtocol &&
          other.name == name &&
          other.nodePort == nodePort &&
          other.port == port &&
          other.protocol == protocol &&
          other.targetPort == targetPort;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (appProtocol == null ? 0 : appProtocol!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (nodePort == null ? 0 : nodePort!.hashCode) +
      (port.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode) +
      (targetPort == null ? 0 : targetPort!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ServicePort[appProtocol=$appProtocol, name=$name, nodePort=$nodePort, port=$port, protocol=$protocol, targetPort=$targetPort]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.appProtocol != null) {
      json[r'appProtocol'] = this.appProtocol;
    } else {
      json[r'appProtocol'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.nodePort != null) {
      json[r'nodePort'] = this.nodePort;
    } else {
      json[r'nodePort'] = null;
    }
    json[r'port'] = this.port;
    if (this.protocol != null) {
      json[r'protocol'] = this.protocol;
    } else {
      json[r'protocol'] = null;
    }
    if (this.targetPort != null) {
      json[r'targetPort'] = this.targetPort;
    } else {
      json[r'targetPort'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ServicePort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ServicePort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ServicePort[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ServicePort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ServicePort(
        appProtocol: mapValueOfType<String>(json, r'appProtocol'),
        name: mapValueOfType<String>(json, r'name'),
        nodePort: mapValueOfType<int>(json, r'nodePort'),
        port: mapValueOfType<int>(json, r'port')!,
        protocol: mapValueOfType<String>(json, r'protocol'),
        targetPort: mapValueOfType<dynamic>(json, r'targetPort'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ServicePort>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ServicePort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ServicePort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ServicePort> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ServicePort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServicePort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ServicePort-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ServicePort>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ServicePort>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServicePort.listFromJson(
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
