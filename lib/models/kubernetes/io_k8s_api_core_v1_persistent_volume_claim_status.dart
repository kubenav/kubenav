//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PersistentVolumeClaimStatus {
  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimStatus] instance.
  IoK8sApiCoreV1PersistentVolumeClaimStatus({
    this.accessModes = const [],
    this.allocatedResources = const {},
    this.capacity = const {},
    this.conditions = const [],
    this.phase,
    this.resizeStatus,
  });

  /// AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
  List<String> accessModes;

  /// The storage resource within AllocatedResources tracks the capacity allocated to a PVC. It may be larger than the actual capacity when a volume expansion operation is requested. For storage quota, the larger value from allocatedResources and PVC.spec.resources is used. If allocatedResources is not set, PVC.spec.resources alone is used for quota calculation. If a volume expansion capacity request is lowered, allocatedResources is only lowered if there are no expansion operations in progress and if the actual volume capacity is equal or lower than the requested capacity. This is an alpha field and requires enabling RecoverVolumeExpansionFailure feature.
  Map<String, String> allocatedResources;

  /// Represents the actual resources of the underlying volume.
  Map<String, String> capacity;

  /// Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.
  List<IoK8sApiCoreV1PersistentVolumeClaimCondition> conditions;

  /// Phase represents the current phase of PersistentVolumeClaim.  Possible enum values:  - `\"Bound\"` used for PersistentVolumeClaims that are bound  - `\"Lost\"` used for PersistentVolumeClaims that lost their underlying PersistentVolume. The claim was bound to a PersistentVolume and this volume does not exist any longer and all data on it was lost.  - `\"Pending\"` used for PersistentVolumeClaims that are not yet bound
  IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum? phase;

  /// ResizeStatus stores status of resize operation. ResizeStatus is not set by default but when expansion is complete resizeStatus is set to empty string by resize controller or kubelet. This is an alpha field and requires enabling RecoverVolumeExpansionFailure feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resizeStatus;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PersistentVolumeClaimStatus &&
          other.accessModes == accessModes &&
          other.allocatedResources == allocatedResources &&
          other.capacity == capacity &&
          other.conditions == conditions &&
          other.phase == phase &&
          other.resizeStatus == resizeStatus;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessModes.hashCode) +
      (allocatedResources.hashCode) +
      (capacity.hashCode) +
      (conditions.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (resizeStatus == null ? 0 : resizeStatus!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PersistentVolumeClaimStatus[accessModes=$accessModes, allocatedResources=$allocatedResources, capacity=$capacity, conditions=$conditions, phase=$phase, resizeStatus=$resizeStatus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'accessModes'] = accessModes;
    json[r'allocatedResources'] = allocatedResources;
    json[r'capacity'] = capacity;
    json[r'conditions'] = conditions;
    if (phase != null) {
      json[r'phase'] = phase;
    }
    if (resizeStatus != null) {
      json[r'resizeStatus'] = resizeStatus;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PersistentVolumeClaimStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PersistentVolumeClaimStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PersistentVolumeClaimStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PersistentVolumeClaimStatus(
        accessModes: json[r'accessModes'] is List
            ? (json[r'accessModes'] as List).cast<String>()
            : const [],
        allocatedResources:
            mapCastOfType<String, String>(json, r'allocatedResources') ??
                const {},
        capacity: mapCastOfType<String, String>(json, r'capacity') ?? const {},
        conditions: IoK8sApiCoreV1PersistentVolumeClaimCondition.listFromJson(
                json[r'conditions']) ??
            const [],
        phase: IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.fromJson(
            json[r'phase']),
        resizeStatus: mapValueOfType<String>(json, r'resizeStatus'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PersistentVolumeClaimStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeClaimStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PersistentVolumeClaimStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PersistentVolumeClaimStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PersistentVolumeClaimStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1PersistentVolumeClaimStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PersistentVolumeClaimStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PersistentVolumeClaimStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PersistentVolumeClaimStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeClaimStatus.listFromJson(
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

/// Phase represents the current phase of PersistentVolumeClaim.  Possible enum values:  - `\"Bound\"` used for PersistentVolumeClaims that are bound  - `\"Lost\"` used for PersistentVolumeClaims that lost their underlying PersistentVolume. The claim was bound to a PersistentVolume and this volume does not exist any longer and all data on it was lost.  - `\"Pending\"` used for PersistentVolumeClaims that are not yet bound
class IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const bound =
      IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum._(r'Bound');
  static const lost =
      IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum._(r'Lost');
  static const pending =
      IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum._(r'Pending');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum].
  static const values = <IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum>[
    bound,
    lost,
    pending,
  ];

  static IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum].
class IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer {
  factory IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Bound':
          return IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.bound;
        case r'Lost':
          return IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.lost;
        case r'Pending':
          return IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnum.pending;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PersistentVolumeClaimStatusPhaseEnumTypeTransformer?
      _instance;
}
