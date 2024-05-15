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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_keystores_jks_password_secret_ref.dart';

class IoCertManagerV1CertificateSpecKeystoresJks {
  /// Returns a new [IoCertManagerV1CertificateSpecKeystoresJks] instance.
  IoCertManagerV1CertificateSpecKeystoresJks({
    required this.create,
    required this.passwordSecretRef,
  });

  /// Create enables JKS keystore creation for the Certificate. If true, a file named `keystore.jks` will be created in the target Secret resource, encrypted using the password stored in `passwordSecretRef`. The keystore file will be updated immediately. If the issuer provided a CA certificate, a file named `truststore.jks` will also be created in the target Secret resource, encrypted using the password stored in `passwordSecretRef` containing the issuing Certificate Authority
  bool create;

  IoCertManagerV1CertificateSpecKeystoresJksPasswordSecretRef passwordSecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecKeystoresJks &&
          other.create == create &&
          other.passwordSecretRef == passwordSecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (create.hashCode) + (passwordSecretRef.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecKeystoresJks[create=$create, passwordSecretRef=$passwordSecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'create'] = this.create;
    json[r'passwordSecretRef'] = this.passwordSecretRef;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecKeystoresJks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecKeystoresJks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecKeystoresJks[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecKeystoresJks[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecKeystoresJks(
        create: mapValueOfType<bool>(json, r'create')!,
        passwordSecretRef:
            IoCertManagerV1CertificateSpecKeystoresJksPasswordSecretRef
                .fromJson(json[r'passwordSecretRef'])!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecKeystoresJks> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecKeystoresJks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateSpecKeystoresJks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecKeystoresJks> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecKeystoresJks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecKeystoresJks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecKeystoresJks-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecKeystoresJks>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecKeystoresJks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecKeystoresJks.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'create',
    'passwordSecretRef',
  };
}
