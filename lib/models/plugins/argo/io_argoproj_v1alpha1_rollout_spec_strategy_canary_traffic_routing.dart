//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/dev_summerwind_actions_v1alpha1_horizontal_runner_autoscaler_spec_github_api_credentials_from_secret_ref.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_alb.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_ambassador.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_app_mesh.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_istio.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_nginx.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_smi.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_spec_strategy_canary_traffic_routing_traefik.dart';

class IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting {
  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting] instance.
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting({
    this.alb,
    this.ambassador,
    this.appMesh,
    this.istio,
    this.managedRoutes = const [],
    this.nginx,
    this.smi,
    this.traefik,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb? alb;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAmbassador?
      ambassador;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMesh? appMesh;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstio? istio;

  List<DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef>
      managedRoutes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingNginx? nginx;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi? smi;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingTraefik? traefik;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting &&
          other.alb == alb &&
          other.ambassador == ambassador &&
          other.appMesh == appMesh &&
          other.istio == istio &&
          deepEquality.equals(other.managedRoutes, managedRoutes) &&
          other.nginx == nginx &&
          other.smi == smi &&
          other.traefik == traefik;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (alb == null ? 0 : alb!.hashCode) +
      (ambassador == null ? 0 : ambassador!.hashCode) +
      (appMesh == null ? 0 : appMesh!.hashCode) +
      (istio == null ? 0 : istio!.hashCode) +
      (managedRoutes.hashCode) +
      (nginx == null ? 0 : nginx!.hashCode) +
      (smi == null ? 0 : smi!.hashCode) +
      (traefik == null ? 0 : traefik!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting[alb=$alb, ambassador=$ambassador, appMesh=$appMesh, istio=$istio, managedRoutes=$managedRoutes, nginx=$nginx, smi=$smi, traefik=$traefik]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.alb != null) {
      json[r'alb'] = this.alb;
    } else {
      json[r'alb'] = null;
    }
    if (this.ambassador != null) {
      json[r'ambassador'] = this.ambassador;
    } else {
      json[r'ambassador'] = null;
    }
    if (this.appMesh != null) {
      json[r'appMesh'] = this.appMesh;
    } else {
      json[r'appMesh'] = null;
    }
    if (this.istio != null) {
      json[r'istio'] = this.istio;
    } else {
      json[r'istio'] = null;
    }
    json[r'managedRoutes'] = this.managedRoutes;
    if (this.nginx != null) {
      json[r'nginx'] = this.nginx;
    } else {
      json[r'nginx'] = null;
    }
    if (this.smi != null) {
      json[r'smi'] = this.smi;
    } else {
      json[r'smi'] = null;
    }
    if (this.traefik != null) {
      json[r'traefik'] = this.traefik;
    } else {
      json[r'traefik'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting(
        alb: IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAlb
            .fromJson(json[r'alb']),
        ambassador:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAmbassador
                .fromJson(json[r'ambassador']),
        appMesh:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingAppMesh
                .fromJson(json[r'appMesh']),
        istio: IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingIstio
            .fromJson(json[r'istio']),
        managedRoutes:
            DevSummerwindActionsV1alpha1HorizontalRunnerAutoscalerSpecGithubAPICredentialsFromSecretRef
                .listFromJson(json[r'managedRoutes']),
        nginx: IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingNginx
            .fromJson(json[r'nginx']),
        smi: IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingSmi
            .fromJson(json[r'smi']),
        traefik:
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRoutingTraefik
                .fromJson(json[r'traefik']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutSpecStrategyCanaryTrafficRouting
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
