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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_verify_secret_ref.dart';

class IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify] instance.
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify({
    required this.mode,
    required this.secretRef,
  });

  /// Mode specifies what Git object should be verified, currently ('head').
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum mode;

  IoFluxcdToolkitSourceV1GitRepositorySpecVerifySecretRef secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify &&
          other.mode == mode &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mode.hashCode) + (secretRef.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify[mode=$mode, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'mode'] = this.mode;
    json[r'secretRef'] = this.secretRef;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify(
        mode: IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum
            .fromJson(json[r'mode'])!,
        secretRef:
            IoFluxcdToolkitSourceV1GitRepositorySpecVerifySecretRef.fromJson(
                json[r'secretRef'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'mode',
    'secretRef',
  };
}

/// Mode specifies what Git object should be verified, currently ('head').
class IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const head =
      IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum._(r'head');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum>[
    head,
  ];

  static IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum].
class IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'head':
          return IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnum
              .head;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerifyModeEnumTypeTransformer?
      _instance;
}
