//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_http_get_http_headers_inner.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet({
    this.host,
    this.httpHeaders = const [],
    this.path,
    required this.port,
    this.scheme,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? host;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner>
      httpHeaders;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  Object port;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet &&
          other.host == host &&
          deepEquality.equals(other.httpHeaders, httpHeaders) &&
          other.path == path &&
          other.port == port &&
          other.scheme == scheme;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (host == null ? 0 : host!.hashCode) +
      (httpHeaders.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (port.hashCode) +
      (scheme == null ? 0 : scheme!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet[host=$host, httpHeaders=$httpHeaders, path=$path, port=$port, scheme=$scheme]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.host != null) {
      json[r'host'] = this.host;
    } else {
      json[r'host'] = null;
    }
    json[r'httpHeaders'] = this.httpHeaders;
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    json[r'port'] = this.port;
    if (this.scheme != null) {
      json[r'scheme'] = this.scheme;
    } else {
      json[r'scheme'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet(
        host: mapValueOfType<String>(json, r'host'),
        httpHeaders:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner
                .listFromJson(json[r'httpHeaders']),
        path: mapValueOfType<String>(json, r'path'),
        port: mapValueOfType<Object>(json, r'port')!,
        scheme: mapValueOfType<String>(json, r'scheme'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGet
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
    'port',
  };
}
