//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PodReadinessGate {
  /// Returns a new [IoK8sApiCoreV1PodReadinessGate] instance.
  IoK8sApiCoreV1PodReadinessGate({
    required this.conditionType,
  });

  /// ConditionType refers to a condition in the pod's condition list with matching type.  Possible enum values:  - `\"ContainersReady\"` indicates whether all containers in the pod are ready.  - `\"Initialized\"` means that all init containers in the pod have started successfully.  - `\"PodScheduled\"` represents status of the scheduling process for this pod.  - `\"Ready\"` means the pod is able to service requests and should be added to the load balancing pools of all matching services.
  IoK8sApiCoreV1PodReadinessGateConditionTypeEnum conditionType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodReadinessGate &&
          other.conditionType == conditionType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditionType.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodReadinessGate[conditionType=$conditionType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditionType'] = conditionType;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodReadinessGate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodReadinessGate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodReadinessGate[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodReadinessGate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodReadinessGate(
        conditionType: IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.fromJson(
            json[r'conditionType'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodReadinessGate>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodReadinessGate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodReadinessGate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodReadinessGate> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodReadinessGate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodReadinessGate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodReadinessGate-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodReadinessGate>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodReadinessGate>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodReadinessGate.listFromJson(
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
    'conditionType',
  };
}

/// ConditionType refers to a condition in the pod's condition list with matching type.  Possible enum values:  - `\"ContainersReady\"` indicates whether all containers in the pod are ready.  - `\"Initialized\"` means that all init containers in the pod have started successfully.  - `\"PodScheduled\"` represents status of the scheduling process for this pod.  - `\"Ready\"` means the pod is able to service requests and should be added to the load balancing pools of all matching services.
class IoK8sApiCoreV1PodReadinessGateConditionTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodReadinessGateConditionTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const containersReady =
      IoK8sApiCoreV1PodReadinessGateConditionTypeEnum._(r'ContainersReady');
  static const initialized =
      IoK8sApiCoreV1PodReadinessGateConditionTypeEnum._(r'Initialized');
  static const podScheduled =
      IoK8sApiCoreV1PodReadinessGateConditionTypeEnum._(r'PodScheduled');
  static const ready =
      IoK8sApiCoreV1PodReadinessGateConditionTypeEnum._(r'Ready');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodReadinessGateConditionTypeEnum].
  static const values = <IoK8sApiCoreV1PodReadinessGateConditionTypeEnum>[
    containersReady,
    initialized,
    podScheduled,
    ready,
  ];

  static IoK8sApiCoreV1PodReadinessGateConditionTypeEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1PodReadinessGateConditionTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodReadinessGateConditionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodReadinessGateConditionTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodReadinessGateConditionTypeEnum].
class IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodReadinessGateConditionTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodReadinessGateConditionTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ContainersReady':
          return IoK8sApiCoreV1PodReadinessGateConditionTypeEnum
              .containersReady;
        case r'Initialized':
          return IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.initialized;
        case r'PodScheduled':
          return IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.podScheduled;
        case r'Ready':
          return IoK8sApiCoreV1PodReadinessGateConditionTypeEnum.ready;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodReadinessGateConditionTypeEnumTypeTransformer?
      _instance;
}
