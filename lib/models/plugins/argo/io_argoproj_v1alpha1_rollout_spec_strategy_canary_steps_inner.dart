//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_blue_green_post_promotion_analysis.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_experiment.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_pause.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_set_canary_scale.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_set_header_route.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner_set_mirror_route.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner({
    this.analysis,
    this.experiment,
    this.pause,
    this.setCanaryScale,
    this.setHeaderRoute,
    this.setMirrorRoute,
    this.setWeight,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis? analysis;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperiment? experiment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerPause? pause;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale?
      setCanaryScale;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRoute?
      setHeaderRoute;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute?
      setMirrorRoute;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? setWeight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner &&
          other.analysis == analysis &&
          other.experiment == experiment &&
          other.pause == pause &&
          other.setCanaryScale == setCanaryScale &&
          other.setHeaderRoute == setHeaderRoute &&
          other.setMirrorRoute == setMirrorRoute &&
          other.setWeight == setWeight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (analysis == null ? 0 : analysis!.hashCode) +
      (experiment == null ? 0 : experiment!.hashCode) +
      (pause == null ? 0 : pause!.hashCode) +
      (setCanaryScale == null ? 0 : setCanaryScale!.hashCode) +
      (setHeaderRoute == null ? 0 : setHeaderRoute!.hashCode) +
      (setMirrorRoute == null ? 0 : setMirrorRoute!.hashCode) +
      (setWeight == null ? 0 : setWeight!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner[analysis=$analysis, experiment=$experiment, pause=$pause, setCanaryScale=$setCanaryScale, setHeaderRoute=$setHeaderRoute, setMirrorRoute=$setMirrorRoute, setWeight=$setWeight]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.analysis != null) {
      json[r'analysis'] = this.analysis;
    } else {
      json[r'analysis'] = null;
    }
    if (this.experiment != null) {
      json[r'experiment'] = this.experiment;
    } else {
      json[r'experiment'] = null;
    }
    if (this.pause != null) {
      json[r'pause'] = this.pause;
    } else {
      json[r'pause'] = null;
    }
    if (this.setCanaryScale != null) {
      json[r'setCanaryScale'] = this.setCanaryScale;
    } else {
      json[r'setCanaryScale'] = null;
    }
    if (this.setHeaderRoute != null) {
      json[r'setHeaderRoute'] = this.setHeaderRoute;
    } else {
      json[r'setHeaderRoute'] = null;
    }
    if (this.setMirrorRoute != null) {
      json[r'setMirrorRoute'] = this.setMirrorRoute;
    } else {
      json[r'setMirrorRoute'] = null;
    }
    if (this.setWeight != null) {
      json[r'setWeight'] = this.setWeight;
    } else {
      json[r'setWeight'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner(
        analysis:
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis
                .fromJson(json[r'analysis']),
        experiment:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerExperiment
                .fromJson(json[r'experiment']),
        pause:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerPause.fromJson(
                json[r'pause']),
        setCanaryScale:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetCanaryScale
                .fromJson(json[r'setCanaryScale']),
        setHeaderRoute:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetHeaderRoute
                .fromJson(json[r'setHeaderRoute']),
        setMirrorRoute:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInnerSetMirrorRoute
                .fromJson(json[r'setMirrorRoute']),
        setWeight: mapValueOfType<int>(json, r'setWeight'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner.listFromJson(
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
