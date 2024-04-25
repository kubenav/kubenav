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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_git_repository_spec_verify_secret_ref.dart';

class IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify] instance.
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify({
    required this.mode,
    this.secretRef,
  });

  /// Mode describes what git object should be verified, currently ('head').
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum mode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifySecretRef? secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify &&
          other.mode == mode &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mode.hashCode) + (secretRef == null ? 0 : secretRef!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify[mode=$mode, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'mode'] = this.mode;
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify(
        mode: IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum
            .fromJson(json[r'mode'])!,
        secretRef: IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifySecretRef
            .fromJson(json[r'secretRef']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerify.listFromJson(
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
  };
}

/// Mode describes what git object should be verified, currently ('head').
class IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const head =
      IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum._(r'head');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum>[
    head,
  ];

  static IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum].
class IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'head':
          return IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnum
              .head;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta1GitRepositorySpecVerifyModeEnumTypeTransformer?
      _instance;
}
