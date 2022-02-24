//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ScopedResourceSelectorRequirement {
  /// Returns a new [IoK8sApiCoreV1ScopedResourceSelectorRequirement] instance.
  IoK8sApiCoreV1ScopedResourceSelectorRequirement({
    required this.operator_,
    required this.scopeName,
    this.values = const [],
  });

  /// Represents a scope's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.  Possible enum values:  - `\"DoesNotExist\"`  - `\"Exists\"`  - `\"In\"`  - `\"NotIn\"`
  IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum operator_;

  /// The name of the scope that the selector applies to.  Possible enum values:  - `\"BestEffort\"` Match all pod objects that have best effort quality of service  - `\"CrossNamespacePodAffinity\"` Match all pod objects that have cross-namespace pod (anti)affinity mentioned. This is a beta feature enabled by the PodAffinityNamespaceSelector feature flag.  - `\"NotBestEffort\"` Match all pod objects that do not have best effort quality of service  - `\"NotTerminating\"` Match all pod objects where spec.activeDeadlineSeconds is nil  - `\"PriorityClass\"` Match all pod objects that have priority class mentioned  - `\"Terminating\"` Match all pod objects where spec.activeDeadlineSeconds >=0
  IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum scopeName;

  /// An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
  List<String> values;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ScopedResourceSelectorRequirement &&
          other.operator_ == operator_ &&
          other.scopeName == scopeName &&
          other.values == values;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (operator_.hashCode) + (scopeName.hashCode) + (values.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ScopedResourceSelectorRequirement[operator_=$operator_, scopeName=$scopeName, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'operator'] = operator_;
    json[r'scopeName'] = scopeName;
    json[r'values'] = values;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ScopedResourceSelectorRequirement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ScopedResourceSelectorRequirement? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ScopedResourceSelectorRequirement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ScopedResourceSelectorRequirement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ScopedResourceSelectorRequirement(
        operator_: IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
            .fromJson(json[r'operator'])!,
        scopeName: IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
            .fromJson(json[r'scopeName'])!,
        values: json[r'values'] is List
            ? (json[r'values'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ScopedResourceSelectorRequirement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ScopedResourceSelectorRequirement>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ScopedResourceSelectorRequirement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ScopedResourceSelectorRequirement.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ScopedResourceSelectorRequirement-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCoreV1ScopedResourceSelectorRequirement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirement.listFromJson(
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
    'operator',
    'scopeName',
  };
}

/// Represents a scope's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.  Possible enum values:  - `\"DoesNotExist\"`  - `\"Exists\"`  - `\"In\"`  - `\"NotIn\"`
class IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const doesNotExist =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum._(
          r'DoesNotExist');
  static const exists =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum._(r'Exists');
  static const in_ =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum._(r'In');
  static const notIn =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum._(r'NotIn');

  /// List of all possible values in this [enum][IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum].
  static const values =
      <IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum>[
    doesNotExist,
    exists,
    in_,
    notIn,
  ];

  static IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum].
class IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer {
  factory IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer
              ._();

  const IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer._();

  String encode(
          IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'DoesNotExist':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
              .doesNotExist;
        case r'Exists':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
              .exists;
        case r'In':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
              .in_;
        case r'NotIn':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_Enum
              .notIn;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer] instance.
  static IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator_EnumTypeTransformer?
      _instance;
}

/// The name of the scope that the selector applies to.  Possible enum values:  - `\"BestEffort\"` Match all pod objects that have best effort quality of service  - `\"CrossNamespacePodAffinity\"` Match all pod objects that have cross-namespace pod (anti)affinity mentioned. This is a beta feature enabled by the PodAffinityNamespaceSelector feature flag.  - `\"NotBestEffort\"` Match all pod objects that do not have best effort quality of service  - `\"NotTerminating\"` Match all pod objects where spec.activeDeadlineSeconds is nil  - `\"PriorityClass\"` Match all pod objects that have priority class mentioned  - `\"Terminating\"` Match all pod objects where spec.activeDeadlineSeconds >=0
class IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const bestEffort =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'BestEffort');
  static const crossNamespacePodAffinity =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'CrossNamespacePodAffinity');
  static const notBestEffort =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'NotBestEffort');
  static const notTerminating =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'NotTerminating');
  static const priorityClass =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'PriorityClass');
  static const terminating =
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum._(
          r'Terminating');

  /// List of all possible values in this [enum][IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum].
  static const values =
      <IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum>[
    bestEffort,
    crossNamespacePodAffinity,
    notBestEffort,
    notTerminating,
    priorityClass,
    terminating,
  ];

  static IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum].
class IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer {
  factory IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer._();

  String encode(
          IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BestEffort':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .bestEffort;
        case r'CrossNamespacePodAffinity':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .crossNamespacePodAffinity;
        case r'NotBestEffort':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .notBestEffort;
        case r'NotTerminating':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .notTerminating;
        case r'PriorityClass':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .priorityClass;
        case r'Terminating':
          return IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnum
              .terminating;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer] instance.
  static IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeNameEnumTypeTransformer?
      _instance;
}
