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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_config_source.dart';

class IoK8sApiCoreV1NodeConfigStatus {
  /// Returns a new [IoK8sApiCoreV1NodeConfigStatus] instance.
  IoK8sApiCoreV1NodeConfigStatus({
    this.active,
    this.assigned,
    this.error,
    this.lastKnownGood,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeConfigSource? active;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeConfigSource? assigned;

  /// Error describes any problems reconciling the Spec.ConfigSource to the Active config. Errors may occur, for example, attempting to checkpoint Spec.ConfigSource to the local Assigned record, attempting to checkpoint the payload associated with Spec.ConfigSource, attempting to load or validate the Assigned config, etc. Errors may occur at different points while syncing config. Earlier errors (e.g. download or checkpointing errors) will not result in a rollback to LastKnownGood, and may resolve across Kubelet retries. Later errors (e.g. loading or validating a checkpointed config) will result in a rollback to LastKnownGood. In the latter case, it is usually possible to resolve the error by fixing the config assigned in Spec.ConfigSource. You can find additional information for debugging by searching the error message in the Kubelet log. Error is a human-readable description of the error state; machines can check whether or not Error is empty, but should not rely on the stability of the Error text across Kubelet versions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeConfigSource? lastKnownGood;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeConfigStatus &&
          other.active == active &&
          other.assigned == assigned &&
          other.error == error &&
          other.lastKnownGood == lastKnownGood;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (active == null ? 0 : active!.hashCode) +
      (assigned == null ? 0 : assigned!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (lastKnownGood == null ? 0 : lastKnownGood!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeConfigStatus[active=$active, assigned=$assigned, error=$error, lastKnownGood=$lastKnownGood]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.assigned != null) {
      json[r'assigned'] = this.assigned;
    } else {
      json[r'assigned'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.lastKnownGood != null) {
      json[r'lastKnownGood'] = this.lastKnownGood;
    } else {
      json[r'lastKnownGood'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeConfigStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeConfigStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeConfigStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeConfigStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeConfigStatus(
        active: IoK8sApiCoreV1NodeConfigSource.fromJson(json[r'active']),
        assigned: IoK8sApiCoreV1NodeConfigSource.fromJson(json[r'assigned']),
        error: mapValueOfType<String>(json, r'error'),
        lastKnownGood:
            IoK8sApiCoreV1NodeConfigSource.fromJson(json[r'lastKnownGood']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeConfigStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeConfigStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeConfigStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeConfigStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeConfigStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeConfigStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeConfigStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeConfigStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeConfigStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeConfigStatus.listFromJson(
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
