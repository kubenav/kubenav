//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, avoid_function_literals_in_foreach_calls, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_status_metric_results_inner_measurements_inner.dart';

class IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner] instance.
  IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner({
    this.consecutiveError,
    this.count,
    this.dryRun,
    this.error,
    this.failed,
    this.inconclusive,
    this.measurements = const [],
    this.message,
    this.metadata = const {},
    required this.name,
    required this.phase,
    this.successful,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? consecutiveError;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? count;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? dryRun;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? inconclusive;

  List<IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>
      measurements;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  Map<String, String> metadata;

  String name;

  String phase;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? successful;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner &&
          other.consecutiveError == consecutiveError &&
          other.count == count &&
          other.dryRun == dryRun &&
          other.error == error &&
          other.failed == failed &&
          other.inconclusive == inconclusive &&
          deepEquality.equals(other.measurements, measurements) &&
          other.message == message &&
          deepEquality.equals(other.metadata, metadata) &&
          other.name == name &&
          other.phase == phase &&
          other.successful == successful;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (consecutiveError == null ? 0 : consecutiveError!.hashCode) +
      (count == null ? 0 : count!.hashCode) +
      (dryRun == null ? 0 : dryRun!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (failed == null ? 0 : failed!.hashCode) +
      (inconclusive == null ? 0 : inconclusive!.hashCode) +
      (measurements.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (metadata.hashCode) +
      (name.hashCode) +
      (phase.hashCode) +
      (successful == null ? 0 : successful!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner[consecutiveError=$consecutiveError, count=$count, dryRun=$dryRun, error=$error, failed=$failed, inconclusive=$inconclusive, measurements=$measurements, message=$message, metadata=$metadata, name=$name, phase=$phase, successful=$successful]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.consecutiveError != null) {
      json[r'consecutiveError'] = this.consecutiveError;
    } else {
      json[r'consecutiveError'] = null;
    }
    if (this.count != null) {
      json[r'count'] = this.count;
    } else {
      json[r'count'] = null;
    }
    if (this.dryRun != null) {
      json[r'dryRun'] = this.dryRun;
    } else {
      json[r'dryRun'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.failed != null) {
      json[r'failed'] = this.failed;
    } else {
      json[r'failed'] = null;
    }
    if (this.inconclusive != null) {
      json[r'inconclusive'] = this.inconclusive;
    } else {
      json[r'inconclusive'] = null;
    }
    json[r'measurements'] = this.measurements;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'metadata'] = this.metadata;
    json[r'name'] = this.name;
    json[r'phase'] = this.phase;
    if (this.successful != null) {
      json[r'successful'] = this.successful;
    } else {
      json[r'successful'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner(
        consecutiveError: mapValueOfType<int>(json, r'consecutiveError'),
        count: mapValueOfType<int>(json, r'count'),
        dryRun: mapValueOfType<bool>(json, r'dryRun'),
        error: mapValueOfType<int>(json, r'error'),
        failed: mapValueOfType<int>(json, r'failed'),
        inconclusive: mapValueOfType<int>(json, r'inconclusive'),
        measurements:
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner
                .listFromJson(json[r'measurements']),
        message: mapValueOfType<String>(json, r'message'),
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        name: mapValueOfType<String>(json, r'name')!,
        phase: mapValueOfType<String>(json, r'phase')!,
        successful: mapValueOfType<int>(json, r'successful'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInner.listFromJson(
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
    'phase',
  };
}
