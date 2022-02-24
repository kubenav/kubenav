//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1NodeSelectorRequirement {
  /// Returns a new [IoK8sApiCoreV1NodeSelectorRequirement] instance.
  IoK8sApiCoreV1NodeSelectorRequirement({
    required this.key,
    required this.operator_,
    this.values = const [],
  });

  /// The label key that the selector applies to.
  String key;

  /// Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.  Possible enum values:  - `\"DoesNotExist\"`  - `\"Exists\"`  - `\"Gt\"`  - `\"In\"`  - `\"Lt\"`  - `\"NotIn\"`
  IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum operator_;

  /// An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.
  List<String> values;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeSelectorRequirement &&
          other.key == key &&
          other.operator_ == operator_ &&
          other.values == values;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (key.hashCode) + (operator_.hashCode) + (values.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeSelectorRequirement[key=$key, operator_=$operator_, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'key'] = key;
    json[r'operator'] = operator_;
    json[r'values'] = values;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeSelectorRequirement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeSelectorRequirement? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeSelectorRequirement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeSelectorRequirement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeSelectorRequirement(
        key: mapValueOfType<String>(json, r'key')!,
        operator_: IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.fromJson(
            json[r'operator'])!,
        values: json[r'values'] is List
            ? (json[r'values'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeSelectorRequirement>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeSelectorRequirement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeSelectorRequirement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeSelectorRequirement> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeSelectorRequirement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1NodeSelectorRequirement.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeSelectorRequirement-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeSelectorRequirement>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeSelectorRequirement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeSelectorRequirement.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
    'operator',
  };
}

/// Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.  Possible enum values:  - `\"DoesNotExist\"`  - `\"Exists\"`  - `\"Gt\"`  - `\"In\"`  - `\"Lt\"`  - `\"NotIn\"`
class IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const doesNotExist =
      IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'DoesNotExist');
  static const exists =
      IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'Exists');
  static const gt = IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'Gt');
  static const in_ =
      IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'In');
  static const lt = IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'Lt');
  static const notIn =
      IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum._(r'NotIn');

  /// List of all possible values in this [enum][IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum].
  static const values = <IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum>[
    doesNotExist,
    exists,
    gt,
    in_,
    lt,
    notIn,
  ];

  static IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum].
class IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer {
  factory IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer
              ._();

  const IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer._();

  String encode(IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'DoesNotExist':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum
              .doesNotExist;
        case r'Exists':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.exists;
        case r'Gt':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.gt;
        case r'In':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.in_;
        case r'Lt':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.lt;
        case r'NotIn':
          return IoK8sApiCoreV1NodeSelectorRequirementOperator_Enum.notIn;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer] instance.
  static IoK8sApiCoreV1NodeSelectorRequirementOperator_EnumTypeTransformer?
      _instance;
}
