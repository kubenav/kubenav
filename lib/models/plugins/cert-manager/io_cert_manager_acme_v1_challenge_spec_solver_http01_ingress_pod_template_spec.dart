//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_image_pull_secrets_inner.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_tolerations_inner.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec({
    this.affinity,
    this.imagePullSecrets = const [],
    this.nodeSelector = const {},
    this.priorityClassName,
    this.serviceAccountName,
    this.tolerations = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity?
      affinity;

  /// If specified, the pod's imagePullSecrets
  List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecImagePullSecretsInner>
      imagePullSecrets;

  /// NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
  Map<String, String> nodeSelector;

  /// If specified, the pod's priorityClassName.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priorityClassName;

  /// If specified, the pod's service account
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  /// If specified, the pod's tolerations.
  List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecTolerationsInner>
      tolerations;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec &&
          other.affinity == affinity &&
          deepEquality.equals(other.imagePullSecrets, imagePullSecrets) &&
          deepEquality.equals(other.nodeSelector, nodeSelector) &&
          other.priorityClassName == priorityClassName &&
          other.serviceAccountName == serviceAccountName &&
          deepEquality.equals(other.tolerations, tolerations);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (affinity == null ? 0 : affinity!.hashCode) +
      (imagePullSecrets.hashCode) +
      (nodeSelector.hashCode) +
      (priorityClassName == null ? 0 : priorityClassName!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (tolerations.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec[affinity=$affinity, imagePullSecrets=$imagePullSecrets, nodeSelector=$nodeSelector, priorityClassName=$priorityClassName, serviceAccountName=$serviceAccountName, tolerations=$tolerations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.affinity != null) {
      json[r'affinity'] = this.affinity;
    } else {
      json[r'affinity'] = null;
    }
    json[r'imagePullSecrets'] = this.imagePullSecrets;
    json[r'nodeSelector'] = this.nodeSelector;
    if (this.priorityClassName != null) {
      json[r'priorityClassName'] = this.priorityClassName;
    } else {
      json[r'priorityClassName'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
    }
    json[r'tolerations'] = this.tolerations;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec(
        affinity:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity
                .fromJson(json[r'affinity']),
        imagePullSecrets:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecImagePullSecretsInner
                .listFromJson(json[r'imagePullSecrets']),
        nodeSelector:
            mapCastOfType<String, String>(json, r'nodeSelector') ?? const {},
        priorityClassName: mapValueOfType<String>(json, r'priorityClassName'),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        tolerations:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecTolerationsInner
                .listFromJson(json[r'tolerations']),
      );
    }
    return null;
  }

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpec
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
