//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, avoid_function_literals_in_foreach_calls, require_trailing_commas, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_status_dry_run_summary.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_status_metric_results_inner.dart';

class IoArgoprojV1alpha1AnalysisRunStatus {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatus] instance.
  IoArgoprojV1alpha1AnalysisRunStatus({
    this.dryRunSummary,
    this.message,
    this.metricResults = const [],
    required this.phase,
    this.runSummary,
    this.startedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary? dryRunSummary;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  List<IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner> metricResults;

  String phase;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary? runSummary;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunStatus &&
          other.dryRunSummary == dryRunSummary &&
          other.message == message &&
          deepEquality.equals(other.metricResults, metricResults) &&
          other.phase == phase &&
          other.runSummary == runSummary &&
          other.startedAt == startedAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (dryRunSummary == null ? 0 : dryRunSummary!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (metricResults.hashCode) +
      (phase.hashCode) +
      (runSummary == null ? 0 : runSummary!.hashCode) +
      (startedAt == null ? 0 : startedAt!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunStatus[dryRunSummary=$dryRunSummary, message=$message, metricResults=$metricResults, phase=$phase, runSummary=$runSummary, startedAt=$startedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dryRunSummary != null) {
      json[r'dryRunSummary'] = this.dryRunSummary;
    } else {
      json[r'dryRunSummary'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'metricResults'] = this.metricResults;
    json[r'phase'] = this.phase;
    if (this.runSummary != null) {
      json[r'runSummary'] = this.runSummary;
    } else {
      json[r'runSummary'] = null;
    }
    if (this.startedAt != null) {
      json[r'startedAt'] = this.startedAt!.toUtc().toIso8601String();
    } else {
      json[r'startedAt'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunStatus(
        dryRunSummary:
            IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary.fromJson(
                json[r'dryRunSummary']),
        message: mapValueOfType<String>(json, r'message'),
        metricResults:
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner.listFromJson(
                json[r'metricResults']),
        phase: mapValueOfType<String>(json, r'phase')!,
        runSummary: IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary.fromJson(
            json[r'runSummary']),
        startedAt: mapDateTime(json, r'startedAt', r''),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AnalysisRunStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisRunStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AnalysisRunStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisRunStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AnalysisRunStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1AnalysisRunStatus.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'phase',
  };
}
