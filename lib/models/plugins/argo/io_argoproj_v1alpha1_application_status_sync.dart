//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_sync_compared_to.dart';

class IoArgoprojV1alpha1ApplicationStatusSync {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusSync] instance.
  IoArgoprojV1alpha1ApplicationStatusSync({
    this.comparedTo,
    this.revision,
    this.revisions = const [],
    required this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusSyncComparedTo? comparedTo;

  /// Revision contains information about the revision the comparison has been performed to
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? revision;

  /// Revisions contains information about the revisions of multiple sources the comparison has been performed to
  List<String> revisions;

  /// Status is the sync state of the comparison
  String status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusSync &&
          other.comparedTo == comparedTo &&
          other.revision == revision &&
          deepEquality.equals(other.revisions, revisions) &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (comparedTo == null ? 0 : comparedTo!.hashCode) +
      (revision == null ? 0 : revision!.hashCode) +
      (revisions.hashCode) +
      (status.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusSync[comparedTo=$comparedTo, revision=$revision, revisions=$revisions, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.comparedTo != null) {
      json[r'comparedTo'] = this.comparedTo;
    } else {
      json[r'comparedTo'] = null;
    }
    if (this.revision != null) {
      json[r'revision'] = this.revision;
    } else {
      json[r'revision'] = null;
    }
    json[r'revisions'] = this.revisions;
    json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusSync] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusSync? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusSync[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusSync[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusSync(
        comparedTo: IoArgoprojV1alpha1ApplicationStatusSyncComparedTo.fromJson(
            json[r'comparedTo']),
        revision: mapValueOfType<String>(json, r'revision'),
        revisions: json[r'revisions'] is Iterable
            ? (json[r'revisions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusSync> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatusSync>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationStatusSync.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusSync> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatusSync>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusSync.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusSync-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatusSync>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationStatusSync>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationStatusSync.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
  };
}
