//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, avoid_function_literals_in_foreach_calls, require_trailing_commas, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner] instance.
  IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner({
    this.finishedAt,
    this.message,
    this.metadata = const {},
    required this.phase,
    this.resumeAt,
    this.startedAt,
    this.value,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? finishedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  Map<String, String> metadata;

  String phase;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? resumeAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner &&
          other.finishedAt == finishedAt &&
          other.message == message &&
          deepEquality.equals(other.metadata, metadata) &&
          other.phase == phase &&
          other.resumeAt == resumeAt &&
          other.startedAt == startedAt &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (finishedAt == null ? 0 : finishedAt!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (metadata.hashCode) +
      (phase.hashCode) +
      (resumeAt == null ? 0 : resumeAt!.hashCode) +
      (startedAt == null ? 0 : startedAt!.hashCode) +
      (value == null ? 0 : value!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner[finishedAt=$finishedAt, message=$message, metadata=$metadata, phase=$phase, resumeAt=$resumeAt, startedAt=$startedAt, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.finishedAt != null) {
      json[r'finishedAt'] = this.finishedAt!.toUtc().toIso8601String();
    } else {
      json[r'finishedAt'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'metadata'] = this.metadata;
    json[r'phase'] = this.phase;
    if (this.resumeAt != null) {
      json[r'resumeAt'] = this.resumeAt!.toUtc().toIso8601String();
    } else {
      json[r'resumeAt'] = null;
    }
    if (this.startedAt != null) {
      json[r'startedAt'] = this.startedAt!.toUtc().toIso8601String();
    } else {
      json[r'startedAt'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner(
        finishedAt: mapDateTime(json, r'finishedAt', r''),
        message: mapValueOfType<String>(json, r'message'),
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        phase: mapValueOfType<String>(json, r'phase')!,
        resumeAt: mapDateTime(json, r'resumeAt', r''),
        startedAt: mapDateTime(json, r'startedAt', r''),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunStatusMetricResultsInnerMeasurementsInner
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
    'phase',
  };
}
