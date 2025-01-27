//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_status_application_status_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_status_conditions_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_status_resources_inner.dart';

class IoArgoprojV1alpha1ApplicationSetStatus {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetStatus] instance.
  IoArgoprojV1alpha1ApplicationSetStatus({
    this.applicationStatus = const [],
    this.conditions = const [],
    this.resources = const [],
  });

  List<IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>
      applicationStatus;

  List<IoArgoprojV1alpha1ApplicationSetStatusConditionsInner> conditions;

  List<IoArgoprojV1alpha1ApplicationSetStatusResourcesInner> resources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetStatus &&
          deepEquality.equals(other.applicationStatus, applicationStatus) &&
          deepEquality.equals(other.conditions, conditions) &&
          deepEquality.equals(other.resources, resources);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (applicationStatus.hashCode) +
      (conditions.hashCode) +
      (resources.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetStatus[applicationStatus=$applicationStatus, conditions=$conditions, resources=$resources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'applicationStatus'] = this.applicationStatus;
    json[r'conditions'] = this.conditions;
    json[r'resources'] = this.resources;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetStatus(
        applicationStatus:
            IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner
                .listFromJson(json[r'applicationStatus']),
        conditions:
            IoArgoprojV1alpha1ApplicationSetStatusConditionsInner.listFromJson(
                json[r'conditions']),
        resources:
            IoArgoprojV1alpha1ApplicationSetStatusResourcesInner.listFromJson(
                json[r'resources']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationSetStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSetStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSetStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationSetStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationSetStatus.listFromJson(
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
