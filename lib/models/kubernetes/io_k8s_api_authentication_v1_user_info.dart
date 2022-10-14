//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApiAuthenticationV1UserInfo {
  /// Returns a new [IoK8sApiAuthenticationV1UserInfo] instance.
  IoK8sApiAuthenticationV1UserInfo({
    this.extra = const {},
    this.groups = const [],
    this.uid,
    this.username,
  });

  /// Any additional information provided by the authenticator.
  Map<String, List<dynamic>>? extra;

  /// The names of groups this user is a part of.
  List<String> groups;

  /// A unique value that identifies this user across time. If this user is deleted and another user by the same name is added, they will have different UIDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uid;

  /// The name that uniquely identifies this user among all active users.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthenticationV1UserInfo &&
          other.extra == extra &&
          other.groups == groups &&
          other.uid == uid &&
          other.username == username;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (extra.hashCode) +
      (groups.hashCode) +
      (uid == null ? 0 : uid!.hashCode) +
      (username == null ? 0 : username!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthenticationV1UserInfo[extra=$extra, groups=$groups, uid=$uid, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'extra'] = this.extra;
    json[r'groups'] = this.groups;
    if (this.uid != null) {
      json[r'uid'] = this.uid;
    } else {
      json[r'uid'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthenticationV1UserInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthenticationV1UserInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthenticationV1UserInfo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthenticationV1UserInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthenticationV1UserInfo(
        extra: json[r'extra'] == null
            ? const {}
            : mapCastOfType<String, List>(json, r'extra'),
        groups: json[r'groups'] is List
            ? (json[r'groups'] as List).cast<String>()
            : const [],
        uid: mapValueOfType<String>(json, r'uid'),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthenticationV1UserInfo>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthenticationV1UserInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiAuthenticationV1UserInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthenticationV1UserInfo> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiAuthenticationV1UserInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthenticationV1UserInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthenticationV1UserInfo-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthenticationV1UserInfo>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiAuthenticationV1UserInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAuthenticationV1UserInfo.listFromJson(
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
  static const requiredKeys = <String>{};
}
