//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, unnecessary_this, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/dev_summerwind_actions_v1alpha1_horizontal_runner_autoscaler_spec_github_api_credentials_from_secret_ref.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_affinity.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_volume_mounts_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_dns_config.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_ephemeral_containers_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_host_aliases_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_image_pull_secrets_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_readiness_gates_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_security_context.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_tolerations_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_topology_spread_constraints_inner.dart';

class IoArgoprojV1alpha1RolloutSpecTemplateSpec {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecTemplateSpec] instance.
  IoArgoprojV1alpha1RolloutSpecTemplateSpec({
    this.activeDeadlineSeconds,
    this.affinity,
    this.automountServiceAccountToken,
    this.containers = const [],
    this.dnsConfig,
    this.dnsPolicy,
    this.enableServiceLinks,
    this.ephemeralContainers = const [],
    this.hostAliases = const [],
    this.hostIPC,
    this.hostNetwork,
    this.hostPID,
    this.hostname,
    this.imagePullSecrets = const [],
    this.initContainers = const [],
    this.nodeName,
    this.nodeSelector = const {},
    this.os,
    this.overhead = const {},
    this.preemptionPolicy,
    this.priority,
    this.priorityClassName,
    this.readinessGates = const [],
    this.restartPolicy,
    this.runtimeClassName,
    this.schedulerName,
    this.securityContext,
    this.serviceAccount,
    this.serviceAccountName,
    this.setHostnameAsFQDN,
    this.shareProcessNamespace,
    this.subdomain,
    this.terminationGracePeriodSeconds,
    this.tolerations = const [],
    this.topologySpreadConstraints = const [],
    this.volumes = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? activeDeadlineSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity?
      affinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? automountServiceAccountToken;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>
      containers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecDnsConfig?
      dnsConfig;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dnsPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableServiceLinks;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecEphemeralContainersInner>
      ephemeralContainers;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecHostAliasesInner>
      hostAliases;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostIPC;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostNetwork;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostPID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostname;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecImagePullSecretsInner>
      imagePullSecrets;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>
      initContainers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeName;

  Map<String, String> nodeSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef?
      os;

  Map<String, Object> overhead;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? preemptionPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? priority;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priorityClassName;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecReadinessGatesInner>
      readinessGates;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? restartPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? runtimeClassName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? schedulerName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext?
      securityContext;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? setHostnameAsFQDN;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? shareProcessNamespace;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subdomain;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? terminationGracePeriodSeconds;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecTolerationsInner>
      tolerations;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecTopologySpreadConstraintsInner>
      topologySpreadConstraints;

  List<Object> volumes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecTemplateSpec &&
          other.activeDeadlineSeconds == activeDeadlineSeconds &&
          other.affinity == affinity &&
          other.automountServiceAccountToken == automountServiceAccountToken &&
          deepEquality.equals(other.containers, containers) &&
          other.dnsConfig == dnsConfig &&
          other.dnsPolicy == dnsPolicy &&
          other.enableServiceLinks == enableServiceLinks &&
          deepEquality.equals(other.ephemeralContainers, ephemeralContainers) &&
          deepEquality.equals(other.hostAliases, hostAliases) &&
          other.hostIPC == hostIPC &&
          other.hostNetwork == hostNetwork &&
          other.hostPID == hostPID &&
          other.hostname == hostname &&
          deepEquality.equals(other.imagePullSecrets, imagePullSecrets) &&
          deepEquality.equals(other.initContainers, initContainers) &&
          other.nodeName == nodeName &&
          deepEquality.equals(other.nodeSelector, nodeSelector) &&
          other.os == os &&
          deepEquality.equals(other.overhead, overhead) &&
          other.preemptionPolicy == preemptionPolicy &&
          other.priority == priority &&
          other.priorityClassName == priorityClassName &&
          deepEquality.equals(other.readinessGates, readinessGates) &&
          other.restartPolicy == restartPolicy &&
          other.runtimeClassName == runtimeClassName &&
          other.schedulerName == schedulerName &&
          other.securityContext == securityContext &&
          other.serviceAccount == serviceAccount &&
          other.serviceAccountName == serviceAccountName &&
          other.setHostnameAsFQDN == setHostnameAsFQDN &&
          other.shareProcessNamespace == shareProcessNamespace &&
          other.subdomain == subdomain &&
          other.terminationGracePeriodSeconds ==
              terminationGracePeriodSeconds &&
          deepEquality.equals(other.tolerations, tolerations) &&
          deepEquality.equals(
              other.topologySpreadConstraints, topologySpreadConstraints) &&
          deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (activeDeadlineSeconds == null ? 0 : activeDeadlineSeconds!.hashCode) +
      (affinity == null ? 0 : affinity!.hashCode) +
      (automountServiceAccountToken == null
          ? 0
          : automountServiceAccountToken!.hashCode) +
      (containers.hashCode) +
      (dnsConfig == null ? 0 : dnsConfig!.hashCode) +
      (dnsPolicy == null ? 0 : dnsPolicy!.hashCode) +
      (enableServiceLinks == null ? 0 : enableServiceLinks!.hashCode) +
      (ephemeralContainers.hashCode) +
      (hostAliases.hashCode) +
      (hostIPC == null ? 0 : hostIPC!.hashCode) +
      (hostNetwork == null ? 0 : hostNetwork!.hashCode) +
      (hostPID == null ? 0 : hostPID!.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (imagePullSecrets.hashCode) +
      (initContainers.hashCode) +
      (nodeName == null ? 0 : nodeName!.hashCode) +
      (nodeSelector.hashCode) +
      (os == null ? 0 : os!.hashCode) +
      (overhead.hashCode) +
      (preemptionPolicy == null ? 0 : preemptionPolicy!.hashCode) +
      (priority == null ? 0 : priority!.hashCode) +
      (priorityClassName == null ? 0 : priorityClassName!.hashCode) +
      (readinessGates.hashCode) +
      (restartPolicy == null ? 0 : restartPolicy!.hashCode) +
      (runtimeClassName == null ? 0 : runtimeClassName!.hashCode) +
      (schedulerName == null ? 0 : schedulerName!.hashCode) +
      (securityContext == null ? 0 : securityContext!.hashCode) +
      (serviceAccount == null ? 0 : serviceAccount!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (setHostnameAsFQDN == null ? 0 : setHostnameAsFQDN!.hashCode) +
      (shareProcessNamespace == null ? 0 : shareProcessNamespace!.hashCode) +
      (subdomain == null ? 0 : subdomain!.hashCode) +
      (terminationGracePeriodSeconds == null
          ? 0
          : terminationGracePeriodSeconds!.hashCode) +
      (tolerations.hashCode) +
      (topologySpreadConstraints.hashCode) +
      (volumes.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecTemplateSpec[activeDeadlineSeconds=$activeDeadlineSeconds, affinity=$affinity, automountServiceAccountToken=$automountServiceAccountToken, containers=$containers, dnsConfig=$dnsConfig, dnsPolicy=$dnsPolicy, enableServiceLinks=$enableServiceLinks, ephemeralContainers=$ephemeralContainers, hostAliases=$hostAliases, hostIPC=$hostIPC, hostNetwork=$hostNetwork, hostPID=$hostPID, hostname=$hostname, imagePullSecrets=$imagePullSecrets, initContainers=$initContainers, nodeName=$nodeName, nodeSelector=$nodeSelector, os=$os, overhead=$overhead, preemptionPolicy=$preemptionPolicy, priority=$priority, priorityClassName=$priorityClassName, readinessGates=$readinessGates, restartPolicy=$restartPolicy, runtimeClassName=$runtimeClassName, schedulerName=$schedulerName, securityContext=$securityContext, serviceAccount=$serviceAccount, serviceAccountName=$serviceAccountName, setHostnameAsFQDN=$setHostnameAsFQDN, shareProcessNamespace=$shareProcessNamespace, subdomain=$subdomain, terminationGracePeriodSeconds=$terminationGracePeriodSeconds, tolerations=$tolerations, topologySpreadConstraints=$topologySpreadConstraints, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.activeDeadlineSeconds != null) {
      json[r'activeDeadlineSeconds'] = this.activeDeadlineSeconds;
    } else {
      json[r'activeDeadlineSeconds'] = null;
    }
    if (this.affinity != null) {
      json[r'affinity'] = this.affinity;
    } else {
      json[r'affinity'] = null;
    }
    if (this.automountServiceAccountToken != null) {
      json[r'automountServiceAccountToken'] = this.automountServiceAccountToken;
    } else {
      json[r'automountServiceAccountToken'] = null;
    }
    json[r'containers'] = this.containers;
    if (this.dnsConfig != null) {
      json[r'dnsConfig'] = this.dnsConfig;
    } else {
      json[r'dnsConfig'] = null;
    }
    if (this.dnsPolicy != null) {
      json[r'dnsPolicy'] = this.dnsPolicy;
    } else {
      json[r'dnsPolicy'] = null;
    }
    if (this.enableServiceLinks != null) {
      json[r'enableServiceLinks'] = this.enableServiceLinks;
    } else {
      json[r'enableServiceLinks'] = null;
    }
    json[r'ephemeralContainers'] = this.ephemeralContainers;
    json[r'hostAliases'] = this.hostAliases;
    if (this.hostIPC != null) {
      json[r'hostIPC'] = this.hostIPC;
    } else {
      json[r'hostIPC'] = null;
    }
    if (this.hostNetwork != null) {
      json[r'hostNetwork'] = this.hostNetwork;
    } else {
      json[r'hostNetwork'] = null;
    }
    if (this.hostPID != null) {
      json[r'hostPID'] = this.hostPID;
    } else {
      json[r'hostPID'] = null;
    }
    if (this.hostname != null) {
      json[r'hostname'] = this.hostname;
    } else {
      json[r'hostname'] = null;
    }
    json[r'imagePullSecrets'] = this.imagePullSecrets;
    json[r'initContainers'] = this.initContainers;
    if (this.nodeName != null) {
      json[r'nodeName'] = this.nodeName;
    } else {
      json[r'nodeName'] = null;
    }
    json[r'nodeSelector'] = this.nodeSelector;
    if (this.os != null) {
      json[r'os'] = this.os;
    } else {
      json[r'os'] = null;
    }
    json[r'overhead'] = this.overhead;
    if (this.preemptionPolicy != null) {
      json[r'preemptionPolicy'] = this.preemptionPolicy;
    } else {
      json[r'preemptionPolicy'] = null;
    }
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
    if (this.priorityClassName != null) {
      json[r'priorityClassName'] = this.priorityClassName;
    } else {
      json[r'priorityClassName'] = null;
    }
    json[r'readinessGates'] = this.readinessGates;
    if (this.restartPolicy != null) {
      json[r'restartPolicy'] = this.restartPolicy;
    } else {
      json[r'restartPolicy'] = null;
    }
    if (this.runtimeClassName != null) {
      json[r'runtimeClassName'] = this.runtimeClassName;
    } else {
      json[r'runtimeClassName'] = null;
    }
    if (this.schedulerName != null) {
      json[r'schedulerName'] = this.schedulerName;
    } else {
      json[r'schedulerName'] = null;
    }
    if (this.securityContext != null) {
      json[r'securityContext'] = this.securityContext;
    } else {
      json[r'securityContext'] = null;
    }
    if (this.serviceAccount != null) {
      json[r'serviceAccount'] = this.serviceAccount;
    } else {
      json[r'serviceAccount'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
    }
    if (this.setHostnameAsFQDN != null) {
      json[r'setHostnameAsFQDN'] = this.setHostnameAsFQDN;
    } else {
      json[r'setHostnameAsFQDN'] = null;
    }
    if (this.shareProcessNamespace != null) {
      json[r'shareProcessNamespace'] = this.shareProcessNamespace;
    } else {
      json[r'shareProcessNamespace'] = null;
    }
    if (this.subdomain != null) {
      json[r'subdomain'] = this.subdomain;
    } else {
      json[r'subdomain'] = null;
    }
    if (this.terminationGracePeriodSeconds != null) {
      json[r'terminationGracePeriodSeconds'] =
          this.terminationGracePeriodSeconds;
    } else {
      json[r'terminationGracePeriodSeconds'] = null;
    }
    json[r'tolerations'] = this.tolerations;
    json[r'topologySpreadConstraints'] = this.topologySpreadConstraints;
    json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecTemplateSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecTemplateSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecTemplateSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecTemplateSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecTemplateSpec(
        activeDeadlineSeconds:
            mapValueOfType<int>(json, r'activeDeadlineSeconds'),
        affinity:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity
                .fromJson(json[r'affinity']),
        automountServiceAccountToken:
            mapValueOfType<bool>(json, r'automountServiceAccountToken'),
        containers:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner
                .listFromJson(json[r'containers']),
        dnsConfig:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecDnsConfig
                .fromJson(json[r'dnsConfig']),
        dnsPolicy: mapValueOfType<String>(json, r'dnsPolicy'),
        enableServiceLinks: mapValueOfType<bool>(json, r'enableServiceLinks'),
        ephemeralContainers:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecEphemeralContainersInner
                .listFromJson(json[r'ephemeralContainers']),
        hostAliases:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecHostAliasesInner
                .listFromJson(json[r'hostAliases']),
        hostIPC: mapValueOfType<bool>(json, r'hostIPC'),
        hostNetwork: mapValueOfType<bool>(json, r'hostNetwork'),
        hostPID: mapValueOfType<bool>(json, r'hostPID'),
        hostname: mapValueOfType<String>(json, r'hostname'),
        imagePullSecrets:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecImagePullSecretsInner
                .listFromJson(json[r'imagePullSecrets']),
        initContainers:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner
                .listFromJson(json[r'initContainers']),
        nodeName: mapValueOfType<String>(json, r'nodeName'),
        nodeSelector:
            mapCastOfType<String, String>(json, r'nodeSelector') ?? const {},
        os: DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
            .fromJson(json[r'os']),
        overhead: mapCastOfType<String, Object>(json, r'overhead') ?? const {},
        preemptionPolicy: mapValueOfType<String>(json, r'preemptionPolicy'),
        priority: mapValueOfType<int>(json, r'priority'),
        priorityClassName: mapValueOfType<String>(json, r'priorityClassName'),
        readinessGates:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecReadinessGatesInner
                .listFromJson(json[r'readinessGates']),
        restartPolicy: mapValueOfType<String>(json, r'restartPolicy'),
        runtimeClassName: mapValueOfType<String>(json, r'runtimeClassName'),
        schedulerName: mapValueOfType<String>(json, r'schedulerName'),
        securityContext:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext
                .fromJson(json[r'securityContext']),
        serviceAccount: mapValueOfType<String>(json, r'serviceAccount'),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        setHostnameAsFQDN: mapValueOfType<bool>(json, r'setHostnameAsFQDN'),
        shareProcessNamespace:
            mapValueOfType<bool>(json, r'shareProcessNamespace'),
        subdomain: mapValueOfType<String>(json, r'subdomain'),
        terminationGracePeriodSeconds:
            mapValueOfType<int>(json, r'terminationGracePeriodSeconds'),
        tolerations:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecTolerationsInner
                .listFromJson(json[r'tolerations']),
        topologySpreadConstraints:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecTopologySpreadConstraintsInner
                .listFromJson(json[r'topologySpreadConstraints']),
        volumes:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerVolumeMountsInner
                .listFromJson(json[r'volumes']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecTemplateSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutSpecTemplateSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutSpecTemplateSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpecTemplateSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutSpecTemplateSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecTemplateSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecTemplateSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutSpecTemplateSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutSpecTemplateSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1RolloutSpecTemplateSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'containers',
  };
}
