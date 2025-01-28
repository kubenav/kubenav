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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_ignore_differences_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_sync_compared_to_destination.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_sync_compared_to_source.dart';

class IoArgoprojV1alpha1ApplicationStatusSyncComparedTo {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusSyncComparedTo] instance.
  IoArgoprojV1alpha1ApplicationStatusSyncComparedTo({
    required this.destination,
    this.ignoreDifferences = const [],
    this.source_,
    this.sources = const [],
  });

  IoArgoprojV1alpha1ApplicationStatusSyncComparedToDestination destination;

  /// IgnoreDifferences is a reference to the application's ignored differences used for comparison
  List<IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>
      ignoreDifferences;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusSyncComparedToSource? source_;

  /// Sources is a reference to the application's multiple sources used for comparison
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner> sources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusSyncComparedTo &&
          other.destination == destination &&
          deepEquality.equals(other.ignoreDifferences, ignoreDifferences) &&
          other.source_ == source_ &&
          deepEquality.equals(other.sources, sources);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (destination.hashCode) +
      (ignoreDifferences.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (sources.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusSyncComparedTo[destination=$destination, ignoreDifferences=$ignoreDifferences, source_=$source_, sources=$sources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'destination'] = this.destination;
    json[r'ignoreDifferences'] = this.ignoreDifferences;
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    json[r'sources'] = this.sources;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusSyncComparedTo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusSyncComparedTo? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatusSyncComparedTo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatusSyncComparedTo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusSyncComparedTo(
        destination:
            IoArgoprojV1alpha1ApplicationStatusSyncComparedToDestination
                .fromJson(json[r'destination'])!,
        ignoreDifferences:
            IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner
                .listFromJson(json[r'ignoreDifferences']),
        source_:
            IoArgoprojV1alpha1ApplicationStatusSyncComparedToSource.fromJson(
                json[r'source']),
        sources:
            IoArgoprojV1alpha1ApplicationOperationSyncSourcesInner.listFromJson(
                json[r'sources']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatusSyncComparedTo> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatusSyncComparedTo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusSyncComparedTo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatusSyncComparedTo>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatusSyncComparedTo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusSyncComparedTo.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusSyncComparedTo-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatusSyncComparedTo>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationStatusSyncComparedTo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusSyncComparedTo.listFromJson(
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
  };
}
