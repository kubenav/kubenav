//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, require_trailing_commas, avoid_function_literals_in_foreach_calls, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_orphaned_resources_ignore_inner.dart';

class IoArgoprojV1alpha1AppProjectSpecOrphanedResources {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecOrphanedResources] instance.
  IoArgoprojV1alpha1AppProjectSpecOrphanedResources({
    this.ignore = const [],
    this.warn,
  });

  /// Ignore contains a list of resources that are to be excluded from orphaned resources monitoring
  List<IoArgoprojV1alpha1AppProjectSpecOrphanedResourcesIgnoreInner> ignore;

  /// Warn indicates if warning condition should be created for apps which have orphaned resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? warn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecOrphanedResources &&
          deepEquality.equals(other.ignore, ignore) &&
          other.warn == warn;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignore.hashCode) + (warn == null ? 0 : warn!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecOrphanedResources[ignore=$ignore, warn=$warn]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'ignore'] = this.ignore;
    if (this.warn != null) {
      json[r'warn'] = this.warn;
    } else {
      json[r'warn'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecOrphanedResources] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecOrphanedResources? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecOrphanedResources[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecOrphanedResources[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecOrphanedResources(
        ignore: IoArgoprojV1alpha1AppProjectSpecOrphanedResourcesIgnoreInner
            .listFromJson(json[r'ignore']),
        warn: mapValueOfType<bool>(json, r'warn'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecOrphanedResources> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpecOrphanedResources>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecOrphanedResources.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpecOrphanedResources>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectSpecOrphanedResources>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecOrphanedResources.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecOrphanedResources-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectSpecOrphanedResources>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AppProjectSpecOrphanedResources>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecOrphanedResources.listFromJson(
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
