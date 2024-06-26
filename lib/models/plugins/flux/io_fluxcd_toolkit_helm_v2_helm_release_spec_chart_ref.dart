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

class IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef({
    this.apiVersion,
    required this.kind,
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
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum kind;

  /// Name of the referent.
  String name;

  /// Namespace of the referent, defaults to the namespace of the Kubernetes resource object that contains the reference.
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
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind.hashCode) +
      (name.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef[apiVersion=$apiVersion, kind=$kind, name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum.fromJson(
            json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartRef.listFromJson(
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

/// Kind of the referent.
class IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oCIRepository =
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum._(r'OCIRepository');
  static const helmChart =
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum._(r'HelmChart');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum].
  static const values = <IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum>[
    oCIRepository,
    helmChart,
  ];

  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum].
class IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer._();

  String encode(IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'OCIRepository':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum
              .oCIRepository;
        case r'HelmChart':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnum.helmChart;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2HelmReleaseSpecChartRefKindEnumTypeTransformer?
      _instance;
}
