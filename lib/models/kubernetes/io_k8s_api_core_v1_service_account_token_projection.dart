//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ServiceAccountTokenProjection {
  /// Returns a new [IoK8sApiCoreV1ServiceAccountTokenProjection] instance.
  IoK8sApiCoreV1ServiceAccountTokenProjection({
    this.audience,
    this.expirationSeconds,
    required this.path,
  });

  /// Audience is the intended audience of the token. A recipient of a token must identify itself with an identifier specified in the audience of the token, and otherwise should reject the token. The audience defaults to the identifier of the apiserver.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? audience;

  /// ExpirationSeconds is the requested duration of validity of the service account token. As the token approaches expiration, the kubelet volume plugin will proactively rotate the service account token. The kubelet will start trying to rotate the token if the token is older than 80 percent of its time to live or if the token is older than 24 hours.Defaults to 1 hour and must be at least 10 minutes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expirationSeconds;

  /// Path is the path relative to the mount point of the file to project the token into.
  String path;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ServiceAccountTokenProjection &&
          other.audience == audience &&
          other.expirationSeconds == expirationSeconds &&
          other.path == path;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (audience == null ? 0 : audience!.hashCode) +
      (expirationSeconds == null ? 0 : expirationSeconds!.hashCode) +
      (path.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ServiceAccountTokenProjection[audience=$audience, expirationSeconds=$expirationSeconds, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (audience != null) {
      json[r'audience'] = audience;
    }
    if (expirationSeconds != null) {
      json[r'expirationSeconds'] = expirationSeconds;
    }
    json[r'path'] = path;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ServiceAccountTokenProjection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ServiceAccountTokenProjection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ServiceAccountTokenProjection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ServiceAccountTokenProjection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ServiceAccountTokenProjection(
        audience: mapValueOfType<String>(json, r'audience'),
        expirationSeconds: mapValueOfType<int>(json, r'expirationSeconds'),
        path: mapValueOfType<String>(json, r'path')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ServiceAccountTokenProjection>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ServiceAccountTokenProjection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ServiceAccountTokenProjection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ServiceAccountTokenProjection> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ServiceAccountTokenProjection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ServiceAccountTokenProjection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ServiceAccountTokenProjection-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ServiceAccountTokenProjection>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ServiceAccountTokenProjection>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServiceAccountTokenProjection.listFromJson(
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
    'path',
  };
}
