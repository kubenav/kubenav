//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_selector.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_analysis.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_template.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_workload_ref.dart';

class IoArgoprojV1alpha1RolloutSpec {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpec] instance.
  IoArgoprojV1alpha1RolloutSpec({
    this.analysis,
    this.minReadySeconds,
    this.paused,
    this.progressDeadlineAbort,
    this.progressDeadlineSeconds,
    this.replicas,
    this.restartAt,
    this.revisionHistoryLimit,
    this.selector,
    this.strategy,
    this.template,
    this.workloadRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecAnalysis? analysis;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? paused;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? progressDeadlineAbort;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? progressDeadlineSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? restartAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector?
      selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategy? strategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecTemplate? template;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecWorkloadRef? workloadRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpec &&
          other.analysis == analysis &&
          other.minReadySeconds == minReadySeconds &&
          other.paused == paused &&
          other.progressDeadlineAbort == progressDeadlineAbort &&
          other.progressDeadlineSeconds == progressDeadlineSeconds &&
          other.replicas == replicas &&
          other.restartAt == restartAt &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.selector == selector &&
          other.strategy == strategy &&
          other.template == template &&
          other.workloadRef == workloadRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (analysis == null ? 0 : analysis!.hashCode) +
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (paused == null ? 0 : paused!.hashCode) +
      (progressDeadlineAbort == null ? 0 : progressDeadlineAbort!.hashCode) +
      (progressDeadlineSeconds == null
          ? 0
          : progressDeadlineSeconds!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (restartAt == null ? 0 : restartAt!.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (strategy == null ? 0 : strategy!.hashCode) +
      (template == null ? 0 : template!.hashCode) +
      (workloadRef == null ? 0 : workloadRef!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpec[analysis=$analysis, minReadySeconds=$minReadySeconds, paused=$paused, progressDeadlineAbort=$progressDeadlineAbort, progressDeadlineSeconds=$progressDeadlineSeconds, replicas=$replicas, restartAt=$restartAt, revisionHistoryLimit=$revisionHistoryLimit, selector=$selector, strategy=$strategy, template=$template, workloadRef=$workloadRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.analysis != null) {
      json[r'analysis'] = this.analysis;
    } else {
      json[r'analysis'] = null;
    }
    if (this.minReadySeconds != null) {
      json[r'minReadySeconds'] = this.minReadySeconds;
    } else {
      json[r'minReadySeconds'] = null;
    }
    if (this.paused != null) {
      json[r'paused'] = this.paused;
    } else {
      json[r'paused'] = null;
    }
    if (this.progressDeadlineAbort != null) {
      json[r'progressDeadlineAbort'] = this.progressDeadlineAbort;
    } else {
      json[r'progressDeadlineAbort'] = null;
    }
    if (this.progressDeadlineSeconds != null) {
      json[r'progressDeadlineSeconds'] = this.progressDeadlineSeconds;
    } else {
      json[r'progressDeadlineSeconds'] = null;
    }
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.restartAt != null) {
      json[r'restartAt'] = this.restartAt!.toUtc().toIso8601String();
    } else {
      json[r'restartAt'] = null;
    }
    if (this.revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = this.revisionHistoryLimit;
    } else {
      json[r'revisionHistoryLimit'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    if (this.strategy != null) {
      json[r'strategy'] = this.strategy;
    } else {
      json[r'strategy'] = null;
    }
    if (this.template != null) {
      json[r'template'] = this.template;
    } else {
      json[r'template'] = null;
    }
    if (this.workloadRef != null) {
      json[r'workloadRef'] = this.workloadRef;
    } else {
      json[r'workloadRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpec(
        analysis:
            IoArgoprojV1alpha1RolloutSpecAnalysis.fromJson(json[r'analysis']),
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        paused: mapValueOfType<bool>(json, r'paused'),
        progressDeadlineAbort:
            mapValueOfType<bool>(json, r'progressDeadlineAbort'),
        progressDeadlineSeconds:
            mapValueOfType<int>(json, r'progressDeadlineSeconds'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        restartAt: mapDateTime(json, r'restartAt', r''),
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        selector:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector
                .fromJson(json[r'selector']),
        strategy:
            IoArgoprojV1alpha1RolloutSpecStrategy.fromJson(json[r'strategy']),
        template:
            IoArgoprojV1alpha1RolloutSpecTemplate.fromJson(json[r'template']),
        workloadRef: IoArgoprojV1alpha1RolloutSpecWorkloadRef.fromJson(
            json[r'workloadRef']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpec> mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1RolloutSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1RolloutSpec.listFromJson(
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
