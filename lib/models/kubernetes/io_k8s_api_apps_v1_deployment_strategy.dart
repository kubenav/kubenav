//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_rolling_update_deployment.dart';

class IoK8sApiAppsV1DeploymentStrategy {
  /// Returns a new [IoK8sApiAppsV1DeploymentStrategy] instance.
  IoK8sApiAppsV1DeploymentStrategy({
    this.rollingUpdate,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1RollingUpdateDeployment? rollingUpdate;

  /// Type of deployment. Can be \"Recreate\" or \"RollingUpdate\". Default is RollingUpdate.  Possible enum values:  - `\"Recreate\"` Kill all existing pods before creating new ones.  - `\"RollingUpdate\"` Replace the old ReplicaSets by new one using rolling update i.e gradually scale down the old ReplicaSets and scale up the new one.
  IoK8sApiAppsV1DeploymentStrategyTypeEnum? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DeploymentStrategy &&
          other.rollingUpdate == rollingUpdate &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rollingUpdate == null ? 0 : rollingUpdate!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DeploymentStrategy[rollingUpdate=$rollingUpdate, type=$type]';

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

  /// Returns a new [IoK8sApiAppsV1DeploymentStrategy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DeploymentStrategy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DeploymentStrategy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DeploymentStrategy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DeploymentStrategy(
        rollingUpdate: IoK8sApiAppsV1RollingUpdateDeployment.fromJson(
            json[r'rollingUpdate']),
        type: IoK8sApiAppsV1DeploymentStrategyTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DeploymentStrategy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DeploymentStrategy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DeploymentStrategy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DeploymentStrategy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1DeploymentStrategy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStrategy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DeploymentStrategy-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DeploymentStrategy>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DeploymentStrategy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentStrategy.listFromJson(
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

/// Type of deployment. Can be \"Recreate\" or \"RollingUpdate\". Default is RollingUpdate.  Possible enum values:  - `\"Recreate\"` Kill all existing pods before creating new ones.  - `\"RollingUpdate\"` Replace the old ReplicaSets by new one using rolling update i.e gradually scale down the old ReplicaSets and scale up the new one.
class IoK8sApiAppsV1DeploymentStrategyTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiAppsV1DeploymentStrategyTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const recreate =
      IoK8sApiAppsV1DeploymentStrategyTypeEnum._(r'Recreate');
  static const rollingUpdate =
      IoK8sApiAppsV1DeploymentStrategyTypeEnum._(r'RollingUpdate');

  /// List of all possible values in this [enum][IoK8sApiAppsV1DeploymentStrategyTypeEnum].
  static const values = <IoK8sApiAppsV1DeploymentStrategyTypeEnum>[
    recreate,
    rollingUpdate,
  ];

  static IoK8sApiAppsV1DeploymentStrategyTypeEnum? fromJson(dynamic value) =>
      IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiAppsV1DeploymentStrategyTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DeploymentStrategyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DeploymentStrategyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiAppsV1DeploymentStrategyTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiAppsV1DeploymentStrategyTypeEnum].
class IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer {
  factory IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer._();

  const IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer._();

  String encode(IoK8sApiAppsV1DeploymentStrategyTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiAppsV1DeploymentStrategyTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiAppsV1DeploymentStrategyTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Recreate':
          return IoK8sApiAppsV1DeploymentStrategyTypeEnum.recreate;
        case r'RollingUpdate':
          return IoK8sApiAppsV1DeploymentStrategyTypeEnum.rollingUpdate;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer] instance.
  static IoK8sApiAppsV1DeploymentStrategyTypeEnumTypeTransformer? _instance;
}
