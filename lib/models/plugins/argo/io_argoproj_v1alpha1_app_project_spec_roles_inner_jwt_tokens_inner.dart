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

class IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner] instance.
  IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner({
    this.exp,
    required this.iat,
    this.id,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? exp;

  int iat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner &&
          other.exp == exp &&
          other.iat == iat &&
          other.id == id;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (exp == null ? 0 : exp!.hashCode) +
      (iat.hashCode) +
      (id == null ? 0 : id!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner[exp=$exp, iat=$iat, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.exp != null) {
      json[r'exp'] = this.exp;
    } else {
      json[r'exp'] = null;
    }
    json[r'iat'] = this.iat;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner(
        exp: mapValueOfType<int>(json, r'exp'),
        iat: mapValueOfType<int>(json, r'iat')!,
        id: mapValueOfType<String>(json, r'id'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecRolesInnerJwtTokensInner
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
    'iat',
  };
}
