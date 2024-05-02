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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_status_history_inner.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseStatus {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatus] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatus({
    this.conditions = const [],
    this.failures,
    this.helmChart,
    this.history = const [],
    this.installFailures,
    this.lastAppliedRevision,
    this.lastAttemptedConfigDigest,
    this.lastAttemptedGeneration,
    this.lastAttemptedReleaseAction,
    this.lastAttemptedRevision,
    this.lastAttemptedValuesChecksum,
    this.lastHandledForceAt,
    this.lastHandledReconcileAt,
    this.lastHandledResetAt,
    this.lastReleaseRevision,
    this.observedGeneration,
    this.storageNamespace,
    this.upgradeFailures,
  });

  /// Conditions holds the conditions for the HelmRelease.
  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// Failures is the reconciliation failure count against the latest desired state. It is reset after a successful reconciliation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failures;

  /// HelmChart is the namespaced name of the HelmChart resource created by the controller for the HelmRelease.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? helmChart;

  /// History holds the history of Helm releases performed for this HelmRelease up to the last successfully completed release.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner> history;

  /// InstallFailures is the install failure count against the latest desired state. It is reset after a successful reconciliation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? installFailures;

  /// LastAppliedRevision is the revision of the last successfully applied source.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAppliedRevision;

  /// LastAttemptedConfigDigest is the digest for the config (better known as \"values\") of the last reconciliation attempt.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedConfigDigest;

  /// LastAttemptedGeneration is the last generation the controller attempted to reconcile.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lastAttemptedGeneration;

  /// LastAttemptedReleaseAction is the last release action performed for this HelmRelease. It is used to determine the active remediation strategy.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedReleaseAction;

  /// LastAttemptedRevision is the revision of the last reconciliation attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedRevision;

  /// LastAttemptedValuesChecksum is the SHA1 checksum of the values of the last reconciliation attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedValuesChecksum;

  /// LastHandledForceAt holds the value of the most recent force request value, so a change of the annotation value can be detected.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledForceAt;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// LastHandledResetAt holds the value of the most recent reset request value, so a change of the annotation value can be detected.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledResetAt;

  /// LastReleaseRevision is the revision of the last successful Helm release.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lastReleaseRevision;

  /// ObservedGeneration is the last observed generation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// StorageNamespace is the namespace of the Helm release storage for the current release.   Note: this field is provisional to the v2beta2 API, and not actively used by v2beta1 HelmReleases.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageNamespace;

  /// UpgradeFailures is the upgrade failure count against the latest desired state. It is reset after a successful reconciliation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? upgradeFailures;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.failures == failures &&
          other.helmChart == helmChart &&
          deepEquality.equals(other.history, history) &&
          other.installFailures == installFailures &&
          other.lastAppliedRevision == lastAppliedRevision &&
          other.lastAttemptedConfigDigest == lastAttemptedConfigDigest &&
          other.lastAttemptedGeneration == lastAttemptedGeneration &&
          other.lastAttemptedReleaseAction == lastAttemptedReleaseAction &&
          other.lastAttemptedRevision == lastAttemptedRevision &&
          other.lastAttemptedValuesChecksum == lastAttemptedValuesChecksum &&
          other.lastHandledForceAt == lastHandledForceAt &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.lastHandledResetAt == lastHandledResetAt &&
          other.lastReleaseRevision == lastReleaseRevision &&
          other.observedGeneration == observedGeneration &&
          other.storageNamespace == storageNamespace &&
          other.upgradeFailures == upgradeFailures;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (failures == null ? 0 : failures!.hashCode) +
      (helmChart == null ? 0 : helmChart!.hashCode) +
      (history.hashCode) +
      (installFailures == null ? 0 : installFailures!.hashCode) +
      (lastAppliedRevision == null ? 0 : lastAppliedRevision!.hashCode) +
      (lastAttemptedConfigDigest == null
          ? 0
          : lastAttemptedConfigDigest!.hashCode) +
      (lastAttemptedGeneration == null
          ? 0
          : lastAttemptedGeneration!.hashCode) +
      (lastAttemptedReleaseAction == null
          ? 0
          : lastAttemptedReleaseAction!.hashCode) +
      (lastAttemptedRevision == null ? 0 : lastAttemptedRevision!.hashCode) +
      (lastAttemptedValuesChecksum == null
          ? 0
          : lastAttemptedValuesChecksum!.hashCode) +
      (lastHandledForceAt == null ? 0 : lastHandledForceAt!.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (lastHandledResetAt == null ? 0 : lastHandledResetAt!.hashCode) +
      (lastReleaseRevision == null ? 0 : lastReleaseRevision!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (storageNamespace == null ? 0 : storageNamespace!.hashCode) +
      (upgradeFailures == null ? 0 : upgradeFailures!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseStatus[conditions=$conditions, failures=$failures, helmChart=$helmChart, history=$history, installFailures=$installFailures, lastAppliedRevision=$lastAppliedRevision, lastAttemptedConfigDigest=$lastAttemptedConfigDigest, lastAttemptedGeneration=$lastAttemptedGeneration, lastAttemptedReleaseAction=$lastAttemptedReleaseAction, lastAttemptedRevision=$lastAttemptedRevision, lastAttemptedValuesChecksum=$lastAttemptedValuesChecksum, lastHandledForceAt=$lastHandledForceAt, lastHandledReconcileAt=$lastHandledReconcileAt, lastHandledResetAt=$lastHandledResetAt, lastReleaseRevision=$lastReleaseRevision, observedGeneration=$observedGeneration, storageNamespace=$storageNamespace, upgradeFailures=$upgradeFailures]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.failures != null) {
      json[r'failures'] = this.failures;
    } else {
      json[r'failures'] = null;
    }
    if (this.helmChart != null) {
      json[r'helmChart'] = this.helmChart;
    } else {
      json[r'helmChart'] = null;
    }
    json[r'history'] = this.history;
    if (this.installFailures != null) {
      json[r'installFailures'] = this.installFailures;
    } else {
      json[r'installFailures'] = null;
    }
    if (this.lastAppliedRevision != null) {
      json[r'lastAppliedRevision'] = this.lastAppliedRevision;
    } else {
      json[r'lastAppliedRevision'] = null;
    }
    if (this.lastAttemptedConfigDigest != null) {
      json[r'lastAttemptedConfigDigest'] = this.lastAttemptedConfigDigest;
    } else {
      json[r'lastAttemptedConfigDigest'] = null;
    }
    if (this.lastAttemptedGeneration != null) {
      json[r'lastAttemptedGeneration'] = this.lastAttemptedGeneration;
    } else {
      json[r'lastAttemptedGeneration'] = null;
    }
    if (this.lastAttemptedReleaseAction != null) {
      json[r'lastAttemptedReleaseAction'] = this.lastAttemptedReleaseAction;
    } else {
      json[r'lastAttemptedReleaseAction'] = null;
    }
    if (this.lastAttemptedRevision != null) {
      json[r'lastAttemptedRevision'] = this.lastAttemptedRevision;
    } else {
      json[r'lastAttemptedRevision'] = null;
    }
    if (this.lastAttemptedValuesChecksum != null) {
      json[r'lastAttemptedValuesChecksum'] = this.lastAttemptedValuesChecksum;
    } else {
      json[r'lastAttemptedValuesChecksum'] = null;
    }
    if (this.lastHandledForceAt != null) {
      json[r'lastHandledForceAt'] = this.lastHandledForceAt;
    } else {
      json[r'lastHandledForceAt'] = null;
    }
    if (this.lastHandledReconcileAt != null) {
      json[r'lastHandledReconcileAt'] = this.lastHandledReconcileAt;
    } else {
      json[r'lastHandledReconcileAt'] = null;
    }
    if (this.lastHandledResetAt != null) {
      json[r'lastHandledResetAt'] = this.lastHandledResetAt;
    } else {
      json[r'lastHandledResetAt'] = null;
    }
    if (this.lastReleaseRevision != null) {
      json[r'lastReleaseRevision'] = this.lastReleaseRevision;
    } else {
      json[r'lastReleaseRevision'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.storageNamespace != null) {
      json[r'storageNamespace'] = this.storageNamespace;
    } else {
      json[r'storageNamespace'] = null;
    }
    if (this.upgradeFailures != null) {
      json[r'upgradeFailures'] = this.upgradeFailures;
    } else {
      json[r'upgradeFailures'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        failures: mapValueOfType<int>(json, r'failures'),
        helmChart: mapValueOfType<String>(json, r'helmChart'),
        history: IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner
            .listFromJson(json[r'history']),
        installFailures: mapValueOfType<int>(json, r'installFailures'),
        lastAppliedRevision:
            mapValueOfType<String>(json, r'lastAppliedRevision'),
        lastAttemptedConfigDigest:
            mapValueOfType<String>(json, r'lastAttemptedConfigDigest'),
        lastAttemptedGeneration:
            mapValueOfType<int>(json, r'lastAttemptedGeneration'),
        lastAttemptedReleaseAction:
            mapValueOfType<String>(json, r'lastAttemptedReleaseAction'),
        lastAttemptedRevision:
            mapValueOfType<String>(json, r'lastAttemptedRevision'),
        lastAttemptedValuesChecksum:
            mapValueOfType<String>(json, r'lastAttemptedValuesChecksum'),
        lastHandledForceAt: mapValueOfType<String>(json, r'lastHandledForceAt'),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        lastHandledResetAt: mapValueOfType<String>(json, r'lastHandledResetAt'),
        lastReleaseRevision: mapValueOfType<int>(json, r'lastReleaseRevision'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        storageNamespace: mapValueOfType<String>(json, r'storageNamespace'),
        upgradeFailures: mapValueOfType<int>(json, r'upgradeFailures'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitHelmV2beta1HelmReleaseStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatus.listFromJson(
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
