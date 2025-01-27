//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_blue_green_post_promotion_analysis_run_status.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_canary_weights.dart';

class IoArgoprojV1alpha1RolloutStatusCanary {
  /// Returns a new [IoArgoprojV1alpha1RolloutStatusCanary] instance.
  IoArgoprojV1alpha1RolloutStatusCanary({
    this.currentBackgroundAnalysisRunStatus,
    this.currentExperiment,
    this.currentStepAnalysisRunStatus,
    this.stablePingPong,
    this.weights,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus?
      currentBackgroundAnalysisRunStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currentExperiment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus?
      currentStepAnalysisRunStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stablePingPong;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusCanaryWeights? weights;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutStatusCanary &&
          other.currentBackgroundAnalysisRunStatus ==
              currentBackgroundAnalysisRunStatus &&
          other.currentExperiment == currentExperiment &&
          other.currentStepAnalysisRunStatus == currentStepAnalysisRunStatus &&
          other.stablePingPong == stablePingPong &&
          other.weights == weights;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (currentBackgroundAnalysisRunStatus == null
          ? 0
          : currentBackgroundAnalysisRunStatus!.hashCode) +
      (currentExperiment == null ? 0 : currentExperiment!.hashCode) +
      (currentStepAnalysisRunStatus == null
          ? 0
          : currentStepAnalysisRunStatus!.hashCode) +
      (stablePingPong == null ? 0 : stablePingPong!.hashCode) +
      (weights == null ? 0 : weights!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutStatusCanary[currentBackgroundAnalysisRunStatus=$currentBackgroundAnalysisRunStatus, currentExperiment=$currentExperiment, currentStepAnalysisRunStatus=$currentStepAnalysisRunStatus, stablePingPong=$stablePingPong, weights=$weights]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.currentBackgroundAnalysisRunStatus != null) {
      json[r'currentBackgroundAnalysisRunStatus'] =
          this.currentBackgroundAnalysisRunStatus;
    } else {
      json[r'currentBackgroundAnalysisRunStatus'] = null;
    }
    if (this.currentExperiment != null) {
      json[r'currentExperiment'] = this.currentExperiment;
    } else {
      json[r'currentExperiment'] = null;
    }
    if (this.currentStepAnalysisRunStatus != null) {
      json[r'currentStepAnalysisRunStatus'] = this.currentStepAnalysisRunStatus;
    } else {
      json[r'currentStepAnalysisRunStatus'] = null;
    }
    if (this.stablePingPong != null) {
      json[r'stablePingPong'] = this.stablePingPong;
    } else {
      json[r'stablePingPong'] = null;
    }
    if (this.weights != null) {
      json[r'weights'] = this.weights;
    } else {
      json[r'weights'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutStatusCanary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutStatusCanary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutStatusCanary[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutStatusCanary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutStatusCanary(
        currentBackgroundAnalysisRunStatus:
            IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus
                .fromJson(json[r'currentBackgroundAnalysisRunStatus']),
        currentExperiment: mapValueOfType<String>(json, r'currentExperiment'),
        currentStepAnalysisRunStatus:
            IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus
                .fromJson(json[r'currentStepAnalysisRunStatus']),
        stablePingPong: mapValueOfType<String>(json, r'stablePingPong'),
        weights: IoArgoprojV1alpha1RolloutStatusCanaryWeights.fromJson(
            json[r'weights']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutStatusCanary> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutStatusCanary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutStatusCanary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutStatusCanary> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutStatusCanary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutStatusCanary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutStatusCanary-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutStatusCanary>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutStatusCanary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1RolloutStatusCanary.listFromJson(
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
