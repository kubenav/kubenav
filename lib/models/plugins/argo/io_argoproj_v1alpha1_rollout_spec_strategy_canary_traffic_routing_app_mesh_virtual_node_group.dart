//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/dev_summerwind_actions_v1alpha1_horizontal_runner_autoscaler_spec_github_api_credentials_from_secret_ref.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup({
    required this.canaryVirtualNodeRef,
    required this.stableVirtualNodeRef,
  });

  DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
      canaryVirtualNodeRef;

  DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
      stableVirtualNodeRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup &&
          other.canaryVirtualNodeRef == canaryVirtualNodeRef &&
          other.stableVirtualNodeRef == stableVirtualNodeRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (canaryVirtualNodeRef.hashCode) + (stableVirtualNodeRef.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup[canaryVirtualNodeRef=$canaryVirtualNodeRef, stableVirtualNodeRef=$stableVirtualNodeRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'canaryVirtualNodeRef'] = this.canaryVirtualNodeRef;
    json[r'stableVirtualNodeRef'] = this.stableVirtualNodeRef;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup(
        canaryVirtualNodeRef:
            DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
                .fromJson(json[r'canaryVirtualNodeRef'])!,
        stableVirtualNodeRef:
            DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
                .fromJson(json[r'stableVirtualNodeRef'])!,
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMeshVirtualNodeGroup
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
    'canaryVirtualNodeRef',
    'stableVirtualNodeRef',
  };
}
