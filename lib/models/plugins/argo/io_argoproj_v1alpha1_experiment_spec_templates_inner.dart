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

class IoArgoprojV1alpha1ExperimentSpecTemplatesInner {
  /// Returns a new [IoArgoprojV1alpha1ExperimentSpecTemplatesInner] instance.
  IoArgoprojV1alpha1ExperimentSpecTemplatesInner({
    this.minReadySeconds,
    required this.name,
    this.replicas,
    required this.selector,
    this.service,
    required this.template,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? service;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplate template;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentSpecTemplatesInner &&
          other.minReadySeconds == minReadySeconds &&
          other.name == name &&
          other.replicas == replicas &&
          other.selector == selector &&
          other.service == service &&
          other.template == template;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (name.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (selector.hashCode) +
      (service == null ? 0 : service!.hashCode) +
      (template.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentSpecTemplatesInner[minReadySeconds=$minReadySeconds, name=$name, replicas=$replicas, selector=$selector, service=$service, template=$template]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.minReadySeconds != null) {
      json[r'minReadySeconds'] = this.minReadySeconds;
    } else {
      json[r'minReadySeconds'] = null;
    }
    json[r'name'] = this.name;
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    json[r'selector'] = this.selector;
    if (this.service != null) {
      json[r'service'] = this.service;
    } else {
      json[r'service'] = null;
    }
    json[r'template'] = this.template;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentSpecTemplatesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentSpecTemplatesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentSpecTemplatesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentSpecTemplatesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentSpecTemplatesInner(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        name: mapValueOfType<String>(json, r'name')!,
        replicas: mapValueOfType<int>(json, r'replicas'),
        selector:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecSelector
                .fromJson(json[r'selector'])!,
        service: mapValueOfType<Object>(json, r'service'),
        template:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplate
                .fromJson(json[r'template'])!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentSpecTemplatesInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentSpecTemplatesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ExperimentSpecTemplatesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentSpecTemplatesInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentSpecTemplatesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ExperimentSpecTemplatesInner.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentSpecTemplatesInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentSpecTemplatesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ExperimentSpecTemplatesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ExperimentSpecTemplatesInner.listFromJson(
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
    'selector',
    'template',
  };
}
