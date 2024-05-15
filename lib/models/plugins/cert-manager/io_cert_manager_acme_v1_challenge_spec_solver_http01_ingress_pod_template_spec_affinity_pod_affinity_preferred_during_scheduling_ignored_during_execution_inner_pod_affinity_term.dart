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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_pod_affinity_preferred_during_scheduling_ignored_during_execution_inner_pod_affinity_term_label_selector.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_pod_affinity_preferred_during_scheduling_ignored_during_execution_inner_pod_affinity_term_namespace_selector.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys = const [],
    this.mismatchLabelKeys = const [],
    this.namespaceSelector,
    this.namespaces = const [],
    required this.topologyKey,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTermLabelSelector?
      labelSelector;

  /// MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration. The keys are used to lookup values from the incoming pod labels, those key-value labels are merged with `LabelSelector` as `key in (value)` to select the group of existing pods which pods will be taken into consideration for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The default value is empty. The same key is forbidden to exist in both MatchLabelKeys and LabelSelector. Also, MatchLabelKeys cannot be set when LabelSelector isn't set. This is an alpha field and requires enabling MatchLabelKeysInPodAffinity feature gate.
  List<String> matchLabelKeys;

  /// MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration. The keys are used to lookup values from the incoming pod labels, those key-value labels are merged with `LabelSelector` as `key notin (value)` to select the group of existing pods which pods will be taken into consideration for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The default value is empty. The same key is forbidden to exist in both MismatchLabelKeys and LabelSelector. Also, MismatchLabelKeys cannot be set when LabelSelector isn't set. This is an alpha field and requires enabling MatchLabelKeysInPodAffinity feature gate.
  List<String> mismatchLabelKeys;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTermNamespaceSelector?
      namespaceSelector;

  /// namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector. null or empty namespaces list and null namespaceSelector means \"this pod's namespace\".
  List<String> namespaces;

  /// This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
  String topologyKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm &&
          other.labelSelector == labelSelector &&
          deepEquality.equals(other.matchLabelKeys, matchLabelKeys) &&
          deepEquality.equals(other.mismatchLabelKeys, mismatchLabelKeys) &&
          other.namespaceSelector == namespaceSelector &&
          deepEquality.equals(other.namespaces, namespaces) &&
          other.topologyKey == topologyKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labelSelector == null ? 0 : labelSelector!.hashCode) +
      (matchLabelKeys.hashCode) +
      (mismatchLabelKeys.hashCode) +
      (namespaceSelector == null ? 0 : namespaceSelector!.hashCode) +
      (namespaces.hashCode) +
      (topologyKey.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm[labelSelector=$labelSelector, matchLabelKeys=$matchLabelKeys, mismatchLabelKeys=$mismatchLabelKeys, namespaceSelector=$namespaceSelector, namespaces=$namespaces, topologyKey=$topologyKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.labelSelector != null) {
      json[r'labelSelector'] = this.labelSelector;
    } else {
      json[r'labelSelector'] = null;
    }
    json[r'matchLabelKeys'] = this.matchLabelKeys;
    json[r'mismatchLabelKeys'] = this.mismatchLabelKeys;
    if (this.namespaceSelector != null) {
      json[r'namespaceSelector'] = this.namespaceSelector;
    } else {
      json[r'namespaceSelector'] = null;
    }
    json[r'namespaces'] = this.namespaces;
    json[r'topologyKey'] = this.topologyKey;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm(
        labelSelector:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTermLabelSelector
                .fromJson(json[r'labelSelector']),
        matchLabelKeys: json[r'matchLabelKeys'] is Iterable
            ? (json[r'matchLabelKeys'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        mismatchLabelKeys: json[r'mismatchLabelKeys'] is Iterable
            ? (json[r'mismatchLabelKeys'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        namespaceSelector:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTermNamespaceSelector
                .fromJson(json[r'namespaceSelector']),
        namespaces: json[r'namespaces'] is Iterable
            ? (json[r'namespaces'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        topologyKey: mapValueOfType<String>(json, r'topologyKey')!,
      );
    }
    return null;
  }

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinityPreferredDuringSchedulingIgnoredDuringExecutionInnerPodAffinityTerm
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
    'topologyKey',
  };
}
