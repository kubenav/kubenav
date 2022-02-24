//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1NamespaceCondition {
  /// Returns a new [IoK8sApiCoreV1NamespaceCondition] instance.
  IoK8sApiCoreV1NamespaceCondition({
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
  DateTime? lastTransitionTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Status of the condition, one of True, False, Unknown.
  String status;

  /// Type of namespace controller condition.  Possible enum values:  - `\"NamespaceContentRemaining\"` contains information about resources remaining in a namespace.  - `\"NamespaceDeletionContentFailure\"` contains information about namespace deleter errors during deletion of resources.  - `\"NamespaceDeletionDiscoveryFailure\"` contains information about namespace deleter errors during resource discovery.  - `\"NamespaceDeletionGroupVersionParsingFailure\"` contains information about namespace deleter errors parsing GV for legacy types.  - `\"NamespaceFinalizersRemaining\"` contains information about which finalizers are on resources remaining in a namespace.
  IoK8sApiCoreV1NamespaceConditionTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NamespaceCondition &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NamespaceCondition[lastTransitionTime=$lastTransitionTime, message=$message, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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

  /// Returns a new [IoK8sApiCoreV1NamespaceCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NamespaceCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NamespaceCondition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NamespaceCondition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NamespaceCondition(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', ''),
        message: mapValueOfType<String>(json, r'message'),
        reason: mapValueOfType<String>(json, r'reason'),
        status: mapValueOfType<String>(json, r'status')!,
        type: IoK8sApiCoreV1NamespaceConditionTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NamespaceCondition>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NamespaceCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NamespaceCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NamespaceCondition> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1NamespaceCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NamespaceCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NamespaceCondition-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NamespaceCondition>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NamespaceCondition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NamespaceCondition.listFromJson(
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

/// Type of namespace controller condition.  Possible enum values:  - `\"NamespaceContentRemaining\"` contains information about resources remaining in a namespace.  - `\"NamespaceDeletionContentFailure\"` contains information about namespace deleter errors during deletion of resources.  - `\"NamespaceDeletionDiscoveryFailure\"` contains information about namespace deleter errors during resource discovery.  - `\"NamespaceDeletionGroupVersionParsingFailure\"` contains information about namespace deleter errors parsing GV for legacy types.  - `\"NamespaceFinalizersRemaining\"` contains information about which finalizers are on resources remaining in a namespace.
class IoK8sApiCoreV1NamespaceConditionTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1NamespaceConditionTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const namespaceContentRemaining =
      IoK8sApiCoreV1NamespaceConditionTypeEnum._(r'NamespaceContentRemaining');
  static const namespaceDeletionContentFailure =
      IoK8sApiCoreV1NamespaceConditionTypeEnum._(
          r'NamespaceDeletionContentFailure');
  static const namespaceDeletionDiscoveryFailure =
      IoK8sApiCoreV1NamespaceConditionTypeEnum._(
          r'NamespaceDeletionDiscoveryFailure');
  static const namespaceDeletionGroupVersionParsingFailure =
      IoK8sApiCoreV1NamespaceConditionTypeEnum._(
          r'NamespaceDeletionGroupVersionParsingFailure');
  static const namespaceFinalizersRemaining =
      IoK8sApiCoreV1NamespaceConditionTypeEnum._(
          r'NamespaceFinalizersRemaining');

  /// List of all possible values in this [enum][IoK8sApiCoreV1NamespaceConditionTypeEnum].
  static const values = <IoK8sApiCoreV1NamespaceConditionTypeEnum>[
    namespaceContentRemaining,
    namespaceDeletionContentFailure,
    namespaceDeletionDiscoveryFailure,
    namespaceDeletionGroupVersionParsingFailure,
    namespaceFinalizersRemaining,
  ];

  static IoK8sApiCoreV1NamespaceConditionTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1NamespaceConditionTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NamespaceConditionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NamespaceConditionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1NamespaceConditionTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1NamespaceConditionTypeEnum].
class IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1NamespaceConditionTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1NamespaceConditionTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1NamespaceConditionTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'NamespaceContentRemaining':
          return IoK8sApiCoreV1NamespaceConditionTypeEnum
              .namespaceContentRemaining;
        case r'NamespaceDeletionContentFailure':
          return IoK8sApiCoreV1NamespaceConditionTypeEnum
              .namespaceDeletionContentFailure;
        case r'NamespaceDeletionDiscoveryFailure':
          return IoK8sApiCoreV1NamespaceConditionTypeEnum
              .namespaceDeletionDiscoveryFailure;
        case r'NamespaceDeletionGroupVersionParsingFailure':
          return IoK8sApiCoreV1NamespaceConditionTypeEnum
              .namespaceDeletionGroupVersionParsingFailure;
        case r'NamespaceFinalizersRemaining':
          return IoK8sApiCoreV1NamespaceConditionTypeEnum
              .namespaceFinalizersRemaining;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1NamespaceConditionTypeEnumTypeTransformer? _instance;
}
