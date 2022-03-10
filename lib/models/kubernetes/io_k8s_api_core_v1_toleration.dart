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

class IoK8sApiCoreV1Toleration {
  /// Returns a new [IoK8sApiCoreV1Toleration] instance.
  IoK8sApiCoreV1Toleration({
    this.effect,
    this.key,
    this.operator_,
    this.tolerationSeconds,
    this.value,
  });

  /// Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.  Possible enum values:  - `\"NoExecute\"` Evict any already-running pods that do not tolerate the taint. Currently enforced by NodeController.  - `\"NoSchedule\"` Do not allow new pods to schedule onto the node unless they tolerate the taint, but allow all pods submitted to Kubelet without going through the scheduler to start, and allow all already-running pods to continue running. Enforced by the scheduler.  - `\"PreferNoSchedule\"` Like TaintEffectNoSchedule, but the scheduler tries not to schedule new pods onto the node, rather than prohibiting new pods from scheduling onto the node entirely. Enforced by the scheduler.
  IoK8sApiCoreV1TolerationEffectEnum? effect;

  /// Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.  Possible enum values:  - `\"Equal\"`  - `\"Exists\"`
  IoK8sApiCoreV1TolerationOperatorEnum? operator_;

  /// TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? tolerationSeconds;

  /// Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.
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
      other is IoK8sApiCoreV1Toleration &&
          other.effect == effect &&
          other.key == key &&
          other.operator_ == operator_ &&
          other.tolerationSeconds == tolerationSeconds &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (effect == null ? 0 : effect!.hashCode) +
      (key == null ? 0 : key!.hashCode) +
      (operator_ == null ? 0 : operator_!.hashCode) +
      (tolerationSeconds == null ? 0 : tolerationSeconds!.hashCode) +
      (value == null ? 0 : value!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Toleration[effect=$effect, key=$key, operator_=$operator_, tolerationSeconds=$tolerationSeconds, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (effect != null) {
      json[r'effect'] = effect;
    }
    if (key != null) {
      json[r'key'] = key;
    }
    if (operator_ != null) {
      json[r'operator'] = operator_;
    }
    if (tolerationSeconds != null) {
      json[r'tolerationSeconds'] = tolerationSeconds;
    }
    if (value != null) {
      json[r'value'] = value;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Toleration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Toleration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Toleration[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Toleration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Toleration(
        effect: IoK8sApiCoreV1TolerationEffectEnum.fromJson(json[r'effect']),
        key: mapValueOfType<String>(json, r'key'),
        operator_:
            IoK8sApiCoreV1TolerationOperatorEnum.fromJson(json[r'operator']),
        tolerationSeconds: mapValueOfType<int>(json, r'tolerationSeconds'),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Toleration>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Toleration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Toleration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Toleration> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Toleration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Toleration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Toleration-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Toleration>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Toleration>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Toleration.listFromJson(
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

/// Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.  Possible enum values:  - `\"NoExecute\"` Evict any already-running pods that do not tolerate the taint. Currently enforced by NodeController.  - `\"NoSchedule\"` Do not allow new pods to schedule onto the node unless they tolerate the taint, but allow all pods submitted to Kubelet without going through the scheduler to start, and allow all already-running pods to continue running. Enforced by the scheduler.  - `\"PreferNoSchedule\"` Like TaintEffectNoSchedule, but the scheduler tries not to schedule new pods onto the node, rather than prohibiting new pods from scheduling onto the node entirely. Enforced by the scheduler.
class IoK8sApiCoreV1TolerationEffectEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1TolerationEffectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const noExecute = IoK8sApiCoreV1TolerationEffectEnum._(r'NoExecute');
  static const noSchedule = IoK8sApiCoreV1TolerationEffectEnum._(r'NoSchedule');
  static const preferNoSchedule =
      IoK8sApiCoreV1TolerationEffectEnum._(r'PreferNoSchedule');

  /// List of all possible values in this [enum][IoK8sApiCoreV1TolerationEffectEnum].
  static const values = <IoK8sApiCoreV1TolerationEffectEnum>[
    noExecute,
    noSchedule,
    preferNoSchedule,
  ];

  static IoK8sApiCoreV1TolerationEffectEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1TolerationEffectEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1TolerationEffectEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1TolerationEffectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1TolerationEffectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1TolerationEffectEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1TolerationEffectEnum].
class IoK8sApiCoreV1TolerationEffectEnumTypeTransformer {
  factory IoK8sApiCoreV1TolerationEffectEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1TolerationEffectEnumTypeTransformer._();

  const IoK8sApiCoreV1TolerationEffectEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1TolerationEffectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1TolerationEffectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1TolerationEffectEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'NoExecute':
          return IoK8sApiCoreV1TolerationEffectEnum.noExecute;
        case r'NoSchedule':
          return IoK8sApiCoreV1TolerationEffectEnum.noSchedule;
        case r'PreferNoSchedule':
          return IoK8sApiCoreV1TolerationEffectEnum.preferNoSchedule;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1TolerationEffectEnumTypeTransformer] instance.
  static IoK8sApiCoreV1TolerationEffectEnumTypeTransformer? _instance;
}

/// Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.  Possible enum values:  - `\"Equal\"`  - `\"Exists\"`
class IoK8sApiCoreV1TolerationOperatorEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1TolerationOperatorEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const equal = IoK8sApiCoreV1TolerationOperatorEnum._(r'Equal');
  static const exists = IoK8sApiCoreV1TolerationOperatorEnum._(r'Exists');

  /// List of all possible values in this [enum][IoK8sApiCoreV1TolerationOperatorEnum].
  static const values = <IoK8sApiCoreV1TolerationOperatorEnum>[
    equal,
    exists,
  ];

  static IoK8sApiCoreV1TolerationOperatorEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1TolerationOperatorEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1TolerationOperatorEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1TolerationOperatorEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1TolerationOperatorEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1TolerationOperatorEnum].
class IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer {
  factory IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer._();

  const IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1TolerationOperatorEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1TolerationOperatorEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1TolerationOperatorEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Equal':
          return IoK8sApiCoreV1TolerationOperatorEnum.equal;
        case r'Exists':
          return IoK8sApiCoreV1TolerationOperatorEnum.exists;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer] instance.
  static IoK8sApiCoreV1TolerationOperatorEnumTypeTransformer? _instance;
}
