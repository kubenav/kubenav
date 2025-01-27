//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_blue_green_anti_affinity.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_analysis.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_ping_pong.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_steps_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanary {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanary] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanary({
    this.abortScaleDownDelaySeconds,
    this.analysis,
    this.antiAffinity,
    this.canaryMetadata,
    this.canaryService,
    this.dynamicStableScale,
    this.maxSurge,
    this.maxUnavailable,
    this.pingPong,
    this.scaleDownDelayRevisionLimit,
    this.scaleDownDelaySeconds,
    this.stableMetadata,
    this.stableService,
    this.steps = const [],
    this.trafficRouting,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? abortScaleDownDelaySeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryAnalysis? analysis;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenAntiAffinity? antiAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata?
      canaryMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? canaryService;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? dynamicStableScale;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? maxSurge;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? maxUnavailable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryPingPong? pingPong;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? scaleDownDelayRevisionLimit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? scaleDownDelaySeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata?
      stableMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stableService;

  List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner> steps;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting? trafficRouting;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanary &&
          other.abortScaleDownDelaySeconds == abortScaleDownDelaySeconds &&
          other.analysis == analysis &&
          other.antiAffinity == antiAffinity &&
          other.canaryMetadata == canaryMetadata &&
          other.canaryService == canaryService &&
          other.dynamicStableScale == dynamicStableScale &&
          other.maxSurge == maxSurge &&
          other.maxUnavailable == maxUnavailable &&
          other.pingPong == pingPong &&
          other.scaleDownDelayRevisionLimit == scaleDownDelayRevisionLimit &&
          other.scaleDownDelaySeconds == scaleDownDelaySeconds &&
          other.stableMetadata == stableMetadata &&
          other.stableService == stableService &&
          deepEquality.equals(other.steps, steps) &&
          other.trafficRouting == trafficRouting;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (abortScaleDownDelaySeconds == null
          ? 0
          : abortScaleDownDelaySeconds!.hashCode) +
      (analysis == null ? 0 : analysis!.hashCode) +
      (antiAffinity == null ? 0 : antiAffinity!.hashCode) +
      (canaryMetadata == null ? 0 : canaryMetadata!.hashCode) +
      (canaryService == null ? 0 : canaryService!.hashCode) +
      (dynamicStableScale == null ? 0 : dynamicStableScale!.hashCode) +
      (maxSurge == null ? 0 : maxSurge!.hashCode) +
      (maxUnavailable == null ? 0 : maxUnavailable!.hashCode) +
      (pingPong == null ? 0 : pingPong!.hashCode) +
      (scaleDownDelayRevisionLimit == null
          ? 0
          : scaleDownDelayRevisionLimit!.hashCode) +
      (scaleDownDelaySeconds == null ? 0 : scaleDownDelaySeconds!.hashCode) +
      (stableMetadata == null ? 0 : stableMetadata!.hashCode) +
      (stableService == null ? 0 : stableService!.hashCode) +
      (steps.hashCode) +
      (trafficRouting == null ? 0 : trafficRouting!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanary[abortScaleDownDelaySeconds=$abortScaleDownDelaySeconds, analysis=$analysis, antiAffinity=$antiAffinity, canaryMetadata=$canaryMetadata, canaryService=$canaryService, dynamicStableScale=$dynamicStableScale, maxSurge=$maxSurge, maxUnavailable=$maxUnavailable, pingPong=$pingPong, scaleDownDelayRevisionLimit=$scaleDownDelayRevisionLimit, scaleDownDelaySeconds=$scaleDownDelaySeconds, stableMetadata=$stableMetadata, stableService=$stableService, steps=$steps, trafficRouting=$trafficRouting]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.abortScaleDownDelaySeconds != null) {
      json[r'abortScaleDownDelaySeconds'] = this.abortScaleDownDelaySeconds;
    } else {
      json[r'abortScaleDownDelaySeconds'] = null;
    }
    if (this.analysis != null) {
      json[r'analysis'] = this.analysis;
    } else {
      json[r'analysis'] = null;
    }
    if (this.antiAffinity != null) {
      json[r'antiAffinity'] = this.antiAffinity;
    } else {
      json[r'antiAffinity'] = null;
    }
    if (this.canaryMetadata != null) {
      json[r'canaryMetadata'] = this.canaryMetadata;
    } else {
      json[r'canaryMetadata'] = null;
    }
    if (this.canaryService != null) {
      json[r'canaryService'] = this.canaryService;
    } else {
      json[r'canaryService'] = null;
    }
    if (this.dynamicStableScale != null) {
      json[r'dynamicStableScale'] = this.dynamicStableScale;
    } else {
      json[r'dynamicStableScale'] = null;
    }
    if (this.maxSurge != null) {
      json[r'maxSurge'] = this.maxSurge;
    } else {
      json[r'maxSurge'] = null;
    }
    if (this.maxUnavailable != null) {
      json[r'maxUnavailable'] = this.maxUnavailable;
    } else {
      json[r'maxUnavailable'] = null;
    }
    if (this.pingPong != null) {
      json[r'pingPong'] = this.pingPong;
    } else {
      json[r'pingPong'] = null;
    }
    if (this.scaleDownDelayRevisionLimit != null) {
      json[r'scaleDownDelayRevisionLimit'] = this.scaleDownDelayRevisionLimit;
    } else {
      json[r'scaleDownDelayRevisionLimit'] = null;
    }
    if (this.scaleDownDelaySeconds != null) {
      json[r'scaleDownDelaySeconds'] = this.scaleDownDelaySeconds;
    } else {
      json[r'scaleDownDelaySeconds'] = null;
    }
    if (this.stableMetadata != null) {
      json[r'stableMetadata'] = this.stableMetadata;
    } else {
      json[r'stableMetadata'] = null;
    }
    if (this.stableService != null) {
      json[r'stableService'] = this.stableService;
    } else {
      json[r'stableService'] = null;
    }
    json[r'steps'] = this.steps;
    if (this.trafficRouting != null) {
      json[r'trafficRouting'] = this.trafficRouting;
    } else {
      json[r'trafficRouting'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanary[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanary(
        abortScaleDownDelaySeconds:
            mapValueOfType<int>(json, r'abortScaleDownDelaySeconds'),
        analysis: IoArgoprojV1alpha1RolloutSpecStrategyCanaryAnalysis.fromJson(
            json[r'analysis']),
        antiAffinity:
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenAntiAffinity.fromJson(
                json[r'antiAffinity']),
        canaryMetadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'canaryMetadata']),
        canaryService: mapValueOfType<String>(json, r'canaryService'),
        dynamicStableScale: mapValueOfType<bool>(json, r'dynamicStableScale'),
        maxSurge: mapValueOfType<Object>(json, r'maxSurge'),
        maxUnavailable: mapValueOfType<Object>(json, r'maxUnavailable'),
        pingPong: IoArgoprojV1alpha1RolloutSpecStrategyCanaryPingPong.fromJson(
            json[r'pingPong']),
        scaleDownDelayRevisionLimit:
            mapValueOfType<int>(json, r'scaleDownDelayRevisionLimit'),
        scaleDownDelaySeconds:
            mapValueOfType<int>(json, r'scaleDownDelaySeconds'),
        stableMetadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'stableMetadata']),
        stableService: mapValueOfType<String>(json, r'stableService'),
        steps:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryStepsInner.listFromJson(
                json[r'steps']),
        trafficRouting:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting.fromJson(
                json[r'trafficRouting']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyCanary> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutSpecStrategyCanary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutSpecStrategyCanary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpecStrategyCanary> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutSpecStrategyCanary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanary-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutSpecStrategyCanary>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutSpecStrategyCanary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanary.listFromJson(
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
