//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_claim_condition.dart';

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

  /// accessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
  List<String> accessModes;

  /// allocatedResources is the storage resource within AllocatedResources tracks the capacity allocated to a PVC. It may be larger than the actual capacity when a volume expansion operation is requested. For storage quota, the larger value from allocatedResources and PVC.spec.resources is used. If allocatedResources is not set, PVC.spec.resources alone is used for quota calculation. If a volume expansion capacity request is lowered, allocatedResources is only lowered if there are no expansion operations in progress and if the actual volume capacity is equal or lower than the requested capacity. This is an alpha field and requires enabling RecoverVolumeExpansionFailure feature.
  Map<String, String> allocatedResources;

  /// capacity represents the actual resources of the underlying volume.
  Map<String, String> capacity;

  /// conditions is the current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.
  List<IoK8sApiCoreV1PersistentVolumeClaimCondition> conditions;

  /// phase represents the current phase of PersistentVolumeClaim.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phase;

  /// resizeStatus stores status of resize operation. ResizeStatus is not set by default but when expansion is complete resizeStatus is set to empty string by resize controller or kubelet. This is an alpha field and requires enabling RecoverVolumeExpansionFailure feature.
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
    json[r'accessModes'] = this.accessModes;
    json[r'allocatedResources'] = this.allocatedResources;
    json[r'capacity'] = this.capacity;
    json[r'conditions'] = this.conditions;
    if (this.phase != null) {
      json[r'phase'] = this.phase;
    } else {
      json[r'phase'] = null;
    }
    if (this.resizeStatus != null) {
      json[r'resizeStatus'] = this.resizeStatus;
    } else {
      json[r'resizeStatus'] = null;
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
        phase: mapValueOfType<String>(json, r'phase'),
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
