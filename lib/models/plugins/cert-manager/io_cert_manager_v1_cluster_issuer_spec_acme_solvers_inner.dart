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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_selector.dart';

class IoCertManagerV1ClusterIssuerSpecAcmeSolversInner {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcmeSolversInner] instance.
  IoCertManagerV1ClusterIssuerSpecAcmeSolversInner({
    this.dns01,
    this.http01,
    this.selector,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01? dns01;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01? http01;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverSelector? selector;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecAcmeSolversInner &&
          other.dns01 == dns01 &&
          other.http01 == http01 &&
          other.selector == selector;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (dns01 == null ? 0 : dns01!.hashCode) +
      (http01 == null ? 0 : http01!.hashCode) +
      (selector == null ? 0 : selector!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecAcmeSolversInner[dns01=$dns01, http01=$http01, selector=$selector]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dns01 != null) {
      json[r'dns01'] = this.dns01;
    } else {
      json[r'dns01'] = null;
    }
    if (this.http01 != null) {
      json[r'http01'] = this.http01;
    } else {
      json[r'http01'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcmeSolversInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecAcmeSolversInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecAcmeSolversInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecAcmeSolversInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecAcmeSolversInner(
        dns01: IoCertManagerAcmeV1ChallengeSpecSolverDns01.fromJson(
            json[r'dns01']),
        http01: IoCertManagerAcmeV1ChallengeSpecSolverHttp01.fromJson(
            json[r'http01']),
        selector: IoCertManagerAcmeV1ChallengeSpecSolverSelector.fromJson(
            json[r'selector']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecAcmeSolversInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecAcmeSolversInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecAcmeSolversInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecAcmeSolversInner>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecAcmeSolversInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1ClusterIssuerSpecAcmeSolversInner.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecAcmeSolversInner-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecAcmeSolversInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerV1ClusterIssuerSpecAcmeSolversInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecAcmeSolversInner.listFromJson(
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
