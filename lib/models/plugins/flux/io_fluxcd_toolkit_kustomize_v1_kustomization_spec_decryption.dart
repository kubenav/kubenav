//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_decryption_secret_ref.dart';

class IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption {
  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption] instance.
  IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption({
    required this.provider,
    this.secretRef,
  });

  /// Provider is the name of the decryption engine.
  IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionSecretRef? secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption &&
          other.provider == provider &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (provider.hashCode) + (secretRef == null ? 0 : secretRef!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption[provider=$provider, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'provider'] = this.provider;
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption(
        provider:
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum
                .fromJson(json[r'provider'])!,
        secretRef:
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionSecretRef
                .fromJson(json[r'secretRef']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'provider',
  };
}

/// Provider is the name of the decryption engine.
class IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const sops =
      IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum._(
          r'sops');

  /// List of all possible values in this [enum][IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum].
  static const values =
      <IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum>[
    sops,
  ];

  static IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer()
              .decode(value);

  static List<IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum].
class IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer {
  factory IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'sops':
          return IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnum
              .sops;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitKustomizeV1KustomizationSpecDecryptionProviderEnumTypeTransformer?
      _instance;
}
