//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_dry_run_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_measurement_retention_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_spec_analyses_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_spec_templates_inner.dart';

class IoArgoprojV1alpha1ExperimentSpec {
  /// Returns a new [IoArgoprojV1alpha1ExperimentSpec] instance.
  IoArgoprojV1alpha1ExperimentSpec({
    this.analyses = const [],
    this.dryRun = const [],
    this.duration,
    this.measurementRetention = const [],
    this.progressDeadlineSeconds,
    this.scaleDownDelaySeconds,
    this.templates = const [],
    this.terminate,
  });

  List<IoArgoprojV1alpha1ExperimentSpecAnalysesInner> analyses;

  List<IoArgoprojV1alpha1AnalysisRunSpecDryRunInner> dryRun;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  List<IoArgoprojV1alpha1AnalysisRunSpecMeasurementRetentionInner>
      measurementRetention;

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
  int? scaleDownDelaySeconds;

  List<IoArgoprojV1alpha1ExperimentSpecTemplatesInner> templates;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? terminate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentSpec &&
          deepEquality.equals(other.analyses, analyses) &&
          deepEquality.equals(other.dryRun, dryRun) &&
          other.duration == duration &&
          deepEquality.equals(
              other.measurementRetention, measurementRetention) &&
          other.progressDeadlineSeconds == progressDeadlineSeconds &&
          other.scaleDownDelaySeconds == scaleDownDelaySeconds &&
          deepEquality.equals(other.templates, templates) &&
          other.terminate == terminate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (analyses.hashCode) +
      (dryRun.hashCode) +
      (duration == null ? 0 : duration!.hashCode) +
      (measurementRetention.hashCode) +
      (progressDeadlineSeconds == null
          ? 0
          : progressDeadlineSeconds!.hashCode) +
      (scaleDownDelaySeconds == null ? 0 : scaleDownDelaySeconds!.hashCode) +
      (templates.hashCode) +
      (terminate == null ? 0 : terminate!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentSpec[analyses=$analyses, dryRun=$dryRun, duration=$duration, measurementRetention=$measurementRetention, progressDeadlineSeconds=$progressDeadlineSeconds, scaleDownDelaySeconds=$scaleDownDelaySeconds, templates=$templates, terminate=$terminate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'analyses'] = this.analyses;
    json[r'dryRun'] = this.dryRun;
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    json[r'measurementRetention'] = this.measurementRetention;
    if (this.progressDeadlineSeconds != null) {
      json[r'progressDeadlineSeconds'] = this.progressDeadlineSeconds;
    } else {
      json[r'progressDeadlineSeconds'] = null;
    }
    if (this.scaleDownDelaySeconds != null) {
      json[r'scaleDownDelaySeconds'] = this.scaleDownDelaySeconds;
    } else {
      json[r'scaleDownDelaySeconds'] = null;
    }
    json[r'templates'] = this.templates;
    if (this.terminate != null) {
      json[r'terminate'] = this.terminate;
    } else {
      json[r'terminate'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentSpec(
        analyses: IoArgoprojV1alpha1ExperimentSpecAnalysesInner.listFromJson(
            json[r'analyses']),
        dryRun: IoArgoprojV1alpha1AnalysisRunSpecDryRunInner.listFromJson(
            json[r'dryRun']),
        duration: mapValueOfType<String>(json, r'duration'),
        measurementRetention:
            IoArgoprojV1alpha1AnalysisRunSpecMeasurementRetentionInner
                .listFromJson(json[r'measurementRetention']),
        progressDeadlineSeconds:
            mapValueOfType<int>(json, r'progressDeadlineSeconds'),
        scaleDownDelaySeconds:
            mapValueOfType<int>(json, r'scaleDownDelaySeconds'),
        templates: IoArgoprojV1alpha1ExperimentSpecTemplatesInner.listFromJson(
            json[r'templates']),
        terminate: mapValueOfType<bool>(json, r'terminate'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ExperimentSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ExperimentSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ExperimentSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ExperimentSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'templates',
  };
}
