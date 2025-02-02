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

class IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner] instance.
  IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner({
    this.applications = const [],
    this.clusters = const [],
    this.duration,
    this.kind,
    this.manualSync,
    this.namespaces = const [],
    this.schedule,
    this.timeZone,
  });

  /// Applications contains a list of applications that the window will apply to
  List<String> applications;

  /// Clusters contains a list of clusters that the window will apply to
  List<String> clusters;

  /// Duration is the amount of time the sync window will be open
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  /// Kind defines if the window allows or blocks syncs
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// ManualSync enables manual syncs when they would otherwise be blocked
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? manualSync;

  /// Namespaces contains a list of namespaces that the window will apply to
  List<String> namespaces;

  /// Schedule is the time the window will begin, specified in cron format
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? schedule;

  /// TimeZone of the sync that will be applied to the schedule
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeZone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner &&
          deepEquality.equals(other.applications, applications) &&
          deepEquality.equals(other.clusters, clusters) &&
          other.duration == duration &&
          other.kind == kind &&
          other.manualSync == manualSync &&
          deepEquality.equals(other.namespaces, namespaces) &&
          other.schedule == schedule &&
          other.timeZone == timeZone;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (applications.hashCode) +
      (clusters.hashCode) +
      (duration == null ? 0 : duration!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (manualSync == null ? 0 : manualSync!.hashCode) +
      (namespaces.hashCode) +
      (schedule == null ? 0 : schedule!.hashCode) +
      (timeZone == null ? 0 : timeZone!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner[applications=$applications, clusters=$clusters, duration=$duration, kind=$kind, manualSync=$manualSync, namespaces=$namespaces, schedule=$schedule, timeZone=$timeZone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'applications'] = this.applications;
    json[r'clusters'] = this.clusters;
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    if (this.manualSync != null) {
      json[r'manualSync'] = this.manualSync;
    } else {
      json[r'manualSync'] = null;
    }
    json[r'namespaces'] = this.namespaces;
    if (this.schedule != null) {
      json[r'schedule'] = this.schedule;
    } else {
      json[r'schedule'] = null;
    }
    if (this.timeZone != null) {
      json[r'timeZone'] = this.timeZone;
    } else {
      json[r'timeZone'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner(
        applications: json[r'applications'] is Iterable
            ? (json[r'applications'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        clusters: json[r'clusters'] is Iterable
            ? (json[r'clusters'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        duration: mapValueOfType<String>(json, r'duration'),
        kind: mapValueOfType<String>(json, r'kind'),
        manualSync: mapValueOfType<bool>(json, r'manualSync'),
        namespaces: json[r'namespaces'] is Iterable
            ? (json[r'namespaces'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        schedule: mapValueOfType<String>(json, r'schedule'),
        timeZone: mapValueOfType<String>(json, r'timeZone'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner.listFromJson(
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
