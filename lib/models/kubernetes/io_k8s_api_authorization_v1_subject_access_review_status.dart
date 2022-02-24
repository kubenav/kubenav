//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAuthorizationV1SubjectAccessReviewStatus {
  /// Returns a new [IoK8sApiAuthorizationV1SubjectAccessReviewStatus] instance.
  IoK8sApiAuthorizationV1SubjectAccessReviewStatus({
    required this.allowed,
    this.denied,
    this.evaluationError,
    this.reason,
  });

  /// Allowed is required. True if the action would be allowed, false otherwise.
  bool allowed;

  /// Denied is optional. True if the action would be denied, otherwise false. If both allowed is false and denied is false, then the authorizer has no opinion on whether to authorize the action. Denied may not be true if Allowed is true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? denied;

  /// EvaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? evaluationError;

  /// Reason is optional.  It indicates why a request was allowed or denied.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1SubjectAccessReviewStatus &&
          other.allowed == allowed &&
          other.denied == denied &&
          other.evaluationError == evaluationError &&
          other.reason == reason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowed.hashCode) +
      (denied == null ? 0 : denied!.hashCode) +
      (evaluationError == null ? 0 : evaluationError!.hashCode) +
      (reason == null ? 0 : reason!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1SubjectAccessReviewStatus[allowed=$allowed, denied=$denied, evaluationError=$evaluationError, reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'allowed'] = allowed;
    if (denied != null) {
      json[r'denied'] = denied;
    }
    if (evaluationError != null) {
      json[r'evaluationError'] = evaluationError;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1SubjectAccessReviewStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1SubjectAccessReviewStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1SubjectAccessReviewStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1SubjectAccessReviewStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1SubjectAccessReviewStatus(
        allowed: mapValueOfType<bool>(json, r'allowed')!,
        denied: mapValueOfType<bool>(json, r'denied'),
        evaluationError: mapValueOfType<String>(json, r'evaluationError'),
        reason: mapValueOfType<String>(json, r'reason'),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthorizationV1SubjectAccessReviewStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1SubjectAccessReviewStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAuthorizationV1SubjectAccessReviewStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1SubjectAccessReviewStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1SubjectAccessReviewStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1SubjectAccessReviewStatus.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1SubjectAccessReviewStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1SubjectAccessReviewStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAuthorizationV1SubjectAccessReviewStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1SubjectAccessReviewStatus.listFromJson(
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
    'allowed',
  };
}
