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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_issuer_ref.dart';

class IoCertManagerV1CertificateRequestSpec {
  /// Returns a new [IoCertManagerV1CertificateRequestSpec] instance.
  IoCertManagerV1CertificateRequestSpec({
    this.duration,
    this.extra = const {},
    this.groups = const [],
    this.isCA,
    required this.issuerRef,
    required this.request,
    this.uid,
    this.usages = const [],
    this.username,
  });

  /// Requested 'duration' (i.e. lifetime) of the Certificate. Note that the issuer may choose to ignore the requested duration, just like any other requested attribute.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  /// Extra contains extra attributes of the user that created the CertificateRequest. Populated by the cert-manager webhook on creation and immutable.
  Map<String, List<dynamic>>? extra;

  /// Groups contains group membership of the user that created the CertificateRequest. Populated by the cert-manager webhook on creation and immutable.
  List<String> groups;

  /// Requested basic constraints isCA value. Note that the issuer may choose to ignore the requested isCA value, just like any other requested attribute.   NOTE: If the CSR in the `Request` field has a BasicConstraints extension, it must have the same isCA value as specified here.   If true, this will automatically add the `cert sign` usage to the list of requested `usages`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isCA;

  IoCertManagerV1CertificateSpecIssuerRef issuerRef;

  /// The PEM-encoded X.509 certificate signing request to be submitted to the issuer for signing.   If the CSR has a BasicConstraints extension, its isCA attribute must match the `isCA` value of this CertificateRequest. If the CSR has a KeyUsage extension, its key usages must match the key usages in the `usages` field of this CertificateRequest. If the CSR has a ExtKeyUsage extension, its extended key usages must match the extended key usages in the `usages` field of this CertificateRequest.
  String request;

  /// UID contains the uid of the user that created the CertificateRequest. Populated by the cert-manager webhook on creation and immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uid;

  /// Requested key usages and extended key usages.   NOTE: If the CSR in the `Request` field has uses the KeyUsage or ExtKeyUsage extension, these extensions must have the same values as specified here without any additional values.   If unset, defaults to `digital signature` and `key encipherment`.
  List<IoCertManagerV1CertificateRequestSpecUsagesEnum> usages;

  /// Username contains the name of the user that created the CertificateRequest. Populated by the cert-manager webhook on creation and immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateRequestSpec &&
          other.duration == duration &&
          deepEquality.equals(other.extra, extra) &&
          deepEquality.equals(other.groups, groups) &&
          other.isCA == isCA &&
          other.issuerRef == issuerRef &&
          other.request == request &&
          other.uid == uid &&
          deepEquality.equals(other.usages, usages) &&
          other.username == username;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (duration == null ? 0 : duration!.hashCode) +
      (extra.hashCode) +
      (groups.hashCode) +
      (isCA == null ? 0 : isCA!.hashCode) +
      (issuerRef.hashCode) +
      (request.hashCode) +
      (uid == null ? 0 : uid!.hashCode) +
      (usages.hashCode) +
      (username == null ? 0 : username!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateRequestSpec[duration=$duration, extra=$extra, groups=$groups, isCA=$isCA, issuerRef=$issuerRef, request=$request, uid=$uid, usages=$usages, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    json[r'extra'] = this.extra;
    json[r'groups'] = this.groups;
    if (this.isCA != null) {
      json[r'isCA'] = this.isCA;
    } else {
      json[r'isCA'] = null;
    }
    json[r'issuerRef'] = this.issuerRef;
    json[r'request'] = this.request;
    if (this.uid != null) {
      json[r'uid'] = this.uid;
    } else {
      json[r'uid'] = null;
    }
    json[r'usages'] = this.usages;
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateRequestSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateRequestSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateRequestSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateRequestSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateRequestSpec(
        duration: mapValueOfType<String>(json, r'duration'),
        extra: json[r'extra'] == null
            ? const {}
            : mapCastOfType<String, List>(json, r'extra'),
        groups: json[r'groups'] is Iterable
            ? (json[r'groups'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        isCA: mapValueOfType<bool>(json, r'isCA'),
        issuerRef: IoCertManagerV1CertificateSpecIssuerRef.fromJson(
            json[r'issuerRef'])!,
        request: mapValueOfType<String>(json, r'request')!,
        uid: mapValueOfType<String>(json, r'uid'),
        usages: IoCertManagerV1CertificateRequestSpecUsagesEnum.listFromJson(
            json[r'usages']),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateRequestSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateRequestSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateRequestSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateRequestSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateRequestSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateRequestSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateRequestSpec-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateRequestSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateRequestSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateRequestSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issuerRef',
    'request',
  };
}

/// KeyUsage specifies valid usage contexts for keys. See: https://tools.ietf.org/html/rfc5280#section-4.2.1.3 https://tools.ietf.org/html/rfc5280#section-4.2.1.12   Valid KeyUsage values are as follows: \"signing\", \"digital signature\", \"content commitment\", \"key encipherment\", \"key agreement\", \"data encipherment\", \"cert sign\", \"crl sign\", \"encipher only\", \"decipher only\", \"any\", \"server auth\", \"client auth\", \"code signing\", \"email protection\", \"s/mime\", \"ipsec end system\", \"ipsec tunnel\", \"ipsec user\", \"timestamping\", \"ocsp signing\", \"microsoft sgc\", \"netscape sgc\"
class IoCertManagerV1CertificateRequestSpecUsagesEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateRequestSpecUsagesEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const signing =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'signing');
  static const digitalSignature =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'digital signature');
  static const contentCommitment =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'content commitment');
  static const keyEncipherment =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'key encipherment');
  static const keyAgreement =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'key agreement');
  static const dataEncipherment =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'data encipherment');
  static const certSign =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'cert sign');
  static const crlSign =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'crl sign');
  static const encipherOnly =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'encipher only');
  static const decipherOnly =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'decipher only');
  static const any = IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'any');
  static const serverAuth =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'server auth');
  static const clientAuth =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'client auth');
  static const codeSigning =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'code signing');
  static const emailProtection =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'email protection');
  static const sSlashMime =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r's/mime');
  static const ipsecEndSystem =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'ipsec end system');
  static const ipsecTunnel =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'ipsec tunnel');
  static const ipsecUser =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'ipsec user');
  static const timestamping =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'timestamping');
  static const ocspSigning =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'ocsp signing');
  static const microsoftSgc =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'microsoft sgc');
  static const netscapeSgc =
      IoCertManagerV1CertificateRequestSpecUsagesEnum._(r'netscape sgc');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateRequestSpecUsagesEnum].
  static const values = <IoCertManagerV1CertificateRequestSpecUsagesEnum>[
    signing,
    digitalSignature,
    contentCommitment,
    keyEncipherment,
    keyAgreement,
    dataEncipherment,
    certSign,
    crlSign,
    encipherOnly,
    decipherOnly,
    any,
    serverAuth,
    clientAuth,
    codeSigning,
    emailProtection,
    sSlashMime,
    ipsecEndSystem,
    ipsecTunnel,
    ipsecUser,
    timestamping,
    ocspSigning,
    microsoftSgc,
    netscapeSgc,
  ];

  static IoCertManagerV1CertificateRequestSpecUsagesEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateRequestSpecUsagesEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateRequestSpecUsagesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateRequestSpecUsagesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateRequestSpecUsagesEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateRequestSpecUsagesEnum].
class IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer {
  factory IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer._();

  String encode(IoCertManagerV1CertificateRequestSpecUsagesEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateRequestSpecUsagesEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateRequestSpecUsagesEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'signing':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.signing;
        case r'digital signature':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum
              .digitalSignature;
        case r'content commitment':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum
              .contentCommitment;
        case r'key encipherment':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum
              .keyEncipherment;
        case r'key agreement':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.keyAgreement;
        case r'data encipherment':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum
              .dataEncipherment;
        case r'cert sign':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.certSign;
        case r'crl sign':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.crlSign;
        case r'encipher only':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.encipherOnly;
        case r'decipher only':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.decipherOnly;
        case r'any':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.any;
        case r'server auth':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.serverAuth;
        case r'client auth':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.clientAuth;
        case r'code signing':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.codeSigning;
        case r'email protection':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum
              .emailProtection;
        case r's/mime':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.sSlashMime;
        case r'ipsec end system':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.ipsecEndSystem;
        case r'ipsec tunnel':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.ipsecTunnel;
        case r'ipsec user':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.ipsecUser;
        case r'timestamping':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.timestamping;
        case r'ocsp signing':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.ocspSigning;
        case r'microsoft sgc':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.microsoftSgc;
        case r'netscape sgc':
          return IoCertManagerV1CertificateRequestSpecUsagesEnum.netscapeSgc;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateRequestSpecUsagesEnumTypeTransformer?
      _instance;
}
