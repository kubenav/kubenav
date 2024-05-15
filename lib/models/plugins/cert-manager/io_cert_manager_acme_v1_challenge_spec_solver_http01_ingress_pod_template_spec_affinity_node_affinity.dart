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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_node_affinity_preferred_during_scheduling_ignored_during_execution_inner.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_node_affinity_required_during_scheduling_ignored_during_execution.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution = const [],
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  /// The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
  List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionInner>
      preferredDuringSchedulingIgnoredDuringExecution;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinityRequiredDuringSchedulingIgnoredDuringExecution?
      requiredDuringSchedulingIgnoredDuringExecution;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity &&
          deepEquality.equals(
              other.preferredDuringSchedulingIgnoredDuringExecution,
              preferredDuringSchedulingIgnoredDuringExecution) &&
          other.requiredDuringSchedulingIgnoredDuringExecution ==
              requiredDuringSchedulingIgnoredDuringExecution;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (preferredDuringSchedulingIgnoredDuringExecution.hashCode) +
      (requiredDuringSchedulingIgnoredDuringExecution == null
          ? 0
          : requiredDuringSchedulingIgnoredDuringExecution!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity[preferredDuringSchedulingIgnoredDuringExecution=$preferredDuringSchedulingIgnoredDuringExecution, requiredDuringSchedulingIgnoredDuringExecution=$requiredDuringSchedulingIgnoredDuringExecution]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'preferredDuringSchedulingIgnoredDuringExecution'] =
        this.preferredDuringSchedulingIgnoredDuringExecution;
    if (this.requiredDuringSchedulingIgnoredDuringExecution != null) {
      json[r'requiredDuringSchedulingIgnoredDuringExecution'] =
          this.requiredDuringSchedulingIgnoredDuringExecution;
    } else {
      json[r'requiredDuringSchedulingIgnoredDuringExecution'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity(
        preferredDuringSchedulingIgnoredDuringExecution:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionInner
                .listFromJson(
                    json[r'preferredDuringSchedulingIgnoredDuringExecution']),
        requiredDuringSchedulingIgnoredDuringExecution:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinityRequiredDuringSchedulingIgnoredDuringExecution
                .fromJson(
                    json[r'requiredDuringSchedulingIgnoredDuringExecution']),
      );
    }
    return null;
  }

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity
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
