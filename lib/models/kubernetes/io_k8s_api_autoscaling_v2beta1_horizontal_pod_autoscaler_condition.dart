//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition {
  /// Returns a new [IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition] instance.
  IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition({
    this.lastTransitionTime,
    this.message,
    this.reason,
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

  /// message is a human-readable explanation containing details about the transition
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// reason is the reason for the condition's last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// status is the status of the condition (True, False, Unknown)
  String status;

  /// type describes the current condition
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition[lastTransitionTime=$lastTransitionTime, message=$message, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          lastTransitionTime!.toUtc().toIso8601String();
    }
    if (message != null) {
      json[r'message'] = message;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    json[r'status'] = status;
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', ''),
        message: mapValueOfType<String>(json, r'message'),
        reason: mapValueOfType<String>(json, r'reason'),
        status: mapValueOfType<String>(json, r'status')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition-objects as value to a dart map
  static Map<String,
          List<IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition
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
    'status',
    'type',
  };
}
