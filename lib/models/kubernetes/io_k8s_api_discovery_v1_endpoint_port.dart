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

class IoK8sApiDiscoveryV1EndpointPort {
  /// Returns a new [IoK8sApiDiscoveryV1EndpointPort] instance.
  IoK8sApiDiscoveryV1EndpointPort({
    this.appProtocol,
    this.name,
    this.port,
    this.protocol,
  });

  /// The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appProtocol;

  /// The name of this port. All ports in an EndpointSlice must have a unique name. If the EndpointSlice is dervied from a Kubernetes service, this corresponds to the Service.ports[].name. Name must either be an empty string or pass DNS_LABEL validation: * must be no more than 63 characters long. * must consist of lower case alphanumeric characters or '-'. * must start and end with an alphanumeric character. Default is empty string.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The port number of the endpoint. If this is not specified, ports are not restricted and must be interpreted in the context of the specific consumer.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? port;

  /// The IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.
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
      other is IoK8sApiDiscoveryV1EndpointPort &&
          other.appProtocol == appProtocol &&
          other.name == name &&
          other.port == port &&
          other.protocol == protocol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (appProtocol == null ? 0 : appProtocol!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (port == null ? 0 : port!.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode);

  @override
  String toString() =>
      'IoK8sApiDiscoveryV1EndpointPort[appProtocol=$appProtocol, name=$name, port=$port, protocol=$protocol]';

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
    if (this.port != null) {
      json[r'port'] = this.port;
    } else {
      json[r'port'] = null;
    }
    if (this.protocol != null) {
      json[r'protocol'] = this.protocol;
    } else {
      json[r'protocol'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1EndpointPort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1EndpointPort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1EndpointPort[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1EndpointPort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1EndpointPort(
        appProtocol: mapValueOfType<String>(json, r'appProtocol'),
        name: mapValueOfType<String>(json, r'name'),
        port: mapValueOfType<int>(json, r'port'),
        protocol: mapValueOfType<String>(json, r'protocol'),
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1EndpointPort>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1EndpointPort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1EndpointPort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1EndpointPort> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1EndpointPort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1EndpointPort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1EndpointPort-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1EndpointPort>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1EndpointPort>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1EndpointPort.listFromJson(
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
