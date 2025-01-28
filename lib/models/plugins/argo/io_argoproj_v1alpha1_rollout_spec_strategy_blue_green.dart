//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_metrics_inner_provider_job_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_blue_green_anti_affinity.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_blue_green_post_promotion_analysis.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen({
    this.abortScaleDownDelaySeconds,
    this.activeMetadata,
    required this.activeService,
    this.antiAffinity,
    this.autoPromotionEnabled,
    this.autoPromotionSeconds,
    this.maxUnavailable,
    this.postPromotionAnalysis,
    this.prePromotionAnalysis,
    this.previewMetadata,
    this.previewReplicaCount,
    this.previewService,
    this.scaleDownDelayRevisionLimit,
    this.scaleDownDelaySeconds,
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
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata?
      activeMetadata;

  String activeService;

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
  bool? autoPromotionEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? autoPromotionSeconds;

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
  IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis?
      postPromotionAnalysis;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis?
      prePromotionAnalysis;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata?
      previewMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? previewReplicaCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? previewService;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen &&
          other.abortScaleDownDelaySeconds == abortScaleDownDelaySeconds &&
          other.activeMetadata == activeMetadata &&
          other.activeService == activeService &&
          other.antiAffinity == antiAffinity &&
          other.autoPromotionEnabled == autoPromotionEnabled &&
          other.autoPromotionSeconds == autoPromotionSeconds &&
          other.maxUnavailable == maxUnavailable &&
          other.postPromotionAnalysis == postPromotionAnalysis &&
          other.prePromotionAnalysis == prePromotionAnalysis &&
          other.previewMetadata == previewMetadata &&
          other.previewReplicaCount == previewReplicaCount &&
          other.previewService == previewService &&
          other.scaleDownDelayRevisionLimit == scaleDownDelayRevisionLimit &&
          other.scaleDownDelaySeconds == scaleDownDelaySeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (abortScaleDownDelaySeconds == null
          ? 0
          : abortScaleDownDelaySeconds!.hashCode) +
      (activeMetadata == null ? 0 : activeMetadata!.hashCode) +
      (activeService.hashCode) +
      (antiAffinity == null ? 0 : antiAffinity!.hashCode) +
      (autoPromotionEnabled == null ? 0 : autoPromotionEnabled!.hashCode) +
      (autoPromotionSeconds == null ? 0 : autoPromotionSeconds!.hashCode) +
      (maxUnavailable == null ? 0 : maxUnavailable!.hashCode) +
      (postPromotionAnalysis == null ? 0 : postPromotionAnalysis!.hashCode) +
      (prePromotionAnalysis == null ? 0 : prePromotionAnalysis!.hashCode) +
      (previewMetadata == null ? 0 : previewMetadata!.hashCode) +
      (previewReplicaCount == null ? 0 : previewReplicaCount!.hashCode) +
      (previewService == null ? 0 : previewService!.hashCode) +
      (scaleDownDelayRevisionLimit == null
          ? 0
          : scaleDownDelayRevisionLimit!.hashCode) +
      (scaleDownDelaySeconds == null ? 0 : scaleDownDelaySeconds!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen[abortScaleDownDelaySeconds=$abortScaleDownDelaySeconds, activeMetadata=$activeMetadata, activeService=$activeService, antiAffinity=$antiAffinity, autoPromotionEnabled=$autoPromotionEnabled, autoPromotionSeconds=$autoPromotionSeconds, maxUnavailable=$maxUnavailable, postPromotionAnalysis=$postPromotionAnalysis, prePromotionAnalysis=$prePromotionAnalysis, previewMetadata=$previewMetadata, previewReplicaCount=$previewReplicaCount, previewService=$previewService, scaleDownDelayRevisionLimit=$scaleDownDelayRevisionLimit, scaleDownDelaySeconds=$scaleDownDelaySeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.abortScaleDownDelaySeconds != null) {
      json[r'abortScaleDownDelaySeconds'] = this.abortScaleDownDelaySeconds;
    } else {
      json[r'abortScaleDownDelaySeconds'] = null;
    }
    if (this.activeMetadata != null) {
      json[r'activeMetadata'] = this.activeMetadata;
    } else {
      json[r'activeMetadata'] = null;
    }
    json[r'activeService'] = this.activeService;
    if (this.antiAffinity != null) {
      json[r'antiAffinity'] = this.antiAffinity;
    } else {
      json[r'antiAffinity'] = null;
    }
    if (this.autoPromotionEnabled != null) {
      json[r'autoPromotionEnabled'] = this.autoPromotionEnabled;
    } else {
      json[r'autoPromotionEnabled'] = null;
    }
    if (this.autoPromotionSeconds != null) {
      json[r'autoPromotionSeconds'] = this.autoPromotionSeconds;
    } else {
      json[r'autoPromotionSeconds'] = null;
    }
    if (this.maxUnavailable != null) {
      json[r'maxUnavailable'] = this.maxUnavailable;
    } else {
      json[r'maxUnavailable'] = null;
    }
    if (this.postPromotionAnalysis != null) {
      json[r'postPromotionAnalysis'] = this.postPromotionAnalysis;
    } else {
      json[r'postPromotionAnalysis'] = null;
    }
    if (this.prePromotionAnalysis != null) {
      json[r'prePromotionAnalysis'] = this.prePromotionAnalysis;
    } else {
      json[r'prePromotionAnalysis'] = null;
    }
    if (this.previewMetadata != null) {
      json[r'previewMetadata'] = this.previewMetadata;
    } else {
      json[r'previewMetadata'] = null;
    }
    if (this.previewReplicaCount != null) {
      json[r'previewReplicaCount'] = this.previewReplicaCount;
    } else {
      json[r'previewReplicaCount'] = null;
    }
    if (this.previewService != null) {
      json[r'previewService'] = this.previewService;
    } else {
      json[r'previewService'] = null;
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
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen(
        abortScaleDownDelaySeconds:
            mapValueOfType<int>(json, r'abortScaleDownDelaySeconds'),
        activeMetadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'activeMetadata']),
        activeService: mapValueOfType<String>(json, r'activeService')!,
        antiAffinity:
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenAntiAffinity.fromJson(
                json[r'antiAffinity']),
        autoPromotionEnabled:
            mapValueOfType<bool>(json, r'autoPromotionEnabled'),
        autoPromotionSeconds:
            mapValueOfType<int>(json, r'autoPromotionSeconds'),
        maxUnavailable: mapValueOfType<Object>(json, r'maxUnavailable'),
        postPromotionAnalysis:
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis
                .fromJson(json[r'postPromotionAnalysis']),
        prePromotionAnalysis:
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreenPostPromotionAnalysis
                .fromJson(json[r'prePromotionAnalysis']),
        previewMetadata:
            IoArgoprojV1alpha1AnalysisRunSpecMetricsInnerProviderJobMetadata
                .fromJson(json[r'previewMetadata']),
        previewReplicaCount: mapValueOfType<int>(json, r'previewReplicaCount'),
        previewService: mapValueOfType<String>(json, r'previewService'),
        scaleDownDelayRevisionLimit:
            mapValueOfType<int>(json, r'scaleDownDelayRevisionLimit'),
        scaleDownDelaySeconds:
            mapValueOfType<int>(json, r'scaleDownDelaySeconds'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyBlueGreen.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'activeService',
  };
}
