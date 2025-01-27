//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_capabilities.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_se_linux_options.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_seccomp_profile.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_windows_options.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext({
    this.allowPrivilegeEscalation,
    this.capabilities,
    this.privileged,
    this.procMount,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seLinuxOptions,
    this.seccompProfile,
    this.windowsOptions,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowPrivilegeEscalation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextCapabilities?
      capabilities;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? privileged;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? procMount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnlyRootFilesystem;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? runAsGroup;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? runAsNonRoot;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? runAsUser;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeLinuxOptions?
      seLinuxOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeccompProfile?
      seccompProfile;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextWindowsOptions?
      windowsOptions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext &&
          other.allowPrivilegeEscalation == allowPrivilegeEscalation &&
          other.capabilities == capabilities &&
          other.privileged == privileged &&
          other.procMount == procMount &&
          other.readOnlyRootFilesystem == readOnlyRootFilesystem &&
          other.runAsGroup == runAsGroup &&
          other.runAsNonRoot == runAsNonRoot &&
          other.runAsUser == runAsUser &&
          other.seLinuxOptions == seLinuxOptions &&
          other.seccompProfile == seccompProfile &&
          other.windowsOptions == windowsOptions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowPrivilegeEscalation == null
          ? 0
          : allowPrivilegeEscalation!.hashCode) +
      (capabilities == null ? 0 : capabilities!.hashCode) +
      (privileged == null ? 0 : privileged!.hashCode) +
      (procMount == null ? 0 : procMount!.hashCode) +
      (readOnlyRootFilesystem == null ? 0 : readOnlyRootFilesystem!.hashCode) +
      (runAsGroup == null ? 0 : runAsGroup!.hashCode) +
      (runAsNonRoot == null ? 0 : runAsNonRoot!.hashCode) +
      (runAsUser == null ? 0 : runAsUser!.hashCode) +
      (seLinuxOptions == null ? 0 : seLinuxOptions!.hashCode) +
      (seccompProfile == null ? 0 : seccompProfile!.hashCode) +
      (windowsOptions == null ? 0 : windowsOptions!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext[allowPrivilegeEscalation=$allowPrivilegeEscalation, capabilities=$capabilities, privileged=$privileged, procMount=$procMount, readOnlyRootFilesystem=$readOnlyRootFilesystem, runAsGroup=$runAsGroup, runAsNonRoot=$runAsNonRoot, runAsUser=$runAsUser, seLinuxOptions=$seLinuxOptions, seccompProfile=$seccompProfile, windowsOptions=$windowsOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowPrivilegeEscalation != null) {
      json[r'allowPrivilegeEscalation'] = this.allowPrivilegeEscalation;
    } else {
      json[r'allowPrivilegeEscalation'] = null;
    }
    if (this.capabilities != null) {
      json[r'capabilities'] = this.capabilities;
    } else {
      json[r'capabilities'] = null;
    }
    if (this.privileged != null) {
      json[r'privileged'] = this.privileged;
    } else {
      json[r'privileged'] = null;
    }
    if (this.procMount != null) {
      json[r'procMount'] = this.procMount;
    } else {
      json[r'procMount'] = null;
    }
    if (this.readOnlyRootFilesystem != null) {
      json[r'readOnlyRootFilesystem'] = this.readOnlyRootFilesystem;
    } else {
      json[r'readOnlyRootFilesystem'] = null;
    }
    if (this.runAsGroup != null) {
      json[r'runAsGroup'] = this.runAsGroup;
    } else {
      json[r'runAsGroup'] = null;
    }
    if (this.runAsNonRoot != null) {
      json[r'runAsNonRoot'] = this.runAsNonRoot;
    } else {
      json[r'runAsNonRoot'] = null;
    }
    if (this.runAsUser != null) {
      json[r'runAsUser'] = this.runAsUser;
    } else {
      json[r'runAsUser'] = null;
    }
    if (this.seLinuxOptions != null) {
      json[r'seLinuxOptions'] = this.seLinuxOptions;
    } else {
      json[r'seLinuxOptions'] = null;
    }
    if (this.seccompProfile != null) {
      json[r'seccompProfile'] = this.seccompProfile;
    } else {
      json[r'seccompProfile'] = null;
    }
    if (this.windowsOptions != null) {
      json[r'windowsOptions'] = this.windowsOptions;
    } else {
      json[r'windowsOptions'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(
            json.containsKey(key),
            'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext[$key]" is missing from JSON.',
          );
          assert(
            json[key] != null,
            'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext[$key]" has a null value in JSON.',
          );
        }
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext(
        allowPrivilegeEscalation:
            mapValueOfType<bool>(json, r'allowPrivilegeEscalation'),
        capabilities:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextCapabilities
                .fromJson(json[r'capabilities']),
        privileged: mapValueOfType<bool>(json, r'privileged'),
        procMount: mapValueOfType<String>(json, r'procMount'),
        readOnlyRootFilesystem:
            mapValueOfType<bool>(json, r'readOnlyRootFilesystem'),
        runAsGroup: mapValueOfType<int>(json, r'runAsGroup'),
        runAsNonRoot: mapValueOfType<bool>(json, r'runAsNonRoot'),
        runAsUser: mapValueOfType<int>(json, r'runAsUser'),
        seLinuxOptions:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeLinuxOptions
                .fromJson(json[r'seLinuxOptions']),
        seccompProfile:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeccompProfile
                .fromJson(json[r'seccompProfile']),
        windowsOptions:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextWindowsOptions
                .fromJson(json[r'windowsOptions']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext
                .listFromJson(
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
