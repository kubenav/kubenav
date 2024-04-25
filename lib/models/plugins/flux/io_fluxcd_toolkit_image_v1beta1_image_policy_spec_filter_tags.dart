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

class IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags] instance.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags({
    this.extract,
    this.pattern,
  });

  /// Extract allows a capture group to be extracted from the specified regular expression pattern, useful before tag evaluation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? extract;

  /// Pattern specifies a regular expression pattern used to filter for image tags.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pattern;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags &&
          other.extract == extract &&
          other.pattern == pattern;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (extract == null ? 0 : extract!.hashCode) +
      (pattern == null ? 0 : pattern!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags[extract=$extract, pattern=$pattern]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.extract != null) {
      json[r'extract'] = this.extract;
    } else {
      json[r'extract'] = null;
    }
    if (this.pattern != null) {
      json[r'pattern'] = this.pattern;
    } else {
      json[r'pattern'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags(
        extract: mapValueOfType<String>(json, r'extract'),
        pattern: mapValueOfType<String>(json, r'pattern'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
