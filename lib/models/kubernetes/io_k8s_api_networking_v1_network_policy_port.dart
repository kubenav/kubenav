//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiNetworkingV1NetworkPolicyPort {
  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyPort] instance.
  IoK8sApiNetworkingV1NetworkPolicyPort({
    this.endPort,
    this.port,
    this.protocol,
  });

  /// If set, indicates that the range of ports from port to endPort, inclusive, should be allowed by the policy. This field cannot be defined if the port field is not defined or if the port field is defined as a named (string) port. The endPort must be equal or greater than port. This feature is in Beta state and is enabled by default. It can be disabled using the Feature Gate \"NetworkPolicyEndPort\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endPort;

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  dynamic? port;

  /// The protocol (TCP, UDP, or SCTP) which traffic must match. If not specified, this field defaults to TCP.
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
      other is IoK8sApiNetworkingV1NetworkPolicyPort &&
          other.endPort == endPort &&
          other.port == port &&
          other.protocol == protocol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (endPort == null ? 0 : endPort!.hashCode) +
      (port == null ? 0 : port!.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1NetworkPolicyPort[endPort=$endPort, port=$port, protocol=$protocol]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (endPort != null) {
      json[r'endPort'] = endPort;
    }
    if (port != null) {
      json[r'port'] = port;
    }
    if (protocol != null) {
      json[r'protocol'] = protocol;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyPort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1NetworkPolicyPort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1NetworkPolicyPort[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1NetworkPolicyPort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1NetworkPolicyPort(
        endPort: mapValueOfType<int>(json, r'endPort'),
        port: mapValueOfType<dynamic>(json, r'port'),
        protocol: mapValueOfType<String>(json, r'protocol'),
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1NetworkPolicyPort>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1NetworkPolicyPort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1NetworkPolicyPort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1NetworkPolicyPort> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1NetworkPolicyPort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1NetworkPolicyPort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1NetworkPolicyPort-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1NetworkPolicyPort>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1NetworkPolicyPort>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1NetworkPolicyPort.listFromJson(
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
