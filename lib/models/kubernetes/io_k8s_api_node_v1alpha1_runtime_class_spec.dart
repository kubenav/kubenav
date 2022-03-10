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
import 'package:kubenav/models/kubernetes/io_k8s_api_node_v1alpha1_overhead.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_node_v1alpha1_scheduling.dart';

class IoK8sApiNodeV1alpha1RuntimeClassSpec {
  /// Returns a new [IoK8sApiNodeV1alpha1RuntimeClassSpec] instance.
  IoK8sApiNodeV1alpha1RuntimeClassSpec({
    this.overhead,
    required this.runtimeHandler,
    this.scheduling,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNodeV1alpha1Overhead? overhead;

  /// RuntimeHandler specifies the underlying runtime and configuration that the CRI implementation will use to handle pods of this class. The possible values are specific to the node & CRI configuration.  It is assumed that all handlers are available on every node, and handlers of the same name are equivalent on every node. For example, a handler called \"runc\" might specify that the runc OCI runtime (using native Linux containers) will be used to run the containers in a pod. The RuntimeHandler must be lowercase, conform to the DNS Label (RFC 1123) requirements, and is immutable.
  String runtimeHandler;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNodeV1alpha1Scheduling? scheduling;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNodeV1alpha1RuntimeClassSpec &&
          other.overhead == overhead &&
          other.runtimeHandler == runtimeHandler &&
          other.scheduling == scheduling;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (overhead == null ? 0 : overhead!.hashCode) +
      (runtimeHandler.hashCode) +
      (scheduling == null ? 0 : scheduling!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNodeV1alpha1RuntimeClassSpec[overhead=$overhead, runtimeHandler=$runtimeHandler, scheduling=$scheduling]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (overhead != null) {
      json[r'overhead'] = overhead;
    }
    json[r'runtimeHandler'] = runtimeHandler;
    if (scheduling != null) {
      json[r'scheduling'] = scheduling;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNodeV1alpha1RuntimeClassSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNodeV1alpha1RuntimeClassSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNodeV1alpha1RuntimeClassSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNodeV1alpha1RuntimeClassSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNodeV1alpha1RuntimeClassSpec(
        overhead: IoK8sApiNodeV1alpha1Overhead.fromJson(json[r'overhead']),
        runtimeHandler: mapValueOfType<String>(json, r'runtimeHandler')!,
        scheduling:
            IoK8sApiNodeV1alpha1Scheduling.fromJson(json[r'scheduling']),
      );
    }
    return null;
  }

  static List<IoK8sApiNodeV1alpha1RuntimeClassSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNodeV1alpha1RuntimeClassSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNodeV1alpha1RuntimeClassSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNodeV1alpha1RuntimeClassSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNodeV1alpha1RuntimeClassSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNodeV1alpha1RuntimeClassSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNodeV1alpha1RuntimeClassSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiNodeV1alpha1RuntimeClassSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNodeV1alpha1RuntimeClassSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNodeV1alpha1RuntimeClassSpec.listFromJson(
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
    'runtimeHandler',
  };
}
