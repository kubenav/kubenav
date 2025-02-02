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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_resources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_sources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_sync_strategy.dart';

class IoArgoprojV1alpha1ApplicationOperationSync {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSync] instance.
  IoArgoprojV1alpha1ApplicationOperationSync({
    this.autoHealAttemptsCount,
    this.dryRun,
    this.manifests = const [],
    this.prune,
    this.resources = const [],
    this.revision,
    this.revisions = const [],
    this.source_,
    this.sources = const [],
    this.syncOptions = const [],
    this.syncStrategy,
  });

  /// SelfHealAttemptsCount contains the number of auto-heal attempts
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? autoHealAttemptsCount;

  /// DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the sync
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? dryRun;

  /// Manifests is an optional field that overrides sync source with a local directory for development
  List<String> manifests;

  /// Prune specifies to delete resources from the cluster that are no longer tracked in git
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? prune;

  /// Resources describes which resources shall be part of the sync
  List<IoArgoprojV1alpha1ApplicationOperationSyncResourcesInner> resources;

  /// Revision is the revision (Git) or chart version (Helm) which to sync the application to If omitted, will use the revision specified in app spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? revision;

  /// Revisions is the list of revision (Git) or chart version (Helm) which to sync each source in sources field for the application to If omitted, will use the revision specified in app spec.
  List<String> revisions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSource? source_;

  /// Sources overrides the source definition set in the application. This is typically set in a Rollback operation and is nil during a Sync operation
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner> sources;

  /// SyncOptions provide per-sync sync-options, e.g. Validate=false
  List<String> syncOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSyncStrategy? syncStrategy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationOperationSync &&
          other.autoHealAttemptsCount == autoHealAttemptsCount &&
          other.dryRun == dryRun &&
          deepEquality.equals(other.manifests, manifests) &&
          other.prune == prune &&
          deepEquality.equals(other.resources, resources) &&
          other.revision == revision &&
          deepEquality.equals(other.revisions, revisions) &&
          other.source_ == source_ &&
          deepEquality.equals(other.sources, sources) &&
          deepEquality.equals(other.syncOptions, syncOptions) &&
          other.syncStrategy == syncStrategy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (autoHealAttemptsCount == null ? 0 : autoHealAttemptsCount!.hashCode) +
      (dryRun == null ? 0 : dryRun!.hashCode) +
      (manifests.hashCode) +
      (prune == null ? 0 : prune!.hashCode) +
      (resources.hashCode) +
      (revision == null ? 0 : revision!.hashCode) +
      (revisions.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (sources.hashCode) +
      (syncOptions.hashCode) +
      (syncStrategy == null ? 0 : syncStrategy!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationOperationSync[autoHealAttemptsCount=$autoHealAttemptsCount, dryRun=$dryRun, manifests=$manifests, prune=$prune, resources=$resources, revision=$revision, revisions=$revisions, source_=$source_, sources=$sources, syncOptions=$syncOptions, syncStrategy=$syncStrategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.autoHealAttemptsCount != null) {
      json[r'autoHealAttemptsCount'] = this.autoHealAttemptsCount;
    } else {
      json[r'autoHealAttemptsCount'] = null;
    }
    if (this.dryRun != null) {
      json[r'dryRun'] = this.dryRun;
    } else {
      json[r'dryRun'] = null;
    }
    json[r'manifests'] = this.manifests;
    if (this.prune != null) {
      json[r'prune'] = this.prune;
    } else {
      json[r'prune'] = null;
    }
    json[r'resources'] = this.resources;
    if (this.revision != null) {
      json[r'revision'] = this.revision;
    } else {
      json[r'revision'] = null;
    }
    json[r'revisions'] = this.revisions;
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    json[r'sources'] = this.sources;
    json[r'syncOptions'] = this.syncOptions;
    if (this.syncStrategy != null) {
      json[r'syncStrategy'] = this.syncStrategy;
    } else {
      json[r'syncStrategy'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSync] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationSync? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationSync[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationSync[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationSync(
        autoHealAttemptsCount:
            mapValueOfType<int>(json, r'autoHealAttemptsCount'),
        dryRun: mapValueOfType<bool>(json, r'dryRun'),
        manifests: json[r'manifests'] is Iterable
            ? (json[r'manifests'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        prune: mapValueOfType<bool>(json, r'prune'),
        resources: IoArgoprojV1alpha1ApplicationOperationSyncResourcesInner
            .listFromJson(json[r'resources']),
        revision: mapValueOfType<String>(json, r'revision'),
        revisions: json[r'revisions'] is Iterable
            ? (json[r'revisions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        source_: IoArgoprojV1alpha1ApplicationOperationSyncSource.fromJson(
            json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
                json[r'sources']),
        syncOptions: json[r'syncOptions'] is Iterable
            ? (json[r'syncOptions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        syncStrategy:
            IoArgoprojV1alpha1ApplicationOperationSyncSyncStrategy.fromJson(
                json[r'syncStrategy']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationOperationSync> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationOperationSync>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationOperationSync.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationOperationSync> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationOperationSync>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSync.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationSync-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationOperationSync>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationOperationSync>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationSync.listFromJson(
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
