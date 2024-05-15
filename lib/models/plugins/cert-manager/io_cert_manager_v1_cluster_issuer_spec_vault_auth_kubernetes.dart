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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_kubernetes_secret_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth_kubernetes_service_account_ref.dart';

class IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes] instance.
  IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes({
    this.mountPath,
    required this.role,
    this.secretRef,
    this.serviceAccountRef,
  });

  /// The Vault mountPath here is the mount path to use when authenticating with Vault. For example, setting a value to `/v1/auth/foo`, will use the path `/v1/auth/foo/login` to authenticate with Vault. If unspecified, the default value \"/v1/auth/kubernetes\" will be used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mountPath;

  /// A required field containing the Vault Role to assume. A Role binds a Kubernetes ServiceAccount with a set of Vault policies.
  String role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetesSecretRef? secretRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetesServiceAccountRef?
      serviceAccountRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes &&
          other.mountPath == mountPath &&
          other.role == role &&
          other.secretRef == secretRef &&
          other.serviceAccountRef == serviceAccountRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mountPath == null ? 0 : mountPath!.hashCode) +
      (role.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (serviceAccountRef == null ? 0 : serviceAccountRef!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes[mountPath=$mountPath, role=$role, secretRef=$secretRef, serviceAccountRef=$serviceAccountRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.mountPath != null) {
      json[r'mountPath'] = this.mountPath;
    } else {
      json[r'mountPath'] = null;
    }
    json[r'role'] = this.role;
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.serviceAccountRef != null) {
      json[r'serviceAccountRef'] = this.serviceAccountRef;
    } else {
      json[r'serviceAccountRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes(
        mountPath: mapValueOfType<String>(json, r'mountPath'),
        role: mapValueOfType<String>(json, r'role')!,
        secretRef: IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetesSecretRef
            .fromJson(json[r'secretRef']),
        serviceAccountRef:
            IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetesServiceAccountRef
                .fromJson(json[r'serviceAccountRef']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecVaultAuthKubernetes.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'role',
  };
}
