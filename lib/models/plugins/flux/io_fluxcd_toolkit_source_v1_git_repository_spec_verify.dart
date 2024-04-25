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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_verify_secret_ref.dart';

class IoFluxcdToolkitSourceV1GitRepositorySpecVerify {
  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositorySpecVerify] instance.
  IoFluxcdToolkitSourceV1GitRepositorySpecVerify({
    this.mode,
    required this.secretRef,
  });

  /// Mode specifies which Git object(s) should be verified.   The variants \"head\" and \"HEAD\" both imply the same thing, i.e. verify the commit that the HEAD of the Git repository points to. The variant \"head\" solely exists to ensure backwards compatibility.
  IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum? mode;

  IoFluxcdToolkitSourceV1GitRepositorySpecVerifySecretRef secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1GitRepositorySpecVerify &&
          other.mode == mode &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mode == null ? 0 : mode!.hashCode) + (secretRef.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1GitRepositorySpecVerify[mode=$mode, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    json[r'secretRef'] = this.secretRef;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositorySpecVerify] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1GitRepositorySpecVerify? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1GitRepositorySpecVerify[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1GitRepositorySpecVerify[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1GitRepositorySpecVerify(
        mode: IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.fromJson(
            json[r'mode']),
        secretRef:
            IoFluxcdToolkitSourceV1GitRepositorySpecVerifySecretRef.fromJson(
                json[r'secretRef'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1GitRepositorySpecVerify> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1GitRepositorySpecVerify>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1GitRepositorySpecVerify.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1GitRepositorySpecVerify>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1GitRepositorySpecVerify>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitSourceV1GitRepositorySpecVerify.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1GitRepositorySpecVerify-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1GitRepositorySpecVerify>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1GitRepositorySpecVerify>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1GitRepositorySpecVerify.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'secretRef',
  };
}

/// Mode specifies which Git object(s) should be verified.   The variants \"head\" and \"HEAD\" both imply the same thing, i.e. verify the commit that the HEAD of the Git repository points to. The variant \"head\" solely exists to ensure backwards compatibility.
class IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const head =
      IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum._(r'head');
  static const HEAD =
      IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum._(r'HEAD');
  static const tag =
      IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum._(r'Tag');
  static const tagAndHEAD =
      IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum._(r'TagAndHEAD');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum].
  static const values =
      <IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum>[
    head,
    HEAD,
    tag,
    tagAndHEAD,
  ];

  static IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum].
class IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer._();

  String encode(IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'head':
          return IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.head;
        case r'HEAD':
          return IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.HEAD;
        case r'Tag':
          return IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum.tag;
        case r'TagAndHEAD':
          return IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnum
              .tagAndHEAD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1GitRepositorySpecVerifyModeEnumTypeTransformer?
      _instance;
}
