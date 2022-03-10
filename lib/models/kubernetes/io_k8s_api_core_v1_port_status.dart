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

class IoK8sApiCoreV1PortStatus {
  /// Returns a new [IoK8sApiCoreV1PortStatus] instance.
  IoK8sApiCoreV1PortStatus({
    this.error,
    required this.port,
    required this.protocol,
  });

  /// Error is to record the problem with the service port The format of the error shall comply with the following rules: - built-in error values shall be specified in this file and those shall use   CamelCase names - cloud provider specific error values must have names that comply with the   format foo.example.com/CamelCase.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  /// Port is the port number of the service port of which status is recorded here
  int port;

  /// Protocol is the protocol of the service port of which status is recorded here The supported values are: \"TCP\", \"UDP\", \"SCTP\"  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
  IoK8sApiCoreV1PortStatusProtocolEnum protocol;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PortStatus &&
          other.error == error &&
          other.port == port &&
          other.protocol == protocol;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (error == null ? 0 : error!.hashCode) +
      (port.hashCode) +
      (protocol.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PortStatus[error=$error, port=$port, protocol=$protocol]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (error != null) {
      json[r'error'] = error;
    }
    json[r'port'] = port;
    json[r'protocol'] = protocol;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PortStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PortStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PortStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PortStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PortStatus(
        error: mapValueOfType<String>(json, r'error'),
        port: mapValueOfType<int>(json, r'port')!,
        protocol:
            IoK8sApiCoreV1PortStatusProtocolEnum.fromJson(json[r'protocol'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PortStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PortStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PortStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PortStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PortStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PortStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PortStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PortStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PortStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PortStatus.listFromJson(
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
    'protocol',
  };
}

/// Protocol is the protocol of the service port of which status is recorded here The supported values are: \"TCP\", \"UDP\", \"SCTP\"  Possible enum values:  - `\"SCTP\"` is the SCTP protocol.  - `\"TCP\"` is the TCP protocol.  - `\"UDP\"` is the UDP protocol.
class IoK8sApiCoreV1PortStatusProtocolEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PortStatusProtocolEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const SCTP = IoK8sApiCoreV1PortStatusProtocolEnum._(r'SCTP');
  static const TCP = IoK8sApiCoreV1PortStatusProtocolEnum._(r'TCP');
  static const UDP = IoK8sApiCoreV1PortStatusProtocolEnum._(r'UDP');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PortStatusProtocolEnum].
  static const values = <IoK8sApiCoreV1PortStatusProtocolEnum>[
    SCTP,
    TCP,
    UDP,
  ];

  static IoK8sApiCoreV1PortStatusProtocolEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PortStatusProtocolEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PortStatusProtocolEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PortStatusProtocolEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PortStatusProtocolEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PortStatusProtocolEnum].
class IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer {
  factory IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer._();

  const IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PortStatusProtocolEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PortStatusProtocolEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PortStatusProtocolEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'SCTP':
          return IoK8sApiCoreV1PortStatusProtocolEnum.SCTP;
        case r'TCP':
          return IoK8sApiCoreV1PortStatusProtocolEnum.TCP;
        case r'UDP':
          return IoK8sApiCoreV1PortStatusProtocolEnum.UDP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PortStatusProtocolEnumTypeTransformer? _instance;
}
