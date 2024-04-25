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

class IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner {
  /// Returns a new [IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner] instance.
  IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner({
    this.apiVersion,
    required this.kind,
    this.matchLabels = const {},
    required this.name,
    this.namespace,
  });

  /// API version of the referent
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind of the referent
  IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum kind;

  /// MatchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed. MatchLabels requires the name to be set to `*`.
  Map<String, String> matchLabels;

  /// Name of the referent If multiple resources are targeted `*` may be set.
  String name;

  /// Namespace of the referent
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
      other is IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          deepEquality.equals(other.matchLabels, matchLabels) &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind.hashCode) +
      (matchLabels.hashCode) +
      (name.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner[apiVersion=$apiVersion, kind=$kind, matchLabels=$matchLabels, name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    json[r'kind'] = this.kind;
    json[r'matchLabels'] = this.matchLabels;
    json[r'name'] = this.name;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
            .fromJson(json[r'kind'])!,
        matchLabels:
            mapCastOfType<String, String>(json, r'matchLabels') ?? const {},
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner
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

/// Kind of the referent
class IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const bucket =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'Bucket');
  static const gitRepository =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'GitRepository');
  static const kustomization =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'Kustomization');
  static const helmRelease =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'HelmRelease');
  static const helmChart =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'HelmChart');
  static const helmRepository =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'HelmRepository');
  static const imageRepository =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'ImageRepository');
  static const imagePolicy =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'ImagePolicy');
  static const imageUpdateAutomation =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'ImageUpdateAutomation');
  static const oCIRepository =
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum._(
          r'OCIRepository');

  /// List of all possible values in this [enum][IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum].
  static const values =
      <IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum>[
    bucket,
    gitRepository,
    kustomization,
    helmRelease,
    helmChart,
    helmRepository,
    imageRepository,
    imagePolicy,
    imageUpdateAutomation,
    oCIRepository,
  ];

  static IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum].
class IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer {
  factory IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer
              ._();

  const IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Bucket':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .bucket;
        case r'GitRepository':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .gitRepository;
        case r'Kustomization':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .kustomization;
        case r'HelmRelease':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .helmRelease;
        case r'HelmChart':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .helmChart;
        case r'HelmRepository':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .helmRepository;
        case r'ImageRepository':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .imageRepository;
        case r'ImagePolicy':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .imagePolicy;
        case r'ImageUpdateAutomation':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .imageUpdateAutomation;
        case r'OCIRepository':
          return IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnum
              .oCIRepository;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer] instance.
  static IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInnerKindEnumTypeTransformer?
      _instance;
}
