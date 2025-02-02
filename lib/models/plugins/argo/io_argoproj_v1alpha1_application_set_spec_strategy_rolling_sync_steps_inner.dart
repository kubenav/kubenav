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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_strategy_rolling_sync_steps_inner_match_expressions_inner.dart';

class IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner] instance.
  IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner({
    this.matchExpressions = const [],
    this.maxUpdate,
  });

  List<IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInnerMatchExpressionsInner>
      matchExpressions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? maxUpdate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner &&
          deepEquality.equals(other.matchExpressions, matchExpressions) &&
          other.maxUpdate == maxUpdate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (matchExpressions.hashCode) +
      (maxUpdate == null ? 0 : maxUpdate!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner[matchExpressions=$matchExpressions, maxUpdate=$maxUpdate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'matchExpressions'] = this.matchExpressions;
    if (this.maxUpdate != null) {
      json[r'maxUpdate'] = this.maxUpdate;
    } else {
      json[r'maxUpdate'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner(
        matchExpressions:
            IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInnerMatchExpressionsInner
                .listFromJson(json[r'matchExpressions']),
        maxUpdate: mapValueOfType<Object>(json, r'maxUpdate'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecStrategyRollingSyncStepsInner
                .listFromJson(
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
