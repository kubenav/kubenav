//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_rolling_update_daemon_set.dart';

class IoK8sApiAppsV1DaemonSetUpdateStrategy {
  /// Returns a new [IoK8sApiAppsV1DaemonSetUpdateStrategy] instance.
  IoK8sApiAppsV1DaemonSetUpdateStrategy({
    this.rollingUpdate,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1RollingUpdateDaemonSet? rollingUpdate;

  /// Type of daemon set update. Can be \"RollingUpdate\" or \"OnDelete\". Default is RollingUpdate.  Possible enum values:  - `\"OnDelete\"` Replace the old daemons only when it's killed  - `\"RollingUpdate\"` Replace the old daemons by new ones using rolling update i.e replace them on each node one after the other.
  IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DaemonSetUpdateStrategy &&
          other.rollingUpdate == rollingUpdate &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rollingUpdate == null ? 0 : rollingUpdate!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DaemonSetUpdateStrategy[rollingUpdate=$rollingUpdate, type=$type]';

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

  /// Returns a new [IoK8sApiAppsV1DaemonSetUpdateStrategy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DaemonSetUpdateStrategy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DaemonSetUpdateStrategy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DaemonSetUpdateStrategy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DaemonSetUpdateStrategy(
        rollingUpdate: IoK8sApiAppsV1RollingUpdateDaemonSet.fromJson(
            json[r'rollingUpdate']),
        type: IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum.fromJson(
            json[r'type']),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DaemonSetUpdateStrategy>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DaemonSetUpdateStrategy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DaemonSetUpdateStrategy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DaemonSetUpdateStrategy> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAppsV1DaemonSetUpdateStrategy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAppsV1DaemonSetUpdateStrategy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DaemonSetUpdateStrategy-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DaemonSetUpdateStrategy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DaemonSetUpdateStrategy>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DaemonSetUpdateStrategy.listFromJson(
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

/// Type of daemon set update. Can be \"RollingUpdate\" or \"OnDelete\". Default is RollingUpdate.  Possible enum values:  - `\"OnDelete\"` Replace the old daemons only when it's killed  - `\"RollingUpdate\"` Replace the old daemons by new ones using rolling update i.e replace them on each node one after the other.
class IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const onDelete =
      IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum._(r'OnDelete');
  static const rollingUpdate =
      IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum._(r'RollingUpdate');

  /// List of all possible values in this [enum][IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum].
  static const values = <IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum>[
    onDelete,
    rollingUpdate,
  ];

  static IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum? fromJson(
          dynamic value) =>
      IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum].
class IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer {
  factory IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer
              ._();

  const IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer._();

  String encode(IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'OnDelete':
          return IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum.onDelete;
        case r'RollingUpdate':
          return IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnum.rollingUpdate;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer] instance.
  static IoK8sApiAppsV1DaemonSetUpdateStrategyTypeEnumTypeTransformer?
      _instance;
}
