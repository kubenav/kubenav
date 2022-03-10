//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_certificates_v1_certificate_signing_request_condition.dart';

class IoK8sApiCertificatesV1CertificateSigningRequestStatus {
  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequestStatus] instance.
  IoK8sApiCertificatesV1CertificateSigningRequestStatus({
    this.certificate,
    this.conditions = const [],
  });

  /// certificate is populated with an issued certificate by the signer after an Approved condition is present. This field is set via the /status subresource. Once populated, this field is immutable.  If the certificate signing request is denied, a condition of type \"Denied\" is added and this field remains empty. If the signer cannot issue the certificate, a condition of type \"Failed\" is added and this field remains empty.  Validation requirements:  1. certificate must contain one or more PEM blocks.  2. All PEM blocks must have the \"CERTIFICATE\" label, contain no headers, and the encoded data   must be a BER-encoded ASN.1 Certificate structure as described in section 4 of RFC5280.  3. Non-PEM content may appear before or after the \"CERTIFICATE\" PEM blocks and is unvalidated,   to allow for explanatory text as described in section 5.2 of RFC7468.  If more than one PEM block is present, and the definition of the requested spec.signerName does not indicate otherwise, the first block is the issued certificate, and subsequent blocks should be treated as intermediate certificates and presented in TLS handshakes.  The certificate is encoded in PEM format.  When serialized as JSON or YAML, the data is additionally base64-encoded, so it consists of:      base64(     -----BEGIN CERTIFICATE-----     ...     -----END CERTIFICATE-----     )
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? certificate;

  /// conditions applied to the request. Known conditions are \"Approved\", \"Denied\", and \"Failed\".
  List<IoK8sApiCertificatesV1CertificateSigningRequestCondition> conditions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCertificatesV1CertificateSigningRequestStatus &&
          other.certificate == certificate &&
          other.conditions == conditions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (certificate == null ? 0 : certificate!.hashCode) + (conditions.hashCode);

  @override
  String toString() =>
      'IoK8sApiCertificatesV1CertificateSigningRequestStatus[certificate=$certificate, conditions=$conditions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (certificate != null) {
      json[r'certificate'] = certificate;
    }
    json[r'conditions'] = conditions;
    return json;
  }

  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequestStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCertificatesV1CertificateSigningRequestStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequestStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequestStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCertificatesV1CertificateSigningRequestStatus(
        certificate: mapValueOfType<String>(json, r'certificate'),
        conditions: IoK8sApiCertificatesV1CertificateSigningRequestCondition
                .listFromJson(json[r'conditions']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCertificatesV1CertificateSigningRequestStatus>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCertificatesV1CertificateSigningRequestStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCertificatesV1CertificateSigningRequestStatus>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiCertificatesV1CertificateSigningRequestStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCertificatesV1CertificateSigningRequestStatus-objects as value to a dart map
  static Map<String,
          List<IoK8sApiCertificatesV1CertificateSigningRequestStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCertificatesV1CertificateSigningRequestStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestStatus.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
