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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_git_repository_spec_include_inner_repository.dart';

class IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner] instance.
  IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner({
    this.fromPath,
    required this.repository,
    this.toPath,
  });

  /// The path to copy contents from, defaults to the root directory.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fromPath;

  IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInnerRepository
      repository;

  /// The path to copy contents to, defaults to the name of the source ref.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? toPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner &&
          other.fromPath == fromPath &&
          other.repository == repository &&
          other.toPath == toPath;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fromPath == null ? 0 : fromPath!.hashCode) +
      (repository.hashCode) +
      (toPath == null ? 0 : toPath!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner[fromPath=$fromPath, repository=$repository, toPath=$toPath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fromPath != null) {
      json[r'fromPath'] = this.fromPath;
    } else {
      json[r'fromPath'] = null;
    }
    json[r'repository'] = this.repository;
    if (this.toPath != null) {
      json[r'toPath'] = this.toPath;
    } else {
      json[r'toPath'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner(
        fromPath: mapValueOfType<String>(json, r'fromPath'),
        repository:
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInnerRepository
                .fromJson(json[r'repository'])!,
        toPath: mapValueOfType<String>(json, r'toPath'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta1GitRepositorySpecIncludeInner
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
    'repository',
  };
}
