//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, avoid_function_literals_in_foreach_calls, require_trailing_commas, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_status_jwt_tokens_by_role_value.dart';

class IoArgoprojV1alpha1AppProjectStatus {
  /// Returns a new [IoArgoprojV1alpha1AppProjectStatus] instance.
  IoArgoprojV1alpha1AppProjectStatus({
    this.jwtTokensByRole = const {},
  });

  /// JWTTokensByRole contains a list of JWT tokens issued for a given role
  Map<String, IoArgoprojV1alpha1AppProjectStatusJwtTokensByRoleValue>
      jwtTokensByRole;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectStatus &&
          deepEquality.equals(other.jwtTokensByRole, jwtTokensByRole);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (jwtTokensByRole.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectStatus[jwtTokensByRole=$jwtTokensByRole]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'jwtTokensByRole'] = this.jwtTokensByRole;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectStatus(
        jwtTokensByRole:
            IoArgoprojV1alpha1AppProjectStatusJwtTokensByRoleValue.mapFromJson(
                json[r'jwtTokensByRole']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AppProjectStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AppProjectStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AppProjectStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1AppProjectStatus.listFromJson(
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
