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

class IoArgoprojV1alpha1RolloutStatusBlueGreen {
  /// Returns a new [IoArgoprojV1alpha1RolloutStatusBlueGreen] instance.
  IoArgoprojV1alpha1RolloutStatusBlueGreen({
    this.activeSelector,
    this.postPromotionAnalysisRunStatus,
    this.prePromotionAnalysisRunStatus,
    this.previewSelector,
    this.scaleUpPreviewCheckPoint,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? activeSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus?
      postPromotionAnalysisRunStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus?
      prePromotionAnalysisRunStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? previewSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? scaleUpPreviewCheckPoint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutStatusBlueGreen &&
          other.activeSelector == activeSelector &&
          other.postPromotionAnalysisRunStatus ==
              postPromotionAnalysisRunStatus &&
          other.prePromotionAnalysisRunStatus ==
              prePromotionAnalysisRunStatus &&
          other.previewSelector == previewSelector &&
          other.scaleUpPreviewCheckPoint == scaleUpPreviewCheckPoint;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (activeSelector == null ? 0 : activeSelector!.hashCode) +
      (postPromotionAnalysisRunStatus == null
          ? 0
          : postPromotionAnalysisRunStatus!.hashCode) +
      (prePromotionAnalysisRunStatus == null
          ? 0
          : prePromotionAnalysisRunStatus!.hashCode) +
      (previewSelector == null ? 0 : previewSelector!.hashCode) +
      (scaleUpPreviewCheckPoint == null
          ? 0
          : scaleUpPreviewCheckPoint!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutStatusBlueGreen[activeSelector=$activeSelector, postPromotionAnalysisRunStatus=$postPromotionAnalysisRunStatus, prePromotionAnalysisRunStatus=$prePromotionAnalysisRunStatus, previewSelector=$previewSelector, scaleUpPreviewCheckPoint=$scaleUpPreviewCheckPoint]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.activeSelector != null) {
      json[r'activeSelector'] = this.activeSelector;
    } else {
      json[r'activeSelector'] = null;
    }
    if (this.postPromotionAnalysisRunStatus != null) {
      json[r'postPromotionAnalysisRunStatus'] =
          this.postPromotionAnalysisRunStatus;
    } else {
      json[r'postPromotionAnalysisRunStatus'] = null;
    }
    if (this.prePromotionAnalysisRunStatus != null) {
      json[r'prePromotionAnalysisRunStatus'] =
          this.prePromotionAnalysisRunStatus;
    } else {
      json[r'prePromotionAnalysisRunStatus'] = null;
    }
    if (this.previewSelector != null) {
      json[r'previewSelector'] = this.previewSelector;
    } else {
      json[r'previewSelector'] = null;
    }
    if (this.scaleUpPreviewCheckPoint != null) {
      json[r'scaleUpPreviewCheckPoint'] = this.scaleUpPreviewCheckPoint;
    } else {
      json[r'scaleUpPreviewCheckPoint'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutStatusBlueGreen] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutStatusBlueGreen? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutStatusBlueGreen[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutStatusBlueGreen[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutStatusBlueGreen(
        activeSelector: mapValueOfType<String>(json, r'activeSelector'),
        postPromotionAnalysisRunStatus:
            IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus
                .fromJson(json[r'postPromotionAnalysisRunStatus']),
        prePromotionAnalysisRunStatus:
            IoArgoprojV1alpha1RolloutStatusBlueGreenPostPromotionAnalysisRunStatus
                .fromJson(json[r'prePromotionAnalysisRunStatus']),
        previewSelector: mapValueOfType<String>(json, r'previewSelector'),
        scaleUpPreviewCheckPoint:
            mapValueOfType<bool>(json, r'scaleUpPreviewCheckPoint'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutStatusBlueGreen> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutStatusBlueGreen>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1RolloutStatusBlueGreen.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutStatusBlueGreen> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutStatusBlueGreen>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutStatusBlueGreen.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutStatusBlueGreen-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutStatusBlueGreen>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutStatusBlueGreen>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1RolloutStatusBlueGreen.listFromJson(
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
