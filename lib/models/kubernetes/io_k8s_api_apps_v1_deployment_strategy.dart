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

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_rolling_update_deployment.dart';

class IoK8sApiAppsV1DeploymentStrategy {
  /// Returns a new [IoK8sApiAppsV1DeploymentStrategy] instance.
  IoK8sApiAppsV1DeploymentStrategy({
    this.rollingUpdate,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1RollingUpdateDeployment? rollingUpdate;

  /// Type of deployment. Can be \"Recreate\" or \"RollingUpdate\". Default is RollingUpdate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DeploymentStrategy &&
          other.rollingUpdate == rollingUpdate &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rollingUpdate == null ? 0 : rollingUpdate!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DeploymentStrategy[rollingUpdate=$rollingUpdate, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.rollingUpdate != null) {
      json[r'rollingUpdate'] = this.rollingUpdate;
    } else {
      json[r'rollingUpdate'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1DeploymentStrategy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DeploymentStrategy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DeploymentStrategy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DeploymentStrategy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DeploymentStrategy(
        rollingUpdate: IoK8sApiAppsV1RollingUpdateDeployment.fromJson(
            json[r'rollingUpdate']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DeploymentStrategy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DeploymentStrategy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DeploymentStrategy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DeploymentStrategy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1DeploymentStrategy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStrategy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DeploymentStrategy-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DeploymentStrategy>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DeploymentStrategy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStrategy.listFromJson(
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
