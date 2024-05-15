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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_rfc2136_tsig_secret_secret_ref.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136 {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136({
    required this.nameserver,
    this.tsigAlgorithm,
    this.tsigKeyName,
    this.tsigSecretSecretRef,
  });

  /// The IP address or hostname of an authoritative DNS server supporting RFC2136 in the form host:port. If the host is an IPv6 address it must be enclosed in square brackets (e.g [2001:db8::1]) ; port is optional. This field is required.
  String nameserver;

  /// The TSIG Algorithm configured in the DNS supporting RFC2136. Used only when ``tsigSecretSecretRef`` and ``tsigKeyName`` are defined. Supported values are (case-insensitive): ``HMACMD5`` (default), ``HMACSHA1``, ``HMACSHA256`` or ``HMACSHA512``.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tsigAlgorithm;

  /// The TSIG Key name configured in the DNS. If ``tsigSecretSecretRef`` is defined, this field is required.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tsigKeyName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136TsigSecretSecretRef?
      tsigSecretSecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136 &&
          other.nameserver == nameserver &&
          other.tsigAlgorithm == tsigAlgorithm &&
          other.tsigKeyName == tsigKeyName &&
          other.tsigSecretSecretRef == tsigSecretSecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nameserver.hashCode) +
      (tsigAlgorithm == null ? 0 : tsigAlgorithm!.hashCode) +
      (tsigKeyName == null ? 0 : tsigKeyName!.hashCode) +
      (tsigSecretSecretRef == null ? 0 : tsigSecretSecretRef!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136[nameserver=$nameserver, tsigAlgorithm=$tsigAlgorithm, tsigKeyName=$tsigKeyName, tsigSecretSecretRef=$tsigSecretSecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'nameserver'] = this.nameserver;
    if (this.tsigAlgorithm != null) {
      json[r'tsigAlgorithm'] = this.tsigAlgorithm;
    } else {
      json[r'tsigAlgorithm'] = null;
    }
    if (this.tsigKeyName != null) {
      json[r'tsigKeyName'] = this.tsigKeyName;
    } else {
      json[r'tsigKeyName'] = null;
    }
    if (this.tsigSecretSecretRef != null) {
      json[r'tsigSecretSecretRef'] = this.tsigSecretSecretRef;
    } else {
      json[r'tsigSecretSecretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136(
        nameserver: mapValueOfType<String>(json, r'nameserver')!,
        tsigAlgorithm: mapValueOfType<String>(json, r'tsigAlgorithm'),
        tsigKeyName: mapValueOfType<String>(json, r'tsigKeyName'),
        tsigSecretSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136TsigSecretSecretRef
                .fromJson(json[r'tsigSecretSecretRef']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Rfc2136.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'nameserver',
  };
}
