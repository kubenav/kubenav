//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, avoid_function_literals_in_foreach_calls, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_args_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_dry_run_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_measurement_retention_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner.dart';

class IoArgoprojV1alpha1AnalysisTemplateSpec {
  /// Returns a new [IoArgoprojV1alpha1AnalysisTemplateSpec] instance.
  IoArgoprojV1alpha1AnalysisTemplateSpec({
    this.args = const [],
    this.dryRun = const [],
    this.measurementRetention = const [],
    this.metrics = const [],
  });

  List<IoArgoprojV1alpha1AnalysisRunSpecArgsInner> args;

  List<IoArgoprojV1alpha1AnalysisRunSpecDryRunInner> dryRun;

  List<IoArgoprojV1alpha1AnalysisRunSpecMeasurementRetentionInner>
      measurementRetention;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInner> metrics;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisTemplateSpec &&
          deepEquality.equals(other.args, args) &&
          deepEquality.equals(other.dryRun, dryRun) &&
          deepEquality.equals(
              other.measurementRetention, measurementRetention) &&
          deepEquality.equals(other.metrics, metrics);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (args.hashCode) +
      (dryRun.hashCode) +
      (measurementRetention.hashCode) +
      (metrics.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisTemplateSpec[args=$args, dryRun=$dryRun, measurementRetention=$measurementRetention, metrics=$metrics]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'args'] = this.args;
    json[r'dryRun'] = this.dryRun;
    json[r'measurementRetention'] = this.measurementRetention;
    json[r'metrics'] = this.metrics;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisTemplateSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisTemplateSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisTemplateSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisTemplateSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisTemplateSpec(
        args: IoArgoprojV1alpha1AnalysisRunSpecArgsInner.listFromJson(
            json[r'args']),
        dryRun: IoArgoprojV1alpha1AnalysisRunSpecDryRunInner.listFromJson(
            json[r'dryRun']),
        measurementRetention:
            IoArgoprojV1alpha1AnalysisRunSpecMeasurementRetentionInner
                .listFromJson(json[r'measurementRetention']),
        metrics: IoArgoprojV1alpha1AnalysisRunSpecMetricsInner.listFromJson(
            json[r'metrics']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisTemplateSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisTemplateSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AnalysisTemplateSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisTemplateSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisTemplateSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisTemplateSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisTemplateSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisTemplateSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AnalysisTemplateSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1AnalysisTemplateSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'metrics',
  };
}
