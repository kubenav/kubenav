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
import 'package:kubenav/models/kubernetes/io_k8s_api_node_v1_overhead.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_node_v1_scheduling.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiNodeV1RuntimeClass {
  /// Returns a new [IoK8sApiNodeV1RuntimeClass] instance.
  IoK8sApiNodeV1RuntimeClass({
    this.apiVersion,
    required this.handler,
    this.kind,
    this.metadata,
    this.overhead,
    this.scheduling,
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Handler specifies the underlying runtime and configuration that the CRI implementation will use to handle pods of this class. The possible values are specific to the node & CRI configuration.  It is assumed that all handlers are available on every node, and handlers of the same name are equivalent on every node. For example, a handler called \"runc\" might specify that the runc OCI runtime (using native Linux containers) will be used to run the containers in a pod. The Handler must be lowercase, conform to the DNS Label (RFC 1123) requirements, and is immutable.
  String handler;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNodeV1Overhead? overhead;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNodeV1Scheduling? scheduling;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNodeV1RuntimeClass &&
          other.apiVersion == apiVersion &&
          other.handler == handler &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.overhead == overhead &&
          other.scheduling == scheduling;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (handler.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (overhead == null ? 0 : overhead!.hashCode) +
      (scheduling == null ? 0 : scheduling!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNodeV1RuntimeClass[apiVersion=$apiVersion, handler=$handler, kind=$kind, metadata=$metadata, overhead=$overhead, scheduling=$scheduling]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    json[r'handler'] = handler;
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (overhead != null) {
      json[r'overhead'] = overhead;
    }
    if (scheduling != null) {
      json[r'scheduling'] = scheduling;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNodeV1RuntimeClass] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNodeV1RuntimeClass? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNodeV1RuntimeClass[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNodeV1RuntimeClass[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNodeV1RuntimeClass(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        handler: mapValueOfType<String>(json, r'handler')!,
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        overhead: IoK8sApiNodeV1Overhead.fromJson(json[r'overhead']),
        scheduling: IoK8sApiNodeV1Scheduling.fromJson(json[r'scheduling']),
      );
    }
    return null;
  }

  static List<IoK8sApiNodeV1RuntimeClass>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNodeV1RuntimeClass>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNodeV1RuntimeClass.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNodeV1RuntimeClass> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiNodeV1RuntimeClass>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNodeV1RuntimeClass.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNodeV1RuntimeClass-objects as value to a dart map
  static Map<String, List<IoK8sApiNodeV1RuntimeClass>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNodeV1RuntimeClass>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNodeV1RuntimeClass.listFromJson(
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
    'handler',
  };
}
