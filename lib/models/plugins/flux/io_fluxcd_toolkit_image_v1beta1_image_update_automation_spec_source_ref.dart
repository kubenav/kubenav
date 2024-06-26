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

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef({
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
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum kind;

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
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef &&
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
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef[apiVersion=$apiVersion, kind=$kind, name=$name, namespace=$namespace]';

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

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum
                .fromJson(json[r'kind'])!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef
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

/// Kind of the referent.
class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const gitRepository =
      IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum._(
          r'GitRepository');

  /// List of all possible values in this [enum][IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum].
  static const values =
      <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum>[
    gitRepository,
  ];

  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum].
class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer {
  factory IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'GitRepository':
          return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnum
              .gitRepository;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRefKindEnumTypeTransformer?
      _instance;
}
