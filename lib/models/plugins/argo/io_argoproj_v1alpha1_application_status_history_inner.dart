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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_initiated_by.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_sources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_history_inner_source.dart';

class IoArgoprojV1alpha1ApplicationStatusHistoryInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusHistoryInner] instance.
  IoArgoprojV1alpha1ApplicationStatusHistoryInner({
    this.deployStartedAt,
    required this.deployedAt,
    required this.id,
    this.initiatedBy,
    this.revision,
    this.revisions = const [],
    this.source_,
    this.sources = const [],
  });

  /// DeployStartedAt holds the time the sync operation started
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deployStartedAt;

  /// DeployedAt holds the time the sync operation completed
  DateTime deployedAt;

  /// ID is an auto incrementing identifier of the RevisionHistory
  int id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationInitiatedBy? initiatedBy;

  /// Revision holds the revision the sync was performed against
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? revision;

  /// Revisions holds the revision of each source in sources field the sync was performed against
  List<String> revisions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusHistoryInnerSource? source_;

  /// Sources is a reference to the application sources used for the sync operation
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner> sources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusHistoryInner &&
          other.deployStartedAt == deployStartedAt &&
          other.deployedAt == deployedAt &&
          other.id == id &&
          other.initiatedBy == initiatedBy &&
          other.revision == revision &&
          deepEquality.equals(other.revisions, revisions) &&
          other.source_ == source_ &&
          deepEquality.equals(other.sources, sources);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (deployStartedAt == null ? 0 : deployStartedAt!.hashCode) +
      (deployedAt.hashCode) +
      (id.hashCode) +
      (initiatedBy == null ? 0 : initiatedBy!.hashCode) +
      (revision == null ? 0 : revision!.hashCode) +
      (revisions.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (sources.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusHistoryInner[deployStartedAt=$deployStartedAt, deployedAt=$deployedAt, id=$id, initiatedBy=$initiatedBy, revision=$revision, revisions=$revisions, source_=$source_, sources=$sources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.deployStartedAt != null) {
      json[r'deployStartedAt'] =
          this.deployStartedAt!.toUtc().toIso8601String();
    } else {
      json[r'deployStartedAt'] = null;
    }
    json[r'deployedAt'] = this.deployedAt.toUtc().toIso8601String();
    json[r'id'] = this.id;
    if (this.initiatedBy != null) {
      json[r'initiatedBy'] = this.initiatedBy;
    } else {
      json[r'initiatedBy'] = null;
    }
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
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusHistoryInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusHistoryInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusHistoryInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusHistoryInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusHistoryInner(
        deployStartedAt: mapDateTime(json, r'deployStartedAt', r''),
        deployedAt: mapDateTime(json, r'deployedAt', r'')!,
        id: mapValueOfType<int>(json, r'id')!,
        initiatedBy: IoArgoprojV1alpha1ApplicationOperationInitiatedBy.fromJson(
            json[r'initiatedBy']),
        revision: mapValueOfType<String>(json, r'revision'),
        revisions: json[r'revisions'] is Iterable
            ? (json[r'revisions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        source_: IoArgoprojV1alpha1ApplicationStatusHistoryInnerSource.fromJson(
            json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
                json[r'sources']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusHistoryInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatusHistoryInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusHistoryInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusHistoryInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatusHistoryInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ApplicationStatusHistoryInner.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusHistoryInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatusHistoryInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationStatusHistoryInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusHistoryInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'deployedAt',
    'id',
  };
}
