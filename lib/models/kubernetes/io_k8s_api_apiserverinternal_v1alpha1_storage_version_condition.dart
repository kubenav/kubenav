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

class IoK8sApiApiserverinternalV1alpha1StorageVersionCondition {
  /// Returns a new [IoK8sApiApiserverinternalV1alpha1StorageVersionCondition] instance.
  IoK8sApiApiserverinternalV1alpha1StorageVersionCondition({
    this.lastTransitionTime,
    this.message,
    this.observedGeneration,
    required this.reason,
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

  /// A human readable message indicating details about the transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// If set, this represents the .metadata.generation that the condition was set based upon.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// The reason for the condition's last transition.
  String reason;

  /// Status of the condition, one of True, False, Unknown.
  String status;

  /// Type of the condition.
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiApiserverinternalV1alpha1StorageVersionCondition &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.observedGeneration == observedGeneration &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (reason.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiApiserverinternalV1alpha1StorageVersionCondition[lastTransitionTime=$lastTransitionTime, message=$message, observedGeneration=$observedGeneration, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          this.lastTransitionTime!.toUtc().toIso8601String();
    } else {
      json[r'lastTransitionTime'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    json[r'reason'] = this.reason;
    json[r'status'] = this.status;
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoK8sApiApiserverinternalV1alpha1StorageVersionCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiApiserverinternalV1alpha1StorageVersionCondition? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiApiserverinternalV1alpha1StorageVersionCondition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiApiserverinternalV1alpha1StorageVersionCondition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiApiserverinternalV1alpha1StorageVersionCondition(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', ''),
        message: mapValueOfType<String>(json, r'message'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        reason: mapValueOfType<String>(json, r'reason')!,
        status: mapValueOfType<String>(json, r'status')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiApiserverinternalV1alpha1StorageVersionCondition.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiApiserverinternalV1alpha1StorageVersionCondition.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiApiserverinternalV1alpha1StorageVersionCondition-objects as value to a dart map
  static Map<String,
          List<IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiApiserverinternalV1alpha1StorageVersionCondition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiApiserverinternalV1alpha1StorageVersionCondition
            .listFromJson(
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
    'reason',
    'status',
    'type',
  };
}
