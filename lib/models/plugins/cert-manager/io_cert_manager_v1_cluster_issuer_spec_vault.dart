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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_auth.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault_ca_bundle_secret_ref.dart';

class IoCertManagerV1ClusterIssuerSpecVault {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVault] instance.
  IoCertManagerV1ClusterIssuerSpecVault({
    required this.auth,
    this.caBundle,
    this.caBundleSecretRef,
    this.namespace,
    required this.path,
    required this.server,
  });

  IoCertManagerV1ClusterIssuerSpecVaultAuth auth;

  /// Base64-encoded bundle of PEM CAs which will be used to validate the certificate chain presented by Vault. Only used if using HTTPS to connect to Vault and ignored for HTTP connections. Mutually exclusive with CABundleSecretRef. If neither CABundle nor CABundleSecretRef are defined, the certificate bundle in the cert-manager controller container is used to validate the TLS connection.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? caBundle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVaultCaBundleSecretRef? caBundleSecretRef;

  /// Name of the vault namespace. Namespaces is a set of features within Vault Enterprise that allows Vault environments to support Secure Multi-tenancy. e.g: \"ns1\" More about namespaces can be found here https://www.vaultproject.io/docs/enterprise/namespaces
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  /// Path is the mount path of the Vault PKI backend's `sign` endpoint, e.g: \"my_pki_mount/sign/my-role-name\".
  String path;

  /// Server is the connection address for the Vault server, e.g: \"https://vault.example.com:8200\".
  String server;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVault &&
          other.auth == auth &&
          other.caBundle == caBundle &&
          other.caBundleSecretRef == caBundleSecretRef &&
          other.namespace == namespace &&
          other.path == path &&
          other.server == server;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (auth.hashCode) +
      (caBundle == null ? 0 : caBundle!.hashCode) +
      (caBundleSecretRef == null ? 0 : caBundleSecretRef!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (path.hashCode) +
      (server.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVault[auth=$auth, caBundle=$caBundle, caBundleSecretRef=$caBundleSecretRef, namespace=$namespace, path=$path, server=$server]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'auth'] = this.auth;
    if (this.caBundle != null) {
      json[r'caBundle'] = this.caBundle;
    } else {
      json[r'caBundle'] = null;
    }
    if (this.caBundleSecretRef != null) {
      json[r'caBundleSecretRef'] = this.caBundleSecretRef;
    } else {
      json[r'caBundleSecretRef'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    json[r'path'] = this.path;
    json[r'server'] = this.server;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVault] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVault? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVault[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVault[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVault(
        auth:
            IoCertManagerV1ClusterIssuerSpecVaultAuth.fromJson(json[r'auth'])!,
        caBundle: mapValueOfType<String>(json, r'caBundle'),
        caBundleSecretRef:
            IoCertManagerV1ClusterIssuerSpecVaultCaBundleSecretRef.fromJson(
                json[r'caBundleSecretRef']),
        namespace: mapValueOfType<String>(json, r'namespace'),
        path: mapValueOfType<String>(json, r'path')!,
        server: mapValueOfType<String>(json, r'server')!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVault> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVault>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecVault.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVault> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVault>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVault.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVault-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVault>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecVault>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpecVault.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'auth',
    'path',
    'server',
  };
}
