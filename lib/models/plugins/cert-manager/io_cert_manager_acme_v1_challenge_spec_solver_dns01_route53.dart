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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_route53_access_key_id_secret_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_route53_secret_access_key_secret_ref.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53 {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53({
    this.accessKeyID,
    this.accessKeyIDSecretRef,
    this.hostedZoneID,
    required this.region,
    this.role,
    this.secretAccessKeySecretRef,
  });

  /// The AccessKeyID is used for authentication. Cannot be set when SecretAccessKeyID is set. If neither the Access Key nor Key ID are set, we fall-back to using env vars, shared credentials file or AWS Instance metadata, see: https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessKeyID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53AccessKeyIDSecretRef?
      accessKeyIDSecretRef;

  /// If set, the provider will manage only this zone in Route53 and will not do an lookup using the route53:ListHostedZonesByName api call.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostedZoneID;

  /// Always set the region when using AccessKeyID and SecretAccessKey
  String region;

  /// Role is a Role ARN which the Route53 provider will assume using either the explicit credentials AccessKeyID/SecretAccessKey or the inferred credentials from environment variables, shared credentials file or AWS Instance metadata
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53SecretAccessKeySecretRef?
      secretAccessKeySecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53 &&
          other.accessKeyID == accessKeyID &&
          other.accessKeyIDSecretRef == accessKeyIDSecretRef &&
          other.hostedZoneID == hostedZoneID &&
          other.region == region &&
          other.role == role &&
          other.secretAccessKeySecretRef == secretAccessKeySecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessKeyID == null ? 0 : accessKeyID!.hashCode) +
      (accessKeyIDSecretRef == null ? 0 : accessKeyIDSecretRef!.hashCode) +
      (hostedZoneID == null ? 0 : hostedZoneID!.hashCode) +
      (region.hashCode) +
      (role == null ? 0 : role!.hashCode) +
      (secretAccessKeySecretRef == null
          ? 0
          : secretAccessKeySecretRef!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53[accessKeyID=$accessKeyID, accessKeyIDSecretRef=$accessKeyIDSecretRef, hostedZoneID=$hostedZoneID, region=$region, role=$role, secretAccessKeySecretRef=$secretAccessKeySecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessKeyID != null) {
      json[r'accessKeyID'] = this.accessKeyID;
    } else {
      json[r'accessKeyID'] = null;
    }
    if (this.accessKeyIDSecretRef != null) {
      json[r'accessKeyIDSecretRef'] = this.accessKeyIDSecretRef;
    } else {
      json[r'accessKeyIDSecretRef'] = null;
    }
    if (this.hostedZoneID != null) {
      json[r'hostedZoneID'] = this.hostedZoneID;
    } else {
      json[r'hostedZoneID'] = null;
    }
    json[r'region'] = this.region;
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.secretAccessKeySecretRef != null) {
      json[r'secretAccessKeySecretRef'] = this.secretAccessKeySecretRef;
    } else {
      json[r'secretAccessKeySecretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53(
        accessKeyID: mapValueOfType<String>(json, r'accessKeyID'),
        accessKeyIDSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53AccessKeyIDSecretRef
                .fromJson(json[r'accessKeyIDSecretRef']),
        hostedZoneID: mapValueOfType<String>(json, r'hostedZoneID'),
        region: mapValueOfType<String>(json, r'region')!,
        role: mapValueOfType<String>(json, r'role'),
        secretAccessKeySecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53SecretAccessKeySecretRef
                .fromJson(json[r'secretAccessKeySecretRef']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'region',
  };
}
