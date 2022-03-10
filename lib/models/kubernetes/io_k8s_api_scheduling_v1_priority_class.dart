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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiSchedulingV1PriorityClass {
  /// Returns a new [IoK8sApiSchedulingV1PriorityClass] instance.
  IoK8sApiSchedulingV1PriorityClass({
    this.apiVersion,
    this.description,
    this.globalDefault,
    this.kind,
    this.metadata,
    this.preemptionPolicy,
    required this.value,
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// description is an arbitrary string that usually provides guidelines on when this priority class should be used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class. Only one PriorityClass can be marked as `globalDefault`. However, if more than one PriorityClasses exists with their `globalDefault` field set to true, the smallest value of such global default PriorityClasses will be used as the default priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? globalDefault;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  /// PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset. This field is beta-level, gated by the NonPreemptingPriority feature-gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? preemptionPolicy;

  /// The value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.
  int value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiSchedulingV1PriorityClass &&
          other.apiVersion == apiVersion &&
          other.description == description &&
          other.globalDefault == globalDefault &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.preemptionPolicy == preemptionPolicy &&
          other.value == value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (globalDefault == null ? 0 : globalDefault!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (preemptionPolicy == null ? 0 : preemptionPolicy!.hashCode) +
      (value.hashCode);

  @override
  String toString() =>
      'IoK8sApiSchedulingV1PriorityClass[apiVersion=$apiVersion, description=$description, globalDefault=$globalDefault, kind=$kind, metadata=$metadata, preemptionPolicy=$preemptionPolicy, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (globalDefault != null) {
      json[r'globalDefault'] = globalDefault;
    }
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (preemptionPolicy != null) {
      json[r'preemptionPolicy'] = preemptionPolicy;
    }
    json[r'value'] = value;
    return json;
  }

  /// Returns a new [IoK8sApiSchedulingV1PriorityClass] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiSchedulingV1PriorityClass? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiSchedulingV1PriorityClass[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiSchedulingV1PriorityClass[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiSchedulingV1PriorityClass(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        description: mapValueOfType<String>(json, r'description'),
        globalDefault: mapValueOfType<bool>(json, r'globalDefault'),
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        preemptionPolicy: mapValueOfType<String>(json, r'preemptionPolicy'),
        value: mapValueOfType<int>(json, r'value')!,
      );
    }
    return null;
  }

  static List<IoK8sApiSchedulingV1PriorityClass>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiSchedulingV1PriorityClass>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiSchedulingV1PriorityClass.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiSchedulingV1PriorityClass> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiSchedulingV1PriorityClass>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiSchedulingV1PriorityClass.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiSchedulingV1PriorityClass-objects as value to a dart map
  static Map<String, List<IoK8sApiSchedulingV1PriorityClass>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiSchedulingV1PriorityClass>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiSchedulingV1PriorityClass.listFromJson(
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
    'value',
  };
}
