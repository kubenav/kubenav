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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_request_status_conditions_inner.dart';

class IoCertManagerV1CertificateRequestStatus {
  /// Returns a new [IoCertManagerV1CertificateRequestStatus] instance.
  IoCertManagerV1CertificateRequestStatus({
    this.ca,
    this.certificate,
    this.conditions = const [],
    this.failureTime,
  });

  /// The PEM encoded X.509 certificate of the signer, also known as the CA (Certificate Authority). This is set on a best-effort basis by different issuers. If not set, the CA is assumed to be unknown/not available.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ca;

  /// The PEM encoded X.509 certificate resulting from the certificate signing request. If not set, the CertificateRequest has either not been completed or has failed. More information on failure can be found by checking the `conditions` field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? certificate;

  /// List of status conditions to indicate the status of a CertificateRequest. Known condition types are `Ready`, `InvalidRequest`, `Approved` and `Denied`.
  List<IoCertManagerV1CertificateRequestStatusConditionsInner> conditions;

  /// FailureTime stores the time that this CertificateRequest failed. This is used to influence garbage collection and back-off.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? failureTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateRequestStatus &&
          other.ca == ca &&
          other.certificate == certificate &&
          deepEquality.equals(other.conditions, conditions) &&
          other.failureTime == failureTime;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ca == null ? 0 : ca!.hashCode) +
      (certificate == null ? 0 : certificate!.hashCode) +
      (conditions.hashCode) +
      (failureTime == null ? 0 : failureTime!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateRequestStatus[ca=$ca, certificate=$certificate, conditions=$conditions, failureTime=$failureTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ca != null) {
      json[r'ca'] = this.ca;
    } else {
      json[r'ca'] = null;
    }
    if (this.certificate != null) {
      json[r'certificate'] = this.certificate;
    } else {
      json[r'certificate'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.failureTime != null) {
      json[r'failureTime'] = this.failureTime!.toUtc().toIso8601String();
    } else {
      json[r'failureTime'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateRequestStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateRequestStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateRequestStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateRequestStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateRequestStatus(
        ca: mapValueOfType<String>(json, r'ca'),
        certificate: mapValueOfType<String>(json, r'certificate'),
        conditions:
            IoCertManagerV1CertificateRequestStatusConditionsInner.listFromJson(
                json[r'conditions']),
        failureTime: mapDateTime(json, r'failureTime', r''),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateRequestStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateRequestStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateRequestStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateRequestStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateRequestStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateRequestStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateRequestStatus-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateRequestStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateRequestStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateRequestStatus.listFromJson(
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
