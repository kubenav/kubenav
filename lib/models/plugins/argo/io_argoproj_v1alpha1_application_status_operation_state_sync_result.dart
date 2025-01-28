//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_sources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state_sync_result_managed_namespace_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state_sync_result_resources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state_sync_result_source.dart';

class IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult] instance.
  IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult({
    this.managedNamespaceMetadata,
    this.resources = const [],
    required this.revision,
    this.revisions = const [],
    this.source_,
    this.sources = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultManagedNamespaceMetadata?
      managedNamespaceMetadata;

  /// Resources contains a list of sync result items for each individual resource in a sync operation
  List<IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>
      resources;

  /// Revision holds the revision this sync operation was performed to
  String revision;

  /// Revisions holds the revision this sync operation was performed for respective indexed source in sources field
  List<String> revisions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultSource? source_;

  /// Source records the application source information of the sync, used for comparing auto-sync
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner> sources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult &&
          other.managedNamespaceMetadata == managedNamespaceMetadata &&
          deepEquality.equals(other.resources, resources) &&
          other.revision == revision &&
          deepEquality.equals(other.revisions, revisions) &&
          other.source_ == source_ &&
          deepEquality.equals(other.sources, sources);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (managedNamespaceMetadata == null
          ? 0
          : managedNamespaceMetadata!.hashCode) +
      (resources.hashCode) +
      (revision.hashCode) +
      (revisions.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (sources.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult[managedNamespaceMetadata=$managedNamespaceMetadata, resources=$resources, revision=$revision, revisions=$revisions, source_=$source_, sources=$sources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.managedNamespaceMetadata != null) {
      json[r'managedNamespaceMetadata'] = this.managedNamespaceMetadata;
    } else {
      json[r'managedNamespaceMetadata'] = null;
    }
    json[r'resources'] = this.resources;
    json[r'revision'] = this.revision;
    json[r'revisions'] = this.revisions;
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    json[r'sources'] = this.sources;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult(
        managedNamespaceMetadata:
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultManagedNamespaceMetadata
                .fromJson(json[r'managedNamespaceMetadata']),
        resources:
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner
                .listFromJson(json[r'resources']),
        revision: mapValueOfType<String>(json, r'revision')!,
        revisions: json[r'revisions'] is Iterable
            ? (json[r'revisions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        source_:
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultSource
                .fromJson(json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
                json[r'sources']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResult
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
    'revision',
  };
}
