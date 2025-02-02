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

class IoArgoprojV1alpha1ApplicationSetSpecPreservedFields {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecPreservedFields] instance.
  IoArgoprojV1alpha1ApplicationSetSpecPreservedFields({
    this.annotations = const [],
    this.labels = const [],
  });

  List<String> annotations;

  List<String> labels;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecPreservedFields &&
          deepEquality.equals(other.annotations, annotations) &&
          deepEquality.equals(other.labels, labels);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (annotations.hashCode) + (labels.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecPreservedFields[annotations=$annotations, labels=$labels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'annotations'] = this.annotations;
    json[r'labels'] = this.labels;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecPreservedFields] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecPreservedFields? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecPreservedFields[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecPreservedFields[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecPreservedFields(
        annotations: json[r'annotations'] is Iterable
            ? (json[r'annotations'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        labels: json[r'labels'] is Iterable
            ? (json[r'labels'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpecPreservedFields> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetSpecPreservedFields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecPreservedFields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetSpecPreservedFields>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSetSpecPreservedFields>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecPreservedFields.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecPreservedFields-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSetSpecPreservedFields>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationSetSpecPreservedFields>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecPreservedFields.listFromJson(
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
