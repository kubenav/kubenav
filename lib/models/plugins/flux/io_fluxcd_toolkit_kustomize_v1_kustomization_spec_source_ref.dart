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

class IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef {
  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef] instance.
  IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef({
    this.apiVersion,
    required this.kind,
    required this.name,
    this.namespace,
  });

  /// API version of the referent.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind of the referent.
  IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum kind;

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
      other is IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef &&
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
      'IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef[apiVersion=$apiVersion, kind=$kind, name=$name, namespace=$namespace]';

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

  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum
            .fromJson(json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef.listFromJson(
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
class IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const oCIRepository =
      IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum._(
          r'OCIRepository');
  static const gitRepository =
      IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum._(
          r'GitRepository');
  static const bucket =
      IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum._(r'Bucket');

  /// List of all possible values in this [enum][IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum].
  static const values =
      <IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum>[
    oCIRepository,
    gitRepository,
    bucket,
  ];

  static IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum].
class IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer {
  factory IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'OCIRepository':
          return IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum
              .oCIRepository;
        case r'GitRepository':
          return IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum
              .gitRepository;
        case r'Bucket':
          return IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnum
              .bucket;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRefKindEnumTypeTransformer?
      _instance;
}
