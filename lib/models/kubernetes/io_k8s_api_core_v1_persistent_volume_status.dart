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

class IoK8sApiCoreV1PersistentVolumeStatus {
  /// Returns a new [IoK8sApiCoreV1PersistentVolumeStatus] instance.
  IoK8sApiCoreV1PersistentVolumeStatus({
    this.message,
    this.phase,
    this.reason,
  });

  /// A human-readable message indicating details about why the volume is in this state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Phase indicates if a volume is available, bound to a claim, or released by a claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase  Possible enum values:  - `\"Available\"` used for PersistentVolumes that are not yet bound Available volumes are held by the binder and matched to PersistentVolumeClaims  - `\"Bound\"` used for PersistentVolumes that are bound  - `\"Failed\"` used for PersistentVolumes that failed to be correctly recycled or deleted after being released from a claim  - `\"Pending\"` used for PersistentVolumes that are not available  - `\"Released\"` used for PersistentVolumes where the bound PersistentVolumeClaim was deleted released volumes must be recycled before becoming available again this phase is used by the persistent volume claim binder to signal to another process to reclaim the resource
  IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum? phase;

  /// Reason is a brief CamelCase string that describes any failure and is meant for machine parsing and tidy display in the CLI.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PersistentVolumeStatus &&
          other.message == message &&
          other.phase == phase &&
          other.reason == reason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (message == null ? 0 : message!.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (reason == null ? 0 : reason!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PersistentVolumeStatus[message=$message, phase=$phase, reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (message != null) {
      json[r'message'] = message;
    }
    if (phase != null) {
      json[r'phase'] = phase;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PersistentVolumeStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PersistentVolumeStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PersistentVolumeStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PersistentVolumeStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PersistentVolumeStatus(
        message: mapValueOfType<String>(json, r'message'),
        phase: IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.fromJson(
            json[r'phase']),
        reason: mapValueOfType<String>(json, r'reason'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PersistentVolumeStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PersistentVolumeStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PersistentVolumeStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PersistentVolumeStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1PersistentVolumeStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PersistentVolumeStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PersistentVolumeStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PersistentVolumeStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeStatus.listFromJson(
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

/// Phase indicates if a volume is available, bound to a claim, or released by a claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase  Possible enum values:  - `\"Available\"` used for PersistentVolumes that are not yet bound Available volumes are held by the binder and matched to PersistentVolumeClaims  - `\"Bound\"` used for PersistentVolumes that are bound  - `\"Failed\"` used for PersistentVolumes that failed to be correctly recycled or deleted after being released from a claim  - `\"Pending\"` used for PersistentVolumes that are not available  - `\"Released\"` used for PersistentVolumes where the bound PersistentVolumeClaim was deleted released volumes must be recycled before becoming available again this phase is used by the persistent volume claim binder to signal to another process to reclaim the resource
class IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const available =
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(r'Available');
  static const bound =
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(r'Bound');
  static const failed =
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(r'Failed');
  static const pending =
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(r'Pending');
  static const released =
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum._(r'Released');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum].
  static const values = <IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum>[
    available,
    bound,
    failed,
    pending,
    released,
  ];

  static IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum].
class IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer {
  factory IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Available':
          return IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.available;
        case r'Bound':
          return IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.bound;
        case r'Failed':
          return IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.failed;
        case r'Pending':
          return IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.pending;
        case r'Released':
          return IoK8sApiCoreV1PersistentVolumeStatusPhaseEnum.released;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PersistentVolumeStatusPhaseEnumTypeTransformer?
      _instance;
}
