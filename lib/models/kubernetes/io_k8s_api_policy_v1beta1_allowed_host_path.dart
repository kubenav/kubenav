//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiPolicyV1beta1AllowedHostPath {
  /// Returns a new [IoK8sApiPolicyV1beta1AllowedHostPath] instance.
  IoK8sApiPolicyV1beta1AllowedHostPath({
    this.pathPrefix,
    this.readOnly,
  });

  /// pathPrefix is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.  Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pathPrefix;

  /// when set to true, will allow host volumes matching the pathPrefix only if all volume mounts are readOnly.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiPolicyV1beta1AllowedHostPath &&
          other.pathPrefix == pathPrefix &&
          other.readOnly == readOnly;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (pathPrefix == null ? 0 : pathPrefix!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode);

  @override
  String toString() =>
      'IoK8sApiPolicyV1beta1AllowedHostPath[pathPrefix=$pathPrefix, readOnly=$readOnly]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (pathPrefix != null) {
      json[r'pathPrefix'] = pathPrefix;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    return json;
  }

  /// Returns a new [IoK8sApiPolicyV1beta1AllowedHostPath] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiPolicyV1beta1AllowedHostPath? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiPolicyV1beta1AllowedHostPath[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiPolicyV1beta1AllowedHostPath[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiPolicyV1beta1AllowedHostPath(
        pathPrefix: mapValueOfType<String>(json, r'pathPrefix'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
      );
    }
    return null;
  }

  static List<IoK8sApiPolicyV1beta1AllowedHostPath>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiPolicyV1beta1AllowedHostPath>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiPolicyV1beta1AllowedHostPath.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiPolicyV1beta1AllowedHostPath> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiPolicyV1beta1AllowedHostPath>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiPolicyV1beta1AllowedHostPath.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiPolicyV1beta1AllowedHostPath-objects as value to a dart map
  static Map<String, List<IoK8sApiPolicyV1beta1AllowedHostPath>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiPolicyV1beta1AllowedHostPath>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiPolicyV1beta1AllowedHostPath.listFromJson(
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
