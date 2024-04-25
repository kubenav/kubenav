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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_chart.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_depends_on_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_drift_detection.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_install.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_kube_config.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_post_renderers_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_rollback.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_test.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_uninstall.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_upgrade.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_values_from_inner.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpec {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpec] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpec({
    required this.chart,
    this.dependsOn = const [],
    this.driftDetection,
    this.install,
    required this.interval,
    this.kubeConfig,
    this.maxHistory,
    this.persistentClient,
    this.postRenderers = const [],
    this.releaseName,
    this.rollback,
    this.serviceAccountName,
    this.storageNamespace,
    this.suspend,
    this.targetNamespace,
    this.test,
    this.timeout,
    this.uninstall,
    this.upgrade,
    this.values,
    this.valuesFrom = const [],
  });

  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChart chart;

  /// DependsOn may contain a meta.NamespacedObjectReference slice with references to HelmRelease resources that must be ready before this HelmRelease can be reconciled.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDependsOnInner> dependsOn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection? driftDetection;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall? install;

  /// Interval at which to reconcile the Helm release. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  String interval;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecKubeConfig? kubeConfig;

  /// MaxHistory is the number of revisions saved by Helm for this HelmRelease. Use '0' for an unlimited number of revisions; defaults to '10'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxHistory;

  /// PersistentClient tells the controller to use a persistent Kubernetes client for this release. When enabled, the client will be reused for the duration of the reconciliation, instead of being created and destroyed for each (step of a) Helm action.   This can improve performance, but may cause issues with some Helm charts that for example do create Custom Resource Definitions during installation outside Helm's CRD lifecycle hooks, which are then not observed to be available by e.g. post-install hooks.   If not set, it defaults to true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? persistentClient;

  /// PostRenderers holds an array of Helm PostRenderers, which will be applied in order of their definition.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInner>
      postRenderers;

  /// ReleaseName used for the Helm release. Defaults to a composition of '[TargetNamespace-]Name'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? releaseName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecRollback? rollback;

  /// The name of the Kubernetes service account to impersonate when reconciling this HelmRelease.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  /// StorageNamespace used for the Helm storage. Defaults to the namespace of the HelmRelease.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageNamespace;

  /// Suspend tells the controller to suspend reconciliation for this HelmRelease, it does not apply to already started reconciliations. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// TargetNamespace to target when performing operations for the HelmRelease. Defaults to the namespace of the HelmRelease.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetNamespace;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest? test;

  /// Timeout is the time to wait for any individual Kubernetes operation (like Jobs for hooks) during the performance of a Helm action. Defaults to '5m0s'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall? uninstall;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgrade? upgrade;

  /// Values holds the values for this Helm release.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? values;

  /// ValuesFrom holds references to resources containing Helm values for this HelmRelease, and information about how they should be merged.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecValuesFromInner> valuesFrom;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpec &&
          other.chart == chart &&
          deepEquality.equals(other.dependsOn, dependsOn) &&
          other.driftDetection == driftDetection &&
          other.install == install &&
          other.interval == interval &&
          other.kubeConfig == kubeConfig &&
          other.maxHistory == maxHistory &&
          other.persistentClient == persistentClient &&
          deepEquality.equals(other.postRenderers, postRenderers) &&
          other.releaseName == releaseName &&
          other.rollback == rollback &&
          other.serviceAccountName == serviceAccountName &&
          other.storageNamespace == storageNamespace &&
          other.suspend == suspend &&
          other.targetNamespace == targetNamespace &&
          other.test == test &&
          other.timeout == timeout &&
          other.uninstall == uninstall &&
          other.upgrade == upgrade &&
          other.values == values &&
          deepEquality.equals(other.valuesFrom, valuesFrom);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (chart.hashCode) +
      (dependsOn.hashCode) +
      (driftDetection == null ? 0 : driftDetection!.hashCode) +
      (install == null ? 0 : install!.hashCode) +
      (interval.hashCode) +
      (kubeConfig == null ? 0 : kubeConfig!.hashCode) +
      (maxHistory == null ? 0 : maxHistory!.hashCode) +
      (persistentClient == null ? 0 : persistentClient!.hashCode) +
      (postRenderers.hashCode) +
      (releaseName == null ? 0 : releaseName!.hashCode) +
      (rollback == null ? 0 : rollback!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (storageNamespace == null ? 0 : storageNamespace!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (targetNamespace == null ? 0 : targetNamespace!.hashCode) +
      (test == null ? 0 : test!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (uninstall == null ? 0 : uninstall!.hashCode) +
      (upgrade == null ? 0 : upgrade!.hashCode) +
      (values == null ? 0 : values!.hashCode) +
      (valuesFrom.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpec[chart=$chart, dependsOn=$dependsOn, driftDetection=$driftDetection, install=$install, interval=$interval, kubeConfig=$kubeConfig, maxHistory=$maxHistory, persistentClient=$persistentClient, postRenderers=$postRenderers, releaseName=$releaseName, rollback=$rollback, serviceAccountName=$serviceAccountName, storageNamespace=$storageNamespace, suspend=$suspend, targetNamespace=$targetNamespace, test=$test, timeout=$timeout, uninstall=$uninstall, upgrade=$upgrade, values=$values, valuesFrom=$valuesFrom]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'chart'] = this.chart;
    json[r'dependsOn'] = this.dependsOn;
    if (this.driftDetection != null) {
      json[r'driftDetection'] = this.driftDetection;
    } else {
      json[r'driftDetection'] = null;
    }
    if (this.install != null) {
      json[r'install'] = this.install;
    } else {
      json[r'install'] = null;
    }
    json[r'interval'] = this.interval;
    if (this.kubeConfig != null) {
      json[r'kubeConfig'] = this.kubeConfig;
    } else {
      json[r'kubeConfig'] = null;
    }
    if (this.maxHistory != null) {
      json[r'maxHistory'] = this.maxHistory;
    } else {
      json[r'maxHistory'] = null;
    }
    if (this.persistentClient != null) {
      json[r'persistentClient'] = this.persistentClient;
    } else {
      json[r'persistentClient'] = null;
    }
    json[r'postRenderers'] = this.postRenderers;
    if (this.releaseName != null) {
      json[r'releaseName'] = this.releaseName;
    } else {
      json[r'releaseName'] = null;
    }
    if (this.rollback != null) {
      json[r'rollback'] = this.rollback;
    } else {
      json[r'rollback'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
    }
    if (this.storageNamespace != null) {
      json[r'storageNamespace'] = this.storageNamespace;
    } else {
      json[r'storageNamespace'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.targetNamespace != null) {
      json[r'targetNamespace'] = this.targetNamespace;
    } else {
      json[r'targetNamespace'] = null;
    }
    if (this.test != null) {
      json[r'test'] = this.test;
    } else {
      json[r'test'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    if (this.uninstall != null) {
      json[r'uninstall'] = this.uninstall;
    } else {
      json[r'uninstall'] = null;
    }
    if (this.upgrade != null) {
      json[r'upgrade'] = this.upgrade;
    } else {
      json[r'upgrade'] = null;
    }
    if (this.values != null) {
      json[r'values'] = this.values;
    } else {
      json[r'values'] = null;
    }
    json[r'valuesFrom'] = this.valuesFrom;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpec(
        chart: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChart.fromJson(
            json[r'chart'])!,
        dependsOn: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDependsOnInner
            .listFromJson(json[r'dependsOn']),
        driftDetection:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection.fromJson(
                json[r'driftDetection']),
        install: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall.fromJson(
            json[r'install']),
        interval: mapValueOfType<String>(json, r'interval')!,
        kubeConfig:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecKubeConfig.fromJson(
                json[r'kubeConfig']),
        maxHistory: mapValueOfType<int>(json, r'maxHistory'),
        persistentClient: mapValueOfType<bool>(json, r'persistentClient'),
        postRenderers:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInner
                .listFromJson(json[r'postRenderers']),
        releaseName: mapValueOfType<String>(json, r'releaseName'),
        rollback: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecRollback.fromJson(
            json[r'rollback']),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        storageNamespace: mapValueOfType<String>(json, r'storageNamespace'),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        targetNamespace: mapValueOfType<String>(json, r'targetNamespace'),
        test: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest.fromJson(
            json[r'test']),
        timeout: mapValueOfType<String>(json, r'timeout'),
        uninstall: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall.fromJson(
            json[r'uninstall']),
        upgrade: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgrade.fromJson(
            json[r'upgrade']),
        values: mapValueOfType<Object>(json, r'values'),
        valuesFrom: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecValuesFromInner
            .listFromJson(json[r'valuesFrom']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitHelmV2beta1HelmReleaseSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitHelmV2beta1HelmReleaseSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'chart',
    'interval',
  };
}
