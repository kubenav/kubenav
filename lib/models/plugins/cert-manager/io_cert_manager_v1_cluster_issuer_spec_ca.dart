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

class IoCertManagerV1ClusterIssuerSpecCa {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecCa] instance.
  IoCertManagerV1ClusterIssuerSpecCa({
    this.crlDistributionPoints = const [],
    this.issuingCertificateURLs = const [],
    this.ocspServers = const [],
    required this.secretName,
  });

  /// The CRL distribution points is an X.509 v3 certificate extension which identifies the location of the CRL from which the revocation of this certificate can be checked. If not set, certificates will be issued without distribution points set.
  List<String> crlDistributionPoints;

  /// IssuingCertificateURLs is a list of URLs which this issuer should embed into certificates it creates. See https://www.rfc-editor.org/rfc/rfc5280#section-4.2.2.1 for more details. As an example, such a URL might be \"http://ca.domain.com/ca.crt\".
  List<String> issuingCertificateURLs;

  /// The OCSP server list is an X.509 v3 extension that defines a list of URLs of OCSP responders. The OCSP responders can be queried for the revocation status of an issued certificate. If not set, the certificate will be issued with no OCSP servers set. For example, an OCSP server URL could be \"http://ocsp.int-x3.letsencrypt.org\".
  List<String> ocspServers;

  /// SecretName is the name of the secret used to sign Certificates issued by this Issuer.
  String secretName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecCa &&
          deepEquality.equals(
              other.crlDistributionPoints, crlDistributionPoints) &&
          deepEquality.equals(
              other.issuingCertificateURLs, issuingCertificateURLs) &&
          deepEquality.equals(other.ocspServers, ocspServers) &&
          other.secretName == secretName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (crlDistributionPoints.hashCode) +
      (issuingCertificateURLs.hashCode) +
      (ocspServers.hashCode) +
      (secretName.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecCa[crlDistributionPoints=$crlDistributionPoints, issuingCertificateURLs=$issuingCertificateURLs, ocspServers=$ocspServers, secretName=$secretName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'crlDistributionPoints'] = this.crlDistributionPoints;
    json[r'issuingCertificateURLs'] = this.issuingCertificateURLs;
    json[r'ocspServers'] = this.ocspServers;
    json[r'secretName'] = this.secretName;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecCa] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecCa? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecCa[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecCa[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecCa(
        crlDistributionPoints: json[r'crlDistributionPoints'] is Iterable
            ? (json[r'crlDistributionPoints'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        issuingCertificateURLs: json[r'issuingCertificateURLs'] is Iterable
            ? (json[r'issuingCertificateURLs'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        ocspServers: json[r'ocspServers'] is Iterable
            ? (json[r'ocspServers'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        secretName: mapValueOfType<String>(json, r'secretName')!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecCa> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecCa>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecCa.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecCa> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecCa>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1ClusterIssuerSpecCa.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecCa-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecCa>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecCa>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpecCa.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'secretName',
  };
}
