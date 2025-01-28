//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_cloud_watch.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_datadog.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_graphite.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_influxdb.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_kayenta.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_new_relic.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_web.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider({
    this.cloudWatch,
    this.datadog,
    this.graphite,
    this.influxdb,
    this.job,
    this.kayenta,
    this.newRelic,
    this.prometheus,
    this.wavefront,
    this.web,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatch? cloudWatch;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderDatadog? datadog;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite? graphite;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderInfluxdb? influxdb;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob? job;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta? kayenta;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderNewRelic? newRelic;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite? prometheus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite? wavefront;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderWeb? web;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider &&
          other.cloudWatch == cloudWatch &&
          other.datadog == datadog &&
          other.graphite == graphite &&
          other.influxdb == influxdb &&
          other.job == job &&
          other.kayenta == kayenta &&
          other.newRelic == newRelic &&
          other.prometheus == prometheus &&
          other.wavefront == wavefront &&
          other.web == web;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cloudWatch == null ? 0 : cloudWatch!.hashCode) +
      (datadog == null ? 0 : datadog!.hashCode) +
      (graphite == null ? 0 : graphite!.hashCode) +
      (influxdb == null ? 0 : influxdb!.hashCode) +
      (job == null ? 0 : job!.hashCode) +
      (kayenta == null ? 0 : kayenta!.hashCode) +
      (newRelic == null ? 0 : newRelic!.hashCode) +
      (prometheus == null ? 0 : prometheus!.hashCode) +
      (wavefront == null ? 0 : wavefront!.hashCode) +
      (web == null ? 0 : web!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider[cloudWatch=$cloudWatch, datadog=$datadog, graphite=$graphite, influxdb=$influxdb, job=$job, kayenta=$kayenta, newRelic=$newRelic, prometheus=$prometheus, wavefront=$wavefront, web=$web]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cloudWatch != null) {
      json[r'cloudWatch'] = this.cloudWatch;
    } else {
      json[r'cloudWatch'] = null;
    }
    if (this.datadog != null) {
      json[r'datadog'] = this.datadog;
    } else {
      json[r'datadog'] = null;
    }
    if (this.graphite != null) {
      json[r'graphite'] = this.graphite;
    } else {
      json[r'graphite'] = null;
    }
    if (this.influxdb != null) {
      json[r'influxdb'] = this.influxdb;
    } else {
      json[r'influxdb'] = null;
    }
    if (this.job != null) {
      json[r'job'] = this.job;
    } else {
      json[r'job'] = null;
    }
    if (this.kayenta != null) {
      json[r'kayenta'] = this.kayenta;
    } else {
      json[r'kayenta'] = null;
    }
    if (this.newRelic != null) {
      json[r'newRelic'] = this.newRelic;
    } else {
      json[r'newRelic'] = null;
    }
    if (this.prometheus != null) {
      json[r'prometheus'] = this.prometheus;
    } else {
      json[r'prometheus'] = null;
    }
    if (this.wavefront != null) {
      json[r'wavefront'] = this.wavefront;
    } else {
      json[r'wavefront'] = null;
    }
    if (this.web != null) {
      json[r'web'] = this.web;
    } else {
      json[r'web'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider(
        cloudWatch:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderCloudWatch
                .fromJson(json[r'cloudWatch']),
        datadog: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderDatadog
            .fromJson(json[r'datadog']),
        graphite: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite
            .fromJson(json[r'graphite']),
        influxdb: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderInfluxdb
            .fromJson(json[r'influxdb']),
        job: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJob.fromJson(
            json[r'job']),
        kayenta: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta
            .fromJson(json[r'kayenta']),
        newRelic: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderNewRelic
            .fromJson(json[r'newRelic']),
        prometheus:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite
                .fromJson(json[r'prometheus']),
        wavefront: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderGraphite
            .fromJson(json[r'wavefront']),
        web: IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderWeb.fromJson(
            json[r'web']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProvider.listFromJson(
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
