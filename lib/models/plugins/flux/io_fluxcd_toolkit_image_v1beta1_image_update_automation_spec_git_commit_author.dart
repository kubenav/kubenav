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

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor({
    required this.email,
    this.name,
  });

  /// Email gives the email to provide when making a commit.
  String email;

  /// Name gives the name to provide when making a commit.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor &&
          other.email == email &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (email.hashCode) + (name == null ? 0 : name!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor[email=$email, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'email'] = this.email;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor(
        email: mapValueOfType<String>(json, r'email')!,
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email',
  };
}
