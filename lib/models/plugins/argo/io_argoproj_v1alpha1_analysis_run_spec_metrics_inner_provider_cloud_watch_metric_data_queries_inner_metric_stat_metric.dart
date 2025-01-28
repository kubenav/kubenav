//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_cloud_watch_metric_data_queries_inner_metric_stat_metric_dimensions_inner.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric({
    this.dimensions = const [],
    this.metricName,
    this.namespace,
  });

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetricDimensionsInner> dimensions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? metricName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric &&
    deepEquality.equals(other.dimensions, dimensions) &&
    other.metricName == metricName &&
    other.namespace == namespace;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dimensions.hashCode) +
    (metricName == null ? 0 : metricName!.hashCode) +
    (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() => 'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric[dimensions=$dimensions, metricName=$metricName, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dimensions'] = this.dimensions;
    if (this.metricName != null) {
      json[r'metricName'] = this.metricName;
    } else {
      json[r'metricName'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric(
        dimensions: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetricDimensionsInner.listFromJson(json[r'dimensions']),
        metricName: mapValueOfType<String>(json, r'metricName'),
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric> mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatchMetricDataQueriesInnerMetricStatMetric.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

