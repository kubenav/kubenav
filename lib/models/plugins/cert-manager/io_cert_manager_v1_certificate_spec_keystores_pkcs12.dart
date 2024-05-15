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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_keystores_pkcs12_password_secret_ref.dart';

class IoCertManagerV1CertificateSpecKeystoresPkcs12 {
  /// Returns a new [IoCertManagerV1CertificateSpecKeystoresPkcs12] instance.
  IoCertManagerV1CertificateSpecKeystoresPkcs12({
    required this.create,
    required this.passwordSecretRef,
    this.profile,
  });

  /// Create enables PKCS12 keystore creation for the Certificate. If true, a file named `keystore.p12` will be created in the target Secret resource, encrypted using the password stored in `passwordSecretRef`. The keystore file will be updated immediately. If the issuer provided a CA certificate, a file named `truststore.p12` will also be created in the target Secret resource, encrypted using the password stored in `passwordSecretRef` containing the issuing Certificate Authority
  bool create;

  IoCertManagerV1CertificateSpecKeystoresPkcs12PasswordSecretRef
      passwordSecretRef;

  /// Profile specifies the key and certificate encryption algorithms and the HMAC algorithm used to create the PKCS12 keystore. Default value is `LegacyRC2` for backward compatibility.   If provided, allowed values are: `LegacyRC2`: Deprecated. Not supported by default in OpenSSL 3 or Java 20. `LegacyDES`: Less secure algorithm. Use this option for maximal compatibility. `Modern2023`: Secure algorithm. Use this option in case you have to always use secure algorithms (eg. because of company policy). Please note that the security of the algorithm is not that important in reality, because the unencrypted certificate and private key are also stored in the Secret.
  IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum? profile;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecKeystoresPkcs12 &&
          other.create == create &&
          other.passwordSecretRef == passwordSecretRef &&
          other.profile == profile;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (create.hashCode) +
      (passwordSecretRef.hashCode) +
      (profile == null ? 0 : profile!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecKeystoresPkcs12[create=$create, passwordSecretRef=$passwordSecretRef, profile=$profile]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'create'] = this.create;
    json[r'passwordSecretRef'] = this.passwordSecretRef;
    if (this.profile != null) {
      json[r'profile'] = this.profile;
    } else {
      json[r'profile'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecKeystoresPkcs12] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecKeystoresPkcs12? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecKeystoresPkcs12[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecKeystoresPkcs12[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecKeystoresPkcs12(
        create: mapValueOfType<bool>(json, r'create')!,
        passwordSecretRef:
            IoCertManagerV1CertificateSpecKeystoresPkcs12PasswordSecretRef
                .fromJson(json[r'passwordSecretRef'])!,
        profile:
            IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum.fromJson(
                json[r'profile']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecKeystoresPkcs12> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecKeystoresPkcs12>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecKeystoresPkcs12.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecKeystoresPkcs12> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecKeystoresPkcs12>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecKeystoresPkcs12.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecKeystoresPkcs12-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecKeystoresPkcs12>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecKeystoresPkcs12>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecKeystoresPkcs12.listFromJson(
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

/// Profile specifies the key and certificate encryption algorithms and the HMAC algorithm used to create the PKCS12 keystore. Default value is `LegacyRC2` for backward compatibility.   If provided, allowed values are: `LegacyRC2`: Deprecated. Not supported by default in OpenSSL 3 or Java 20. `LegacyDES`: Less secure algorithm. Use this option for maximal compatibility. `Modern2023`: Secure algorithm. Use this option in case you have to always use secure algorithms (eg. because of company policy). Please note that the security of the algorithm is not that important in reality, because the unencrypted certificate and private key are also stored in the Secret.
class IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const legacyRC2 =
      IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum._(r'LegacyRC2');
  static const legacyDES =
      IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum._(r'LegacyDES');
  static const modern2023 =
      IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum._(r'Modern2023');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum].
  static const values =
      <IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum>[
    legacyRC2,
    legacyDES,
    modern2023,
  ];

  static IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum].
class IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer {
  factory IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer._();

  String encode(
          IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'LegacyRC2':
          return IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum
              .legacyRC2;
        case r'LegacyDES':
          return IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum
              .legacyDES;
        case r'Modern2023':
          return IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnum
              .modern2023;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateSpecKeystoresPkcs12ProfileEnumTypeTransformer?
      _instance;
}
