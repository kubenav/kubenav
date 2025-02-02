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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_roles_inner_jwt_tokens_inner.dart';

class IoArgoprojV1alpha1AppProjectSpecRolesInner {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecRolesInner] instance.
  IoArgoprojV1alpha1AppProjectSpecRolesInner({
    this.description,
    this.groups = const [],
    this.jwtTokens = const [],
    required this.name,
    this.policies = const [],
  });

  /// Description is a description of the role
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Groups are a list of OIDC group claims bound to this role
  List<String> groups;

  /// JWTTokens are a list of generated JWT tokens bound to this role
  List<IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner> jwtTokens;

  /// Name is a name for this role
  String name;

  /// Policies Stores a list of casbin formatted strings that define access policies for the role in the project
  List<String> policies;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecRolesInner &&
          other.description == description &&
          deepEquality.equals(other.groups, groups) &&
          deepEquality.equals(other.jwtTokens, jwtTokens) &&
          other.name == name &&
          deepEquality.equals(other.policies, policies);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description == null ? 0 : description!.hashCode) +
      (groups.hashCode) +
      (jwtTokens.hashCode) +
      (name.hashCode) +
      (policies.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecRolesInner[description=$description, groups=$groups, jwtTokens=$jwtTokens, name=$name, policies=$policies]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'groups'] = this.groups;
    json[r'jwtTokens'] = this.jwtTokens;
    json[r'name'] = this.name;
    json[r'policies'] = this.policies;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecRolesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecRolesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecRolesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecRolesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecRolesInner(
        description: mapValueOfType<String>(json, r'description'),
        groups: json[r'groups'] is Iterable
            ? (json[r'groups'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        jwtTokens: IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner
            .listFromJson(json[r'jwtTokens']),
        name: mapValueOfType<String>(json, r'name')!,
        policies: json[r'policies'] is Iterable
            ? (json[r'policies'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecRolesInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpecRolesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AppProjectSpecRolesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpecRolesInner> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectSpecRolesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecRolesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecRolesInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectSpecRolesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AppProjectSpecRolesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecRolesInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}
