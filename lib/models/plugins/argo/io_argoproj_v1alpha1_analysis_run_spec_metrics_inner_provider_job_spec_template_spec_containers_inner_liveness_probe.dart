//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_exec.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_http_get.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_tcp_socket.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_liveness_probe_grpc.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartExec?
      exec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failureThreshold;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbeGrpc?
      grpc;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet?
      httpGet;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? initialDelaySeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? periodSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? successThreshold;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartTcpSocket?
      tcpSocket;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? terminationGracePeriodSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeoutSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe &&
          other.exec == exec &&
          other.failureThreshold == failureThreshold &&
          other.grpc == grpc &&
          other.httpGet == httpGet &&
          other.initialDelaySeconds == initialDelaySeconds &&
          other.periodSeconds == periodSeconds &&
          other.successThreshold == successThreshold &&
          other.tcpSocket == tcpSocket &&
          other.terminationGracePeriodSeconds ==
              terminationGracePeriodSeconds &&
          other.timeoutSeconds == timeoutSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (exec == null ? 0 : exec!.hashCode) +
      (failureThreshold == null ? 0 : failureThreshold!.hashCode) +
      (grpc == null ? 0 : grpc!.hashCode) +
      (httpGet == null ? 0 : httpGet!.hashCode) +
      (initialDelaySeconds == null ? 0 : initialDelaySeconds!.hashCode) +
      (periodSeconds == null ? 0 : periodSeconds!.hashCode) +
      (successThreshold == null ? 0 : successThreshold!.hashCode) +
      (tcpSocket == null ? 0 : tcpSocket!.hashCode) +
      (terminationGracePeriodSeconds == null
          ? 0
          : terminationGracePeriodSeconds!.hashCode) +
      (timeoutSeconds == null ? 0 : timeoutSeconds!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe[exec=$exec, failureThreshold=$failureThreshold, grpc=$grpc, httpGet=$httpGet, initialDelaySeconds=$initialDelaySeconds, periodSeconds=$periodSeconds, successThreshold=$successThreshold, tcpSocket=$tcpSocket, terminationGracePeriodSeconds=$terminationGracePeriodSeconds, timeoutSeconds=$timeoutSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.exec != null) {
      json[r'exec'] = this.exec;
    } else {
      json[r'exec'] = null;
    }
    if (this.failureThreshold != null) {
      json[r'failureThreshold'] = this.failureThreshold;
    } else {
      json[r'failureThreshold'] = null;
    }
    if (this.grpc != null) {
      json[r'grpc'] = this.grpc;
    } else {
      json[r'grpc'] = null;
    }
    if (this.httpGet != null) {
      json[r'httpGet'] = this.httpGet;
    } else {
      json[r'httpGet'] = null;
    }
    if (this.initialDelaySeconds != null) {
      json[r'initialDelaySeconds'] = this.initialDelaySeconds;
    } else {
      json[r'initialDelaySeconds'] = null;
    }
    if (this.periodSeconds != null) {
      json[r'periodSeconds'] = this.periodSeconds;
    } else {
      json[r'periodSeconds'] = null;
    }
    if (this.successThreshold != null) {
      json[r'successThreshold'] = this.successThreshold;
    } else {
      json[r'successThreshold'] = null;
    }
    if (this.tcpSocket != null) {
      json[r'tcpSocket'] = this.tcpSocket;
    } else {
      json[r'tcpSocket'] = null;
    }
    if (this.terminationGracePeriodSeconds != null) {
      json[r'terminationGracePeriodSeconds'] =
          this.terminationGracePeriodSeconds;
    } else {
      json[r'terminationGracePeriodSeconds'] = null;
    }
    if (this.timeoutSeconds != null) {
      json[r'timeoutSeconds'] = this.timeoutSeconds;
    } else {
      json[r'timeoutSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe(
        exec:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartExec
                .fromJson(json[r'exec']),
        failureThreshold: mapValueOfType<int>(json, r'failureThreshold'),
        grpc:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbeGrpc
                .fromJson(json[r'grpc']),
        httpGet:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet
                .fromJson(json[r'httpGet']),
        initialDelaySeconds: mapValueOfType<int>(json, r'initialDelaySeconds'),
        periodSeconds: mapValueOfType<int>(json, r'periodSeconds'),
        successThreshold: mapValueOfType<int>(json, r'successThreshold'),
        tcpSocket:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartTcpSocket
                .fromJson(json[r'tcpSocket']),
        terminationGracePeriodSeconds:
            mapValueOfType<int>(json, r'terminationGracePeriodSeconds'),
        timeoutSeconds: mapValueOfType<int>(json, r'timeoutSeconds'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
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
