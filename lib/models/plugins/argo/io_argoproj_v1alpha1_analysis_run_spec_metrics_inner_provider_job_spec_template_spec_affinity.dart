//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_affinity_node_affinity.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_affinity_pod_affinity.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity({
    this.nodeAffinity,
    this.podAffinity,
    this.podAntiAffinity,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityNodeAffinity?
      nodeAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityPodAffinity?
      podAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityPodAffinity?
      podAntiAffinity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity &&
          other.nodeAffinity == nodeAffinity &&
          other.podAffinity == podAffinity &&
          other.podAntiAffinity == podAntiAffinity;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nodeAffinity == null ? 0 : nodeAffinity!.hashCode) +
      (podAffinity == null ? 0 : podAffinity!.hashCode) +
      (podAntiAffinity == null ? 0 : podAntiAffinity!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity[nodeAffinity=$nodeAffinity, podAffinity=$podAffinity, podAntiAffinity=$podAntiAffinity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nodeAffinity != null) {
      json[r'nodeAffinity'] = this.nodeAffinity;
    } else {
      json[r'nodeAffinity'] = null;
    }
    if (this.podAffinity != null) {
      json[r'podAffinity'] = this.podAffinity;
    } else {
      json[r'podAffinity'] = null;
    }
    if (this.podAntiAffinity != null) {
      json[r'podAntiAffinity'] = this.podAntiAffinity;
    } else {
      json[r'podAntiAffinity'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity(
        nodeAffinity:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityNodeAffinity
                .fromJson(json[r'nodeAffinity']),
        podAffinity:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityPodAffinity
                .fromJson(json[r'podAffinity']),
        podAntiAffinity:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinityPodAffinity
                .fromJson(json[r'podAntiAffinity']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecAffinity
                .listFromJson(
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
