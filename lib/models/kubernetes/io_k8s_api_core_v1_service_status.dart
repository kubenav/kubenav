//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_load_balancer_status.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';

class IoK8sApiCoreV1ServiceStatus {
  /// Returns a new [IoK8sApiCoreV1ServiceStatus] instance.
  IoK8sApiCoreV1ServiceStatus({
    this.conditions = const [],
    this.loadBalancer,
  });

  /// Current service state
  List<IoK8sApimachineryPkgApisMetaV1Condition> conditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1LoadBalancerStatus? loadBalancer;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ServiceStatus &&
          other.conditions == conditions &&
          other.loadBalancer == loadBalancer;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (loadBalancer == null ? 0 : loadBalancer!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ServiceStatus[conditions=$conditions, loadBalancer=$loadBalancer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.loadBalancer != null) {
      json[r'loadBalancer'] = this.loadBalancer;
    } else {
      json[r'loadBalancer'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ServiceStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ServiceStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ServiceStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ServiceStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ServiceStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
                json[r'conditions']) ??
            const [],
        loadBalancer:
            IoK8sApiCoreV1LoadBalancerStatus.fromJson(json[r'loadBalancer']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ServiceStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ServiceStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ServiceStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ServiceStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ServiceStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServiceStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ServiceStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ServiceStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ServiceStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServiceStatus.listFromJson(
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
