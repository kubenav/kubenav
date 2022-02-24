//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ReplicationControllerSpec {
  /// Returns a new [IoK8sApiCoreV1ReplicationControllerSpec] instance.
  IoK8sApiCoreV1ReplicationControllerSpec({
    this.minReadySeconds,
    this.replicas,
    this.selector = const {},
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

  /// Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  /// Selector is a label query over pods that should match the Replicas count. If Selector is empty, it is defaulted to the labels present on the Pod template. Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
  Map<String, String> selector;

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
      other is IoK8sApiCoreV1ReplicationControllerSpec &&
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
      'IoK8sApiCoreV1ReplicationControllerSpec[minReadySeconds=$minReadySeconds, replicas=$replicas, selector=$selector, template=$template]';

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

  /// Returns a new [IoK8sApiCoreV1ReplicationControllerSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ReplicationControllerSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ReplicationControllerSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ReplicationControllerSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ReplicationControllerSpec(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        selector: mapCastOfType<String, String>(json, r'selector') ?? const {},
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ReplicationControllerSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ReplicationControllerSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ReplicationControllerSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ReplicationControllerSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ReplicationControllerSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ReplicationControllerSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ReplicationControllerSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ReplicationControllerSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ReplicationControllerSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ReplicationControllerSpec.listFromJson(
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
