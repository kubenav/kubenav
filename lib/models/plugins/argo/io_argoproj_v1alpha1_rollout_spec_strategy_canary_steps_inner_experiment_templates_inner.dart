//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_selector.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner({
    this.metadata,
    required this.name,
    this.replicas,
    this.selector,
    required this.specRef,
    this.weight,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata? metadata;

  String name;

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
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector?
      selector;

  String specRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? weight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner &&
          other.metadata == metadata &&
          other.name == name &&
          other.replicas == replicas &&
          other.selector == selector &&
          other.specRef == specRef &&
          other.weight == weight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (metadata == null ? 0 : metadata!.hashCode) +
      (name.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (specRef.hashCode) +
      (weight == null ? 0 : weight!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner[metadata=$metadata, name=$name, replicas=$replicas, selector=$selector, specRef=$specRef, weight=$weight]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    json[r'name'] = this.name;
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    json[r'specRef'] = this.specRef;
    if (this.weight != null) {
      json[r'weight'] = this.weight;
    } else {
      json[r'weight'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner(
        metadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'metadata']),
        name: mapValueOfType<String>(json, r'name')!,
        replicas: mapValueOfType<int>(json, r'replicas'),
        selector:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector
                .fromJson(json[r'selector']),
        specRef: mapValueOfType<String>(json, r'specRef')!,
        weight: mapValueOfType<int>(json, r'weight'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperimentTemplatesInner
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
    'name',
    'specRef',
  };
}
