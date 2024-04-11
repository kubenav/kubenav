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
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set_persistent_volume_claim_retention_policy.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set_update_strategy.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_claim.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_template_spec.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiAppsV1StatefulSetSpec {
  /// Returns a new [IoK8sApiAppsV1StatefulSetSpec] instance.
  IoK8sApiAppsV1StatefulSetSpec({
    this.minReadySeconds,
    this.persistentVolumeClaimRetentionPolicy,
    this.podManagementPolicy,
    this.replicas,
    this.revisionHistoryLimit,
    required this.selector,
    required this.serviceName,
    required this.template,
    this.updateStrategy,
    this.volumeClaimTemplates = const [],
  });

  /// Minimum number of seconds for which a newly created pod should be ready without any of its container crashing for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy?
      persistentVolumeClaimRetentionPolicy;

  /// podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down. The default policy is `OrderedReady`, where pods are created in increasing order (pod-0, then pod-1, etc) and the controller will wait until each pod is ready before continuing. When scaling down, the pods are removed in the opposite order. The alternative policy is `Parallel` which will create pods in parallel to match the desired scale without waiting, and on scale down will delete all pods at once.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? podManagementPolicy;

  /// replicas is the desired number of replicas of the given Template. These are replicas in the sense that they are instantiations of the same Template, but individual replicas also have a consistent identity. If unspecified, defaults to 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  /// revisionHistoryLimit is the maximum number of revisions that will be maintained in the StatefulSet's revision history. The revision history consists of all revisions not represented by a currently applied StatefulSetSpec version. The default value is 10.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  IoK8sApimachineryPkgApisMetaV1LabelSelector selector;

  /// serviceName is the name of the service that governs this StatefulSet. This service must exist before the StatefulSet, and is responsible for the network identity of the set. Pods get DNS/hostnames that follow the pattern: pod-specific-string.serviceName.default.svc.cluster.local where \"pod-specific-string\" is managed by the StatefulSet controller.
  String serviceName;

  IoK8sApiCoreV1PodTemplateSpec template;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1StatefulSetUpdateStrategy? updateStrategy;

  /// volumeClaimTemplates is a list of claims that pods are allowed to reference. The StatefulSet controller is responsible for mapping network identities to claims in a way that maintains the identity of a pod. Every claim in this list must have at least one matching (by name) volumeMount in one container in the template. A claim in this list takes precedence over any volumes in the template, with the same name.
  List<IoK8sApiCoreV1PersistentVolumeClaim> volumeClaimTemplates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1StatefulSetSpec &&
          other.minReadySeconds == minReadySeconds &&
          other.persistentVolumeClaimRetentionPolicy ==
              persistentVolumeClaimRetentionPolicy &&
          other.podManagementPolicy == podManagementPolicy &&
          other.replicas == replicas &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.selector == selector &&
          other.serviceName == serviceName &&
          other.template == template &&
          other.updateStrategy == updateStrategy &&
          other.volumeClaimTemplates == volumeClaimTemplates;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (persistentVolumeClaimRetentionPolicy == null
          ? 0
          : persistentVolumeClaimRetentionPolicy!.hashCode) +
      (podManagementPolicy == null ? 0 : podManagementPolicy!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (selector.hashCode) +
      (serviceName.hashCode) +
      (template.hashCode) +
      (updateStrategy == null ? 0 : updateStrategy!.hashCode) +
      (volumeClaimTemplates.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1StatefulSetSpec[minReadySeconds=$minReadySeconds, persistentVolumeClaimRetentionPolicy=$persistentVolumeClaimRetentionPolicy, podManagementPolicy=$podManagementPolicy, replicas=$replicas, revisionHistoryLimit=$revisionHistoryLimit, selector=$selector, serviceName=$serviceName, template=$template, updateStrategy=$updateStrategy, volumeClaimTemplates=$volumeClaimTemplates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.minReadySeconds != null) {
      json[r'minReadySeconds'] = this.minReadySeconds;
    } else {
      json[r'minReadySeconds'] = null;
    }
    if (this.persistentVolumeClaimRetentionPolicy != null) {
      json[r'persistentVolumeClaimRetentionPolicy'] =
          this.persistentVolumeClaimRetentionPolicy;
    } else {
      json[r'persistentVolumeClaimRetentionPolicy'] = null;
    }
    if (this.podManagementPolicy != null) {
      json[r'podManagementPolicy'] = this.podManagementPolicy;
    } else {
      json[r'podManagementPolicy'] = null;
    }
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = this.revisionHistoryLimit;
    } else {
      json[r'revisionHistoryLimit'] = null;
    }
    json[r'selector'] = this.selector;
    json[r'serviceName'] = this.serviceName;
    json[r'template'] = this.template;
    if (this.updateStrategy != null) {
      json[r'updateStrategy'] = this.updateStrategy;
    } else {
      json[r'updateStrategy'] = null;
    }
    json[r'volumeClaimTemplates'] = this.volumeClaimTemplates;
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1StatefulSetSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1StatefulSetSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1StatefulSetSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1StatefulSetSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1StatefulSetSpec(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        persistentVolumeClaimRetentionPolicy:
            IoK8sApiAppsV1StatefulSetPersistentVolumeClaimRetentionPolicy
                .fromJson(json[r'persistentVolumeClaimRetentionPolicy']),
        podManagementPolicy:
            mapValueOfType<String>(json, r'podManagementPolicy'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector'])!,
        serviceName: mapValueOfType<String>(json, r'serviceName')!,
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template'])!,
        updateStrategy: IoK8sApiAppsV1StatefulSetUpdateStrategy.fromJson(
            json[r'updateStrategy']),
        volumeClaimTemplates: IoK8sApiCoreV1PersistentVolumeClaim.listFromJson(
                json[r'volumeClaimTemplates']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1StatefulSetSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1StatefulSetSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1StatefulSetSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1StatefulSetSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1StatefulSetSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1StatefulSetSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1StatefulSetSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1StatefulSetSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1StatefulSetSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1StatefulSetSpec.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'selector',
    'serviceName',
    'template',
  };
}
