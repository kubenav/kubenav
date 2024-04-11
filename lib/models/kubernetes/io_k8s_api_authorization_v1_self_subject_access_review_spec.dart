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

import 'package:kubenav/models/kubernetes/io_k8s_api_authorization_v1_non_resource_attributes.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_authorization_v1_resource_attributes.dart';

class IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec {
  /// Returns a new [IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec] instance.
  IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec({
    this.nonResourceAttributes,
    this.resourceAttributes,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAuthorizationV1NonResourceAttributes? nonResourceAttributes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiAuthorizationV1ResourceAttributes? resourceAttributes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec &&
          other.nonResourceAttributes == nonResourceAttributes &&
          other.resourceAttributes == resourceAttributes;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nonResourceAttributes == null ? 0 : nonResourceAttributes!.hashCode) +
      (resourceAttributes == null ? 0 : resourceAttributes!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec[nonResourceAttributes=$nonResourceAttributes, resourceAttributes=$resourceAttributes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nonResourceAttributes != null) {
      json[r'nonResourceAttributes'] = this.nonResourceAttributes;
    } else {
      json[r'nonResourceAttributes'] = null;
    }
    if (this.resourceAttributes != null) {
      json[r'resourceAttributes'] = this.resourceAttributes;
    } else {
      json[r'resourceAttributes'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec(
        nonResourceAttributes:
            IoK8sApiAuthorizationV1NonResourceAttributes.fromJson(
                json[r'nonResourceAttributes']),
        resourceAttributes: IoK8sApiAuthorizationV1ResourceAttributes.fromJson(
            json[r'resourceAttributes']),
      );
    }
    return null;
  }

  static List<IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec.listFromJson(
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
