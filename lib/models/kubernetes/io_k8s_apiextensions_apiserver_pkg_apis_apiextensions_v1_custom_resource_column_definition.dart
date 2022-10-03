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

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition({
    this.description,
    this.format,
    required this.jsonPath,
    required this.name,
    this.priority,
    required this.type,
  });

  /// description is a human readable description of this column.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// format is an optional OpenAPI type definition for this column. The 'name' format is applied to the primary identifier column to assist in clients identifying column is the resource name. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? format;

  /// jsonPath is a simple JSON path (i.e. with array notation) which is evaluated against each custom resource to produce the value for this column.
  String jsonPath;

  /// name is a human readable name for the column.
  String name;

  /// priority is an integer defining the relative importance of this column compared to others. Lower numbers are considered higher priority. Columns that may be omitted in limited space scenarios should be given a priority greater than 0.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? priority;

  /// type is an OpenAPI type definition for this column. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition &&
          other.description == description &&
          other.format == format &&
          other.jsonPath == jsonPath &&
          other.name == name &&
          other.priority == priority &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description == null ? 0 : description!.hashCode) +
      (format == null ? 0 : format!.hashCode) +
      (jsonPath.hashCode) +
      (name.hashCode) +
      (priority == null ? 0 : priority!.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition[description=$description, format=$format, jsonPath=$jsonPath, name=$name, priority=$priority, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.format != null) {
      json[r'format'] = this.format;
    } else {
      json[r'format'] = null;
    }
    json[r'jsonPath'] = this.jsonPath;
    json[r'name'] = this.name;
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition(
        description: mapValueOfType<String>(json, r'description'),
        format: mapValueOfType<String>(json, r'format'),
        jsonPath: mapValueOfType<String>(json, r'jsonPath')!,
        name: mapValueOfType<String>(json, r'name')!,
        priority: mapValueOfType<int>(json, r'priority'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <
        String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition
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
  static const requiredKeys = <String>{
    'jsonPath',
    'name',
    'type',
  };
}
