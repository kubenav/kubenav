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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_discovery_v1_endpoint_conditions.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_discovery_v1_endpoint_hints.dart';

class IoK8sApiDiscoveryV1Endpoint {
  /// Returns a new [IoK8sApiDiscoveryV1Endpoint] instance.
  IoK8sApiDiscoveryV1Endpoint({
    this.addresses = const [],
    this.conditions,
    this.deprecatedTopology = const {},
    this.hints,
    this.hostname,
    this.nodeName,
    this.targetRef,
    this.zone,
  });

  /// addresses of this endpoint. The contents of this field are interpreted according to the corresponding EndpointSlice addressType field. Consumers must handle different types of addresses in the context of their own capabilities. This must contain at least one address but no more than 100.
  List<String> addresses;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiDiscoveryV1EndpointConditions? conditions;

  /// deprecatedTopology contains topology information part of the v1beta1 API. This field is deprecated, and will be removed when the v1beta1 API is removed (no sooner than kubernetes v1.24).  While this field can hold values, it is not writable through the v1 API, and any attempts to write to it will be silently ignored. Topology information can be found in the zone and nodeName fields instead.
  Map<String, String> deprecatedTopology;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiDiscoveryV1EndpointHints? hints;

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

  /// zone is the name of the Zone this endpoint exists in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? zone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiDiscoveryV1Endpoint &&
          other.addresses == addresses &&
          other.conditions == conditions &&
          other.deprecatedTopology == deprecatedTopology &&
          other.hints == hints &&
          other.hostname == hostname &&
          other.nodeName == nodeName &&
          other.targetRef == targetRef &&
          other.zone == zone;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addresses.hashCode) +
      (conditions == null ? 0 : conditions!.hashCode) +
      (deprecatedTopology.hashCode) +
      (hints == null ? 0 : hints!.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (nodeName == null ? 0 : nodeName!.hashCode) +
      (targetRef == null ? 0 : targetRef!.hashCode) +
      (zone == null ? 0 : zone!.hashCode);

  @override
  String toString() =>
      'IoK8sApiDiscoveryV1Endpoint[addresses=$addresses, conditions=$conditions, deprecatedTopology=$deprecatedTopology, hints=$hints, hostname=$hostname, nodeName=$nodeName, targetRef=$targetRef, zone=$zone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'addresses'] = addresses;
    if (conditions != null) {
      json[r'conditions'] = conditions;
    }
    json[r'deprecatedTopology'] = deprecatedTopology;
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
    if (zone != null) {
      json[r'zone'] = zone;
    }
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1Endpoint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1Endpoint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1Endpoint[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1Endpoint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1Endpoint(
        addresses: json[r'addresses'] is List
            ? (json[r'addresses'] as List).cast<String>()
            : const [],
        conditions:
            IoK8sApiDiscoveryV1EndpointConditions.fromJson(json[r'conditions']),
        deprecatedTopology:
            mapCastOfType<String, String>(json, r'deprecatedTopology') ??
                const {},
        hints: IoK8sApiDiscoveryV1EndpointHints.fromJson(json[r'hints']),
        hostname: mapValueOfType<String>(json, r'hostname'),
        nodeName: mapValueOfType<String>(json, r'nodeName'),
        targetRef: IoK8sApiCoreV1ObjectReference.fromJson(json[r'targetRef']),
        zone: mapValueOfType<String>(json, r'zone'),
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1Endpoint>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1Endpoint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1Endpoint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1Endpoint> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1Endpoint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1Endpoint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1Endpoint-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1Endpoint>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1Endpoint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1Endpoint.listFromJson(
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
