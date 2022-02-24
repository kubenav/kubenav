//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAuthenticationV1TokenReviewStatus {
  /// Returns a new [IoK8sApiAuthenticationV1TokenReviewStatus] instance.
  IoK8sApiAuthenticationV1TokenReviewStatus({
    this.audiences = const [],
    this.authenticated,
    this.error,
    this.user,
  });

  /// Audiences are audience identifiers chosen by the authenticator that are compatible with both the TokenReview and token. An identifier is any identifier in the intersection of the TokenReviewSpec audiences and the token's audiences. A client of the TokenReview API that sets the spec.audiences field should validate that a compatible audience identifier is returned in the status.audiences field to ensure that the TokenReview server is audience aware. If a TokenReview returns an empty status.audience field where status.authenticated is \"true\", the token is valid against the audience of the Kubernetes API server.
  List<String> audiences;

  /// Authenticated indicates that the token was associated with a known user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? authenticated;

  /// Error indicates that the token couldn't be checked
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAuthenticationV1UserInfo? user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthenticationV1TokenReviewStatus &&
          other.audiences == audiences &&
          other.authenticated == authenticated &&
          other.error == error &&
          other.user == user;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (audiences.hashCode) +
      (authenticated == null ? 0 : authenticated!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (user == null ? 0 : user!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthenticationV1TokenReviewStatus[audiences=$audiences, authenticated=$authenticated, error=$error, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'audiences'] = audiences;
    if (authenticated != null) {
      json[r'authenticated'] = authenticated;
    }
    if (error != null) {
      json[r'error'] = error;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthenticationV1TokenReviewStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthenticationV1TokenReviewStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthenticationV1TokenReviewStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthenticationV1TokenReviewStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthenticationV1TokenReviewStatus(
        audiences: json[r'audiences'] is List
            ? (json[r'audiences'] as List).cast<String>()
            : const [],
        authenticated: mapValueOfType<bool>(json, r'authenticated'),
        error: mapValueOfType<String>(json, r'error'),
        user: IoK8sApiAuthenticationV1UserInfo.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthenticationV1TokenReviewStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthenticationV1TokenReviewStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthenticationV1TokenReviewStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthenticationV1TokenReviewStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthenticationV1TokenReviewStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthenticationV1TokenReviewStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthenticationV1TokenReviewStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthenticationV1TokenReviewStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthenticationV1TokenReviewStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthenticationV1TokenReviewStatus.listFromJson(
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
