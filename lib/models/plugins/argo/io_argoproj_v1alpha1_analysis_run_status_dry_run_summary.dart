//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, avoid_function_literals_in_foreach_calls, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary] instance.
  IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary({
    this.count,
    this.error,
    this.failed,
    this.inconclusive,
    this.successful,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? count;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? inconclusive;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? successful;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary &&
          other.count == count &&
          other.error == error &&
          other.failed == failed &&
          other.inconclusive == inconclusive &&
          other.successful == successful;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (count == null ? 0 : count!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (failed == null ? 0 : failed!.hashCode) +
      (inconclusive == null ? 0 : inconclusive!.hashCode) +
      (successful == null ? 0 : successful!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary[count=$count, error=$error, failed=$failed, inconclusive=$inconclusive, successful=$successful]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.count != null) {
      json[r'count'] = this.count;
    } else {
      json[r'count'] = null;
    }
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.failed != null) {
      json[r'failed'] = this.failed;
    } else {
      json[r'failed'] = null;
    }
    if (this.inconclusive != null) {
      json[r'inconclusive'] = this.inconclusive;
    } else {
      json[r'inconclusive'] = null;
    }
    if (this.successful != null) {
      json[r'successful'] = this.successful;
    } else {
      json[r'successful'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary(
        count: mapValueOfType<int>(json, r'count'),
        error: mapValueOfType<int>(json, r'error'),
        failed: mapValueOfType<int>(json, r'failed'),
        inconclusive: mapValueOfType<int>(json, r'inconclusive'),
        successful: mapValueOfType<int>(json, r'successful'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunStatusDryRunSummary.listFromJson(
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
