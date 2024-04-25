//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue({
    this.lastCompleted,
    this.lastStarted,
    this.phase,
  });

  /// LastCompleted is the time the test hook last completed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastCompleted;

  /// LastStarted is the time the test hook was last started.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastStarted;

  /// Phase the test hook was observed to be in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phase;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue &&
          other.lastCompleted == lastCompleted &&
          other.lastStarted == lastStarted &&
          other.phase == phase;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastCompleted == null ? 0 : lastCompleted!.hashCode) +
      (lastStarted == null ? 0 : lastStarted!.hashCode) +
      (phase == null ? 0 : phase!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue[lastCompleted=$lastCompleted, lastStarted=$lastStarted, phase=$phase]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastCompleted != null) {
      json[r'lastCompleted'] = this.lastCompleted!.toUtc().toIso8601String();
    } else {
      json[r'lastCompleted'] = null;
    }
    if (this.lastStarted != null) {
      json[r'lastStarted'] = this.lastStarted!.toUtc().toIso8601String();
    } else {
      json[r'lastStarted'] = null;
    }
    if (this.phase != null) {
      json[r'phase'] = this.phase;
    } else {
      json[r'phase'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue(
        lastCompleted: mapDateTime(json, r'lastCompleted', r''),
        lastStarted: mapDateTime(json, r'lastStarted', r''),
        phase: mapValueOfType<String>(json, r'phase'),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue
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
