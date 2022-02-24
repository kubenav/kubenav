//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation({
    this.openAPIV3Schema,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps?
      openAPIV3Schema;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation &&
          other.openAPIV3Schema == openAPIV3Schema;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (openAPIV3Schema == null ? 0 : openAPIV3Schema!.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation[openAPIV3Schema=$openAPIV3Schema]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (openAPIV3Schema != null) {
      json[r'openAPIV3Schema'] = openAPIV3Schema;
    }
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation(
        openAPIV3Schema:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .fromJson(json[r'openAPIV3Schema']),
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <
        String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation
                .listFromJson(
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
