//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiPolicyV1beta1SELinuxStrategyOptions {
  /// Returns a new [IoK8sApiPolicyV1beta1SELinuxStrategyOptions] instance.
  IoK8sApiPolicyV1beta1SELinuxStrategyOptions({
    required this.rule,
    this.seLinuxOptions,
  });

  /// rule is the strategy that will dictate the allowable labels that may be set.
  String rule;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SELinuxOptions? seLinuxOptions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiPolicyV1beta1SELinuxStrategyOptions &&
          other.rule == rule &&
          other.seLinuxOptions == seLinuxOptions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (rule.hashCode) + (seLinuxOptions == null ? 0 : seLinuxOptions!.hashCode);

  @override
  String toString() =>
      'IoK8sApiPolicyV1beta1SELinuxStrategyOptions[rule=$rule, seLinuxOptions=$seLinuxOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'rule'] = rule;
    if (seLinuxOptions != null) {
      json[r'seLinuxOptions'] = seLinuxOptions;
    }
    return json;
  }

  /// Returns a new [IoK8sApiPolicyV1beta1SELinuxStrategyOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiPolicyV1beta1SELinuxStrategyOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiPolicyV1beta1SELinuxStrategyOptions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiPolicyV1beta1SELinuxStrategyOptions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiPolicyV1beta1SELinuxStrategyOptions(
        rule: mapValueOfType<String>(json, r'rule')!,
        seLinuxOptions:
            IoK8sApiCoreV1SELinuxOptions.fromJson(json[r'seLinuxOptions']),
      );
    }
    return null;
  }

  static List<IoK8sApiPolicyV1beta1SELinuxStrategyOptions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiPolicyV1beta1SELinuxStrategyOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiPolicyV1beta1SELinuxStrategyOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiPolicyV1beta1SELinuxStrategyOptions> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiPolicyV1beta1SELinuxStrategyOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiPolicyV1beta1SELinuxStrategyOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiPolicyV1beta1SELinuxStrategyOptions-objects as value to a dart map
  static Map<String, List<IoK8sApiPolicyV1beta1SELinuxStrategyOptions>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiPolicyV1beta1SELinuxStrategyOptions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiPolicyV1beta1SELinuxStrategyOptions.listFromJson(
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
    'rule',
  };
}
