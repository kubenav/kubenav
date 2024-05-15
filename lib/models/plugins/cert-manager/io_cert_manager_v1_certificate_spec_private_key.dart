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

class IoCertManagerV1CertificateSpecPrivateKey {
  /// Returns a new [IoCertManagerV1CertificateSpecPrivateKey] instance.
  IoCertManagerV1CertificateSpecPrivateKey({
    this.algorithm,
    this.encoding,
    this.rotationPolicy,
    this.size,
  });

  /// Algorithm is the private key algorithm of the corresponding private key for this certificate.   If provided, allowed values are either `RSA`, `ECDSA` or `Ed25519`. If `algorithm` is specified and `size` is not provided, key size of 2048 will be used for `RSA` key algorithm and key size of 256 will be used for `ECDSA` key algorithm. key size is ignored when using the `Ed25519` key algorithm.
  IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum? algorithm;

  /// The private key cryptography standards (PKCS) encoding for this certificate's private key to be encoded in.   If provided, allowed values are `PKCS1` and `PKCS8` standing for PKCS#1 and PKCS#8, respectively. Defaults to `PKCS1` if not specified.
  IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum? encoding;

  /// RotationPolicy controls how private keys should be regenerated when a re-issuance is being processed.   If set to `Never`, a private key will only be generated if one does not already exist in the target `spec.secretName`. If one does exists but it does not have the correct algorithm or size, a warning will be raised to await user intervention. If set to `Always`, a private key matching the specified requirements will be generated whenever a re-issuance occurs. Default is `Never` for backward compatibility.
  IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum? rotationPolicy;

  /// Size is the key bit size of the corresponding private key for this certificate.   If `algorithm` is set to `RSA`, valid values are `2048`, `4096` or `8192`, and will default to `2048` if not specified. If `algorithm` is set to `ECDSA`, valid values are `256`, `384` or `521`, and will default to `256` if not specified. If `algorithm` is set to `Ed25519`, Size is ignored. No other values are allowed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecPrivateKey &&
          other.algorithm == algorithm &&
          other.encoding == encoding &&
          other.rotationPolicy == rotationPolicy &&
          other.size == size;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (algorithm == null ? 0 : algorithm!.hashCode) +
      (encoding == null ? 0 : encoding!.hashCode) +
      (rotationPolicy == null ? 0 : rotationPolicy!.hashCode) +
      (size == null ? 0 : size!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecPrivateKey[algorithm=$algorithm, encoding=$encoding, rotationPolicy=$rotationPolicy, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.algorithm != null) {
      json[r'algorithm'] = this.algorithm;
    } else {
      json[r'algorithm'] = null;
    }
    if (this.encoding != null) {
      json[r'encoding'] = this.encoding;
    } else {
      json[r'encoding'] = null;
    }
    if (this.rotationPolicy != null) {
      json[r'rotationPolicy'] = this.rotationPolicy;
    } else {
      json[r'rotationPolicy'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecPrivateKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecPrivateKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecPrivateKey[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecPrivateKey[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecPrivateKey(
        algorithm:
            IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.fromJson(
                json[r'algorithm']),
        encoding: IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum.fromJson(
            json[r'encoding']),
        rotationPolicy:
            IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum.fromJson(
                json[r'rotationPolicy']),
        size: mapValueOfType<int>(json, r'size'),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecPrivateKey> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecPrivateKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateSpecPrivateKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecPrivateKey> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecPrivateKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecPrivateKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecPrivateKey-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecPrivateKey>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecPrivateKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateSpecPrivateKey.listFromJson(
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

/// Algorithm is the private key algorithm of the corresponding private key for this certificate.   If provided, allowed values are either `RSA`, `ECDSA` or `Ed25519`. If `algorithm` is specified and `size` is not provided, key size of 2048 will be used for `RSA` key algorithm and key size of 256 will be used for `ECDSA` key algorithm. key size is ignored when using the `Ed25519` key algorithm.
class IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const RSA =
      IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum._(r'RSA');
  static const ECDSA =
      IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum._(r'ECDSA');
  static const ed25519 =
      IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum._(r'Ed25519');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum].
  static const values = <IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum>[
    RSA,
    ECDSA,
    ed25519,
  ];

  static IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum].
class IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer {
  factory IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer._();

  String encode(IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'RSA':
          return IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.RSA;
        case r'ECDSA':
          return IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.ECDSA;
        case r'Ed25519':
          return IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnum.ed25519;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateSpecPrivateKeyAlgorithmEnumTypeTransformer?
      _instance;
}

/// The private key cryptography standards (PKCS) encoding for this certificate's private key to be encoded in.   If provided, allowed values are `PKCS1` and `PKCS8` standing for PKCS#1 and PKCS#8, respectively. Defaults to `PKCS1` if not specified.
class IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pKCS1 =
      IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum._(r'PKCS1');
  static const pKCS8 =
      IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum._(r'PKCS8');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum].
  static const values = <IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum>[
    pKCS1,
    pKCS8,
  ];

  static IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum].
class IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer {
  factory IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer._();

  String encode(IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'PKCS1':
          return IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum.pKCS1;
        case r'PKCS8':
          return IoCertManagerV1CertificateSpecPrivateKeyEncodingEnum.pKCS8;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateSpecPrivateKeyEncodingEnumTypeTransformer?
      _instance;
}

/// RotationPolicy controls how private keys should be regenerated when a re-issuance is being processed.   If set to `Never`, a private key will only be generated if one does not already exist in the target `spec.secretName`. If one does exists but it does not have the correct algorithm or size, a warning will be raised to await user intervention. If set to `Always`, a private key matching the specified requirements will be generated whenever a re-issuance occurs. Default is `Never` for backward compatibility.
class IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const never =
      IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum._(r'Never');
  static const always =
      IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum._(r'Always');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum].
  static const values =
      <IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum>[
    never,
    always,
  ];

  static IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum].
class IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer {
  factory IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer._();

  String encode(
          IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Never':
          return IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum
              .never;
        case r'Always':
          return IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnum
              .always;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateSpecPrivateKeyRotationPolicyEnumTypeTransformer?
      _instance;
}
