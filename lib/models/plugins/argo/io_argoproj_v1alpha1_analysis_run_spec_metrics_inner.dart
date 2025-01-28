//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInner {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInner] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInner({
    this.consecutiveErrorLimit,
    this.count,
    this.failureCondition,
    this.failureLimit,
    this.inconclusiveLimit,
    this.initialDelay,
    this.interval,
    required this.name,
    required this.provider,
    this.successCondition,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? consecutiveErrorLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? count;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? failureCondition;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? failureLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? inconclusiveLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? initialDelay;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  String name;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? successCondition;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInner &&
          other.consecutiveErrorLimit == consecutiveErrorLimit &&
          other.count == count &&
          other.failureCondition == failureCondition &&
          other.failureLimit == failureLimit &&
          other.inconclusiveLimit == inconclusiveLimit &&
          other.initialDelay == initialDelay &&
          other.interval == interval &&
          other.name == name &&
          other.provider == provider &&
          other.successCondition == successCondition;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (consecutiveErrorLimit == null ? 0 : consecutiveErrorLimit!.hashCode) +
      (count == null ? 0 : count!.hashCode) +
      (failureCondition == null ? 0 : failureCondition!.hashCode) +
      (failureLimit == null ? 0 : failureLimit!.hashCode) +
      (inconclusiveLimit == null ? 0 : inconclusiveLimit!.hashCode) +
      (initialDelay == null ? 0 : initialDelay!.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (name.hashCode) +
      (provider.hashCode) +
      (successCondition == null ? 0 : successCondition!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInner[consecutiveErrorLimit=$consecutiveErrorLimit, count=$count, failureCondition=$failureCondition, failureLimit=$failureLimit, inconclusiveLimit=$inconclusiveLimit, initialDelay=$initialDelay, interval=$interval, name=$name, provider=$provider, successCondition=$successCondition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.consecutiveErrorLimit != null) {
      json[r'consecutiveErrorLimit'] = this.consecutiveErrorLimit;
    } else {
      json[r'consecutiveErrorLimit'] = null;
    }
    if (this.count != null) {
      json[r'count'] = this.count;
    } else {
      json[r'count'] = null;
    }
    if (this.failureCondition != null) {
      json[r'failureCondition'] = this.failureCondition;
    } else {
      json[r'failureCondition'] = null;
    }
    if (this.failureLimit != null) {
      json[r'failureLimit'] = this.failureLimit;
    } else {
      json[r'failureLimit'] = null;
    }
    if (this.inconclusiveLimit != null) {
      json[r'inconclusiveLimit'] = this.inconclusiveLimit;
    } else {
      json[r'inconclusiveLimit'] = null;
    }
    if (this.initialDelay != null) {
      json[r'initialDelay'] = this.initialDelay;
    } else {
      json[r'initialDelay'] = null;
    }
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    json[r'name'] = this.name;
    json[r'provider'] = this.provider;
    if (this.successCondition != null) {
      json[r'successCondition'] = this.successCondition;
    } else {
      json[r'successCondition'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInner(
        consecutiveErrorLimit:
            mapValueOfType<Object>(json, r'consecutiveErrorLimit'),
        count: mapValueOfType<Object>(json, r'count'),
        failureCondition: mapValueOfType<String>(json, r'failureCondition'),
        failureLimit: mapValueOfType<Object>(json, r'failureLimit'),
        inconclusiveLimit: mapValueOfType<Object>(json, r'inconclusiveLimit'),
        initialDelay: mapValueOfType<String>(json, r'initialDelay'),
        interval: mapValueOfType<String>(json, r'interval'),
        name: mapValueOfType<String>(json, r'name')!,
        provider:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider.fromJson(
                json[r'provider'])!,
        successCondition: mapValueOfType<String>(json, r'successCondition'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunSpecMetricsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInner> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInner.listFromJson(
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
    'provider',
  };
}
