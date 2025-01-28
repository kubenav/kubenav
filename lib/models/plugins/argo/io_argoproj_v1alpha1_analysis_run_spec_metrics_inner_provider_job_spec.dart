//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_selector.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec({
    this.activeDeadlineSeconds,
    this.backoffLimit,
    this.completionMode,
    this.completions,
    this.manualSelector,
    this.parallelism,
    this.selector,
    this.suspend,
    required this.template,
    this.ttlSecondsAfterFinished,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? activeDeadlineSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? backoffLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? completionMode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? completions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? manualSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? parallelism;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector?
      selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplate template;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ttlSecondsAfterFinished;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec &&
          other.activeDeadlineSeconds == activeDeadlineSeconds &&
          other.backoffLimit == backoffLimit &&
          other.completionMode == completionMode &&
          other.completions == completions &&
          other.manualSelector == manualSelector &&
          other.parallelism == parallelism &&
          other.selector == selector &&
          other.suspend == suspend &&
          other.template == template &&
          other.ttlSecondsAfterFinished == ttlSecondsAfterFinished;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (activeDeadlineSeconds == null ? 0 : activeDeadlineSeconds!.hashCode) +
      (backoffLimit == null ? 0 : backoffLimit!.hashCode) +
      (completionMode == null ? 0 : completionMode!.hashCode) +
      (completions == null ? 0 : completions!.hashCode) +
      (manualSelector == null ? 0 : manualSelector!.hashCode) +
      (parallelism == null ? 0 : parallelism!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (template.hashCode) +
      (ttlSecondsAfterFinished == null ? 0 : ttlSecondsAfterFinished!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec[activeDeadlineSeconds=$activeDeadlineSeconds, backoffLimit=$backoffLimit, completionMode=$completionMode, completions=$completions, manualSelector=$manualSelector, parallelism=$parallelism, selector=$selector, suspend=$suspend, template=$template, ttlSecondsAfterFinished=$ttlSecondsAfterFinished]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.activeDeadlineSeconds != null) {
      json[r'activeDeadlineSeconds'] = this.activeDeadlineSeconds;
    } else {
      json[r'activeDeadlineSeconds'] = null;
    }
    if (this.backoffLimit != null) {
      json[r'backoffLimit'] = this.backoffLimit;
    } else {
      json[r'backoffLimit'] = null;
    }
    if (this.completionMode != null) {
      json[r'completionMode'] = this.completionMode;
    } else {
      json[r'completionMode'] = null;
    }
    if (this.completions != null) {
      json[r'completions'] = this.completions;
    } else {
      json[r'completions'] = null;
    }
    if (this.manualSelector != null) {
      json[r'manualSelector'] = this.manualSelector;
    } else {
      json[r'manualSelector'] = null;
    }
    if (this.parallelism != null) {
      json[r'parallelism'] = this.parallelism;
    } else {
      json[r'parallelism'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    json[r'template'] = this.template;
    if (this.ttlSecondsAfterFinished != null) {
      json[r'ttlSecondsAfterFinished'] = this.ttlSecondsAfterFinished;
    } else {
      json[r'ttlSecondsAfterFinished'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec(
        activeDeadlineSeconds:
            mapValueOfType<int>(json, r'activeDeadlineSeconds'),
        backoffLimit: mapValueOfType<int>(json, r'backoffLimit'),
        completionMode: mapValueOfType<String>(json, r'completionMode'),
        completions: mapValueOfType<int>(json, r'completions'),
        manualSelector: mapValueOfType<bool>(json, r'manualSelector'),
        parallelism: mapValueOfType<int>(json, r'parallelism'),
        selector:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector
                .fromJson(json[r'selector']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        template:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplate
                .fromJson(json[r'template'])!,
        ttlSecondsAfterFinished:
            mapValueOfType<int>(json, r'ttlSecondsAfterFinished'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpec
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
    'template',
  };
}
