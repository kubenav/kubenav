//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiDiscoveryV1beta1EndpointSlice {
  /// Returns a new [IoK8sApiDiscoveryV1beta1EndpointSlice] instance.
  IoK8sApiDiscoveryV1beta1EndpointSlice({
    required this.addressType,
    this.apiVersion,
    this.endpoints = const [],
    this.kind,
    this.metadata,
    this.ports = const [],
  });

  /// addressType specifies the type of address carried by this EndpointSlice. All addresses in this slice must be the same type. This field is immutable after creation. The following address types are currently supported: * IPv4: Represents an IPv4 Address. * IPv6: Represents an IPv6 Address. * FQDN: Represents a Fully Qualified Domain Name.
  String addressType;

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// endpoints is a list of unique endpoints in this slice. Each slice may include a maximum of 1000 endpoints.
  List<IoK8sApiDiscoveryV1beta1Endpoint> endpoints;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  /// ports specifies the list of network ports exposed by each endpoint in this slice. Each port must have a unique name. When ports is empty, it indicates that there are no defined ports. When a port is defined with a nil port value, it indicates \"all ports\". Each slice may include a maximum of 100 ports.
  List<IoK8sApiDiscoveryV1beta1EndpointPort> ports;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiDiscoveryV1beta1EndpointSlice &&
          other.addressType == addressType &&
          other.apiVersion == apiVersion &&
          other.endpoints == endpoints &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.ports == ports;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addressType.hashCode) +
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (endpoints.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (ports.hashCode);

  @override
  String toString() =>
      'IoK8sApiDiscoveryV1beta1EndpointSlice[addressType=$addressType, apiVersion=$apiVersion, endpoints=$endpoints, kind=$kind, metadata=$metadata, ports=$ports]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'addressType'] = addressType;
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    json[r'endpoints'] = endpoints;
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    json[r'ports'] = ports;
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1beta1EndpointSlice] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1beta1EndpointSlice? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1beta1EndpointSlice[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1beta1EndpointSlice[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1beta1EndpointSlice(
        addressType: mapValueOfType<String>(json, r'addressType')!,
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        endpoints:
            IoK8sApiDiscoveryV1beta1Endpoint.listFromJson(json[r'endpoints'])!,
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        ports:
            IoK8sApiDiscoveryV1beta1EndpointPort.listFromJson(json[r'ports']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1beta1EndpointSlice>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1beta1EndpointSlice>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1beta1EndpointSlice.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1beta1EndpointSlice> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1beta1EndpointSlice>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiDiscoveryV1beta1EndpointSlice.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1beta1EndpointSlice-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1beta1EndpointSlice>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1beta1EndpointSlice>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1beta1EndpointSlice.listFromJson(
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
    'addressType',
    'endpoints',
  };
}
