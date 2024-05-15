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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_gateway_http_route.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01 {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01({
    this.gatewayHTTPRoute,
    this.ingress,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute?
      gatewayHTTPRoute;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress? ingress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01 &&
          other.gatewayHTTPRoute == gatewayHTTPRoute &&
          other.ingress == ingress;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (gatewayHTTPRoute == null ? 0 : gatewayHTTPRoute!.hashCode) +
      (ingress == null ? 0 : ingress!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01[gatewayHTTPRoute=$gatewayHTTPRoute, ingress=$ingress]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.gatewayHTTPRoute != null) {
      json[r'gatewayHTTPRoute'] = this.gatewayHTTPRoute;
    } else {
      json[r'gatewayHTTPRoute'] = null;
    }
    if (this.ingress != null) {
      json[r'ingress'] = this.ingress;
    } else {
      json[r'ingress'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01(
        gatewayHTTPRoute:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute
                .fromJson(json[r'gatewayHTTPRoute']),
        ingress: IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress.fromJson(
            json[r'ingress']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverHttp01>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverHttp01> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverHttp01>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01.listFromJson(
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
