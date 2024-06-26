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

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef({
    this.apiVersion,
    this.kind,
    required this.name,
    this.namespace,
  });

  /// APIVersion of the referent.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind of the referent.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum? kind;

  /// Name of the referent.
  String name;

  /// Namespace of the referent.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (name.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef[apiVersion=$apiVersion, kind=$kind, name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    json[r'name'] = this.name;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
                .fromJson(json[r'kind']),
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRef
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
    'name',
  };
}

/// Kind of the referent.
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const helmRepository =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum._(
          r'HelmRepository');
  static const gitRepository =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum._(
          r'GitRepository');
  static const bucket =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum._(
          r'Bucket');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum>[
    helmRepository,
    gitRepository,
    bucket,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'HelmRepository':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
              .helmRepository;
        case r'GitRepository':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
              .gitRepository;
        case r'Bucket':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnum
              .bucket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecSourceRefKindEnumTypeTransformer?
      _instance;
}
