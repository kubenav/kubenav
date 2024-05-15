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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme_external_account_binding.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme_private_key_secret_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme_solvers_inner.dart';

class IoCertManagerV1ClusterIssuerSpecAcme {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcme] instance.
  IoCertManagerV1ClusterIssuerSpecAcme({
    this.caBundle,
    this.disableAccountKeyGeneration,
    this.email,
    this.enableDurationFeature,
    this.externalAccountBinding,
    this.preferredChain,
    required this.privateKeySecretRef,
    required this.server,
    this.skipTLSVerify,
    this.solvers = const [],
  });

  /// Base64-encoded bundle of PEM CAs which can be used to validate the certificate chain presented by the ACME server. Mutually exclusive with SkipTLSVerify; prefer using CABundle to prevent various kinds of security vulnerabilities. If CABundle and SkipTLSVerify are unset, the system certificate bundle inside the container is used to validate the TLS connection.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? caBundle;

  /// Enables or disables generating a new ACME account key. If true, the Issuer resource will *not* request a new account but will expect the account key to be supplied via an existing secret. If false, the cert-manager system will generate a new ACME account key for the Issuer. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableAccountKeyGeneration;

  /// Email is the email address to be associated with the ACME account. This field is optional, but it is strongly recommended to be set. It will be used to contact you in case of issues with your account or certificates, including expiry notification emails. This field may be updated after the account is initially registered.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// Enables requesting a Not After date on certificates that matches the duration of the certificate. This is not supported by all ACME servers like Let's Encrypt. If set to true when the ACME server does not support it it will create an error on the Order. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableDurationFeature;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding?
      externalAccountBinding;

  /// PreferredChain is the chain to use if the ACME server outputs multiple. PreferredChain is no guarantee that this one gets delivered by the ACME endpoint. For example, for Let's Encrypt's DST crosssign you would use: \"DST Root CA X3\" or \"ISRG Root X1\" for the newer Let's Encrypt root CA. This value picks the first certificate bundle in the ACME alternative chains that has a certificate with this value as its issuer's CN
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? preferredChain;

  IoCertManagerV1ClusterIssuerSpecAcmePrivateKeySecretRef privateKeySecretRef;

  /// Server is the URL used to access the ACME server's 'directory' endpoint. For example, for Let's Encrypt's staging endpoint, you would use: \"https://acme-staging-v02.api.letsencrypt.org/directory\". Only ACME v2 endpoints (i.e. RFC 8555) are supported.
  String server;

  /// INSECURE: Enables or disables validation of the ACME server TLS certificate. If true, requests to the ACME server will not have the TLS certificate chain validated. Mutually exclusive with CABundle; prefer using CABundle to prevent various kinds of security vulnerabilities. Only enable this option in development environments. If CABundle and SkipTLSVerify are unset, the system certificate bundle inside the container is used to validate the TLS connection. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? skipTLSVerify;

  /// Solvers is a list of challenge solvers that will be used to solve ACME challenges for the matching domains. Solver configurations must be provided in order to obtain certificates from an ACME server. For more information, see: https://cert-manager.io/docs/configuration/acme/
  List<IoCertManagerV1ClusterIssuerSpecAcmeSolversInner> solvers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecAcme &&
          other.caBundle == caBundle &&
          other.disableAccountKeyGeneration == disableAccountKeyGeneration &&
          other.email == email &&
          other.enableDurationFeature == enableDurationFeature &&
          other.externalAccountBinding == externalAccountBinding &&
          other.preferredChain == preferredChain &&
          other.privateKeySecretRef == privateKeySecretRef &&
          other.server == server &&
          other.skipTLSVerify == skipTLSVerify &&
          deepEquality.equals(other.solvers, solvers);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (caBundle == null ? 0 : caBundle!.hashCode) +
      (disableAccountKeyGeneration == null
          ? 0
          : disableAccountKeyGeneration!.hashCode) +
      (email == null ? 0 : email!.hashCode) +
      (enableDurationFeature == null ? 0 : enableDurationFeature!.hashCode) +
      (externalAccountBinding == null ? 0 : externalAccountBinding!.hashCode) +
      (preferredChain == null ? 0 : preferredChain!.hashCode) +
      (privateKeySecretRef.hashCode) +
      (server.hashCode) +
      (skipTLSVerify == null ? 0 : skipTLSVerify!.hashCode) +
      (solvers.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecAcme[caBundle=$caBundle, disableAccountKeyGeneration=$disableAccountKeyGeneration, email=$email, enableDurationFeature=$enableDurationFeature, externalAccountBinding=$externalAccountBinding, preferredChain=$preferredChain, privateKeySecretRef=$privateKeySecretRef, server=$server, skipTLSVerify=$skipTLSVerify, solvers=$solvers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.caBundle != null) {
      json[r'caBundle'] = this.caBundle;
    } else {
      json[r'caBundle'] = null;
    }
    if (this.disableAccountKeyGeneration != null) {
      json[r'disableAccountKeyGeneration'] = this.disableAccountKeyGeneration;
    } else {
      json[r'disableAccountKeyGeneration'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.enableDurationFeature != null) {
      json[r'enableDurationFeature'] = this.enableDurationFeature;
    } else {
      json[r'enableDurationFeature'] = null;
    }
    if (this.externalAccountBinding != null) {
      json[r'externalAccountBinding'] = this.externalAccountBinding;
    } else {
      json[r'externalAccountBinding'] = null;
    }
    if (this.preferredChain != null) {
      json[r'preferredChain'] = this.preferredChain;
    } else {
      json[r'preferredChain'] = null;
    }
    json[r'privateKeySecretRef'] = this.privateKeySecretRef;
    json[r'server'] = this.server;
    if (this.skipTLSVerify != null) {
      json[r'skipTLSVerify'] = this.skipTLSVerify;
    } else {
      json[r'skipTLSVerify'] = null;
    }
    json[r'solvers'] = this.solvers;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecAcme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecAcme[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecAcme[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecAcme(
        caBundle: mapValueOfType<String>(json, r'caBundle'),
        disableAccountKeyGeneration:
            mapValueOfType<bool>(json, r'disableAccountKeyGeneration'),
        email: mapValueOfType<String>(json, r'email'),
        enableDurationFeature:
            mapValueOfType<bool>(json, r'enableDurationFeature'),
        externalAccountBinding:
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding.fromJson(
                json[r'externalAccountBinding']),
        preferredChain: mapValueOfType<String>(json, r'preferredChain'),
        privateKeySecretRef:
            IoCertManagerV1ClusterIssuerSpecAcmePrivateKeySecretRef.fromJson(
                json[r'privateKeySecretRef'])!,
        server: mapValueOfType<String>(json, r'server')!,
        skipTLSVerify: mapValueOfType<bool>(json, r'skipTLSVerify'),
        solvers: IoCertManagerV1ClusterIssuerSpecAcmeSolversInner.listFromJson(
            json[r'solvers']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecAcme> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecAcme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecAcme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecAcme> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecAcme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecAcme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecAcme-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecAcme>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecAcme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpecAcme.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'privateKeySecretRef',
    'server',
  };
}
