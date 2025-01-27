//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_spec_template_spec_containers_inner_lifecycle_post_start_http_get_http_headers_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_initiated_by.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_retry.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync.dart';

class IoArgoprojV1alpha1ApplicationStatusOperationStateOperation {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateOperation] instance.
  IoArgoprojV1alpha1ApplicationStatusOperationStateOperation({
    this.info = const [],
    this.initiatedBy,
    this.retry,
    this.sync_,
  });

  /// Info is a list of informational items for this operation
  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner>
      info;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationInitiatedBy? initiatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationRetry? retry;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSync? sync_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusOperationStateOperation &&
          deepEquality.equals(other.info, info) &&
          other.initiatedBy == initiatedBy &&
          other.retry == retry &&
          other.sync_ == sync_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (info.hashCode) +
      (initiatedBy == null ? 0 : initiatedBy!.hashCode) +
      (retry == null ? 0 : retry!.hashCode) +
      (sync_ == null ? 0 : sync_!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusOperationStateOperation[info=$info, initiatedBy=$initiatedBy, retry=$retry, sync_=$sync_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'info'] = this.info;
    if (this.initiatedBy != null) {
      json[r'initiatedBy'] = this.initiatedBy;
    } else {
      json[r'initiatedBy'] = null;
    }
    if (this.retry != null) {
      json[r'retry'] = this.retry;
    } else {
      json[r'retry'] = null;
    }
    if (this.sync_ != null) {
      json[r'sync'] = this.sync_;
    } else {
      json[r'sync'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateOperation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusOperationStateOperation? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateOperation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateOperation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusOperationStateOperation(
        info:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner
                .listFromJson(json[r'info']),
        initiatedBy: IoArgoprojV1alpha1ApplicationOperationInitiatedBy.fromJson(
            json[r'initiatedBy']),
        retry: IoArgoprojV1alpha1ApplicationOperationRetry.fromJson(
            json[r'retry']),
        sync_:
            IoArgoprojV1alpha1ApplicationOperationSync.fromJson(json[r'sync']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateOperation.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateOperation.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusOperationStateOperation-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationStatusOperationStateOperation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusOperationStateOperation
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
