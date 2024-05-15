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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_status_conditions_inner.dart';

class IoCertManagerV1CertificateStatus {
  /// Returns a new [IoCertManagerV1CertificateStatus] instance.
  IoCertManagerV1CertificateStatus({
    this.conditions = const [],
    this.failedIssuanceAttempts,
    this.lastFailureTime,
    this.nextPrivateKeySecretName,
    this.notAfter,
    this.notBefore,
    this.renewalTime,
    this.revision,
  });

  /// List of status conditions to indicate the status of certificates. Known condition types are `Ready` and `Issuing`.
  List<IoCertManagerV1CertificateStatusConditionsInner> conditions;

  /// The number of continuous failed issuance attempts up till now. This field gets removed (if set) on a successful issuance and gets set to 1 if unset and an issuance has failed. If an issuance has failed, the delay till the next issuance will be calculated using formula time.Hour * 2 ^ (failedIssuanceAttempts - 1).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failedIssuanceAttempts;

  /// LastFailureTime is set only if the lastest issuance for this Certificate failed and contains the time of the failure. If an issuance has failed, the delay till the next issuance will be calculated using formula time.Hour * 2 ^ (failedIssuanceAttempts - 1). If the latest issuance has succeeded this field will be unset.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastFailureTime;

  /// The name of the Secret resource containing the private key to be used for the next certificate iteration. The keymanager controller will automatically set this field if the `Issuing` condition is set to `True`. It will automatically unset this field when the Issuing condition is not set or False.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPrivateKeySecretName;

  /// The expiration time of the certificate stored in the secret named by this resource in `spec.secretName`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? notAfter;

  /// The time after which the certificate stored in the secret named by this resource in `spec.secretName` is valid.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? notBefore;

  /// RenewalTime is the time at which the certificate will be next renewed. If not set, no upcoming renewal is scheduled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? renewalTime;

  /// The current 'revision' of the certificate as issued.   When a CertificateRequest resource is created, it will have the `cert-manager.io/certificate-revision` set to one greater than the current value of this field.   Upon issuance, this field will be set to the value of the annotation on the CertificateRequest resource used to issue the certificate.   Persisting the value on the CertificateRequest resource allows the certificates controller to know whether a request is part of an old issuance or if it is part of the ongoing revision's issuance by checking if the revision value in the annotation is greater than this field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revision;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.failedIssuanceAttempts == failedIssuanceAttempts &&
          other.lastFailureTime == lastFailureTime &&
          other.nextPrivateKeySecretName == nextPrivateKeySecretName &&
          other.notAfter == notAfter &&
          other.notBefore == notBefore &&
          other.renewalTime == renewalTime &&
          other.revision == revision;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (failedIssuanceAttempts == null ? 0 : failedIssuanceAttempts!.hashCode) +
      (lastFailureTime == null ? 0 : lastFailureTime!.hashCode) +
      (nextPrivateKeySecretName == null
          ? 0
          : nextPrivateKeySecretName!.hashCode) +
      (notAfter == null ? 0 : notAfter!.hashCode) +
      (notBefore == null ? 0 : notBefore!.hashCode) +
      (renewalTime == null ? 0 : renewalTime!.hashCode) +
      (revision == null ? 0 : revision!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateStatus[conditions=$conditions, failedIssuanceAttempts=$failedIssuanceAttempts, lastFailureTime=$lastFailureTime, nextPrivateKeySecretName=$nextPrivateKeySecretName, notAfter=$notAfter, notBefore=$notBefore, renewalTime=$renewalTime, revision=$revision]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.failedIssuanceAttempts != null) {
      json[r'failedIssuanceAttempts'] = this.failedIssuanceAttempts;
    } else {
      json[r'failedIssuanceAttempts'] = null;
    }
    if (this.lastFailureTime != null) {
      json[r'lastFailureTime'] =
          this.lastFailureTime!.toUtc().toIso8601String();
    } else {
      json[r'lastFailureTime'] = null;
    }
    if (this.nextPrivateKeySecretName != null) {
      json[r'nextPrivateKeySecretName'] = this.nextPrivateKeySecretName;
    } else {
      json[r'nextPrivateKeySecretName'] = null;
    }
    if (this.notAfter != null) {
      json[r'notAfter'] = this.notAfter!.toUtc().toIso8601String();
    } else {
      json[r'notAfter'] = null;
    }
    if (this.notBefore != null) {
      json[r'notBefore'] = this.notBefore!.toUtc().toIso8601String();
    } else {
      json[r'notBefore'] = null;
    }
    if (this.renewalTime != null) {
      json[r'renewalTime'] = this.renewalTime!.toUtc().toIso8601String();
    } else {
      json[r'renewalTime'] = null;
    }
    if (this.revision != null) {
      json[r'revision'] = this.revision;
    } else {
      json[r'revision'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateStatus(
        conditions:
            IoCertManagerV1CertificateStatusConditionsInner.listFromJson(
                json[r'conditions']),
        failedIssuanceAttempts:
            mapValueOfType<int>(json, r'failedIssuanceAttempts'),
        lastFailureTime: mapDateTime(json, r'lastFailureTime', r''),
        nextPrivateKeySecretName:
            mapValueOfType<String>(json, r'nextPrivateKeySecretName'),
        notAfter: mapDateTime(json, r'notAfter', r''),
        notBefore: mapDateTime(json, r'notBefore', r''),
        renewalTime: mapDateTime(json, r'renewalTime', r''),
        revision: mapValueOfType<int>(json, r'revision'),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1CertificateStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateStatus-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateStatus.listFromJson(
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
