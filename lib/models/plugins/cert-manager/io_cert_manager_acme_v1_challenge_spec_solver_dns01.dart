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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_acme_dns.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_akamai.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_azure_dns.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_cloud_dns.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_cloudflare.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_digitalocean.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_rfc2136.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_route53.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_webhook.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverDns01 {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01({
    this.acmeDNS,
    this.akamai,
    this.azureDNS,
    this.cloudDNS,
    this.cloudflare,
    this.cnameStrategy,
    this.digitalocean,
    this.rfc2136,
    this.route53,
    this.webhook,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNS? acmeDNS;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai? akamai;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS? azureDNS;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS? cloudDNS;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Cloudflare? cloudflare;

  /// CNAMEStrategy configures how the DNS01 provider should handle CNAME records when found in DNS zones.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum? cnameStrategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Digitalocean? digitalocean;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136? rfc2136;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53? route53;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook? webhook;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01 &&
          other.acmeDNS == acmeDNS &&
          other.akamai == akamai &&
          other.azureDNS == azureDNS &&
          other.cloudDNS == cloudDNS &&
          other.cloudflare == cloudflare &&
          other.cnameStrategy == cnameStrategy &&
          other.digitalocean == digitalocean &&
          other.rfc2136 == rfc2136 &&
          other.route53 == route53 &&
          other.webhook == webhook;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (acmeDNS == null ? 0 : acmeDNS!.hashCode) +
      (akamai == null ? 0 : akamai!.hashCode) +
      (azureDNS == null ? 0 : azureDNS!.hashCode) +
      (cloudDNS == null ? 0 : cloudDNS!.hashCode) +
      (cloudflare == null ? 0 : cloudflare!.hashCode) +
      (cnameStrategy == null ? 0 : cnameStrategy!.hashCode) +
      (digitalocean == null ? 0 : digitalocean!.hashCode) +
      (rfc2136 == null ? 0 : rfc2136!.hashCode) +
      (route53 == null ? 0 : route53!.hashCode) +
      (webhook == null ? 0 : webhook!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01[acmeDNS=$acmeDNS, akamai=$akamai, azureDNS=$azureDNS, cloudDNS=$cloudDNS, cloudflare=$cloudflare, cnameStrategy=$cnameStrategy, digitalocean=$digitalocean, rfc2136=$rfc2136, route53=$route53, webhook=$webhook]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.acmeDNS != null) {
      json[r'acmeDNS'] = this.acmeDNS;
    } else {
      json[r'acmeDNS'] = null;
    }
    if (this.akamai != null) {
      json[r'akamai'] = this.akamai;
    } else {
      json[r'akamai'] = null;
    }
    if (this.azureDNS != null) {
      json[r'azureDNS'] = this.azureDNS;
    } else {
      json[r'azureDNS'] = null;
    }
    if (this.cloudDNS != null) {
      json[r'cloudDNS'] = this.cloudDNS;
    } else {
      json[r'cloudDNS'] = null;
    }
    if (this.cloudflare != null) {
      json[r'cloudflare'] = this.cloudflare;
    } else {
      json[r'cloudflare'] = null;
    }
    if (this.cnameStrategy != null) {
      json[r'cnameStrategy'] = this.cnameStrategy;
    } else {
      json[r'cnameStrategy'] = null;
    }
    if (this.digitalocean != null) {
      json[r'digitalocean'] = this.digitalocean;
    } else {
      json[r'digitalocean'] = null;
    }
    if (this.rfc2136 != null) {
      json[r'rfc2136'] = this.rfc2136;
    } else {
      json[r'rfc2136'] = null;
    }
    if (this.route53 != null) {
      json[r'route53'] = this.route53;
    } else {
      json[r'route53'] = null;
    }
    if (this.webhook != null) {
      json[r'webhook'] = this.webhook;
    } else {
      json[r'webhook'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01(
        acmeDNS: IoCertManagerAcmeV1ChallengeSpecSolverDns01AcmeDNS.fromJson(
            json[r'acmeDNS']),
        akamai: IoCertManagerAcmeV1ChallengeSpecSolverDns01Akamai.fromJson(
            json[r'akamai']),
        azureDNS: IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS.fromJson(
            json[r'azureDNS']),
        cloudDNS: IoCertManagerAcmeV1ChallengeSpecSolverDns01CloudDNS.fromJson(
            json[r'cloudDNS']),
        cloudflare:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Cloudflare.fromJson(
                json[r'cloudflare']),
        cnameStrategy:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum
                .fromJson(json[r'cnameStrategy']),
        digitalocean:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Digitalocean.fromJson(
                json[r'digitalocean']),
        rfc2136: IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136.fromJson(
            json[r'rfc2136']),
        route53: IoCertManagerAcmeV1ChallengeSpecSolverDns01Route53.fromJson(
            json[r'route53']),
        webhook: IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook.fromJson(
            json[r'webhook']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1ChallengeSpecSolverDns01.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01.listFromJson(
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

/// CNAMEStrategy configures how the DNS01 provider should handle CNAME records when found in DNS zones.
class IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const none =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum._(r'None');
  static const follow =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum._(r'Follow');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum].
  static const values =
      <IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum>[
    none,
    follow,
  ];

  static IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum? fromJson(
          dynamic value) =>
      IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum].
class IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer {
  factory IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer
              ._();

  const IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer._();

  String encode(
          IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'None':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum
              .none;
        case r'Follow':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnum
              .follow;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01CnameStrategyEnumTypeTransformer?
      _instance;
}
