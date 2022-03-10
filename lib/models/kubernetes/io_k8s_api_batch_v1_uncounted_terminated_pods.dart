//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls


class IoK8sApiBatchV1UncountedTerminatedPods {
  /// Returns a new [IoK8sApiBatchV1UncountedTerminatedPods] instance.
  IoK8sApiBatchV1UncountedTerminatedPods({
    this.failed = const [],
    this.succeeded = const [],
  });

  /// Failed holds UIDs of failed Pods.
  List<String> failed;

  /// Succeeded holds UIDs of succeeded Pods.
  List<String> succeeded;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1UncountedTerminatedPods &&
          other.failed == failed &&
          other.succeeded == succeeded;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (failed.hashCode) + (succeeded.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1UncountedTerminatedPods[failed=$failed, succeeded=$succeeded]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'failed'] = failed;
    json[r'succeeded'] = succeeded;
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1UncountedTerminatedPods] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1UncountedTerminatedPods? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1UncountedTerminatedPods[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1UncountedTerminatedPods[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1UncountedTerminatedPods(
        failed: json[r'failed'] is List
            ? (json[r'failed'] as List).cast<String>()
            : const [],
        succeeded: json[r'succeeded'] is List
            ? (json[r'succeeded'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1UncountedTerminatedPods>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1UncountedTerminatedPods>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1UncountedTerminatedPods.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1UncountedTerminatedPods> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiBatchV1UncountedTerminatedPods>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiBatchV1UncountedTerminatedPods.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1UncountedTerminatedPods-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1UncountedTerminatedPods>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1UncountedTerminatedPods>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1UncountedTerminatedPods.listFromJson(
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
