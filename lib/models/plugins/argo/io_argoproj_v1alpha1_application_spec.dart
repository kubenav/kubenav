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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_sources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_destination.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_ignore_differences_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_source.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_sync_policy.dart';

class IoArgoprojV1alpha1ApplicationSpec {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSpec] instance.
  IoArgoprojV1alpha1ApplicationSpec({
    required this.destination,
    this.ignoreDifferences = const [],
    this.info = const [],
    required this.project,
    this.revisionHistoryLimit,
    this.source_,
    this.sources = const [],
    this.syncPolicy,
  });

  IoArgoprojV1alpha1ApplicationSpecDestination destination;

  /// IgnoreDifferences is a list of resources and their fields which should be ignored during comparison
  List<IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>
      ignoreDifferences;

  /// Info contains a list of information (URLs, email addresses, and plain text) that relates to the application
  List<IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner>
      info;

  /// Project is a reference to the project this application belongs to. The empty string means that application belongs to the 'default' project.
  String project;

  /// RevisionHistoryLimit limits the number of items kept in the application's revision history, which is used for informational purposes as well as for rollbacks to previous versions. This should only be changed in exceptional circumstances. Setting to zero will store no history. This will reduce storage used. Increasing will increase the space used to store the history, so we do not recommend increasing it. Default is 10.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSpecSource? source_;

  /// Sources is a reference to the location of the application's manifests or chart
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner> sources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSpecSyncPolicy? syncPolicy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSpec &&
          other.destination == destination &&
          deepEquality.equals(other.ignoreDifferences, ignoreDifferences) &&
          deepEquality.equals(other.info, info) &&
          other.project == project &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.source_ == source_ &&
          deepEquality.equals(other.sources, sources) &&
          other.syncPolicy == syncPolicy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (destination.hashCode) +
      (ignoreDifferences.hashCode) +
      (info.hashCode) +
      (project.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (sources.hashCode) +
      (syncPolicy == null ? 0 : syncPolicy!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSpec[destination=$destination, ignoreDifferences=$ignoreDifferences, info=$info, project=$project, revisionHistoryLimit=$revisionHistoryLimit, source_=$source_, sources=$sources, syncPolicy=$syncPolicy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'destination'] = this.destination;
    json[r'ignoreDifferences'] = this.ignoreDifferences;
    json[r'info'] = this.info;
    json[r'project'] = this.project;
    if (this.revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = this.revisionHistoryLimit;
    } else {
      json[r'revisionHistoryLimit'] = null;
    }
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    json[r'sources'] = this.sources;
    if (this.syncPolicy != null) {
      json[r'syncPolicy'] = this.syncPolicy;
    } else {
      json[r'syncPolicy'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSpec(
        destination: IoArgoprojV1alpha1ApplicationSpecDestination.fromJson(
            json[r'destination'])!,
        ignoreDifferences:
            IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner
                .listFromJson(json[r'ignoreDifferences']),
        info:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobSpecTemplateSpecContainersInnerLifecyclePostStartHttpGetHttpHeadersInner
                .listFromJson(json[r'info']),
        project: mapValueOfType<String>(json, r'project')!,
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        source_:
            IoArgoprojV1alpha1ApplicationSpecSource.fromJson(json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
                json[r'sources']),
        syncPolicy: IoArgoprojV1alpha1ApplicationSpecSyncPolicy.fromJson(
            json[r'syncPolicy']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ApplicationSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'destination',
    'project',
  };
}
