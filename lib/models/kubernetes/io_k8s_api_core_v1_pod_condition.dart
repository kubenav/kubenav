//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiCoreV1PodCondition {
  /// Returns a new [IoK8sApiCoreV1PodCondition] instance.
  IoK8sApiCoreV1PodCondition({
    this.lastProbeTime,
    this.lastTransitionTime,
    this.message,
    this.reason,
    required this.status,
    required this.type,
  });

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastProbeTime;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  /// Human-readable message indicating details about last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Unique, one-word, CamelCase reason for the condition's last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
  String status;

  /// Type is the type of the condition. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions  Possible enum values:  - `\"ContainersReady\"` indicates whether all containers in the pod are ready.  - `\"Initialized\"` means that all init containers in the pod have started successfully.  - `\"PodScheduled\"` represents status of the scheduling process for this pod.  - `\"Ready\"` means the pod is able to service requests and should be added to the load balancing pools of all matching services.
  IoK8sApiCoreV1PodConditionTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodCondition &&
          other.lastProbeTime == lastProbeTime &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastProbeTime == null ? 0 : lastProbeTime!.hashCode) +
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodCondition[lastProbeTime=$lastProbeTime, lastTransitionTime=$lastTransitionTime, message=$message, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lastProbeTime != null) {
      json[r'lastProbeTime'] = lastProbeTime!.toUtc().toIso8601String();
    }
    if (lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          lastTransitionTime!.toUtc().toIso8601String();
    }
    if (message != null) {
      json[r'message'] = message;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    json[r'status'] = status;
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodCondition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodCondition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodCondition(
        lastProbeTime: mapDateTime(json, r'lastProbeTime', ''),
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', ''),
        message: mapValueOfType<String>(json, r'message'),
        reason: mapValueOfType<String>(json, r'reason'),
        status: mapValueOfType<String>(json, r'status')!,
        type: IoK8sApiCoreV1PodConditionTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodCondition>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodCondition> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodCondition-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodCondition>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodCondition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodCondition.listFromJson(
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
    'status',
    'type',
  };
}

/// Type is the type of the condition. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions  Possible enum values:  - `\"ContainersReady\"` indicates whether all containers in the pod are ready.  - `\"Initialized\"` means that all init containers in the pod have started successfully.  - `\"PodScheduled\"` represents status of the scheduling process for this pod.  - `\"Ready\"` means the pod is able to service requests and should be added to the load balancing pools of all matching services.
class IoK8sApiCoreV1PodConditionTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodConditionTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const containersReady =
      IoK8sApiCoreV1PodConditionTypeEnum._(r'ContainersReady');
  static const initialized =
      IoK8sApiCoreV1PodConditionTypeEnum._(r'Initialized');
  static const podScheduled =
      IoK8sApiCoreV1PodConditionTypeEnum._(r'PodScheduled');
  static const ready = IoK8sApiCoreV1PodConditionTypeEnum._(r'Ready');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodConditionTypeEnum].
  static const values = <IoK8sApiCoreV1PodConditionTypeEnum>[
    containersReady,
    initialized,
    podScheduled,
    ready,
  ];

  static IoK8sApiCoreV1PodConditionTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PodConditionTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodConditionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodConditionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodConditionTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodConditionTypeEnum].
class IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodConditionTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodConditionTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodConditionTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ContainersReady':
          return IoK8sApiCoreV1PodConditionTypeEnum.containersReady;
        case r'Initialized':
          return IoK8sApiCoreV1PodConditionTypeEnum.initialized;
        case r'PodScheduled':
          return IoK8sApiCoreV1PodConditionTypeEnum.podScheduled;
        case r'Ready':
          return IoK8sApiCoreV1PodConditionTypeEnum.ready;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodConditionTypeEnumTypeTransformer? _instance;
}
