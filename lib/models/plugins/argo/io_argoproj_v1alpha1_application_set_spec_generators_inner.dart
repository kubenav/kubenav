//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_label_selector.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_clusters.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_git.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_list.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_matrix.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_matrix_generators_inner_plugin.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_matrix_generators_inner_pull_request.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_matrix_generators_inner_scm_provider.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_merge.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner({
    this.clusterDecisionResource,
    this.clusters,
    this.git,
    this.list,
    this.matrix,
    this.merge,
    this.plugin,
    this.pullRequest,
    this.scmProvider,
    this.selector,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResource?
      clusterDecisionResource;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusters? clusters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerGit? git;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList? list;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrix? matrix;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMerge? merge;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPlugin?
      plugin;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequest?
      pullRequest;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProvider?
      scmProvider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceLabelSelector?
      selector;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner &&
          other.clusterDecisionResource == clusterDecisionResource &&
          other.clusters == clusters &&
          other.git == git &&
          other.list == list &&
          other.matrix == matrix &&
          other.merge == merge &&
          other.plugin == plugin &&
          other.pullRequest == pullRequest &&
          other.scmProvider == scmProvider &&
          other.selector == selector;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clusterDecisionResource == null
          ? 0
          : clusterDecisionResource!.hashCode) +
      (clusters == null ? 0 : clusters!.hashCode) +
      (git == null ? 0 : git!.hashCode) +
      (list == null ? 0 : list!.hashCode) +
      (matrix == null ? 0 : matrix!.hashCode) +
      (merge == null ? 0 : merge!.hashCode) +
      (plugin == null ? 0 : plugin!.hashCode) +
      (pullRequest == null ? 0 : pullRequest!.hashCode) +
      (scmProvider == null ? 0 : scmProvider!.hashCode) +
      (selector == null ? 0 : selector!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner[clusterDecisionResource=$clusterDecisionResource, clusters=$clusters, git=$git, list=$list, matrix=$matrix, merge=$merge, plugin=$plugin, pullRequest=$pullRequest, scmProvider=$scmProvider, selector=$selector]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.clusterDecisionResource != null) {
      json[r'clusterDecisionResource'] = this.clusterDecisionResource;
    } else {
      json[r'clusterDecisionResource'] = null;
    }
    if (this.clusters != null) {
      json[r'clusters'] = this.clusters;
    } else {
      json[r'clusters'] = null;
    }
    if (this.git != null) {
      json[r'git'] = this.git;
    } else {
      json[r'git'] = null;
    }
    if (this.list != null) {
      json[r'list'] = this.list;
    } else {
      json[r'list'] = null;
    }
    if (this.matrix != null) {
      json[r'matrix'] = this.matrix;
    } else {
      json[r'matrix'] = null;
    }
    if (this.merge != null) {
      json[r'merge'] = this.merge;
    } else {
      json[r'merge'] = null;
    }
    if (this.plugin != null) {
      json[r'plugin'] = this.plugin;
    } else {
      json[r'plugin'] = null;
    }
    if (this.pullRequest != null) {
      json[r'pullRequest'] = this.pullRequest;
    } else {
      json[r'pullRequest'] = null;
    }
    if (this.scmProvider != null) {
      json[r'scmProvider'] = this.scmProvider;
    } else {
      json[r'scmProvider'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner(
        clusterDecisionResource:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResource
                .fromJson(json[r'clusterDecisionResource']),
        clusters: IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusters
            .fromJson(json[r'clusters']),
        git: IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerGit.fromJson(
            json[r'git']),
        list: IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList.fromJson(
            json[r'list']),
        matrix:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrix.fromJson(
                json[r'matrix']),
        merge:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMerge.fromJson(
                json[r'merge']),
        plugin:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPlugin
                .fromJson(json[r'plugin']),
        pullRequest:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequest
                .fromJson(json[r'pullRequest']),
        scmProvider:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProvider
                .fromJson(json[r'scmProvider']),
        selector:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceLabelSelector
                .fromJson(json[r'selector']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner.listFromJson(
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
