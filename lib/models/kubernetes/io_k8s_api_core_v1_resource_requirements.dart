//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ResourceRequirements {
  /// Returns a new [IoK8sApiCoreV1ResourceRequirements] instance.
  IoK8sApiCoreV1ResourceRequirements({
    this.limits = const {},
    this.requests = const {},
  });

  /// Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  Map<String, String> limits;

  /// Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  Map<String, String> requests;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ResourceRequirements &&
          other.limits == limits &&
          other.requests == requests;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (limits.hashCode) + (requests.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ResourceRequirements[limits=$limits, requests=$requests]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'limits'] = limits;
    json[r'requests'] = requests;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ResourceRequirements] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ResourceRequirements? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ResourceRequirements[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ResourceRequirements[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ResourceRequirements(
        limits: mapCastOfType<String, String>(json, r'limits') ?? const {},
        requests: mapCastOfType<String, String>(json, r'requests') ?? const {},
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ResourceRequirements>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ResourceRequirements>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ResourceRequirements.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ResourceRequirements> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ResourceRequirements>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ResourceRequirements.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ResourceRequirements-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ResourceRequirements>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ResourceRequirements>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ResourceRequirements.listFromJson(
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
