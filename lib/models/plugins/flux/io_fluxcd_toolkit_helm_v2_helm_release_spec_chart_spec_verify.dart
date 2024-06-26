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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_chart_spec_verify_secret_ref.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify({
    required this.provider,
    this.secretRef,
  });

  /// Provider specifies the technology used to sign the OCI Helm chart.
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifySecretRef? secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify &&
          other.provider == provider &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (provider.hashCode) + (secretRef == null ? 0 : secretRef!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify[provider=$provider, secretRef=$secretRef]';

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

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify(
        provider:
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum
                .fromJson(json[r'provider'])!,
        secretRef: IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifySecretRef
            .fromJson(json[r'secretRef']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerify.listFromJson(
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

/// Provider specifies the technology used to sign the OCI Helm chart.
class IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const cosign =
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum._(
          r'cosign');
  static const notation =
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum._(
          r'notation');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum].
  static const values =
      <IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum>[
    cosign,
    notation,
  ];

  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum].
class IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'cosign':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum
              .cosign;
        case r'notation':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnum
              .notation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartSpecVerifyProviderEnumTypeTransformer?
      _instance;
}
