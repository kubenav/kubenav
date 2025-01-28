//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob({
    this.metadata,
    required this.spec,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata? metadata;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec spec;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob &&
          other.metadata == metadata &&
          other.spec == spec;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (metadata == null ? 0 : metadata!.hashCode) + (spec.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob[metadata=$metadata, spec=$spec]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    json[r'spec'] = this.spec;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob(
        metadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'metadata']),
        spec: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec
            .fromJson(json[r'spec'])!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob
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
    'spec',
  };
}
