//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner {
  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner] instance.
  IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner({
    required this.analysisRun,
    this.message,
    required this.name,
    required this.phase,
  });

  String analysisRun;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  String name;

  String phase;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner &&
          other.analysisRun == analysisRun &&
          other.message == message &&
          other.name == name &&
          other.phase == phase;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (analysisRun.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (name.hashCode) +
      (phase.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner[analysisRun=$analysisRun, message=$message, name=$name, phase=$phase]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'analysisRun'] = this.analysisRun;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'name'] = this.name;
    json[r'phase'] = this.phase;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner(
        analysisRun: mapValueOfType<String>(json, r'analysisRun')!,
        message: mapValueOfType<String>(json, r'message'),
        name: mapValueOfType<String>(json, r'name')!,
        phase: mapValueOfType<String>(json, r'phase')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ExperimentStatusAnalysisRunsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'analysisRun',
    'name',
    'phase',
  };
}
