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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_gateway_http_route_parent_refs_inner.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute({
    this.labels = const {},
    this.parentRefs = const [],
    this.serviceType,
  });

  /// Custom labels that will be applied to HTTPRoutes created by cert-manager while solving HTTP-01 challenges.
  Map<String, String> labels;

  /// When solving an HTTP-01 challenge, cert-manager creates an HTTPRoute. cert-manager needs to know which parentRefs should be used when creating the HTTPRoute. Usually, the parentRef references a Gateway. See: https://gateway-api.sigs.k8s.io/api-types/httproute/#attaching-to-gateways
  List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRouteParentRefsInner>
      parentRefs;

  /// Optional service type for Kubernetes solver service. Supported values are NodePort or ClusterIP. If unset, defaults to NodePort.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute &&
          deepEquality.equals(other.labels, labels) &&
          deepEquality.equals(other.parentRefs, parentRefs) &&
          other.serviceType == serviceType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labels.hashCode) +
      (parentRefs.hashCode) +
      (serviceType == null ? 0 : serviceType!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute[labels=$labels, parentRefs=$parentRefs, serviceType=$serviceType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'labels'] = this.labels;
    json[r'parentRefs'] = this.parentRefs;
    if (this.serviceType != null) {
      json[r'serviceType'] = this.serviceType;
    } else {
      json[r'serviceType'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute(
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        parentRefs:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRouteParentRefsInner
                .listFromJson(json[r'parentRefs']),
        serviceType: mapValueOfType<String>(json, r'serviceType'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute-objects as value to a dart map
  static Map<String,
          List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01GatewayHTTPRoute
                .listFromJson(
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
