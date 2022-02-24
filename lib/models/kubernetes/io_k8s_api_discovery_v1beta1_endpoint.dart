//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiDiscoveryV1beta1Endpoint {
  /// Returns a new [IoK8sApiDiscoveryV1beta1Endpoint] instance.
  IoK8sApiDiscoveryV1beta1Endpoint({
    this.addresses = const [],
    this.conditions,
    this.hints,
    this.hostname,
    this.nodeName,
    this.targetRef,
    this.topology = const {},
  });

  /// addresses of this endpoint. The contents of this field are interpreted according to the corresponding EndpointSlice addressType field. Consumers must handle different types of addresses in the context of their own capabilities. This must contain at least one address but no more than 100.
  List<String> addresses;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiDiscoveryV1beta1EndpointConditions? conditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiDiscoveryV1beta1EndpointHints? hints;

  /// hostname of this endpoint. This field may be used by consumers of endpoints to distinguish endpoints from each other (e.g. in DNS names). Multiple endpoints which use the same hostname should be considered fungible (e.g. multiple A values in DNS). Must be lowercase and pass DNS Label (RFC 1123) validation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostname;

  /// nodeName represents the name of the Node hosting this endpoint. This can be used to determine endpoints local to a Node. This field can be enabled with the EndpointSliceNodeName feature gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectReference? targetRef;

  /// topology contains arbitrary topology information associated with the endpoint. These key/value pairs must conform with the label format. https://kubernetes.io/docs/concepts/overview/working-with-objects/labels Topology may include a maximum of 16 key/value pairs. This includes, but is not limited to the following well known keys: * kubernetes.io/hostname: the value indicates the hostname of the node   where the endpoint is located. This should match the corresponding   node label. * topology.kubernetes.io/zone: the value indicates the zone where the   endpoint is located. This should match the corresponding node label. * topology.kubernetes.io/region: the value indicates the region where the   endpoint is located. This should match the corresponding node label. This field is deprecated and will be removed in future api versions.
  Map<String, String> topology;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiDiscoveryV1beta1Endpoint &&
          other.addresses == addresses &&
          other.conditions == conditions &&
          other.hints == hints &&
          other.hostname == hostname &&
          other.nodeName == nodeName &&
          other.targetRef == targetRef &&
          other.topology == topology;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addresses.hashCode) +
      (conditions == null ? 0 : conditions!.hashCode) +
      (hints == null ? 0 : hints!.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (nodeName == null ? 0 : nodeName!.hashCode) +
      (targetRef == null ? 0 : targetRef!.hashCode) +
      (topology.hashCode);

  @override
  String toString() =>
      'IoK8sApiDiscoveryV1beta1Endpoint[addresses=$addresses, conditions=$conditions, hints=$hints, hostname=$hostname, nodeName=$nodeName, targetRef=$targetRef, topology=$topology]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'addresses'] = addresses;
    if (conditions != null) {
      json[r'conditions'] = conditions;
    }
    if (hints != null) {
      json[r'hints'] = hints;
    }
    if (hostname != null) {
      json[r'hostname'] = hostname;
    }
    if (nodeName != null) {
      json[r'nodeName'] = nodeName;
    }
    if (targetRef != null) {
      json[r'targetRef'] = targetRef;
    }
    json[r'topology'] = topology;
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1beta1Endpoint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1beta1Endpoint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1beta1Endpoint[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1beta1Endpoint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1beta1Endpoint(
        addresses: json[r'addresses'] is List
            ? (json[r'addresses'] as List).cast<String>()
            : const [],
        conditions: IoK8sApiDiscoveryV1beta1EndpointConditions.fromJson(
            json[r'conditions']),
        hints: IoK8sApiDiscoveryV1beta1EndpointHints.fromJson(json[r'hints']),
        hostname: mapValueOfType<String>(json, r'hostname'),
        nodeName: mapValueOfType<String>(json, r'nodeName'),
        targetRef: IoK8sApiCoreV1ObjectReference.fromJson(json[r'targetRef']),
        topology: mapCastOfType<String, String>(json, r'topology') ?? const {},
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1beta1Endpoint>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1beta1Endpoint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1beta1Endpoint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1beta1Endpoint> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1beta1Endpoint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1beta1Endpoint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1beta1Endpoint-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1beta1Endpoint>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1beta1Endpoint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1beta1Endpoint.listFromJson(
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
    'addresses',
  };
}
