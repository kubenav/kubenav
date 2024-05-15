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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_additional_output_formats_inner.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_issuer_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_keystores.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_name_constraints.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_other_names_inner.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_private_key.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_secret_template.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_subject.dart';

class IoCertManagerV1CertificateSpec {
  /// Returns a new [IoCertManagerV1CertificateSpec] instance.
  IoCertManagerV1CertificateSpec({
    this.additionalOutputFormats = const [],
    this.commonName,
    this.dnsNames = const [],
    this.duration,
    this.emailAddresses = const [],
    this.encodeUsagesInRequest,
    this.ipAddresses = const [],
    this.isCA,
    required this.issuerRef,
    this.keystores,
    this.literalSubject,
    this.nameConstraints,
    this.otherNames = const [],
    this.privateKey,
    this.renewBefore,
    this.revisionHistoryLimit,
    required this.secretName,
    this.secretTemplate,
    this.subject,
    this.uris = const [],
    this.usages = const [],
  });

  /// Defines extra output formats of the private key and signed certificate chain to be written to this Certificate's target Secret.   This is an Alpha Feature and is only enabled with the `--feature-gates=AdditionalCertificateOutputFormats=true` option set on both the controller and webhook components.
  List<IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>
      additionalOutputFormats;

  /// Requested common name X509 certificate subject attribute. More info: https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6 NOTE: TLS clients will ignore this value when any subject alternative name is set (see https://tools.ietf.org/html/rfc6125#section-6.4.4).   Should have a length of 64 characters or fewer to avoid generating invalid CSRs. Cannot be set if the `literalSubject` field is set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commonName;

  /// Requested DNS subject alternative names.
  List<String> dnsNames;

  /// Requested 'duration' (i.e. lifetime) of the Certificate. Note that the issuer may choose to ignore the requested duration, just like any other requested attribute.   If unset, this defaults to 90 days. Minimum accepted duration is 1 hour. Value must be in units accepted by Go time.ParseDuration https://golang.org/pkg/time/#ParseDuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  /// Requested email subject alternative names.
  List<String> emailAddresses;

  /// Whether the KeyUsage and ExtKeyUsage extensions should be set in the encoded CSR.   This option defaults to true, and should only be disabled if the target issuer does not support CSRs with these X509 KeyUsage/ ExtKeyUsage extensions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? encodeUsagesInRequest;

  /// Requested IP address subject alternative names.
  List<String> ipAddresses;

  /// Requested basic constraints isCA value. The isCA value is used to set the `isCA` field on the created CertificateRequest resources. Note that the issuer may choose to ignore the requested isCA value, just like any other requested attribute.   If true, this will automatically add the `cert sign` usage to the list of requested `usages`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isCA;

  IoCertManagerV1CertificateSpecIssuerRef issuerRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecKeystores? keystores;

  /// Requested X.509 certificate subject, represented using the LDAP \"String Representation of a Distinguished Name\" [1]. Important: the LDAP string format also specifies the order of the attributes in the subject, this is important when issuing certs for LDAP authentication. Example: `CN=foo,DC=corp,DC=example,DC=com` More info [1]: https://datatracker.ietf.org/doc/html/rfc4514 More info: https://github.com/cert-manager/cert-manager/issues/3203 More info: https://github.com/cert-manager/cert-manager/issues/4424   Cannot be set if the `subject` or `commonName` field is set. This is an Alpha Feature and is only enabled with the `--feature-gates=LiteralCertificateSubject=true` option set on both the controller and webhook components.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? literalSubject;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecNameConstraints? nameConstraints;

  /// `otherNames` is an escape hatch for SAN that allows any type. We currently restrict the support to string like otherNames, cf RFC 5280 p 37 Any UTF8 String valued otherName can be passed with by setting the keys oid: x.x.x.x and UTF8Value: somevalue for `otherName`. Most commonly this would be UPN set with oid: 1.3.6.1.4.1.311.20.2.3 You should ensure that any OID passed is valid for the UTF8String type as we do not explicitly validate this.
  List<IoCertManagerV1CertificateSpecOtherNamesInner> otherNames;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecPrivateKey? privateKey;

  /// How long before the currently issued certificate's expiry cert-manager should renew the certificate. For example, if a certificate is valid for 60 minutes, and `renewBefore=10m`, cert-manager will begin to attempt to renew the certificate 50 minutes after it was issued (i.e. when there are 10 minutes remaining until the certificate is no longer valid).   NOTE: The actual lifetime of the issued certificate is used to determine the renewal time. If an issuer returns a certificate with a different lifetime than the one requested, cert-manager will use the lifetime of the issued certificate.   If unset, this defaults to 1/3 of the issued certificate's lifetime. Minimum accepted value is 5 minutes. Value must be in units accepted by Go time.ParseDuration https://golang.org/pkg/time/#ParseDuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? renewBefore;

  /// The maximum number of CertificateRequest revisions that are maintained in the Certificate's history. Each revision represents a single `CertificateRequest` created by this Certificate, either when it was created, renewed, or Spec was changed. Revisions will be removed by oldest first if the number of revisions exceeds this number.   If set, revisionHistoryLimit must be a value of `1` or greater. If unset (`nil`), revisions will not be garbage collected. Default value is `nil`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  /// Name of the Secret resource that will be automatically created and managed by this Certificate resource. It will be populated with a private key and certificate, signed by the denoted issuer. The Secret resource lives in the same namespace as the Certificate resource.
  String secretName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecSecretTemplate? secretTemplate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecSubject? subject;

  /// Requested URI subject alternative names.
  List<String> uris;

  /// Requested key usages and extended key usages. These usages are used to set the `usages` field on the created CertificateRequest resources. If `encodeUsagesInRequest` is unset or set to `true`, the usages will additionally be encoded in the `request` field which contains the CSR blob.   If unset, defaults to `digital signature` and `key encipherment`.
  List<IoCertManagerV1CertificateRequestSpecUsagesEnum> usages;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpec &&
          deepEquality.equals(
              other.additionalOutputFormats, additionalOutputFormats) &&
          other.commonName == commonName &&
          deepEquality.equals(other.dnsNames, dnsNames) &&
          other.duration == duration &&
          deepEquality.equals(other.emailAddresses, emailAddresses) &&
          other.encodeUsagesInRequest == encodeUsagesInRequest &&
          deepEquality.equals(other.ipAddresses, ipAddresses) &&
          other.isCA == isCA &&
          other.issuerRef == issuerRef &&
          other.keystores == keystores &&
          other.literalSubject == literalSubject &&
          other.nameConstraints == nameConstraints &&
          deepEquality.equals(other.otherNames, otherNames) &&
          other.privateKey == privateKey &&
          other.renewBefore == renewBefore &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.secretName == secretName &&
          other.secretTemplate == secretTemplate &&
          other.subject == subject &&
          deepEquality.equals(other.uris, uris) &&
          deepEquality.equals(other.usages, usages);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (additionalOutputFormats.hashCode) +
      (commonName == null ? 0 : commonName!.hashCode) +
      (dnsNames.hashCode) +
      (duration == null ? 0 : duration!.hashCode) +
      (emailAddresses.hashCode) +
      (encodeUsagesInRequest == null ? 0 : encodeUsagesInRequest!.hashCode) +
      (ipAddresses.hashCode) +
      (isCA == null ? 0 : isCA!.hashCode) +
      (issuerRef.hashCode) +
      (keystores == null ? 0 : keystores!.hashCode) +
      (literalSubject == null ? 0 : literalSubject!.hashCode) +
      (nameConstraints == null ? 0 : nameConstraints!.hashCode) +
      (otherNames.hashCode) +
      (privateKey == null ? 0 : privateKey!.hashCode) +
      (renewBefore == null ? 0 : renewBefore!.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (secretName.hashCode) +
      (secretTemplate == null ? 0 : secretTemplate!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (uris.hashCode) +
      (usages.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpec[additionalOutputFormats=$additionalOutputFormats, commonName=$commonName, dnsNames=$dnsNames, duration=$duration, emailAddresses=$emailAddresses, encodeUsagesInRequest=$encodeUsagesInRequest, ipAddresses=$ipAddresses, isCA=$isCA, issuerRef=$issuerRef, keystores=$keystores, literalSubject=$literalSubject, nameConstraints=$nameConstraints, otherNames=$otherNames, privateKey=$privateKey, renewBefore=$renewBefore, revisionHistoryLimit=$revisionHistoryLimit, secretName=$secretName, secretTemplate=$secretTemplate, subject=$subject, uris=$uris, usages=$usages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'additionalOutputFormats'] = this.additionalOutputFormats;
    if (this.commonName != null) {
      json[r'commonName'] = this.commonName;
    } else {
      json[r'commonName'] = null;
    }
    json[r'dnsNames'] = this.dnsNames;
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    json[r'emailAddresses'] = this.emailAddresses;
    if (this.encodeUsagesInRequest != null) {
      json[r'encodeUsagesInRequest'] = this.encodeUsagesInRequest;
    } else {
      json[r'encodeUsagesInRequest'] = null;
    }
    json[r'ipAddresses'] = this.ipAddresses;
    if (this.isCA != null) {
      json[r'isCA'] = this.isCA;
    } else {
      json[r'isCA'] = null;
    }
    json[r'issuerRef'] = this.issuerRef;
    if (this.keystores != null) {
      json[r'keystores'] = this.keystores;
    } else {
      json[r'keystores'] = null;
    }
    if (this.literalSubject != null) {
      json[r'literalSubject'] = this.literalSubject;
    } else {
      json[r'literalSubject'] = null;
    }
    if (this.nameConstraints != null) {
      json[r'nameConstraints'] = this.nameConstraints;
    } else {
      json[r'nameConstraints'] = null;
    }
    json[r'otherNames'] = this.otherNames;
    if (this.privateKey != null) {
      json[r'privateKey'] = this.privateKey;
    } else {
      json[r'privateKey'] = null;
    }
    if (this.renewBefore != null) {
      json[r'renewBefore'] = this.renewBefore;
    } else {
      json[r'renewBefore'] = null;
    }
    if (this.revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = this.revisionHistoryLimit;
    } else {
      json[r'revisionHistoryLimit'] = null;
    }
    json[r'secretName'] = this.secretName;
    if (this.secretTemplate != null) {
      json[r'secretTemplate'] = this.secretTemplate;
    } else {
      json[r'secretTemplate'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    json[r'uris'] = this.uris;
    json[r'usages'] = this.usages;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpec(
        additionalOutputFormats:
            IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner
                .listFromJson(json[r'additionalOutputFormats']),
        commonName: mapValueOfType<String>(json, r'commonName'),
        dnsNames: json[r'dnsNames'] is Iterable
            ? (json[r'dnsNames'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        duration: mapValueOfType<String>(json, r'duration'),
        emailAddresses: json[r'emailAddresses'] is Iterable
            ? (json[r'emailAddresses'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        encodeUsagesInRequest:
            mapValueOfType<bool>(json, r'encodeUsagesInRequest'),
        ipAddresses: json[r'ipAddresses'] is Iterable
            ? (json[r'ipAddresses'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        isCA: mapValueOfType<bool>(json, r'isCA'),
        issuerRef: IoCertManagerV1CertificateSpecIssuerRef.fromJson(
            json[r'issuerRef'])!,
        keystores: IoCertManagerV1CertificateSpecKeystores.fromJson(
            json[r'keystores']),
        literalSubject: mapValueOfType<String>(json, r'literalSubject'),
        nameConstraints: IoCertManagerV1CertificateSpecNameConstraints.fromJson(
            json[r'nameConstraints']),
        otherNames: IoCertManagerV1CertificateSpecOtherNamesInner.listFromJson(
            json[r'otherNames']),
        privateKey: IoCertManagerV1CertificateSpecPrivateKey.fromJson(
            json[r'privateKey']),
        renewBefore: mapValueOfType<String>(json, r'renewBefore'),
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        secretName: mapValueOfType<String>(json, r'secretName')!,
        secretTemplate: IoCertManagerV1CertificateSpecSecretTemplate.fromJson(
            json[r'secretTemplate']),
        subject:
            IoCertManagerV1CertificateSpecSubject.fromJson(json[r'subject']),
        uris: json[r'uris'] is Iterable
            ? (json[r'uris'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        usages: IoCertManagerV1CertificateRequestSpecUsagesEnum.listFromJson(
            json[r'usages']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpec> mapFromJson(dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1CertificateSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpec-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateSpec.listFromJson(
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
    'secretName',
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
