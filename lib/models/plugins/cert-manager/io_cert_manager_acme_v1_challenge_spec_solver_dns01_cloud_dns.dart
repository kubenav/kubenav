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

class IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS({
    this.hostedZoneName,
    required this.project,
    this.serviceAccountSecretRef,
  });

  /// HostedZoneName is an optional field that tells cert-manager in which Cloud DNS zone the challenge record has to be created. If left empty cert-manager will automatically choose a zone.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostedZoneName;

  String project;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef?
      serviceAccountSecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS &&
          other.hostedZoneName == hostedZoneName &&
          other.project == project &&
          other.serviceAccountSecretRef == serviceAccountSecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (hostedZoneName == null ? 0 : hostedZoneName!.hashCode) +
      (project.hashCode) +
      (serviceAccountSecretRef == null ? 0 : serviceAccountSecretRef!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS[hostedZoneName=$hostedZoneName, project=$project, serviceAccountSecretRef=$serviceAccountSecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hostedZoneName != null) {
      json[r'hostedZoneName'] = this.hostedZoneName;
    } else {
      json[r'hostedZoneName'] = null;
    }
    json[r'project'] = this.project;
    if (this.serviceAccountSecretRef != null) {
      json[r'serviceAccountSecretRef'] = this.serviceAccountSecretRef;
    } else {
      json[r'serviceAccountSecretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS(
        hostedZoneName: mapValueOfType<String>(json, r'hostedZoneName'),
        project: mapValueOfType<String>(json, r'project')!,
        serviceAccountSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNSAccountSecretRef
                .fromJson(json[r'serviceAccountSecretRef']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'project',
  };
}
