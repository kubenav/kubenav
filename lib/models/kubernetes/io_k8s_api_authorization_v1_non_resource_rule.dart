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

class IoK8sApiAuthorizationV1NonResourceRule {
  /// Returns a new [IoK8sApiAuthorizationV1NonResourceRule] instance.
  IoK8sApiAuthorizationV1NonResourceRule({
    this.nonResourceURLs = const [],
    this.verbs = const [],
  });

  /// NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  \"*\" means all.
  List<String> nonResourceURLs;

  /// Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  \"*\" means all.
  List<String> verbs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1NonResourceRule &&
          other.nonResourceURLs == nonResourceURLs &&
          other.verbs == verbs;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nonResourceURLs.hashCode) + (verbs.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1NonResourceRule[nonResourceURLs=$nonResourceURLs, verbs=$verbs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'nonResourceURLs'] = this.nonResourceURLs;
    json[r'verbs'] = this.verbs;
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1NonResourceRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1NonResourceRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1NonResourceRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1NonResourceRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1NonResourceRule(
        nonResourceURLs: json[r'nonResourceURLs'] is List
            ? (json[r'nonResourceURLs'] as List).cast<String>()
            : const [],
        verbs: json[r'verbs'] is List
            ? (json[r'verbs'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiAuthorizationV1NonResourceRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1NonResourceRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthorizationV1NonResourceRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1NonResourceRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1NonResourceRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1NonResourceRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1NonResourceRule-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1NonResourceRule>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthorizationV1NonResourceRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthorizationV1NonResourceRule.listFromJson(
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
    'verbs',
  };
}
