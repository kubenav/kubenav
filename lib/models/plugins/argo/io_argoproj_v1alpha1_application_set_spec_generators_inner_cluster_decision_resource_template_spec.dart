//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_info_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_destination.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_ignore_differences_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_source.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_sync_policy.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec({
    required this.destination,
    this.ignoreDifferences = const [],
    this.info = const [],
    required this.project,
    this.revisionHistoryLimit,
    this.source_,
    this.sources = const [],
    this.syncPolicy,
  });

  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecDestination
      destination;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecIgnoreDifferencesInner>
      ignoreDifferences;

  List<IoArgoprojV1alpha1ApplicationOperationInfoInner> info;

  String project;

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
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSource?
      source_;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSource>
      sources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSyncPolicy?
      syncPolicy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec &&
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
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec[destination=$destination, ignoreDifferences=$ignoreDifferences, info=$info, project=$project, revisionHistoryLimit=$revisionHistoryLimit, source_=$source_, sources=$sources, syncPolicy=$syncPolicy]';

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

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec(
        destination:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecDestination
                .fromJson(json[r'destination'])!,
        ignoreDifferences:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecIgnoreDifferencesInner
                .listFromJson(json[r'ignoreDifferences']),
        info: IoArgoprojV1alpha1ApplicationOperationInfoInner.listFromJson(
            json[r'info']),
        project: mapValueOfType<String>(json, r'project')!,
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        source_:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSource
                .fromJson(json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSource
                .listFromJson(json[r'sources']),
        syncPolicy:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSyncPolicy
                .fromJson(json[r'syncPolicy']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpec
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
    'destination',
    'project',
  };
}
