//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1NodeCondition {
  /// Returns a new [IoK8sApiCoreV1NodeCondition] instance.
  IoK8sApiCoreV1NodeCondition({
    this.lastHeartbeatTime,
    this.lastTransitionTime,
    this.message,
    this.reason,
    required this.status,
    this.type,
  });

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastHeartbeatTime;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  /// Human readable message indicating details about last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// (brief) reason for the condition's last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Status of the condition, one of True, False, Unknown.
  String status;

  /// Type of node condition.  Possible enum values:  - `\"DiskPressure\"` means the kubelet is under pressure due to insufficient available disk.  - `\"MemoryPressure\"` means the kubelet is under pressure due to insufficient available memory.  - `\"NetworkUnavailable\"` means that network for the node is not correctly configured.  - `\"PIDPressure\"` means the kubelet is under pressure due to insufficient available PID.  - `\"Ready\"` means kubelet is healthy and ready to accept pods.
  IoK8sApiCoreV1NodeConditionTypeEnum? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeCondition &&
          other.lastHeartbeatTime == lastHeartbeatTime &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastHeartbeatTime == null ? 0 : lastHeartbeatTime!.hashCode) +
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeCondition[lastHeartbeatTime=$lastHeartbeatTime, lastTransitionTime=$lastTransitionTime, message=$message, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lastHeartbeatTime != null) {
      json[r'lastHeartbeatTime'] = lastHeartbeatTime!.toUtc().toIso8601String();
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
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeCondition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeCondition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeCondition(
        lastHeartbeatTime: mapDateTime(json, r'lastHeartbeatTime', ''),
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', ''),
        message: mapValueOfType<String>(json, r'message'),
        reason: mapValueOfType<String>(json, r'reason'),
        status: mapValueOfType<String>(json, r'status')!,
        type: IoK8sApiCoreV1NodeConditionTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeCondition>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeCondition> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeCondition-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeCondition>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeCondition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeCondition.listFromJson(
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
  };
}

/// Type of node condition.  Possible enum values:  - `\"DiskPressure\"` means the kubelet is under pressure due to insufficient available disk.  - `\"MemoryPressure\"` means the kubelet is under pressure due to insufficient available memory.  - `\"NetworkUnavailable\"` means that network for the node is not correctly configured.  - `\"PIDPressure\"` means the kubelet is under pressure due to insufficient available PID.  - `\"Ready\"` means kubelet is healthy and ready to accept pods.
class IoK8sApiCoreV1NodeConditionTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1NodeConditionTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const diskPressure =
      IoK8sApiCoreV1NodeConditionTypeEnum._(r'DiskPressure');
  static const memoryPressure =
      IoK8sApiCoreV1NodeConditionTypeEnum._(r'MemoryPressure');
  static const networkUnavailable =
      IoK8sApiCoreV1NodeConditionTypeEnum._(r'NetworkUnavailable');
  static const pIDPressure =
      IoK8sApiCoreV1NodeConditionTypeEnum._(r'PIDPressure');
  static const ready = IoK8sApiCoreV1NodeConditionTypeEnum._(r'Ready');

  /// List of all possible values in this [enum][IoK8sApiCoreV1NodeConditionTypeEnum].
  static const values = <IoK8sApiCoreV1NodeConditionTypeEnum>[
    diskPressure,
    memoryPressure,
    networkUnavailable,
    pIDPressure,
    ready,
  ];

  static IoK8sApiCoreV1NodeConditionTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1NodeConditionTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeConditionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeConditionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1NodeConditionTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1NodeConditionTypeEnum].
class IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1NodeConditionTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1NodeConditionTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1NodeConditionTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'DiskPressure':
          return IoK8sApiCoreV1NodeConditionTypeEnum.diskPressure;
        case r'MemoryPressure':
          return IoK8sApiCoreV1NodeConditionTypeEnum.memoryPressure;
        case r'NetworkUnavailable':
          return IoK8sApiCoreV1NodeConditionTypeEnum.networkUnavailable;
        case r'PIDPressure':
          return IoK8sApiCoreV1NodeConditionTypeEnum.pIDPressure;
        case r'Ready':
          return IoK8sApiCoreV1NodeConditionTypeEnum.ready;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1NodeConditionTypeEnumTypeTransformer? _instance;
}
