//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiNodeV1alpha1Scheduling {
  /// Returns a new [IoK8sApiNodeV1alpha1Scheduling] instance.
  IoK8sApiNodeV1alpha1Scheduling({
    this.nodeSelector = const {},
    this.tolerations = const [],
  });

  /// nodeSelector lists labels that must be present on nodes that support this RuntimeClass. Pods using this RuntimeClass can only be scheduled to a node matched by this selector. The RuntimeClass nodeSelector is merged with a pod's existing nodeSelector. Any conflicts will cause the pod to be rejected in admission.
  Map<String, String> nodeSelector;

  /// tolerations are appended (excluding duplicates) to pods running with this RuntimeClass during admission, effectively unioning the set of nodes tolerated by the pod and the RuntimeClass.
  List<IoK8sApiCoreV1Toleration> tolerations;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNodeV1alpha1Scheduling &&
          other.nodeSelector == nodeSelector &&
          other.tolerations == tolerations;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nodeSelector.hashCode) + (tolerations.hashCode);

  @override
  String toString() =>
      'IoK8sApiNodeV1alpha1Scheduling[nodeSelector=$nodeSelector, tolerations=$tolerations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'nodeSelector'] = nodeSelector;
    json[r'tolerations'] = tolerations;
    return json;
  }

  /// Returns a new [IoK8sApiNodeV1alpha1Scheduling] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNodeV1alpha1Scheduling? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNodeV1alpha1Scheduling[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNodeV1alpha1Scheduling[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNodeV1alpha1Scheduling(
        nodeSelector:
            mapCastOfType<String, String>(json, r'nodeSelector') ?? const {},
        tolerations:
            IoK8sApiCoreV1Toleration.listFromJson(json[r'tolerations']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiNodeV1alpha1Scheduling>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNodeV1alpha1Scheduling>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNodeV1alpha1Scheduling.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNodeV1alpha1Scheduling> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiNodeV1alpha1Scheduling>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNodeV1alpha1Scheduling.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNodeV1alpha1Scheduling-objects as value to a dart map
  static Map<String, List<IoK8sApiNodeV1alpha1Scheduling>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNodeV1alpha1Scheduling>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNodeV1alpha1Scheduling.listFromJson(
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
