//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_alb_stickiness_config.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb({
    this.annotationPrefix,
    required this.ingress,
    this.rootService,
    required this.servicePort,
    this.stickinessConfig,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? annotationPrefix;

  String ingress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rootService;

  int servicePort;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlbStickinessConfig?
      stickinessConfig;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb &&
          other.annotationPrefix == annotationPrefix &&
          other.ingress == ingress &&
          other.rootService == rootService &&
          other.servicePort == servicePort &&
          other.stickinessConfig == stickinessConfig;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (annotationPrefix == null ? 0 : annotationPrefix!.hashCode) +
      (ingress.hashCode) +
      (rootService == null ? 0 : rootService!.hashCode) +
      (servicePort.hashCode) +
      (stickinessConfig == null ? 0 : stickinessConfig!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb[annotationPrefix=$annotationPrefix, ingress=$ingress, rootService=$rootService, servicePort=$servicePort, stickinessConfig=$stickinessConfig]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.annotationPrefix != null) {
      json[r'annotationPrefix'] = this.annotationPrefix;
    } else {
      json[r'annotationPrefix'] = null;
    }
    json[r'ingress'] = this.ingress;
    if (this.rootService != null) {
      json[r'rootService'] = this.rootService;
    } else {
      json[r'rootService'] = null;
    }
    json[r'servicePort'] = this.servicePort;
    if (this.stickinessConfig != null) {
      json[r'stickinessConfig'] = this.stickinessConfig;
    } else {
      json[r'stickinessConfig'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb(
        annotationPrefix: mapValueOfType<String>(json, r'annotationPrefix'),
        ingress: mapValueOfType<String>(json, r'ingress')!,
        rootService: mapValueOfType<String>(json, r'rootService'),
        servicePort: mapValueOfType<int>(json, r'servicePort')!,
        stickinessConfig:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlbStickinessConfig
                .fromJson(json[r'stickinessConfig']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb
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
    'ingress',
    'servicePort',
  };
}
