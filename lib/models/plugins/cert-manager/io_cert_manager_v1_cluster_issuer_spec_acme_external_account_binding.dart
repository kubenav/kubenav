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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme_external_account_binding_key_secret_ref.dart';

class IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding] instance.
  IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding({
    this.keyAlgorithm,
    required this.keyID,
    required this.keySecretRef,
  });

  /// Deprecated: keyAlgorithm field exists for historical compatibility reasons and should not be used. The algorithm is now hardcoded to HS256 in golang/x/crypto/acme.
  IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum?
      keyAlgorithm;

  /// keyID is the ID of the CA key that the External Account is bound to.
  String keyID;

  IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeySecretRef
      keySecretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding &&
          other.keyAlgorithm == keyAlgorithm &&
          other.keyID == keyID &&
          other.keySecretRef == keySecretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (keyAlgorithm == null ? 0 : keyAlgorithm!.hashCode) +
      (keyID.hashCode) +
      (keySecretRef.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding[keyAlgorithm=$keyAlgorithm, keyID=$keyID, keySecretRef=$keySecretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.keyAlgorithm != null) {
      json[r'keyAlgorithm'] = this.keyAlgorithm;
    } else {
      json[r'keyAlgorithm'] = null;
    }
    json[r'keyID'] = this.keyID;
    json[r'keySecretRef'] = this.keySecretRef;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding(
        keyAlgorithm:
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
                .fromJson(json[r'keyAlgorithm']),
        keyID: mapValueOfType<String>(json, r'keyID')!,
        keySecretRef:
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeySecretRef
                .fromJson(json[r'keySecretRef'])!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>
      mapFromJson(dynamic json) {
    final map =
        <String, IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding-objects as value to a dart map
  static Map<String,
          List<IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBinding
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'keyID',
    'keySecretRef',
  };
}

/// Deprecated: keyAlgorithm field exists for historical compatibility reasons and should not be used. The algorithm is now hardcoded to HS256 in golang/x/crypto/acme.
class IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const hS256 =
      IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
          ._(r'HS256');
  static const hS384 =
      IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
          ._(r'HS384');
  static const hS512 =
      IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
          ._(r'HS512');

  /// List of all possible values in this [enum][IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum].
  static const values =
      <IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum>[
    hS256,
    hS384,
    hS512,
  ];

  static IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum?
      fromJson(dynamic value) =>
          IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer()
              .decode(value);

  static List<
          IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum].
class IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer {
  factory IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer
              ._();

  const IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer._();

  String encode(
          IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'HS256':
          return IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
              .hS256;
        case r'HS384':
          return IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
              .hS384;
        case r'HS512':
          return IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnum
              .hS512;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer] instance.
  static IoCertManagerV1ClusterIssuerSpecAcmeExternalAccountBindingKeyAlgorithmEnumTypeTransformer?
      _instance;
}
