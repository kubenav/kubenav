//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_authentication_v1_bound_object_reference.dart';

class IoK8sApiAuthenticationV1TokenRequestSpec {
  /// Returns a new [IoK8sApiAuthenticationV1TokenRequestSpec] instance.
  IoK8sApiAuthenticationV1TokenRequestSpec({
    this.audiences = const [],
    this.boundObjectRef,
    this.expirationSeconds,
  });

  /// Audiences are the intendend audiences of the token. A recipient of a token must identify themself with an identifier in the list of audiences of the token, and otherwise should reject the token. A token issued for multiple audiences may be used to authenticate against any of the audiences listed but implies a high degree of trust between the target audiences.
  List<String> audiences;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAuthenticationV1BoundObjectReference? boundObjectRef;

  /// ExpirationSeconds is the requested duration of validity of the request. The token issuer may return a token with a different validity duration so a client needs to check the 'expiration' field in a response.
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
      other is IoK8sApiAuthenticationV1TokenRequestSpec &&
          other.audiences == audiences &&
          other.boundObjectRef == boundObjectRef &&
          other.expirationSeconds == expirationSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (audiences.hashCode) +
      (boundObjectRef == null ? 0 : boundObjectRef!.hashCode) +
      (expirationSeconds == null ? 0 : expirationSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthenticationV1TokenRequestSpec[audiences=$audiences, boundObjectRef=$boundObjectRef, expirationSeconds=$expirationSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'audiences'] = this.audiences;
    if (this.boundObjectRef != null) {
      json[r'boundObjectRef'] = this.boundObjectRef;
    } else {
      json[r'boundObjectRef'] = null;
    }
    if (this.expirationSeconds != null) {
      json[r'expirationSeconds'] = this.expirationSeconds;
    } else {
      json[r'expirationSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthenticationV1TokenRequestSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthenticationV1TokenRequestSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthenticationV1TokenRequestSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthenticationV1TokenRequestSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthenticationV1TokenRequestSpec(
        audiences: json[r'audiences'] is List
            ? (json[r'audiences'] as List).cast<String>()
            : const [],
        boundObjectRef: IoK8sApiAuthenticationV1BoundObjectReference.fromJson(
            json[r'boundObjectRef']),
        expirationSeconds: mapValueOfType<int>(json, r'expirationSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthenticationV1TokenRequestSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthenticationV1TokenRequestSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthenticationV1TokenRequestSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthenticationV1TokenRequestSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthenticationV1TokenRequestSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthenticationV1TokenRequestSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthenticationV1TokenRequestSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthenticationV1TokenRequestSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthenticationV1TokenRequestSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthenticationV1TokenRequestSpec.listFromJson(
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
    'audiences',
  };
}
