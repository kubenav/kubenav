//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiStorageV1TokenRequest {
  /// Returns a new [IoK8sApiStorageV1TokenRequest] instance.
  IoK8sApiStorageV1TokenRequest({
    required this.audience,
    this.expirationSeconds,
  });

  /// Audience is the intended audience of the token in \"TokenRequestSpec\". It will default to the audiences of kube apiserver.
  String audience;

  /// ExpirationSeconds is the duration of validity of the token in \"TokenRequestSpec\". It has the same default value of \"ExpirationSeconds\" in \"TokenRequestSpec\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expirationSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1TokenRequest &&
          other.audience == audience &&
          other.expirationSeconds == expirationSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (audience.hashCode) +
      (expirationSeconds == null ? 0 : expirationSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1TokenRequest[audience=$audience, expirationSeconds=$expirationSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'audience'] = audience;
    if (expirationSeconds != null) {
      json[r'expirationSeconds'] = expirationSeconds;
    }
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1TokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1TokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1TokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1TokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1TokenRequest(
        audience: mapValueOfType<String>(json, r'audience')!,
        expirationSeconds: mapValueOfType<int>(json, r'expirationSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1TokenRequest>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1TokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1TokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1TokenRequest> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiStorageV1TokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1TokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1TokenRequest-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1TokenRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1TokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1TokenRequest.listFromJson(
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
    'audience',
  };
}
