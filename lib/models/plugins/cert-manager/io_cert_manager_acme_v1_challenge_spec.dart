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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_issuer_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver.dart';

class IoCertManagerAcmeV1ChallengeSpec {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpec] instance.
  IoCertManagerAcmeV1ChallengeSpec({
    required this.authorizationURL,
    required this.dnsName,
    required this.issuerRef,
    required this.key,
    required this.solver,
    required this.token,
    required this.type,
    required this.url,
    this.wildcard,
  });

  /// The URL to the ACME Authorization resource that this challenge is a part of.
  String authorizationURL;

  /// dnsName is the identifier that this challenge is for, e.g. example.com. If the requested DNSName is a 'wildcard', this field MUST be set to the non-wildcard domain, e.g. for `*.example.com`, it must be `example.com`.
  String dnsName;

  IoCertManagerAcmeV1ChallengeSpecIssuerRef issuerRef;

  /// The ACME challenge key for this challenge For HTTP01 challenges, this is the value that must be responded with to complete the HTTP01 challenge in the format: `<private key JWK thumbprint>.<key from acme server for challenge>`. For DNS01 challenges, this is the base64 encoded SHA256 sum of the `<private key JWK thumbprint>.<key from acme server for challenge>` text that must be set as the TXT record content.
  String key;

  IoCertManagerAcmeV1ChallengeSpecSolver solver;

  /// The ACME challenge token for this challenge. This is the raw value returned from the ACME server.
  String token;

  /// The type of ACME challenge this resource represents. One of \"HTTP-01\" or \"DNS-01\".
  IoCertManagerAcmeV1ChallengeSpecTypeEnum type;

  /// The URL of the ACME Challenge resource for this challenge. This can be used to lookup details about the status of this challenge.
  String url;

  /// wildcard will be true if this challenge is for a wildcard identifier, for example '*.example.com'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? wildcard;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpec &&
          other.authorizationURL == authorizationURL &&
          other.dnsName == dnsName &&
          other.issuerRef == issuerRef &&
          other.key == key &&
          other.solver == solver &&
          other.token == token &&
          other.type == type &&
          other.url == url &&
          other.wildcard == wildcard;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (authorizationURL.hashCode) +
      (dnsName.hashCode) +
      (issuerRef.hashCode) +
      (key.hashCode) +
      (solver.hashCode) +
      (token.hashCode) +
      (type.hashCode) +
      (url.hashCode) +
      (wildcard == null ? 0 : wildcard!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpec[authorizationURL=$authorizationURL, dnsName=$dnsName, issuerRef=$issuerRef, key=$key, solver=$solver, token=$token, type=$type, url=$url, wildcard=$wildcard]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'authorizationURL'] = this.authorizationURL;
    json[r'dnsName'] = this.dnsName;
    json[r'issuerRef'] = this.issuerRef;
    json[r'key'] = this.key;
    json[r'solver'] = this.solver;
    json[r'token'] = this.token;
    json[r'type'] = this.type;
    json[r'url'] = this.url;
    if (this.wildcard != null) {
      json[r'wildcard'] = this.wildcard;
    } else {
      json[r'wildcard'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpec(
        authorizationURL: mapValueOfType<String>(json, r'authorizationURL')!,
        dnsName: mapValueOfType<String>(json, r'dnsName')!,
        issuerRef: IoCertManagerAcmeV1ChallengeSpecIssuerRef.fromJson(
            json[r'issuerRef'])!,
        key: mapValueOfType<String>(json, r'key')!,
        solver:
            IoCertManagerAcmeV1ChallengeSpecSolver.fromJson(json[r'solver'])!,
        token: mapValueOfType<String>(json, r'token')!,
        type: IoCertManagerAcmeV1ChallengeSpecTypeEnum.fromJson(json[r'type'])!,
        url: mapValueOfType<String>(json, r'url')!,
        wildcard: mapValueOfType<bool>(json, r'wildcard'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1ChallengeSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerAcmeV1ChallengeSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpec-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1ChallengeSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerAcmeV1ChallengeSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'authorizationURL',
    'dnsName',
    'issuerRef',
    'key',
    'solver',
    'token',
    'type',
    'url',
  };
}

/// The type of ACME challenge this resource represents. One of \"HTTP-01\" or \"DNS-01\".
class IoCertManagerAcmeV1ChallengeSpecTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1ChallengeSpecTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const hTTP01 = IoCertManagerAcmeV1ChallengeSpecTypeEnum._(r'HTTP-01');
  static const dNS01 = IoCertManagerAcmeV1ChallengeSpecTypeEnum._(r'DNS-01');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1ChallengeSpecTypeEnum].
  static const values = <IoCertManagerAcmeV1ChallengeSpecTypeEnum>[
    hTTP01,
    dNS01,
  ];

  static IoCertManagerAcmeV1ChallengeSpecTypeEnum? fromJson(dynamic value) =>
      IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer().decode(value);

  static List<IoCertManagerAcmeV1ChallengeSpecTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1ChallengeSpecTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1ChallengeSpecTypeEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1ChallengeSpecTypeEnum].
class IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer {
  factory IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer._();

  const IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer._();

  String encode(IoCertManagerAcmeV1ChallengeSpecTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1ChallengeSpecTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1ChallengeSpecTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'HTTP-01':
          return IoCertManagerAcmeV1ChallengeSpecTypeEnum.hTTP01;
        case r'DNS-01':
          return IoCertManagerAcmeV1ChallengeSpecTypeEnum.dNS01;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1ChallengeSpecTypeEnumTypeTransformer? _instance;
}
