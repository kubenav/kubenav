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

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_typed_local_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_service_backend.dart';

class IoK8sApiNetworkingV1IngressBackend {
  /// Returns a new [IoK8sApiNetworkingV1IngressBackend] instance.
  IoK8sApiNetworkingV1IngressBackend({
    this.resource,
    this.service,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1TypedLocalObjectReference? resource;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNetworkingV1IngressServiceBackend? service;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1IngressBackend &&
          other.resource == resource &&
          other.service == service;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (resource == null ? 0 : resource!.hashCode) +
      (service == null ? 0 : service!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1IngressBackend[resource=$resource, service=$service]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.resource != null) {
      json[r'resource'] = this.resource;
    } else {
      json[r'resource'] = null;
    }
    if (this.service != null) {
      json[r'service'] = this.service;
    } else {
      json[r'service'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1IngressBackend] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1IngressBackend? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1IngressBackend[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1IngressBackend[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1IngressBackend(
        resource:
            IoK8sApiCoreV1TypedLocalObjectReference.fromJson(json[r'resource']),
        service: IoK8sApiNetworkingV1IngressServiceBackend.fromJson(
            json[r'service']),
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1IngressBackend>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1IngressBackend>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1IngressBackend.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1IngressBackend> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1IngressBackend>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressBackend.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1IngressBackend-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1IngressBackend>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1IngressBackend>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressBackend.listFromJson(
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
