//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiPolicyV1PodDisruptionBudgetStatus {
  /// Returns a new [IoK8sApiPolicyV1PodDisruptionBudgetStatus] instance.
  IoK8sApiPolicyV1PodDisruptionBudgetStatus({
    this.conditions = const [],
    required this.currentHealthy,
    required this.desiredHealthy,
    this.disruptedPods = const {},
    required this.disruptionsAllowed,
    required this.expectedPods,
    this.observedGeneration,
  });

  /// Conditions contain conditions for PDB. The disruption controller sets the DisruptionAllowed condition. The following are known values for the reason field (additional reasons could be added in the future): - SyncFailed: The controller encountered an error and wasn't able to compute               the number of allowed disruptions. Therefore no disruptions are               allowed and the status of the condition will be False. - InsufficientPods: The number of pods are either at or below the number                     required by the PodDisruptionBudget. No disruptions are                     allowed and the status of the condition will be False. - SufficientPods: There are more pods than required by the PodDisruptionBudget.                   The condition will be True, and the number of allowed                   disruptions are provided by the disruptionsAllowed property.
  List<IoK8sApimachineryPkgApisMetaV1Condition> conditions;

  /// current number of healthy pods
  int currentHealthy;

  /// minimum desired number of healthy pods
  int desiredHealthy;

  /// DisruptedPods contains information about pods whose eviction was processed by the API server eviction subresource handler but has not yet been observed by the PodDisruptionBudget controller. A pod will be in this map from the time when the API server processed the eviction request to the time when the pod is seen by PDB controller as having been marked for deletion (or after a timeout). The key in the map is the name of the pod and the value is the time when the API server processed the eviction request. If the deletion didn't occur and a pod is still there it will be removed from the list automatically by PodDisruptionBudget controller after some time. If everything goes smooth this map should be empty for the most of the time. Large number of entries in the map may indicate problems with pod deletions.
  Map<String, DateTime> disruptedPods;

  /// Number of pod disruptions that are currently allowed.
  int disruptionsAllowed;

  /// total number of pods counted by this disruption budget
  int expectedPods;

  /// Most recent generation observed when updating this PDB status. DisruptionsAllowed and other status information is valid only if observedGeneration equals to PDB's object generation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiPolicyV1PodDisruptionBudgetStatus &&
          other.conditions == conditions &&
          other.currentHealthy == currentHealthy &&
          other.desiredHealthy == desiredHealthy &&
          other.disruptedPods == disruptedPods &&
          other.disruptionsAllowed == disruptionsAllowed &&
          other.expectedPods == expectedPods &&
          other.observedGeneration == observedGeneration;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (currentHealthy.hashCode) +
      (desiredHealthy.hashCode) +
      (disruptedPods.hashCode) +
      (disruptionsAllowed.hashCode) +
      (expectedPods.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode);

  @override
  String toString() =>
      'IoK8sApiPolicyV1PodDisruptionBudgetStatus[conditions=$conditions, currentHealthy=$currentHealthy, desiredHealthy=$desiredHealthy, disruptedPods=$disruptedPods, disruptionsAllowed=$disruptionsAllowed, expectedPods=$expectedPods, observedGeneration=$observedGeneration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = conditions;
    json[r'currentHealthy'] = currentHealthy;
    json[r'desiredHealthy'] = desiredHealthy;
    json[r'disruptedPods'] = disruptedPods;
    json[r'disruptionsAllowed'] = disruptionsAllowed;
    json[r'expectedPods'] = expectedPods;
    if (observedGeneration != null) {
      json[r'observedGeneration'] = observedGeneration;
    }
    return json;
  }

  /// Returns a new [IoK8sApiPolicyV1PodDisruptionBudgetStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiPolicyV1PodDisruptionBudgetStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiPolicyV1PodDisruptionBudgetStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiPolicyV1PodDisruptionBudgetStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiPolicyV1PodDisruptionBudgetStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
                json[r'conditions']) ??
            const [],
        currentHealthy: mapValueOfType<int>(json, r'currentHealthy')!,
        desiredHealthy: mapValueOfType<int>(json, r'desiredHealthy')!,
        disruptedPods:
            mapValueOfType<Map<String, DateTime>>(json, r'disruptedPods') ??
                const {},
        disruptionsAllowed: mapValueOfType<int>(json, r'disruptionsAllowed')!,
        expectedPods: mapValueOfType<int>(json, r'expectedPods')!,
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
      );
    }
    return null;
  }

  static List<IoK8sApiPolicyV1PodDisruptionBudgetStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiPolicyV1PodDisruptionBudgetStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiPolicyV1PodDisruptionBudgetStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiPolicyV1PodDisruptionBudgetStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiPolicyV1PodDisruptionBudgetStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiPolicyV1PodDisruptionBudgetStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiPolicyV1PodDisruptionBudgetStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiPolicyV1PodDisruptionBudgetStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiPolicyV1PodDisruptionBudgetStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiPolicyV1PodDisruptionBudgetStatus.listFromJson(
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
    'currentHealthy',
    'desiredHealthy',
    'disruptionsAllowed',
    'expectedPods',
  };
}
