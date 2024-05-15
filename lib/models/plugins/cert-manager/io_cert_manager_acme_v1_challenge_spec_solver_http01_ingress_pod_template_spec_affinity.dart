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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_node_affinity.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_pod_affinity.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template_spec_affinity_pod_anti_affinity.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity({
    this.nodeAffinity,
    this.podAffinity,
    this.podAntiAffinity,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity?
      nodeAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinity?
      podAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAntiAffinity?
      podAntiAffinity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity &&
          other.nodeAffinity == nodeAffinity &&
          other.podAffinity == podAffinity &&
          other.podAntiAffinity == podAntiAffinity;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nodeAffinity == null ? 0 : nodeAffinity!.hashCode) +
      (podAffinity == null ? 0 : podAffinity!.hashCode) +
      (podAntiAffinity == null ? 0 : podAntiAffinity!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity[nodeAffinity=$nodeAffinity, podAffinity=$podAffinity, podAntiAffinity=$podAntiAffinity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nodeAffinity != null) {
      json[r'nodeAffinity'] = this.nodeAffinity;
    } else {
      json[r'nodeAffinity'] = null;
    }
    if (this.podAffinity != null) {
      json[r'podAffinity'] = this.podAffinity;
    } else {
      json[r'podAffinity'] = null;
    }
    if (this.podAntiAffinity != null) {
      json[r'podAntiAffinity'] = this.podAntiAffinity;
    } else {
      json[r'podAntiAffinity'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity(
        nodeAffinity:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityNodeAffinity
                .fromJson(json[r'nodeAffinity']),
        podAffinity:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAffinity
                .fromJson(json[r'podAffinity']),
        podAntiAffinity:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinityPodAntiAffinity
                .fromJson(json[r'podAntiAffinity']),
      );
    }
    return null;
  }

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplateSpecAffinity
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
