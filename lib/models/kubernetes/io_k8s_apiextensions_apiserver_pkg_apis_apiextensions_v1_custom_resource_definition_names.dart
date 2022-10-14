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

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames({
    this.categories = const [],
    required this.kind,
    this.listKind,
    required this.plural,
    this.shortNames = const [],
    this.singular,
  });

  /// categories is a list of grouped resources this custom resource belongs to (e.g. 'all'). This is published in API discovery documents, and used by clients to support invocations like `kubectl get all`.
  List<String> categories;

  /// kind is the serialized kind of the resource. It is normally CamelCase and singular. Custom resource instances will use this value as the `kind` attribute in API calls.
  String kind;

  /// listKind is the serialized kind of the list for this resource. Defaults to \"`kind`List\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? listKind;

  /// plural is the plural name of the resource to serve. The custom resources are served under `/apis/<group>/<version>/.../<plural>`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`). Must be all lowercase.
  String plural;

  /// shortNames are short names for the resource, exposed in API discovery documents, and used by clients to support invocations like `kubectl get <shortname>`. It must be all lowercase.
  List<String> shortNames;

  /// singular is the singular name of the resource. It must be all lowercase. Defaults to lowercased `kind`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? singular;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames &&
          other.categories == categories &&
          other.kind == kind &&
          other.listKind == listKind &&
          other.plural == plural &&
          other.shortNames == shortNames &&
          other.singular == singular;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (categories.hashCode) +
      (kind.hashCode) +
      (listKind == null ? 0 : listKind!.hashCode) +
      (plural.hashCode) +
      (shortNames.hashCode) +
      (singular == null ? 0 : singular!.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames[categories=$categories, kind=$kind, listKind=$listKind, plural=$plural, shortNames=$shortNames, singular=$singular]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'categories'] = this.categories;
    json[r'kind'] = this.kind;
    if (this.listKind != null) {
      json[r'listKind'] = this.listKind;
    } else {
      json[r'listKind'] = null;
    }
    json[r'plural'] = this.plural;
    json[r'shortNames'] = this.shortNames;
    if (this.singular != null) {
      json[r'singular'] = this.singular;
    } else {
      json[r'singular'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames(
        categories: json[r'categories'] is List
            ? (json[r'categories'] as List).cast<String>()
            : const [],
        kind: mapValueOfType<String>(json, r'kind')!,
        listKind: mapValueOfType<String>(json, r'listKind'),
        plural: mapValueOfType<String>(json, r'plural')!,
        shortNames: json[r'shortNames'] is List
            ? (json[r'shortNames'] as List).cast<String>()
            : const [],
        singular: mapValueOfType<String>(json, r'singular'),
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <
        String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
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
    'kind',
    'plural',
  };
}
