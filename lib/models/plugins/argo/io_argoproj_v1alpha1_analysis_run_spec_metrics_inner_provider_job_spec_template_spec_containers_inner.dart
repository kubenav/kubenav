//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_env_from_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_env_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_liveness_probe.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_ports_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_resources.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_security_context.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_volume_devices_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_volume_mounts_inner.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner({
    this.args = const [],
    this.command = const [],
    this.env = const [],
    this.envFrom = const [],
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports = const [],
    this.readinessProbe,
    this.resources,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices = const [],
    this.volumeMounts = const [],
    this.workingDir,
  });

  List<String> args;

  List<String> command;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerEnvInner>
      env;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerEnvFromInner>
      envFrom;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imagePullPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecycle?
      lifecycle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe?
      livenessProbe;

  String name;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerPortsInner>
      ports;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe?
      readinessProbe;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerResources?
      resources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext?
      securityContext;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe?
      startupProbe;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdinOnce;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? terminationMessagePath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? terminationMessagePolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? tty;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerVolumeDevicesInner>
      volumeDevices;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerVolumeMountsInner>
      volumeMounts;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workingDir;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner &&
          deepEquality.equals(other.args, args) &&
          deepEquality.equals(other.command, command) &&
          deepEquality.equals(other.env, env) &&
          deepEquality.equals(other.envFrom, envFrom) &&
          other.image == image &&
          other.imagePullPolicy == imagePullPolicy &&
          other.lifecycle == lifecycle &&
          other.livenessProbe == livenessProbe &&
          other.name == name &&
          deepEquality.equals(other.ports, ports) &&
          other.readinessProbe == readinessProbe &&
          other.resources == resources &&
          other.securityContext == securityContext &&
          other.startupProbe == startupProbe &&
          other.stdin == stdin &&
          other.stdinOnce == stdinOnce &&
          other.terminationMessagePath == terminationMessagePath &&
          other.terminationMessagePolicy == terminationMessagePolicy &&
          other.tty == tty &&
          deepEquality.equals(other.volumeDevices, volumeDevices) &&
          deepEquality.equals(other.volumeMounts, volumeMounts) &&
          other.workingDir == workingDir;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (args.hashCode) +
      (command.hashCode) +
      (env.hashCode) +
      (envFrom.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (imagePullPolicy == null ? 0 : imagePullPolicy!.hashCode) +
      (lifecycle == null ? 0 : lifecycle!.hashCode) +
      (livenessProbe == null ? 0 : livenessProbe!.hashCode) +
      (name.hashCode) +
      (ports.hashCode) +
      (readinessProbe == null ? 0 : readinessProbe!.hashCode) +
      (resources == null ? 0 : resources!.hashCode) +
      (securityContext == null ? 0 : securityContext!.hashCode) +
      (startupProbe == null ? 0 : startupProbe!.hashCode) +
      (stdin == null ? 0 : stdin!.hashCode) +
      (stdinOnce == null ? 0 : stdinOnce!.hashCode) +
      (terminationMessagePath == null ? 0 : terminationMessagePath!.hashCode) +
      (terminationMessagePolicy == null
          ? 0
          : terminationMessagePolicy!.hashCode) +
      (tty == null ? 0 : tty!.hashCode) +
      (volumeDevices.hashCode) +
      (volumeMounts.hashCode) +
      (workingDir == null ? 0 : workingDir!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner[args=$args, command=$command, env=$env, envFrom=$envFrom, image=$image, imagePullPolicy=$imagePullPolicy, lifecycle=$lifecycle, livenessProbe=$livenessProbe, name=$name, ports=$ports, readinessProbe=$readinessProbe, resources=$resources, securityContext=$securityContext, startupProbe=$startupProbe, stdin=$stdin, stdinOnce=$stdinOnce, terminationMessagePath=$terminationMessagePath, terminationMessagePolicy=$terminationMessagePolicy, tty=$tty, volumeDevices=$volumeDevices, volumeMounts=$volumeMounts, workingDir=$workingDir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'args'] = this.args;
    json[r'command'] = this.command;
    json[r'env'] = this.env;
    json[r'envFrom'] = this.envFrom;
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.imagePullPolicy != null) {
      json[r'imagePullPolicy'] = this.imagePullPolicy;
    } else {
      json[r'imagePullPolicy'] = null;
    }
    if (this.lifecycle != null) {
      json[r'lifecycle'] = this.lifecycle;
    } else {
      json[r'lifecycle'] = null;
    }
    if (this.livenessProbe != null) {
      json[r'livenessProbe'] = this.livenessProbe;
    } else {
      json[r'livenessProbe'] = null;
    }
    json[r'name'] = this.name;
    json[r'ports'] = this.ports;
    if (this.readinessProbe != null) {
      json[r'readinessProbe'] = this.readinessProbe;
    } else {
      json[r'readinessProbe'] = null;
    }
    if (this.resources != null) {
      json[r'resources'] = this.resources;
    } else {
      json[r'resources'] = null;
    }
    if (this.securityContext != null) {
      json[r'securityContext'] = this.securityContext;
    } else {
      json[r'securityContext'] = null;
    }
    if (this.startupProbe != null) {
      json[r'startupProbe'] = this.startupProbe;
    } else {
      json[r'startupProbe'] = null;
    }
    if (this.stdin != null) {
      json[r'stdin'] = this.stdin;
    } else {
      json[r'stdin'] = null;
    }
    if (this.stdinOnce != null) {
      json[r'stdinOnce'] = this.stdinOnce;
    } else {
      json[r'stdinOnce'] = null;
    }
    if (this.terminationMessagePath != null) {
      json[r'terminationMessagePath'] = this.terminationMessagePath;
    } else {
      json[r'terminationMessagePath'] = null;
    }
    if (this.terminationMessagePolicy != null) {
      json[r'terminationMessagePolicy'] = this.terminationMessagePolicy;
    } else {
      json[r'terminationMessagePolicy'] = null;
    }
    if (this.tty != null) {
      json[r'tty'] = this.tty;
    } else {
      json[r'tty'] = null;
    }
    json[r'volumeDevices'] = this.volumeDevices;
    json[r'volumeMounts'] = this.volumeMounts;
    if (this.workingDir != null) {
      json[r'workingDir'] = this.workingDir;
    } else {
      json[r'workingDir'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner(
        args: json[r'args'] is Iterable
            ? (json[r'args'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        command: json[r'command'] is Iterable
            ? (json[r'command'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        env:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerEnvInner
                .listFromJson(json[r'env']),
        envFrom:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerEnvFromInner
                .listFromJson(json[r'envFrom']),
        image: mapValueOfType<String>(json, r'image'),
        imagePullPolicy: mapValueOfType<String>(json, r'imagePullPolicy'),
        lifecycle:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecycle
                .fromJson(json[r'lifecycle']),
        livenessProbe:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
                .fromJson(json[r'livenessProbe']),
        name: mapValueOfType<String>(json, r'name')!,
        ports:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerPortsInner
                .listFromJson(json[r'ports']),
        readinessProbe:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
                .fromJson(json[r'readinessProbe']),
        resources:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerResources
                .fromJson(json[r'resources']),
        securityContext:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerSecurityContext
                .fromJson(json[r'securityContext']),
        startupProbe:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLivenessProbe
                .fromJson(json[r'startupProbe']),
        stdin: mapValueOfType<bool>(json, r'stdin'),
        stdinOnce: mapValueOfType<bool>(json, r'stdinOnce'),
        terminationMessagePath:
            mapValueOfType<String>(json, r'terminationMessagePath'),
        terminationMessagePolicy:
            mapValueOfType<String>(json, r'terminationMessagePolicy'),
        tty: mapValueOfType<bool>(json, r'tty'),
        volumeDevices:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerVolumeDevicesInner
                .listFromJson(json[r'volumeDevices']),
        volumeMounts:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerVolumeMountsInner
                .listFromJson(json[r'volumeMounts']),
        workingDir: mapValueOfType<String>(json, r'workingDir'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}
