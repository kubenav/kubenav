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

class IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef] instance.
  IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef({
    this.apiVersion,
    required this.kind,
    required this.name,
  });

  /// APIVersion of the referent.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind of the referent, valid values are ('HelmRepository', 'GitRepository', 'Bucket').
  IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum kind;

  /// Name of the referent.
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind.hashCode) +
      (name.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef[apiVersion=$apiVersion, kind=$kind, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind:
            IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum.fromJson(
                json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRef.listFromJson(
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

/// Kind of the referent, valid values are ('HelmRepository', 'GitRepository', 'Bucket').
class IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const helmRepository =
      IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum._(
          r'HelmRepository');
  static const gitRepository =
      IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum._(
          r'GitRepository');
  static const bucket =
      IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum._(r'Bucket');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum>[
    helmRepository,
    gitRepository,
    bucket,
  ];

  static IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum].
class IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'HelmRepository':
          return IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum
              .helmRepository;
        case r'GitRepository':
          return IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum
              .gitRepository;
        case r'Bucket':
          return IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnum
              .bucket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2HelmChartSpecSourceRefKindEnumTypeTransformer?
      _instance;
}
