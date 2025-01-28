//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_http_get_http_headers_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_se_linux_options.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_seccomp_profile.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context_windows_options.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext({
    this.fsGroup,
    this.fsGroupChangePolicy,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seLinuxOptions,
    this.seccompProfile,
    this.supplementalGroups = const [],
    this.sysctls = const [],
    this.windowsOptions,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fsGroup;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsGroupChangePolicy;

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

  List<int> supplementalGroups;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner>
      sysctls;

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
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext &&
          other.fsGroup == fsGroup &&
          other.fsGroupChangePolicy == fsGroupChangePolicy &&
          other.runAsGroup == runAsGroup &&
          other.runAsNonRoot == runAsNonRoot &&
          other.runAsUser == runAsUser &&
          other.seLinuxOptions == seLinuxOptions &&
          other.seccompProfile == seccompProfile &&
          deepEquality.equals(other.supplementalGroups, supplementalGroups) &&
          deepEquality.equals(other.sysctls, sysctls) &&
          other.windowsOptions == windowsOptions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsGroup == null ? 0 : fsGroup!.hashCode) +
      (fsGroupChangePolicy == null ? 0 : fsGroupChangePolicy!.hashCode) +
      (runAsGroup == null ? 0 : runAsGroup!.hashCode) +
      (runAsNonRoot == null ? 0 : runAsNonRoot!.hashCode) +
      (runAsUser == null ? 0 : runAsUser!.hashCode) +
      (seLinuxOptions == null ? 0 : seLinuxOptions!.hashCode) +
      (seccompProfile == null ? 0 : seccompProfile!.hashCode) +
      (supplementalGroups.hashCode) +
      (sysctls.hashCode) +
      (windowsOptions == null ? 0 : windowsOptions!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext[fsGroup=$fsGroup, fsGroupChangePolicy=$fsGroupChangePolicy, runAsGroup=$runAsGroup, runAsNonRoot=$runAsNonRoot, runAsUser=$runAsUser, seLinuxOptions=$seLinuxOptions, seccompProfile=$seccompProfile, supplementalGroups=$supplementalGroups, sysctls=$sysctls, windowsOptions=$windowsOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fsGroup != null) {
      json[r'fsGroup'] = this.fsGroup;
    } else {
      json[r'fsGroup'] = null;
    }
    if (this.fsGroupChangePolicy != null) {
      json[r'fsGroupChangePolicy'] = this.fsGroupChangePolicy;
    } else {
      json[r'fsGroupChangePolicy'] = null;
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
    json[r'supplementalGroups'] = this.supplementalGroups;
    json[r'sysctls'] = this.sysctls;
    if (this.windowsOptions != null) {
      json[r'windowsOptions'] = this.windowsOptions;
    } else {
      json[r'windowsOptions'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext(
        fsGroup: mapValueOfType<int>(json, r'fsGroup'),
        fsGroupChangePolicy:
            mapValueOfType<String>(json, r'fsGroupChangePolicy'),
        runAsGroup: mapValueOfType<int>(json, r'runAsGroup'),
        runAsNonRoot: mapValueOfType<bool>(json, r'runAsNonRoot'),
        runAsUser: mapValueOfType<int>(json, r'runAsUser'),
        seLinuxOptions:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeLinuxOptions
                .fromJson(json[r'seLinuxOptions']),
        seccompProfile:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextSeccompProfile
                .fromJson(json[r'seccompProfile']),
        supplementalGroups: json[r'supplementalGroups'] is Iterable
            ? (json[r'supplementalGroups'] as Iterable)
                .cast<int>()
                .toList(growable: false)
            : const [],
        sysctls:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner
                .listFromJson(json[r'sysctls']),
        windowsOptions:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContextWindowsOptions
                .fromJson(json[r'windowsOptions']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecSecurityContext
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
