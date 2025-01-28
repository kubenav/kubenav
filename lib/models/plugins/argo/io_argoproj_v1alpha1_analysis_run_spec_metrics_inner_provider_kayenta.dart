//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_kayenta_scopes_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_kayenta_threshold.dart';

class IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta] instance.
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta({
    required this.address,
    required this.application,
    required this.canaryConfigName,
    required this.configurationAccountName,
    required this.metricsAccountName,
    this.scopes = const [],
    required this.storageAccountName,
    required this.threshold,
  });

  String address;

  String application;

  String canaryConfigName;

  String configurationAccountName;

  String metricsAccountName;

  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayentaScopesInner>
      scopes;

  String storageAccountName;

  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayentaThreshold
      threshold;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta &&
          other.address == address &&
          other.application == application &&
          other.canaryConfigName == canaryConfigName &&
          other.configurationAccountName == configurationAccountName &&
          other.metricsAccountName == metricsAccountName &&
          deepEquality.equals(other.scopes, scopes) &&
          other.storageAccountName == storageAccountName &&
          other.threshold == threshold;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (address.hashCode) +
      (application.hashCode) +
      (canaryConfigName.hashCode) +
      (configurationAccountName.hashCode) +
      (metricsAccountName.hashCode) +
      (scopes.hashCode) +
      (storageAccountName.hashCode) +
      (threshold.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta[address=$address, application=$application, canaryConfigName=$canaryConfigName, configurationAccountName=$configurationAccountName, metricsAccountName=$metricsAccountName, scopes=$scopes, storageAccountName=$storageAccountName, threshold=$threshold]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'address'] = this.address;
    json[r'application'] = this.application;
    json[r'canaryConfigName'] = this.canaryConfigName;
    json[r'configurationAccountName'] = this.configurationAccountName;
    json[r'metricsAccountName'] = this.metricsAccountName;
    json[r'scopes'] = this.scopes;
    json[r'storageAccountName'] = this.storageAccountName;
    json[r'threshold'] = this.threshold;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta(
        address: mapValueOfType<String>(json, r'address')!,
        application: mapValueOfType<String>(json, r'application')!,
        canaryConfigName: mapValueOfType<String>(json, r'canaryConfigName')!,
        configurationAccountName:
            mapValueOfType<String>(json, r'configurationAccountName')!,
        metricsAccountName:
            mapValueOfType<String>(json, r'metricsAccountName')!,
        scopes:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayentaScopesInner
                .listFromJson(json[r'scopes']),
        storageAccountName:
            mapValueOfType<String>(json, r'storageAccountName')!,
        threshold:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayentaThreshold
                .fromJson(json[r'threshold'])!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderKayenta
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
    'address',
    'application',
    'canaryConfigName',
    'configurationAccountName',
    'metricsAccountName',
    'scopes',
    'storageAccountName',
    'threshold',
  };
}
