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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_directory.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_helm.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_kustomize.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_plugin.dart';

class IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner] instance.
  IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.path,
    this.plugin,
    this.ref,
    required this.repoURL,
    this.targetRevision,
  });

  /// Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? chart;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory? directory;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm? helm;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSourceKustomize? kustomize;

  /// Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSourcePlugin? plugin;

  /// Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ref;

  /// RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  String repoURL;

  /// TargetRevision defines the revision of the source to sync the application to. In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD. In case of Helm, this is a semver tag for the Chart's version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetRevision;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner &&
          other.chart == chart &&
          other.directory == directory &&
          other.helm == helm &&
          other.kustomize == kustomize &&
          other.path == path &&
          other.plugin == plugin &&
          other.ref == ref &&
          other.repoURL == repoURL &&
          other.targetRevision == targetRevision;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (chart == null ? 0 : chart!.hashCode) +
      (directory == null ? 0 : directory!.hashCode) +
      (helm == null ? 0 : helm!.hashCode) +
      (kustomize == null ? 0 : kustomize!.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (plugin == null ? 0 : plugin!.hashCode) +
      (ref == null ? 0 : ref!.hashCode) +
      (repoURL.hashCode) +
      (targetRevision == null ? 0 : targetRevision!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner[chart=$chart, directory=$directory, helm=$helm, kustomize=$kustomize, path=$path, plugin=$plugin, ref=$ref, repoURL=$repoURL, targetRevision=$targetRevision]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.chart != null) {
      json[r'chart'] = this.chart;
    } else {
      json[r'chart'] = null;
    }
    if (this.directory != null) {
      json[r'directory'] = this.directory;
    } else {
      json[r'directory'] = null;
    }
    if (this.helm != null) {
      json[r'helm'] = this.helm;
    } else {
      json[r'helm'] = null;
    }
    if (this.kustomize != null) {
      json[r'kustomize'] = this.kustomize;
    } else {
      json[r'kustomize'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.plugin != null) {
      json[r'plugin'] = this.plugin;
    } else {
      json[r'plugin'] = null;
    }
    if (this.ref != null) {
      json[r'ref'] = this.ref;
    } else {
      json[r'ref'] = null;
    }
    json[r'repoURL'] = this.repoURL;
    if (this.targetRevision != null) {
      json[r'targetRevision'] = this.targetRevision;
    } else {
      json[r'targetRevision'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner(
        chart: mapValueOfType<String>(json, r'chart'),
        directory:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory.fromJson(
                json[r'directory']),
        helm: IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm.fromJson(
            json[r'helm']),
        kustomize:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceKustomize.fromJson(
                json[r'kustomize']),
        path: mapValueOfType<String>(json, r'path'),
        plugin: IoArgoprojV1alpha1ApplicationOperationSyncSourcePlugin.fromJson(
            json[r'plugin']),
        ref: mapValueOfType<String>(json, r'ref'),
        repoURL: mapValueOfType<String>(json, r'repoURL')!,
        targetRevision: mapValueOfType<String>(json, r'targetRevision'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'repoURL',
  };
}
