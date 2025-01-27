//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner {
  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner] instance.
  IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner({
    required this.availableReplicas,
    this.collisionCount,
    this.lastTransitionTime,
    this.message,
    required this.name,
    this.podTemplateHash,
    required this.readyReplicas,
    required this.replicas,
    this.serviceName,
    this.status,
    required this.updatedReplicas,
  });

  int availableReplicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collisionCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? podTemplateHash;

  int readyReplicas;

  int replicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  int updatedReplicas;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner &&
          other.availableReplicas == availableReplicas &&
          other.collisionCount == collisionCount &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.name == name &&
          other.podTemplateHash == podTemplateHash &&
          other.readyReplicas == readyReplicas &&
          other.replicas == replicas &&
          other.serviceName == serviceName &&
          other.status == status &&
          other.updatedReplicas == updatedReplicas;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (availableReplicas.hashCode) +
      (collisionCount == null ? 0 : collisionCount!.hashCode) +
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (name.hashCode) +
      (podTemplateHash == null ? 0 : podTemplateHash!.hashCode) +
      (readyReplicas.hashCode) +
      (replicas.hashCode) +
      (serviceName == null ? 0 : serviceName!.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (updatedReplicas.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner[availableReplicas=$availableReplicas, collisionCount=$collisionCount, lastTransitionTime=$lastTransitionTime, message=$message, name=$name, podTemplateHash=$podTemplateHash, readyReplicas=$readyReplicas, replicas=$replicas, serviceName=$serviceName, status=$status, updatedReplicas=$updatedReplicas]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'availableReplicas'] = this.availableReplicas;
    if (this.collisionCount != null) {
      json[r'collisionCount'] = this.collisionCount;
    } else {
      json[r'collisionCount'] = null;
    }
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
    json[r'name'] = this.name;
    if (this.podTemplateHash != null) {
      json[r'podTemplateHash'] = this.podTemplateHash;
    } else {
      json[r'podTemplateHash'] = null;
    }
    json[r'readyReplicas'] = this.readyReplicas;
    json[r'replicas'] = this.replicas;
    if (this.serviceName != null) {
      json[r'serviceName'] = this.serviceName;
    } else {
      json[r'serviceName'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    json[r'updatedReplicas'] = this.updatedReplicas;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner(
        availableReplicas: mapValueOfType<int>(json, r'availableReplicas')!,
        collisionCount: mapValueOfType<int>(json, r'collisionCount'),
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r''),
        message: mapValueOfType<String>(json, r'message'),
        name: mapValueOfType<String>(json, r'name')!,
        podTemplateHash: mapValueOfType<String>(json, r'podTemplateHash'),
        readyReplicas: mapValueOfType<int>(json, r'readyReplicas')!,
        replicas: mapValueOfType<int>(json, r'replicas')!,
        serviceName: mapValueOfType<String>(json, r'serviceName'),
        status: mapValueOfType<String>(json, r'status'),
        updatedReplicas: mapValueOfType<int>(json, r'updatedReplicas')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ExperimentStatusTemplateStatusesInner
            .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'availableReplicas',
    'name',
    'readyReplicas',
    'replicas',
    'updatedReplicas',
  };
}
