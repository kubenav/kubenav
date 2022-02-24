//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1Taint {
  /// Returns a new [IoK8sApiCoreV1Taint] instance.
  IoK8sApiCoreV1Taint({
    required this.effect,
    required this.key,
    this.timeAdded,
    this.value,
  });

  /// Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.  Possible enum values:  - `\"NoExecute\"` Evict any already-running pods that do not tolerate the taint. Currently enforced by NodeController.  - `\"NoSchedule\"` Do not allow new pods to schedule onto the node unless they tolerate the taint, but allow all pods submitted to Kubelet without going through the scheduler to start, and allow all already-running pods to continue running. Enforced by the scheduler.  - `\"PreferNoSchedule\"` Like TaintEffectNoSchedule, but the scheduler tries not to schedule new pods onto the node, rather than prohibiting new pods from scheduling onto the node entirely. Enforced by the scheduler.
  IoK8sApiCoreV1TaintEffectEnum effect;

  /// Required. The taint key to be applied to a node.
  String key;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? timeAdded;

  /// The taint value corresponding to the taint key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Taint &&
          other.effect == effect &&
          other.key == key &&
          other.timeAdded == timeAdded &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (effect.hashCode) +
      (key.hashCode) +
      (timeAdded == null ? 0 : timeAdded!.hashCode) +
      (value == null ? 0 : value!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Taint[effect=$effect, key=$key, timeAdded=$timeAdded, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'effect'] = effect;
    json[r'key'] = key;
    if (timeAdded != null) {
      json[r'timeAdded'] = timeAdded!.toUtc().toIso8601String();
    }
    if (value != null) {
      json[r'value'] = value;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Taint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Taint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Taint[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Taint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Taint(
        effect: IoK8sApiCoreV1TaintEffectEnum.fromJson(json[r'effect'])!,
        key: mapValueOfType<String>(json, r'key')!,
        timeAdded: mapDateTime(json, r'timeAdded', ''),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Taint>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Taint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Taint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Taint> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Taint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Taint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Taint-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Taint>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Taint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Taint.listFromJson(
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
    'effect',
    'key',
  };
}

/// Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.  Possible enum values:  - `\"NoExecute\"` Evict any already-running pods that do not tolerate the taint. Currently enforced by NodeController.  - `\"NoSchedule\"` Do not allow new pods to schedule onto the node unless they tolerate the taint, but allow all pods submitted to Kubelet without going through the scheduler to start, and allow all already-running pods to continue running. Enforced by the scheduler.  - `\"PreferNoSchedule\"` Like TaintEffectNoSchedule, but the scheduler tries not to schedule new pods onto the node, rather than prohibiting new pods from scheduling onto the node entirely. Enforced by the scheduler.
class IoK8sApiCoreV1TaintEffectEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1TaintEffectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const noExecute = IoK8sApiCoreV1TaintEffectEnum._(r'NoExecute');
  static const noSchedule = IoK8sApiCoreV1TaintEffectEnum._(r'NoSchedule');
  static const preferNoSchedule =
      IoK8sApiCoreV1TaintEffectEnum._(r'PreferNoSchedule');

  /// List of all possible values in this [enum][IoK8sApiCoreV1TaintEffectEnum].
  static const values = <IoK8sApiCoreV1TaintEffectEnum>[
    noExecute,
    noSchedule,
    preferNoSchedule,
  ];

  static IoK8sApiCoreV1TaintEffectEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1TaintEffectEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1TaintEffectEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1TaintEffectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1TaintEffectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1TaintEffectEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1TaintEffectEnum].
class IoK8sApiCoreV1TaintEffectEnumTypeTransformer {
  factory IoK8sApiCoreV1TaintEffectEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1TaintEffectEnumTypeTransformer._();

  const IoK8sApiCoreV1TaintEffectEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1TaintEffectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1TaintEffectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1TaintEffectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'NoExecute':
          return IoK8sApiCoreV1TaintEffectEnum.noExecute;
        case r'NoSchedule':
          return IoK8sApiCoreV1TaintEffectEnum.noSchedule;
        case r'PreferNoSchedule':
          return IoK8sApiCoreV1TaintEffectEnum.preferNoSchedule;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1TaintEffectEnumTypeTransformer] instance.
  static IoK8sApiCoreV1TaintEffectEnumTypeTransformer? _instance;
}
