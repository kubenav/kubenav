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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_directory_jsonnet.dart';

class IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory] instance.
  IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory({
    this.exclude,
    this.include,
    this.jsonnet,
    this.recurse,
  });

  /// Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? exclude;

  /// Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? include;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectoryJsonnet? jsonnet;

  /// Recurse specifies whether to scan a directory recursively for manifests
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? recurse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory &&
          other.exclude == exclude &&
          other.include == include &&
          other.jsonnet == jsonnet &&
          other.recurse == recurse;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (exclude == null ? 0 : exclude!.hashCode) +
      (include == null ? 0 : include!.hashCode) +
      (jsonnet == null ? 0 : jsonnet!.hashCode) +
      (recurse == null ? 0 : recurse!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory[exclude=$exclude, include=$include, jsonnet=$jsonnet, recurse=$recurse]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.exclude != null) {
      json[r'exclude'] = this.exclude;
    } else {
      json[r'exclude'] = null;
    }
    if (this.include != null) {
      json[r'include'] = this.include;
    } else {
      json[r'include'] = null;
    }
    if (this.jsonnet != null) {
      json[r'jsonnet'] = this.jsonnet;
    } else {
      json[r'jsonnet'] = null;
    }
    if (this.recurse != null) {
      json[r'recurse'] = this.recurse;
    } else {
      json[r'recurse'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory(
        exclude: mapValueOfType<String>(json, r'exclude'),
        include: mapValueOfType<String>(json, r'include'),
        jsonnet:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectoryJsonnet
                .fromJson(json[r'jsonnet']),
        recurse: mapValueOfType<bool>(json, r'recurse'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceDirectory
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
