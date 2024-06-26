//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef({
    this.branch,
    this.commit,
    this.name,
    this.semver,
    this.tag,
  });

  /// Branch to check out, defaults to 'master' if no other field is defined.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? branch;

  /// Commit SHA to check out, takes precedence over all reference fields.   This can be combined with Branch to shallow clone the branch, in which the commit is expected to exist.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commit;

  /// Name of the reference to check out; takes precedence over Branch, Tag and SemVer.   It must be a valid Git reference: https://git-scm.com/docs/git-check-ref-format#_description Examples: \"refs/heads/main\", \"refs/tags/v0.1.0\", \"refs/pull/420/head\", \"refs/merge-requests/1/head\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// SemVer tag expression to check out, takes precedence over Tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? semver;

  /// Tag to check out, takes precedence over Branch.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tag;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef &&
          other.branch == branch &&
          other.commit == commit &&
          other.name == name &&
          other.semver == semver &&
          other.tag == tag;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (branch == null ? 0 : branch!.hashCode) +
      (commit == null ? 0 : commit!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (semver == null ? 0 : semver!.hashCode) +
      (tag == null ? 0 : tag!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef[branch=$branch, commit=$commit, name=$name, semver=$semver, tag=$tag]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.branch != null) {
      json[r'branch'] = this.branch;
    } else {
      json[r'branch'] = null;
    }
    if (this.commit != null) {
      json[r'commit'] = this.commit;
    } else {
      json[r'commit'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.semver != null) {
      json[r'semver'] = this.semver;
    } else {
      json[r'semver'] = null;
    }
    if (this.tag != null) {
      json[r'tag'] = this.tag;
    } else {
      json[r'tag'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef(
        branch: mapValueOfType<String>(json, r'branch'),
        commit: mapValueOfType<String>(json, r'commit'),
        name: mapValueOfType<String>(json, r'name'),
        semver: mapValueOfType<String>(json, r'semver'),
        tag: mapValueOfType<String>(json, r'tag'),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckoutRef
                .listFromJson(
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
