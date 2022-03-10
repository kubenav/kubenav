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

  /// Protocol for port. Must be UDP, TCP, or SCTP. Defaults to \"TCP\".  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
  IoK8sApiCoreV1ContainerPortProtocolEnum? protocol;

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
    json[r'containerPort'] = containerPort;
    if (hostIP != null) {
      json[r'hostIP'] = hostIP;
    }
    if (hostPort != null) {
      json[r'hostPort'] = hostPort;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (protocol != null) {
      json[r'protocol'] = protocol;
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
        protocol:
            IoK8sApiCoreV1ContainerPortProtocolEnum.fromJson(json[r'protocol']),
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

/// Protocol for port. Must be UDP, TCP, or SCTP. Defaults to \"TCP\".  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
class IoK8sApiCoreV1ContainerPortProtocolEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1ContainerPortProtocolEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const SCTP = IoK8sApiCoreV1ContainerPortProtocolEnum._(r'SCTP');
  static const TCP = IoK8sApiCoreV1ContainerPortProtocolEnum._(r'TCP');
  static const UDP = IoK8sApiCoreV1ContainerPortProtocolEnum._(r'UDP');

  /// List of all possible values in this [enum][IoK8sApiCoreV1ContainerPortProtocolEnum].
  static const values = <IoK8sApiCoreV1ContainerPortProtocolEnum>[
    SCTP,
    TCP,
    UDP,
  ];

  static IoK8sApiCoreV1ContainerPortProtocolEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1ContainerPortProtocolEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerPortProtocolEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ContainerPortProtocolEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1ContainerPortProtocolEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1ContainerPortProtocolEnum].
class IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer {
  factory IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer._();

  const IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1ContainerPortProtocolEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1ContainerPortProtocolEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1ContainerPortProtocolEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'SCTP':
          return IoK8sApiCoreV1ContainerPortProtocolEnum.SCTP;
        case r'TCP':
          return IoK8sApiCoreV1ContainerPortProtocolEnum.TCP;
        case r'UDP':
          return IoK8sApiCoreV1ContainerPortProtocolEnum.UDP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer] instance.
  static IoK8sApiCoreV1ContainerPortProtocolEnumTypeTransformer? _instance;
}
