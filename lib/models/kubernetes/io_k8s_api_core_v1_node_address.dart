//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1NodeAddress {
  /// Returns a new [IoK8sApiCoreV1NodeAddress] instance.
  IoK8sApiCoreV1NodeAddress({
    required this.address,
    required this.type,
  });

  /// The node address.
  String address;

  /// Node address type, one of Hostname, ExternalIP or InternalIP.  Possible enum values:  - `\"ExternalDNS\"` identifies a DNS name which resolves to an IP address which has the characteristics of a NodeExternalIP. The IP it resolves to may or may not be a listed NodeExternalIP address.  - `\"ExternalIP\"` identifies an IP address which is, in some way, intended to be more usable from outside the cluster then an internal IP, though no specific semantics are defined. It may be a globally routable IP, though it is not required to be. External IPs may be assigned directly to an interface on the node, like a NodeInternalIP, or alternatively, packets sent to the external IP may be NAT'ed to an internal node IP rather than being delivered directly (making the IP less efficient for node-to-node traffic than a NodeInternalIP).  - `\"Hostname\"` identifies a name of the node. Although every node can be assumed to have a NodeAddress of this type, its exact syntax and semantics are not defined, and are not consistent between different clusters.  - `\"InternalDNS\"` identifies a DNS name which resolves to an IP address which has the characteristics of a NodeInternalIP. The IP it resolves to may or may not be a listed NodeInternalIP address.  - `\"InternalIP\"` identifies an IP address which is assigned to one of the node's network interfaces. Every node should have at least one address of this type. An internal IP is normally expected to be reachable from every other node, but may not be visible to hosts outside the cluster. By default it is assumed that kube-apiserver can reach node internal IPs, though it is possible to configure clusters where this is not the case. NodeInternalIP is the default type of node IP, and does not necessarily imply that the IP is ONLY reachable internally. If a node has multiple internal IPs, no specific semantics are assigned to the additional IPs.
  IoK8sApiCoreV1NodeAddressTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeAddress &&
          other.address == address &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (address.hashCode) + (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeAddress[address=$address, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'address'] = address;
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeAddress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeAddress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeAddress[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeAddress[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeAddress(
        address: mapValueOfType<String>(json, r'address')!,
        type: IoK8sApiCoreV1NodeAddressTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeAddress>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeAddress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeAddress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeAddress> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeAddress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeAddress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeAddress-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeAddress>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeAddress>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeAddress.listFromJson(
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
    'address',
    'type',
  };
}

/// Node address type, one of Hostname, ExternalIP or InternalIP.  Possible enum values:  - `\"ExternalDNS\"` identifies a DNS name which resolves to an IP address which has the characteristics of a NodeExternalIP. The IP it resolves to may or may not be a listed NodeExternalIP address.  - `\"ExternalIP\"` identifies an IP address which is, in some way, intended to be more usable from outside the cluster then an internal IP, though no specific semantics are defined. It may be a globally routable IP, though it is not required to be. External IPs may be assigned directly to an interface on the node, like a NodeInternalIP, or alternatively, packets sent to the external IP may be NAT'ed to an internal node IP rather than being delivered directly (making the IP less efficient for node-to-node traffic than a NodeInternalIP).  - `\"Hostname\"` identifies a name of the node. Although every node can be assumed to have a NodeAddress of this type, its exact syntax and semantics are not defined, and are not consistent between different clusters.  - `\"InternalDNS\"` identifies a DNS name which resolves to an IP address which has the characteristics of a NodeInternalIP. The IP it resolves to may or may not be a listed NodeInternalIP address.  - `\"InternalIP\"` identifies an IP address which is assigned to one of the node's network interfaces. Every node should have at least one address of this type. An internal IP is normally expected to be reachable from every other node, but may not be visible to hosts outside the cluster. By default it is assumed that kube-apiserver can reach node internal IPs, though it is possible to configure clusters where this is not the case. NodeInternalIP is the default type of node IP, and does not necessarily imply that the IP is ONLY reachable internally. If a node has multiple internal IPs, no specific semantics are assigned to the additional IPs.
class IoK8sApiCoreV1NodeAddressTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1NodeAddressTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const externalDNS =
      IoK8sApiCoreV1NodeAddressTypeEnum._(r'ExternalDNS');
  static const externalIP = IoK8sApiCoreV1NodeAddressTypeEnum._(r'ExternalIP');
  static const hostname = IoK8sApiCoreV1NodeAddressTypeEnum._(r'Hostname');
  static const internalDNS =
      IoK8sApiCoreV1NodeAddressTypeEnum._(r'InternalDNS');
  static const internalIP = IoK8sApiCoreV1NodeAddressTypeEnum._(r'InternalIP');

  /// List of all possible values in this [enum][IoK8sApiCoreV1NodeAddressTypeEnum].
  static const values = <IoK8sApiCoreV1NodeAddressTypeEnum>[
    externalDNS,
    externalIP,
    hostname,
    internalDNS,
    internalIP,
  ];

  static IoK8sApiCoreV1NodeAddressTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1NodeAddressTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeAddressTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeAddressTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1NodeAddressTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1NodeAddressTypeEnum].
class IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1NodeAddressTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1NodeAddressTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1NodeAddressTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ExternalDNS':
          return IoK8sApiCoreV1NodeAddressTypeEnum.externalDNS;
        case r'ExternalIP':
          return IoK8sApiCoreV1NodeAddressTypeEnum.externalIP;
        case r'Hostname':
          return IoK8sApiCoreV1NodeAddressTypeEnum.hostname;
        case r'InternalDNS':
          return IoK8sApiCoreV1NodeAddressTypeEnum.internalDNS;
        case r'InternalIP':
          return IoK8sApiCoreV1NodeAddressTypeEnum.internalIP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1NodeAddressTypeEnumTypeTransformer? _instance;
}
