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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta2_image_update_automation_status_observed_policies_value.dart';

class IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus {
  /// Returns a new [IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus] instance.
  IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus({
    this.conditions = const [],
    this.lastAutomationRunTime,
    this.lastHandledReconcileAt,
    this.lastPushCommit,
    this.lastPushTime,
    this.observedGeneration,
    this.observedPolicies = const {},
    this.observedSourceRevision,
  });

  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// LastAutomationRunTime records the last time the controller ran this automation through to completion (even if no updates were made).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastAutomationRunTime;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// LastPushCommit records the SHA1 of the last commit made by the controller, for this automation object
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastPushCommit;

  /// LastPushTime records the time of the last pushed change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastPushTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// ObservedPolicies is the list of observed ImagePolicies that were considered by the ImageUpdateAutomation update process.
  Map<String,
          IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatusObservedPoliciesValue>
      observedPolicies;

  /// ObservedPolicies []ObservedPolicy `json:\"observedPolicies,omitempty\"` ObservedSourceRevision is the last observed source revision. This can be used to determine if the source has been updated since last observation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedSourceRevision;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.lastAutomationRunTime == lastAutomationRunTime &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.lastPushCommit == lastPushCommit &&
          other.lastPushTime == lastPushTime &&
          other.observedGeneration == observedGeneration &&
          deepEquality.equals(other.observedPolicies, observedPolicies) &&
          other.observedSourceRevision == observedSourceRevision;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (lastAutomationRunTime == null ? 0 : lastAutomationRunTime!.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (lastPushCommit == null ? 0 : lastPushCommit!.hashCode) +
      (lastPushTime == null ? 0 : lastPushTime!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedPolicies.hashCode) +
      (observedSourceRevision == null ? 0 : observedSourceRevision!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus[conditions=$conditions, lastAutomationRunTime=$lastAutomationRunTime, lastHandledReconcileAt=$lastHandledReconcileAt, lastPushCommit=$lastPushCommit, lastPushTime=$lastPushTime, observedGeneration=$observedGeneration, observedPolicies=$observedPolicies, observedSourceRevision=$observedSourceRevision]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.lastAutomationRunTime != null) {
      json[r'lastAutomationRunTime'] =
          this.lastAutomationRunTime!.toUtc().toIso8601String();
    } else {
      json[r'lastAutomationRunTime'] = null;
    }
    if (this.lastHandledReconcileAt != null) {
      json[r'lastHandledReconcileAt'] = this.lastHandledReconcileAt;
    } else {
      json[r'lastHandledReconcileAt'] = null;
    }
    if (this.lastPushCommit != null) {
      json[r'lastPushCommit'] = this.lastPushCommit;
    } else {
      json[r'lastPushCommit'] = null;
    }
    if (this.lastPushTime != null) {
      json[r'lastPushTime'] = this.lastPushTime!.toUtc().toIso8601String();
    } else {
      json[r'lastPushTime'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    json[r'observedPolicies'] = this.observedPolicies;
    if (this.observedSourceRevision != null) {
      json[r'observedSourceRevision'] = this.observedSourceRevision;
    } else {
      json[r'observedSourceRevision'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        lastAutomationRunTime: mapDateTime(json, r'lastAutomationRunTime', r''),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        lastPushCommit: mapValueOfType<String>(json, r'lastPushCommit'),
        lastPushTime: mapDateTime(json, r'lastPushTime', r''),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedPolicies:
            IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatusObservedPoliciesValue
                .mapFromJson(json[r'observedPolicies']),
        observedSourceRevision:
            mapValueOfType<String>(json, r'observedSourceRevision'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta2ImageUpdateAutomationStatus.listFromJson(
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
