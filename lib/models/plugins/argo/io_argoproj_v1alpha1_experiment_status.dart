//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_status_analysis_runs_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_status_conditions_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_experiment_status_template_statuses_inner.dart';

class IoArgoprojV1alpha1ExperimentStatus {
  /// Returns a new [IoArgoprojV1alpha1ExperimentStatus] instance.
  IoArgoprojV1alpha1ExperimentStatus({
    this.analysisRuns = const [],
    this.availableAt,
    this.conditions = const [],
    this.message,
    this.phase,
    this.templateStatuses = const [],
  });

  List<IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner> analysisRuns;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? availableAt;

  List<IoArgoprojV1alpha1ExperimentStatusConditionsInner> conditions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phase;

  List<IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>
      templateStatuses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentStatus &&
          deepEquality.equals(other.analysisRuns, analysisRuns) &&
          other.availableAt == availableAt &&
          deepEquality.equals(other.conditions, conditions) &&
          other.message == message &&
          other.phase == phase &&
          deepEquality.equals(other.templateStatuses, templateStatuses);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (analysisRuns.hashCode) +
      (availableAt == null ? 0 : availableAt!.hashCode) +
      (conditions.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (templateStatuses.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentStatus[analysisRuns=$analysisRuns, availableAt=$availableAt, conditions=$conditions, message=$message, phase=$phase, templateStatuses=$templateStatuses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'analysisRuns'] = this.analysisRuns;
    if (this.availableAt != null) {
      json[r'availableAt'] = this.availableAt!.toUtc().toIso8601String();
    } else {
      json[r'availableAt'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.phase != null) {
      json[r'phase'] = this.phase;
    } else {
      json[r'phase'] = null;
    }
    json[r'templateStatuses'] = this.templateStatuses;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentStatus(
        analysisRuns:
            IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner.listFromJson(
                json[r'analysisRuns']),
        availableAt: mapDateTime(json, r'availableAt', r''),
        conditions:
            IoArgoprojV1alpha1ExperimentStatusConditionsInner.listFromJson(
                json[r'conditions']),
        message: mapValueOfType<String>(json, r'message'),
        phase: mapValueOfType<String>(json, r'phase'),
        templateStatuses:
            IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner
                .listFromJson(json[r'templateStatuses']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ExperimentStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ExperimentStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ExperimentStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ExperimentStatus.listFromJson(
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
