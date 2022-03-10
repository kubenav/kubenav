//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_column_definition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_subresources.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_validation.dart';

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion({
    this.additionalPrinterColumns = const [],
    this.deprecated,
    this.deprecationWarning,
    required this.name,
    this.schema,
    required this.served,
    required this.storage,
    this.subresources,
  });

  /// additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. If no columns are specified, a single column displaying the age of the custom resource is used.
  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition>
      additionalPrinterColumns;

  /// deprecated indicates this version of the custom resource API is deprecated. When set to true, API requests to this version receive a warning header in the server response. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deprecated;

  /// deprecationWarning overrides the default warning returned to API clients. May only be set when `deprecated` is true. The default warning indicates this version is deprecated and recommends use of the newest served version of equal or greater stability, if one exists.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deprecationWarning;

  /// name is the version name, e.g. “v1”, “v2beta1”, etc. The custom resources are served under this version at `/apis/<group>/<version>/...` if `served` is true.
  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation?
      schema;

  /// served is a flag enabling/disabling this version from being served via REST APIs
  bool served;

  /// storage indicates this version should be used when persisting custom resources to storage. There must be exactly one version with storage=true.
  bool storage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresources?
      subresources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion &&
          other.additionalPrinterColumns == additionalPrinterColumns &&
          other.deprecated == deprecated &&
          other.deprecationWarning == deprecationWarning &&
          other.name == name &&
          other.schema == schema &&
          other.served == served &&
          other.storage == storage &&
          other.subresources == subresources;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (additionalPrinterColumns.hashCode) +
      (deprecated == null ? 0 : deprecated!.hashCode) +
      (deprecationWarning == null ? 0 : deprecationWarning!.hashCode) +
      (name.hashCode) +
      (schema == null ? 0 : schema!.hashCode) +
      (served.hashCode) +
      (storage.hashCode) +
      (subresources == null ? 0 : subresources!.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion[additionalPrinterColumns=$additionalPrinterColumns, deprecated=$deprecated, deprecationWarning=$deprecationWarning, name=$name, schema=$schema, served=$served, storage=$storage, subresources=$subresources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'additionalPrinterColumns'] = additionalPrinterColumns;
    if (deprecated != null) {
      json[r'deprecated'] = deprecated;
    }
    if (deprecationWarning != null) {
      json[r'deprecationWarning'] = deprecationWarning;
    }
    json[r'name'] = name;
    if (schema != null) {
      json[r'schema'] = schema;
    }
    json[r'served'] = served;
    json[r'storage'] = storage;
    if (subresources != null) {
      json[r'subresources'] = subresources;
    }
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion(
        additionalPrinterColumns:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition
                    .listFromJson(json[r'additionalPrinterColumns']) ??
                const [],
        deprecated: mapValueOfType<bool>(json, r'deprecated'),
        deprecationWarning: mapValueOfType<String>(json, r'deprecationWarning'),
        name: mapValueOfType<String>(json, r'name')!,
        schema:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation
                .fromJson(json[r'schema']),
        served: mapValueOfType<bool>(json, r'served')!,
        storage: mapValueOfType<bool>(json, r'storage')!,
        subresources:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresources
                .fromJson(json[r'subresources']),
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <
        String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion
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
    'name',
    'served',
    'storage',
  };
}
