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

class IoK8sApiDiscoveryV1beta1EndpointConditions {
  /// Returns a new [IoK8sApiDiscoveryV1beta1EndpointConditions] instance.
  IoK8sApiDiscoveryV1beta1EndpointConditions({
    this.ready,
    this.serving,
    this.terminating,
  });

  /// ready indicates that this endpoint is prepared to receive traffic, according to whatever system is managing the endpoint. A nil value indicates an unknown state. In most cases consumers should interpret this unknown state as ready. For compatibility reasons, ready should never be \"true\" for terminating endpoints.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ready;

  /// serving is identical to ready except that it is set regardless of the terminating state of endpoints. This condition should be set to true for a ready endpoint that is terminating. If nil, consumers should defer to the ready condition. This field can be enabled with the EndpointSliceTerminatingCondition feature gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? serving;

  /// terminating indicates that this endpoint is terminating. A nil value indicates an unknown state. Consumers should interpret this unknown state to mean that the endpoint is not terminating. This field can be enabled with the EndpointSliceTerminatingCondition feature gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? terminating;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiDiscoveryV1beta1EndpointConditions &&
          other.ready == ready &&
          other.serving == serving &&
          other.terminating == terminating;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ready == null ? 0 : ready!.hashCode) +
      (serving == null ? 0 : serving!.hashCode) +
      (terminating == null ? 0 : terminating!.hashCode);

  @override
  String toString() =>
      'IoK8sApiDiscoveryV1beta1EndpointConditions[ready=$ready, serving=$serving, terminating=$terminating]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (ready != null) {
      json[r'ready'] = ready;
    }
    if (serving != null) {
      json[r'serving'] = serving;
    }
    if (terminating != null) {
      json[r'terminating'] = terminating;
    }
    return json;
  }

  /// Returns a new [IoK8sApiDiscoveryV1beta1EndpointConditions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiDiscoveryV1beta1EndpointConditions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiDiscoveryV1beta1EndpointConditions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiDiscoveryV1beta1EndpointConditions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiDiscoveryV1beta1EndpointConditions(
        ready: mapValueOfType<bool>(json, r'ready'),
        serving: mapValueOfType<bool>(json, r'serving'),
        terminating: mapValueOfType<bool>(json, r'terminating'),
      );
    }
    return null;
  }

  static List<IoK8sApiDiscoveryV1beta1EndpointConditions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiDiscoveryV1beta1EndpointConditions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiDiscoveryV1beta1EndpointConditions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiDiscoveryV1beta1EndpointConditions> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiDiscoveryV1beta1EndpointConditions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiDiscoveryV1beta1EndpointConditions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiDiscoveryV1beta1EndpointConditions-objects as value to a dart map
  static Map<String, List<IoK8sApiDiscoveryV1beta1EndpointConditions>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiDiscoveryV1beta1EndpointConditions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiDiscoveryV1beta1EndpointConditions.listFromJson(
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
