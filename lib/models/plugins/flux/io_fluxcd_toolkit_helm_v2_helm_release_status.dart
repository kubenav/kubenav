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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_status_history_inner.dart';

class IoFluxcdToolkitHelmV2HelmReleaseStatus {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseStatus] instance.
  IoFluxcdToolkitHelmV2HelmReleaseStatus({
    this.conditions = const [],
    this.failures,
    this.helmChart,
    this.history = const [],
    this.installFailures,
    this.lastAttemptedConfigDigest,
    this.lastAttemptedGeneration,
    this.lastAttemptedReleaseAction,
    this.lastAttemptedRevision,
    this.lastAttemptedRevisionDigest,
    this.lastAttemptedValuesChecksum,
    this.lastHandledForceAt,
    this.lastHandledReconcileAt,
    this.lastHandledResetAt,
    this.lastReleaseRevision,
    this.observedGeneration,
    this.observedPostRenderersDigest,
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

  /// History holds the history of Helm releases performed for this HelmRelease up to the last successfully completed release.
  List<IoFluxcdToolkitHelmV2HelmReleaseStatusHistoryInner> history;

  /// InstallFailures is the install failure count against the latest desired state. It is reset after a successful reconciliation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? installFailures;

  /// LastAttemptedConfigDigest is the digest for the config (better known as \"values\") of the last reconciliation attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedConfigDigest;

  /// LastAttemptedGeneration is the last generation the controller attempted to reconcile.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? lastAttemptedGeneration;

  /// LastAttemptedReleaseAction is the last release action performed for this HelmRelease. It is used to determine the active remediation strategy.
  IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum?
      lastAttemptedReleaseAction;

  /// LastAttemptedRevision is the Source revision of the last reconciliation attempt. For OCIRepository  sources, the 12 first characters of the digest are appended to the chart version e.g. \"1.2.3+1234567890ab\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedRevision;

  /// LastAttemptedRevisionDigest is the digest of the last reconciliation attempt. This is only set for OCIRepository sources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedRevisionDigest;

  /// LastAttemptedValuesChecksum is the SHA1 checksum for the values of the last reconciliation attempt. Deprecated: Use LastAttemptedConfigDigest instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastAttemptedValuesChecksum;

  /// LastHandledForceAt holds the value of the most recent force request value, so a change of the annotation value can be detected.
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

  /// LastHandledResetAt holds the value of the most recent reset request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledResetAt;

  /// LastReleaseRevision is the revision of the last successful Helm release. Deprecated: Use History instead.
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

  /// ObservedPostRenderersDigest is the digest for the post-renderers of the last successful reconciliation attempt.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedPostRenderersDigest;

  /// StorageNamespace is the namespace of the Helm release storage for the current release.
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
      other is IoFluxcdToolkitHelmV2HelmReleaseStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.failures == failures &&
          other.helmChart == helmChart &&
          deepEquality.equals(other.history, history) &&
          other.installFailures == installFailures &&
          other.lastAttemptedConfigDigest == lastAttemptedConfigDigest &&
          other.lastAttemptedGeneration == lastAttemptedGeneration &&
          other.lastAttemptedReleaseAction == lastAttemptedReleaseAction &&
          other.lastAttemptedRevision == lastAttemptedRevision &&
          other.lastAttemptedRevisionDigest == lastAttemptedRevisionDigest &&
          other.lastAttemptedValuesChecksum == lastAttemptedValuesChecksum &&
          other.lastHandledForceAt == lastHandledForceAt &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.lastHandledResetAt == lastHandledResetAt &&
          other.lastReleaseRevision == lastReleaseRevision &&
          other.observedGeneration == observedGeneration &&
          other.observedPostRenderersDigest == observedPostRenderersDigest &&
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
      (lastAttemptedRevisionDigest == null
          ? 0
          : lastAttemptedRevisionDigest!.hashCode) +
      (lastAttemptedValuesChecksum == null
          ? 0
          : lastAttemptedValuesChecksum!.hashCode) +
      (lastHandledForceAt == null ? 0 : lastHandledForceAt!.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (lastHandledResetAt == null ? 0 : lastHandledResetAt!.hashCode) +
      (lastReleaseRevision == null ? 0 : lastReleaseRevision!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedPostRenderersDigest == null
          ? 0
          : observedPostRenderersDigest!.hashCode) +
      (storageNamespace == null ? 0 : storageNamespace!.hashCode) +
      (upgradeFailures == null ? 0 : upgradeFailures!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseStatus[conditions=$conditions, failures=$failures, helmChart=$helmChart, history=$history, installFailures=$installFailures, lastAttemptedConfigDigest=$lastAttemptedConfigDigest, lastAttemptedGeneration=$lastAttemptedGeneration, lastAttemptedReleaseAction=$lastAttemptedReleaseAction, lastAttemptedRevision=$lastAttemptedRevision, lastAttemptedRevisionDigest=$lastAttemptedRevisionDigest, lastAttemptedValuesChecksum=$lastAttemptedValuesChecksum, lastHandledForceAt=$lastHandledForceAt, lastHandledReconcileAt=$lastHandledReconcileAt, lastHandledResetAt=$lastHandledResetAt, lastReleaseRevision=$lastReleaseRevision, observedGeneration=$observedGeneration, observedPostRenderersDigest=$observedPostRenderersDigest, storageNamespace=$storageNamespace, upgradeFailures=$upgradeFailures]';

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
    if (this.lastAttemptedRevisionDigest != null) {
      json[r'lastAttemptedRevisionDigest'] = this.lastAttemptedRevisionDigest;
    } else {
      json[r'lastAttemptedRevisionDigest'] = null;
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
    if (this.observedPostRenderersDigest != null) {
      json[r'observedPostRenderersDigest'] = this.observedPostRenderersDigest;
    } else {
      json[r'observedPostRenderersDigest'] = null;
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

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        failures: mapValueOfType<int>(json, r'failures'),
        helmChart: mapValueOfType<String>(json, r'helmChart'),
        history:
            IoFluxcdToolkitHelmV2HelmReleaseStatusHistoryInner.listFromJson(
                json[r'history']),
        installFailures: mapValueOfType<int>(json, r'installFailures'),
        lastAttemptedConfigDigest:
            mapValueOfType<String>(json, r'lastAttemptedConfigDigest'),
        lastAttemptedGeneration:
            mapValueOfType<int>(json, r'lastAttemptedGeneration'),
        lastAttemptedReleaseAction:
            IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum
                .fromJson(json[r'lastAttemptedReleaseAction']),
        lastAttemptedRevision:
            mapValueOfType<String>(json, r'lastAttemptedRevision'),
        lastAttemptedRevisionDigest:
            mapValueOfType<String>(json, r'lastAttemptedRevisionDigest'),
        lastAttemptedValuesChecksum:
            mapValueOfType<String>(json, r'lastAttemptedValuesChecksum'),
        lastHandledForceAt: mapValueOfType<String>(json, r'lastHandledForceAt'),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        lastHandledResetAt: mapValueOfType<String>(json, r'lastHandledResetAt'),
        lastReleaseRevision: mapValueOfType<int>(json, r'lastReleaseRevision'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedPostRenderersDigest:
            mapValueOfType<String>(json, r'observedPostRenderersDigest'),
        storageNamespace: mapValueOfType<String>(json, r'storageNamespace'),
        upgradeFailures: mapValueOfType<int>(json, r'upgradeFailures'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitHelmV2HelmReleaseStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2HelmReleaseStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitHelmV2HelmReleaseStatus.listFromJson(
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

/// LastAttemptedReleaseAction is the last release action performed for this HelmRelease. It is used to determine the active remediation strategy.
class IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const install =
      IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum._(
          r'install');
  static const upgrade =
      IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum._(
          r'upgrade');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum].
  static const values =
      <IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum>[
    install,
    upgrade,
  ];

  static IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum].
class IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'install':
          return IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum
              .install;
        case r'upgrade':
          return IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnum
              .upgrade;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2HelmReleaseStatusLastAttemptedReleaseActionEnumTypeTransformer?
      _instance;
}
