//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiAuthenticationV1TokenReviewSpec {
  /// Returns a new [IoK8sApiAuthenticationV1TokenReviewSpec] instance.
  IoK8sApiAuthenticationV1TokenReviewSpec({
    this.audiences = const [],
    this.token,
  });

  /// Audiences is a list of the identifiers that the resource server presented with the token identifies as. Audience-aware token authenticators will verify that the token was intended for at least one of the audiences in this list. If no audiences are provided, the audience will default to the audience of the Kubernetes apiserver.
  List<String> audiences;

  /// Token is the opaque bearer token.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? token;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthenticationV1TokenReviewSpec &&
          other.audiences == audiences &&
          other.token == token;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (audiences.hashCode) + (token == null ? 0 : token!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthenticationV1TokenReviewSpec[audiences=$audiences, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'audiences'] = this.audiences;
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthenticationV1TokenReviewSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthenticationV1TokenReviewSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthenticationV1TokenReviewSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthenticationV1TokenReviewSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthenticationV1TokenReviewSpec(
        audiences: json[r'audiences'] is List
            ? (json[r'audiences'] as List).cast<String>()
            : const [],
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthenticationV1TokenReviewSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthenticationV1TokenReviewSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthenticationV1TokenReviewSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthenticationV1TokenReviewSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthenticationV1TokenReviewSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthenticationV1TokenReviewSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthenticationV1TokenReviewSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthenticationV1TokenReviewSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthenticationV1TokenReviewSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthenticationV1TokenReviewSpec.listFromJson(
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
