//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAppsV1ReplicaSetSpec {
  /// Returns a new [IoK8sApiAppsV1ReplicaSetSpec] instance.
  IoK8sApiAppsV1ReplicaSetSpec({
    this.minReadySeconds,
    this.replicas,
    required this.selector,
    this.template,
  });

  /// Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  /// Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  IoK8sApimachineryPkgApisMetaV1LabelSelector selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodTemplateSpec? template;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1ReplicaSetSpec &&
          other.minReadySeconds == minReadySeconds &&
          other.replicas == replicas &&
          other.selector == selector &&
          other.template == template;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (selector.hashCode) +
      (template == null ? 0 : template!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1ReplicaSetSpec[minReadySeconds=$minReadySeconds, replicas=$replicas, selector=$selector, template=$template]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (minReadySeconds != null) {
      json[r'minReadySeconds'] = minReadySeconds;
    }
    if (replicas != null) {
      json[r'replicas'] = replicas;
    }
    json[r'selector'] = selector;
    if (template != null) {
      json[r'template'] = template;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1ReplicaSetSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1ReplicaSetSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1ReplicaSetSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1ReplicaSetSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1ReplicaSetSpec(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector'])!,
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template']),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1ReplicaSetSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1ReplicaSetSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1ReplicaSetSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1ReplicaSetSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1ReplicaSetSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1ReplicaSetSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1ReplicaSetSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1ReplicaSetSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1ReplicaSetSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1ReplicaSetSpec.listFromJson(
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
    'selector',
  };
}
