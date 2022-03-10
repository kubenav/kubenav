//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace_condition.dart';

class IoK8sApiCoreV1NamespaceStatus {
  /// Returns a new [IoK8sApiCoreV1NamespaceStatus] instance.
  IoK8sApiCoreV1NamespaceStatus({
    this.conditions = const [],
    this.phase,
  });

  /// Represents the latest available observations of a namespace's current state.
  List<IoK8sApiCoreV1NamespaceCondition> conditions;

  /// Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/  Possible enum values:  - `\"Active\"` means the namespace is available for use in the system  - `\"Terminating\"` means the namespace is undergoing graceful termination
  IoK8sApiCoreV1NamespaceStatusPhaseEnum? phase;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NamespaceStatus &&
          other.conditions == conditions &&
          other.phase == phase;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) + (phase == null ? 0 : phase!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NamespaceStatus[conditions=$conditions, phase=$phase]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = conditions;
    if (phase != null) {
      json[r'phase'] = phase;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NamespaceStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NamespaceStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NamespaceStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NamespaceStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NamespaceStatus(
        conditions: IoK8sApiCoreV1NamespaceCondition.listFromJson(
                json[r'conditions']) ??
            const [],
        phase: IoK8sApiCoreV1NamespaceStatusPhaseEnum.fromJson(json[r'phase']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NamespaceStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NamespaceStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NamespaceStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NamespaceStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NamespaceStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NamespaceStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NamespaceStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NamespaceStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NamespaceStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NamespaceStatus.listFromJson(
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

/// Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/  Possible enum values:  - `\"Active\"` means the namespace is available for use in the system  - `\"Terminating\"` means the namespace is undergoing graceful termination
class IoK8sApiCoreV1NamespaceStatusPhaseEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1NamespaceStatusPhaseEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = IoK8sApiCoreV1NamespaceStatusPhaseEnum._(r'Active');
  static const terminating =
      IoK8sApiCoreV1NamespaceStatusPhaseEnum._(r'Terminating');

  /// List of all possible values in this [enum][IoK8sApiCoreV1NamespaceStatusPhaseEnum].
  static const values = <IoK8sApiCoreV1NamespaceStatusPhaseEnum>[
    active,
    terminating,
  ];

  static IoK8sApiCoreV1NamespaceStatusPhaseEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1NamespaceStatusPhaseEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NamespaceStatusPhaseEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NamespaceStatusPhaseEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1NamespaceStatusPhaseEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1NamespaceStatusPhaseEnum].
class IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer {
  factory IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer._();

  const IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1NamespaceStatusPhaseEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1NamespaceStatusPhaseEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1NamespaceStatusPhaseEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Active':
          return IoK8sApiCoreV1NamespaceStatusPhaseEnum.active;
        case r'Terminating':
          return IoK8sApiCoreV1NamespaceStatusPhaseEnum.terminating;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer] instance.
  static IoK8sApiCoreV1NamespaceStatusPhaseEnumTypeTransformer? _instance;
}
