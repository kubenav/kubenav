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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_app_role_secret_ref.dart';

class IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole] instance.
  IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole({
    required this.path,
    required this.roleId,
    required this.secretRef,
  });

  /// Path where the App Role authentication backend is mounted in Vault, e.g: \"approle\"
  String path;

  /// RoleID configured in the App Role authentication backend when setting up the authentication backend in Vault.
  String roleId;

  IoCertManagerV1ClusterIssuerSpecVaultAuthAppRoleSecretRef secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole &&
          other.path == path &&
          other.roleId == roleId &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (path.hashCode) + (roleId.hashCode) + (secretRef.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole[path=$path, roleId=$roleId, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'path'] = this.path;
    json[r'roleId'] = this.roleId;
    json[r'secretRef'] = this.secretRef;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole(
        path: mapValueOfType<String>(json, r'path')!,
        roleId: mapValueOfType<String>(json, r'roleId')!,
        secretRef:
            IoCertManagerV1ClusterIssuerSpecVaultAuthAppRoleSecretRef.fromJson(
                json[r'secretRef'])!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecVaultAuthAppRole.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'path',
    'roleId',
    'secretRef',
  };
}
