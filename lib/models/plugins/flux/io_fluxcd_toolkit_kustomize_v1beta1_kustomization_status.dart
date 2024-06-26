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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1beta1_kustomization_status_snapshot.dart';

class IoFluxcdToolkitKustomizeV1beta1KustomizationStatus {
  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationStatus] instance.
  IoFluxcdToolkitKustomizeV1beta1KustomizationStatus({
    this.conditions = const [],
    this.lastAppliedRevision,
    this.lastAttemptedRevision,
    this.lastHandledReconcileAt,
    this.observedGeneration,
    this.snapshot,
  });

  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// The last successfully applied revision. The revision format for Git sources is <branch|tag>/<commit-sha>.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAppliedRevision;

  /// LastAttemptedRevision is the revision of the last reconciliation attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedRevision;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// ObservedGeneration is the last reconciled generation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshot? snapshot;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1beta1KustomizationStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.lastAppliedRevision == lastAppliedRevision &&
          other.lastAttemptedRevision == lastAttemptedRevision &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.observedGeneration == observedGeneration &&
          other.snapshot == snapshot;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (lastAppliedRevision == null ? 0 : lastAppliedRevision!.hashCode) +
      (lastAttemptedRevision == null ? 0 : lastAttemptedRevision!.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (snapshot == null ? 0 : snapshot!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1beta1KustomizationStatus[conditions=$conditions, lastAppliedRevision=$lastAppliedRevision, lastAttemptedRevision=$lastAttemptedRevision, lastHandledReconcileAt=$lastHandledReconcileAt, observedGeneration=$observedGeneration, snapshot=$snapshot]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.lastAppliedRevision != null) {
      json[r'lastAppliedRevision'] = this.lastAppliedRevision;
    } else {
      json[r'lastAppliedRevision'] = null;
    }
    if (this.lastAttemptedRevision != null) {
      json[r'lastAttemptedRevision'] = this.lastAttemptedRevision;
    } else {
      json[r'lastAttemptedRevision'] = null;
    }
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
    if (this.snapshot != null) {
      json[r'snapshot'] = this.snapshot;
    } else {
      json[r'snapshot'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1beta1KustomizationStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1beta1KustomizationStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        lastAppliedRevision:
            mapValueOfType<String>(json, r'lastAppliedRevision'),
        lastAttemptedRevision:
            mapValueOfType<String>(json, r'lastAttemptedRevision'),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        snapshot:
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshot.fromJson(
                json[r'snapshot']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitKustomizeV1beta1KustomizationStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitKustomizeV1beta1KustomizationStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitKustomizeV1beta1KustomizationStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitKustomizeV1beta1KustomizationStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1beta1KustomizationStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitKustomizeV1beta1KustomizationStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitKustomizeV1beta1KustomizationStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatus.listFromJson(
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
