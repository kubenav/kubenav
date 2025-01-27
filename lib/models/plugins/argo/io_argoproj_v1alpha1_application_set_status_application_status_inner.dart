//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner] instance.
  IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner({
    required this.application,
    this.lastTransitionTime,
    required this.message,
    required this.status,
    required this.step,
    this.targetRevisions = const [],
  });

  String application;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  String message;

  String status;

  String step;

  List<String> targetRevisions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner &&
          other.application == application &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.status == status &&
          other.step == step &&
          deepEquality.equals(other.targetRevisions, targetRevisions);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (application.hashCode) +
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message.hashCode) +
      (status.hashCode) +
      (step.hashCode) +
      (targetRevisions.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner[application=$application, lastTransitionTime=$lastTransitionTime, message=$message, status=$status, step=$step, targetRevisions=$targetRevisions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'application'] = this.application;
    if (this.lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          this.lastTransitionTime!.toUtc().toIso8601String();
    } else {
      json[r'lastTransitionTime'] = null;
    }
    json[r'message'] = this.message;
    json[r'status'] = this.status;
    json[r'step'] = this.step;
    json[r'targetRevisions'] = this.targetRevisions;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner(
        application: mapValueOfType<String>(json, r'application')!,
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r''),
        message: mapValueOfType<String>(json, r'message')!,
        status: mapValueOfType<String>(json, r'status')!,
        step: mapValueOfType<String>(json, r'step')!,
        targetRevisions: json[r'targetRevisions'] is Iterable
            ? (json[r'targetRevisions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetStatusApplicationStatusInner
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
    'application',
    'message',
    'status',
    'step',
    'targetRevisions',
  };
}
