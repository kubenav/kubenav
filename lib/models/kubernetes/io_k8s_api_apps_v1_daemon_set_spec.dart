//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAppsV1DaemonSetSpec {
  /// Returns a new [IoK8sApiAppsV1DaemonSetSpec] instance.
  IoK8sApiAppsV1DaemonSetSpec({
    this.minReadySeconds,
    this.revisionHistoryLimit,
    required this.selector,
    required this.template,
    this.updateStrategy,
  });

  /// The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minReadySeconds;

  /// The number of old history to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? revisionHistoryLimit;

  IoK8sApimachineryPkgApisMetaV1LabelSelector selector;

  IoK8sApiCoreV1PodTemplateSpec template;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAppsV1DaemonSetUpdateStrategy? updateStrategy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAppsV1DaemonSetSpec &&
          other.minReadySeconds == minReadySeconds &&
          other.revisionHistoryLimit == revisionHistoryLimit &&
          other.selector == selector &&
          other.template == template &&
          other.updateStrategy == updateStrategy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (minReadySeconds == null ? 0 : minReadySeconds!.hashCode) +
      (revisionHistoryLimit == null ? 0 : revisionHistoryLimit!.hashCode) +
      (selector.hashCode) +
      (template.hashCode) +
      (updateStrategy == null ? 0 : updateStrategy!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAppsV1DaemonSetSpec[minReadySeconds=$minReadySeconds, revisionHistoryLimit=$revisionHistoryLimit, selector=$selector, template=$template, updateStrategy=$updateStrategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (minReadySeconds != null) {
      json[r'minReadySeconds'] = minReadySeconds;
    }
    if (revisionHistoryLimit != null) {
      json[r'revisionHistoryLimit'] = revisionHistoryLimit;
    }
    json[r'selector'] = selector;
    json[r'template'] = template;
    if (updateStrategy != null) {
      json[r'updateStrategy'] = updateStrategy;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAppsV1DaemonSetSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAppsV1DaemonSetSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAppsV1DaemonSetSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAppsV1DaemonSetSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAppsV1DaemonSetSpec(
        minReadySeconds: mapValueOfType<int>(json, r'minReadySeconds'),
        revisionHistoryLimit:
            mapValueOfType<int>(json, r'revisionHistoryLimit'),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector'])!,
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template'])!,
        updateStrategy: IoK8sApiAppsV1DaemonSetUpdateStrategy.fromJson(
            json[r'updateStrategy']),
      );
    }
    return null;
  }

  static List<IoK8sApiAppsV1DaemonSetSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAppsV1DaemonSetSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAppsV1DaemonSetSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAppsV1DaemonSetSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAppsV1DaemonSetSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DaemonSetSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAppsV1DaemonSetSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAppsV1DaemonSetSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAppsV1DaemonSetSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAppsV1DaemonSetSpec.listFromJson(
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
