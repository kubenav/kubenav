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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_app_role.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_kubernetes.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_token_secret_ref.dart';

class IoCertManagerV1ClusterIssuerSpecVaultAuth {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuth] instance.
  IoCertManagerV1ClusterIssuerSpecVaultAuth({
    this.appRole,
    this.kubernetes,
    this.tokenSecretRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole? appRole;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes? kubernetes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultAuthTokenSecretRef? tokenSecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVaultAuth &&
          other.appRole == appRole &&
          other.kubernetes == kubernetes &&
          other.tokenSecretRef == tokenSecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (appRole == null ? 0 : appRole!.hashCode) +
      (kubernetes == null ? 0 : kubernetes!.hashCode) +
      (tokenSecretRef == null ? 0 : tokenSecretRef!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVaultAuth[appRole=$appRole, kubernetes=$kubernetes, tokenSecretRef=$tokenSecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.appRole != null) {
      json[r'appRole'] = this.appRole;
    } else {
      json[r'appRole'] = null;
    }
    if (this.kubernetes != null) {
      json[r'kubernetes'] = this.kubernetes;
    } else {
      json[r'kubernetes'] = null;
    }
    if (this.tokenSecretRef != null) {
      json[r'tokenSecretRef'] = this.tokenSecretRef;
    } else {
      json[r'tokenSecretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuth] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVaultAuth? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuth[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuth[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVaultAuth(
        appRole: IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole.fromJson(
            json[r'appRole']),
        kubernetes:
            IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes.fromJson(
                json[r'kubernetes']),
        tokenSecretRef:
            IoCertManagerV1ClusterIssuerSpecVaultAuthTokenSecretRef.fromJson(
                json[r'tokenSecretRef']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVaultAuth> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVaultAuth>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecVaultAuth.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVaultAuth> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVaultAuth>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVaultAuth.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVaultAuth-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVaultAuth>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecVaultAuth>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpecVaultAuth.listFromJson(
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
