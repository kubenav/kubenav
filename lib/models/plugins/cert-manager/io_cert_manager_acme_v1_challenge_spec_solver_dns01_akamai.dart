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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_acme_dns_account_secret_ref.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai({
    required this.accessTokenSecretRef,
    required this.clientSecretSecretRef,
    required this.clientTokenSecretRef,
    required this.serviceConsumerDomain,
  });

  IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
      accessTokenSecretRef;

  IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
      clientSecretSecretRef;

  IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
      clientTokenSecretRef;

  String serviceConsumerDomain;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai &&
          other.accessTokenSecretRef == accessTokenSecretRef &&
          other.clientSecretSecretRef == clientSecretSecretRef &&
          other.clientTokenSecretRef == clientTokenSecretRef &&
          other.serviceConsumerDomain == serviceConsumerDomain;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessTokenSecretRef.hashCode) +
      (clientSecretSecretRef.hashCode) +
      (clientTokenSecretRef.hashCode) +
      (serviceConsumerDomain.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai[accessTokenSecretRef=$accessTokenSecretRef, clientSecretSecretRef=$clientSecretSecretRef, clientTokenSecretRef=$clientTokenSecretRef, serviceConsumerDomain=$serviceConsumerDomain]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'accessTokenSecretRef'] = this.accessTokenSecretRef;
    json[r'clientSecretSecretRef'] = this.clientSecretSecretRef;
    json[r'clientTokenSecretRef'] = this.clientTokenSecretRef;
    json[r'serviceConsumerDomain'] = this.serviceConsumerDomain;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai(
        accessTokenSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
                .fromJson(json[r'accessTokenSecretRef'])!,
        clientSecretSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
                .fromJson(json[r'clientSecretSecretRef'])!,
        clientTokenSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
                .fromJson(json[r'clientTokenSecretRef'])!,
        serviceConsumerDomain:
            mapValueOfType<String>(json, r'serviceConsumerDomain')!,
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accessTokenSecretRef',
    'clientSecretSecretRef',
    'clientTokenSecretRef',
    'serviceConsumerDomain',
  };
}
