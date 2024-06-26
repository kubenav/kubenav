//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';

class IoFluxcdToolkitNotificationV1ReceiverStatus {
  /// Returns a new [IoFluxcdToolkitNotificationV1ReceiverStatus] instance.
  IoFluxcdToolkitNotificationV1ReceiverStatus({
    this.conditions = const [],
    this.lastHandledReconcileAt,
    this.observedGeneration,
    this.webhookPath,
  });

  /// Conditions holds the conditions for the Receiver.
  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// ObservedGeneration is the last observed generation of the Receiver object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// WebhookPath is the generated incoming webhook address in the format of '/hook/sha256sum(token+name+namespace)'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? webhookPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitNotificationV1ReceiverStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.observedGeneration == observedGeneration &&
          other.webhookPath == webhookPath;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (webhookPath == null ? 0 : webhookPath!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1ReceiverStatus[conditions=$conditions, lastHandledReconcileAt=$lastHandledReconcileAt, observedGeneration=$observedGeneration, webhookPath=$webhookPath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.lastHandledReconcileAt != null) {
      json[r'lastHandledReconcileAt'] = this.lastHandledReconcileAt;
    } else {
      json[r'lastHandledReconcileAt'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.webhookPath != null) {
      json[r'webhookPath'] = this.webhookPath;
    } else {
      json[r'webhookPath'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitNotificationV1ReceiverStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1ReceiverStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1ReceiverStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1ReceiverStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1ReceiverStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        webhookPath: mapValueOfType<String>(json, r'webhookPath'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1ReceiverStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1ReceiverStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitNotificationV1ReceiverStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1ReceiverStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitNotificationV1ReceiverStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitNotificationV1ReceiverStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1ReceiverStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitNotificationV1ReceiverStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitNotificationV1ReceiverStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitNotificationV1ReceiverStatus.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
