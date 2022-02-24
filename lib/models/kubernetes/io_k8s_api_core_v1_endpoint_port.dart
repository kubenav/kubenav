//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1EndpointPort {
  /// Returns a new [IoK8sApiCoreV1EndpointPort] instance.
  IoK8sApiCoreV1EndpointPort({
    this.appProtocol,
    this.name,
    required this.port,
    this.protocol,
  });

  /// The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appProtocol;

  /// The name of this port.  This must match the 'name' field in the corresponding ServicePort. Must be a DNS_LABEL. Optional only if one port is defined.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The port number of the endpoint.
  int port;

  /// The IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
  IoK8sApiCoreV1EndpointPortProtocolEnum? protocol;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EndpointPort &&
          other.appProtocol == appProtocol &&
          other.name == name &&
          other.port == port &&
          other.protocol == protocol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (appProtocol == null ? 0 : appProtocol!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (port.hashCode) +
      (protocol == null ? 0 : protocol!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EndpointPort[appProtocol=$appProtocol, name=$name, port=$port, protocol=$protocol]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (appProtocol != null) {
      json[r'appProtocol'] = appProtocol;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    json[r'port'] = port;
    if (protocol != null) {
      json[r'protocol'] = protocol;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EndpointPort] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EndpointPort? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EndpointPort[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EndpointPort[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EndpointPort(
        appProtocol: mapValueOfType<String>(json, r'appProtocol'),
        name: mapValueOfType<String>(json, r'name'),
        port: mapValueOfType<int>(json, r'port')!,
        protocol:
            IoK8sApiCoreV1EndpointPortProtocolEnum.fromJson(json[r'protocol']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EndpointPort>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EndpointPort>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EndpointPort.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EndpointPort> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1EndpointPort>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointPort.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EndpointPort-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EndpointPort>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EndpointPort>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointPort.listFromJson(
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

/// The IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
class IoK8sApiCoreV1EndpointPortProtocolEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1EndpointPortProtocolEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const SCTP = IoK8sApiCoreV1EndpointPortProtocolEnum._(r'SCTP');
  static const TCP = IoK8sApiCoreV1EndpointPortProtocolEnum._(r'TCP');
  static const UDP = IoK8sApiCoreV1EndpointPortProtocolEnum._(r'UDP');

  /// List of all possible values in this [enum][IoK8sApiCoreV1EndpointPortProtocolEnum].
  static const values = <IoK8sApiCoreV1EndpointPortProtocolEnum>[
    SCTP,
    TCP,
    UDP,
  ];

  static IoK8sApiCoreV1EndpointPortProtocolEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1EndpointPortProtocolEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EndpointPortProtocolEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EndpointPortProtocolEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1EndpointPortProtocolEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1EndpointPortProtocolEnum].
class IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer {
  factory IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer._();

  const IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1EndpointPortProtocolEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1EndpointPortProtocolEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1EndpointPortProtocolEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'SCTP':
          return IoK8sApiCoreV1EndpointPortProtocolEnum.SCTP;
        case r'TCP':
          return IoK8sApiCoreV1EndpointPortProtocolEnum.TCP;
        case r'UDP':
          return IoK8sApiCoreV1EndpointPortProtocolEnum.UDP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer] instance.
  static IoK8sApiCoreV1EndpointPortProtocolEnumTypeTransformer? _instance;
}
