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

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner {
  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner] instance.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner({
    required this.kind,
    required this.name,
    this.optional,
    this.targetPath,
    this.valuesKey,
  });

  /// Kind of the values referent, valid values are ('Secret', 'ConfigMap').
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum kind;

  /// Name of the values referent. Should reside in the same namespace as the referring resource.
  String name;

  /// Optional marks this ValuesReference as optional. When set, a not found error for the values reference is ignored, but any ValuesKey, TargetPath or transient error will still result in a reconciliation failure.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? optional;

  /// TargetPath is the YAML dot notation path the value should be merged at. When set, the ValuesKey is expected to be a single flat value. Defaults to 'None', which results in the values getting merged at the root.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetPath;

  /// ValuesKey is the data key where the values.yaml or a specific value can be found at. Defaults to 'values.yaml'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? valuesKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner &&
          other.kind == kind &&
          other.name == name &&
          other.optional == optional &&
          other.targetPath == targetPath &&
          other.valuesKey == valuesKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kind.hashCode) +
      (name.hashCode) +
      (optional == null ? 0 : optional!.hashCode) +
      (targetPath == null ? 0 : targetPath!.hashCode) +
      (valuesKey == null ? 0 : valuesKey!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner[kind=$kind, name=$name, optional=$optional, targetPath=$targetPath, valuesKey=$valuesKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    if (this.optional != null) {
      json[r'optional'] = this.optional;
    } else {
      json[r'optional'] = null;
    }
    if (this.targetPath != null) {
      json[r'targetPath'] = this.targetPath;
    } else {
      json[r'targetPath'] = null;
    }
    if (this.valuesKey != null) {
      json[r'valuesKey'] = this.valuesKey;
    } else {
      json[r'valuesKey'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner(
        kind: IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum
            .fromJson(json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
        optional: mapValueOfType<bool>(json, r'optional'),
        targetPath: mapValueOfType<String>(json, r'targetPath'),
        valuesKey: mapValueOfType<String>(json, r'valuesKey'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInner
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
class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const secret =
      IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum._(
          r'Secret');
  static const configMap =
      IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum._(
          r'ConfigMap');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum>[
    secret,
    configMap,
  ];

  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum].
class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Secret':
          return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum
              .secret;
        case r'ConfigMap':
          return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnum
              .configMap;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecValuesFromInnerKindEnumTypeTransformer?
      _instance;
}
