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

class IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner {
  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner] instance.
  IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner({
    required this.kind,
    required this.name,
  });

  /// Kind of the values referent, valid values are ('Secret', 'ConfigMap').
  IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
      kind;

  /// Name of the values referent. Should reside in the same namespace as the referring resource.
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner &&
          other.kind == kind &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kind.hashCode) + (name.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner[kind=$kind, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner(
        kind:
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
                .fromJson(json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner
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
    'kind',
    'name',
  };
}

/// Kind of the values referent, valid values are ('Secret', 'ConfigMap').
class IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const secret =
      IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
          ._(r'Secret');
  static const configMap =
      IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
          ._(r'ConfigMap');

  /// List of all possible values in this [enum][IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum].
  static const values =
      <IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum>[
    secret,
    configMap,
  ];

  static IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum].
class IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer {
  factory IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Secret':
          return IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
              .secret;
        case r'ConfigMap':
          return IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnum
              .configMap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInnerKindEnumTypeTransformer?
      _instance;
}
