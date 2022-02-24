//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAuthorizationV1SubjectRulesReviewStatus {
  /// Returns a new [IoK8sApiAuthorizationV1SubjectRulesReviewStatus] instance.
  IoK8sApiAuthorizationV1SubjectRulesReviewStatus({
    this.evaluationError,
    required this.incomplete,
    this.nonResourceRules = const [],
    this.resourceRules = const [],
  });

  /// EvaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn't support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? evaluationError;

  /// Incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn't support rules evaluation.
  bool incomplete;

  /// NonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
  List<IoK8sApiAuthorizationV1NonResourceRule> nonResourceRules;

  /// ResourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
  List<IoK8sApiAuthorizationV1ResourceRule> resourceRules;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1SubjectRulesReviewStatus &&
          other.evaluationError == evaluationError &&
          other.incomplete == incomplete &&
          other.nonResourceRules == nonResourceRules &&
          other.resourceRules == resourceRules;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (evaluationError == null ? 0 : evaluationError!.hashCode) +
      (incomplete.hashCode) +
      (nonResourceRules.hashCode) +
      (resourceRules.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1SubjectRulesReviewStatus[evaluationError=$evaluationError, incomplete=$incomplete, nonResourceRules=$nonResourceRules, resourceRules=$resourceRules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (evaluationError != null) {
      json[r'evaluationError'] = evaluationError;
    }
    json[r'incomplete'] = incomplete;
    json[r'nonResourceRules'] = nonResourceRules;
    json[r'resourceRules'] = resourceRules;
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1SubjectRulesReviewStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1SubjectRulesReviewStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1SubjectRulesReviewStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1SubjectRulesReviewStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1SubjectRulesReviewStatus(
        evaluationError: mapValueOfType<String>(json, r'evaluationError'),
        incomplete: mapValueOfType<bool>(json, r'incomplete')!,
        nonResourceRules: IoK8sApiAuthorizationV1NonResourceRule.listFromJson(
            json[r'nonResourceRules'])!,
        resourceRules: IoK8sApiAuthorizationV1ResourceRule.listFromJson(
            json[r'resourceRules'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAuthorizationV1SubjectRulesReviewStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1SubjectRulesReviewStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAuthorizationV1SubjectRulesReviewStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1SubjectRulesReviewStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1SubjectRulesReviewStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1SubjectRulesReviewStatus.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1SubjectRulesReviewStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1SubjectRulesReviewStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAuthorizationV1SubjectRulesReviewStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1SubjectRulesReviewStatus.listFromJson(
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
    'incomplete',
    'nonResourceRules',
    'resourceRules',
  };
}
