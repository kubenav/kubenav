//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAppsV1DeploymentSpec {
  /// Returns a new [IoK8sApiAppsV1DeploymentSpec] instance.
  IoK8sApiAppsV1DeploymentSpec({
    this.minReadySeconds,
    this.paused,
    this.progressDeadlineSeconds,
    this.replicas,
    this.revisionHistoryLimit,
    required this.selector,
    this.strategy,
    required this.template,
  });

  /// Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  /// Indicates that the deployment is paused.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? paused;

  /// The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? progressDeadlineSeconds;

  /// Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? replicas;

  /// The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  IoK8sApimachineryPkgApisMetaV1LabelSelector selector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1DeploymentStrategy? strategy;

  IoK8sApiCoreV1PodTemplateSpec template;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DeploymentSpec &&
          other.minReadySeconds == minReadySeconds &&
          other.paused == paused &&
          other.progressDeadlineSeconds == progressDeadlineSeconds &&
          other.replicas == replicas &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.selector == selector &&
          other.strategy == strategy &&
          other.template == template;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (paused == null ? 0 : paused!.hashCode) +
      (progressDeadlineSeconds == null
          ? 0
          : progressDeadlineSeconds!.hashCode) +
      (replicas == null ? 0 : replicas!.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (selector.hashCode) +
      (strategy == null ? 0 : strategy!.hashCode) +
      (template.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DeploymentSpec[minReadySeconds=$minReadySeconds, paused=$paused, progressDeadlineSeconds=$progressDeadlineSeconds, replicas=$replicas, revisionHistoryLimit=$revisionHistoryLimit, selector=$selector, strategy=$strategy, template=$template]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (minReadySeconds != null) {
      json[r'minReadySeconds'] = minReadySeconds;
    }
    if (paused != null) {
      json[r'paused'] = paused;
    }
    if (progressDeadlineSeconds != null) {
      json[r'progressDeadlineSeconds'] = progressDeadlineSeconds;
    }
    if (replicas != null) {
      json[r'replicas'] = replicas;
    }
    if (revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = revisionHistoryLimit;
    }
    json[r'selector'] = selector;
    if (strategy != null) {
      json[r'strategy'] = strategy;
    }
    json[r'template'] = template;
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1DeploymentSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DeploymentSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DeploymentSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DeploymentSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DeploymentSpec(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        paused: mapValueOfType<bool>(json, r'paused'),
        progressDeadlineSeconds:
            mapValueOfType<int>(json, r'progressDeadlineSeconds'),
        replicas: mapValueOfType<int>(json, r'replicas'),
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector'])!,
        strategy: IoK8sApiAppsV1DeploymentStrategy.fromJson(json[r'strategy']),
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DeploymentSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DeploymentSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DeploymentSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DeploymentSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1DeploymentSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DeploymentSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DeploymentSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DeploymentSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DeploymentSpec.listFromJson(
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
    'template',
  };
}
