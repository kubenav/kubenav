//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAppsV1StatefulSetUpdateStrategy {
  /// Returns a new [IoK8sApiAppsV1StatefulSetUpdateStrategy] instance.
  IoK8sApiAppsV1StatefulSetUpdateStrategy({
    this.rollingUpdate,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1RollingUpdateStatefulSetStrategy? rollingUpdate;

  /// Type indicates the type of the StatefulSetUpdateStrategy. Default is RollingUpdate.  Possible enum values:  - `\"OnDelete\"` triggers the legacy behavior. Version tracking and ordered rolling restarts are disabled. Pods are recreated from the StatefulSetSpec when they are manually deleted. When a scale operation is performed with this strategy,specification version indicated by the StatefulSet's currentRevision.  - `\"RollingUpdate\"` indicates that update will be applied to all Pods in the StatefulSet with respect to the StatefulSet ordering constraints. When a scale operation is performed with this strategy, new Pods will be created from the specification version indicated by the StatefulSet's updateRevision.
  IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1StatefulSetUpdateStrategy &&
          other.rollingUpdate == rollingUpdate &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rollingUpdate == null ? 0 : rollingUpdate!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1StatefulSetUpdateStrategy[rollingUpdate=$rollingUpdate, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (rollingUpdate != null) {
      json[r'rollingUpdate'] = rollingUpdate;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1StatefulSetUpdateStrategy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1StatefulSetUpdateStrategy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1StatefulSetUpdateStrategy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1StatefulSetUpdateStrategy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1StatefulSetUpdateStrategy(
        rollingUpdate: IoK8sApiAppsV1RollingUpdateStatefulSetStrategy.fromJson(
            json[r'rollingUpdate']),
        type: IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum.fromJson(
            json[r'type']),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1StatefulSetUpdateStrategy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1StatefulSetUpdateStrategy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1StatefulSetUpdateStrategy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1StatefulSetUpdateStrategy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1StatefulSetUpdateStrategy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1StatefulSetUpdateStrategy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1StatefulSetUpdateStrategy-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1StatefulSetUpdateStrategy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1StatefulSetUpdateStrategy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1StatefulSetUpdateStrategy.listFromJson(
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
  static const requiredKeys = <String>{};
}

/// Type indicates the type of the StatefulSetUpdateStrategy. Default is RollingUpdate.  Possible enum values:  - `\"OnDelete\"` triggers the legacy behavior. Version tracking and ordered rolling restarts are disabled. Pods are recreated from the StatefulSetSpec when they are manually deleted. When a scale operation is performed with this strategy,specification version indicated by the StatefulSet's currentRevision.  - `\"RollingUpdate\"` indicates that update will be applied to all Pods in the StatefulSet with respect to the StatefulSet ordering constraints. When a scale operation is performed with this strategy, new Pods will be created from the specification version indicated by the StatefulSet's updateRevision.
class IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const onDelete =
      IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum._(r'OnDelete');
  static const rollingUpdate =
      IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum._(r'RollingUpdate');

  /// List of all possible values in this [enum][IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum].
  static const values = <IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum>[
    onDelete,
    rollingUpdate,
  ];

  static IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum? fromJson(
          dynamic value) =>
      IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum].
class IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer {
  factory IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer
              ._();

  const IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer._();

  String encode(IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'OnDelete':
          return IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum.onDelete;
        case r'RollingUpdate':
          return IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnum.rollingUpdate;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer] instance.
  static IoK8sApiAppsV1StatefulSetUpdateStrategyTypeEnumTypeTransformer?
      _instance;
}
