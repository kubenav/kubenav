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

class IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef] instance.
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef({
    this.branch,
    this.commit,
    this.semver,
    this.tag,
  });

  /// The Git branch to checkout, defaults to master.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? branch;

  /// The Git commit SHA to checkout, if specified Tag filters will be ignored.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commit;

  /// The Git tag semver expression, takes precedence over Tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? semver;

  /// The Git tag to checkout, takes precedence over Branch.
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
      other is IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef &&
          other.branch == branch &&
          other.commit == commit &&
          other.semver == semver &&
          other.tag == tag;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (branch == null ? 0 : branch!.hashCode) +
      (commit == null ? 0 : commit!.hashCode) +
      (semver == null ? 0 : semver!.hashCode) +
      (tag == null ? 0 : tag!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef[branch=$branch, commit=$commit, semver=$semver, tag=$tag]';

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

  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef(
        branch: mapValueOfType<String>(json, r'branch'),
        commit: mapValueOfType<String>(json, r'commit'),
        semver: mapValueOfType<String>(json, r'semver'),
        tag: mapValueOfType<String>(json, r'tag'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecRef.listFromJson(
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
