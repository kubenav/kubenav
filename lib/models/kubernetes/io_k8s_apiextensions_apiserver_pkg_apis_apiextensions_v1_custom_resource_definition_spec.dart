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

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_conversion.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_names.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_version.dart';

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec({
    this.conversion,
    required this.group,
    required this.names,
    this.preserveUnknownFields,
    required this.scope,
    this.versions = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion?
      conversion;

  /// group is the API group of the defined custom resource. The custom resources are served under `/apis/<group>/...`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`).
  String group;

  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
      names;

  /// preserveUnknownFields indicates that object fields which are not specified in the OpenAPI schema should be preserved when persisting to storage. apiVersion, kind, metadata and known fields inside metadata are always preserved. This field is deprecated in favor of setting `x-preserve-unknown-fields` to true in `spec.versions[*].schema.openAPIV3Schema`. See https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#pruning-versus-preserving-unknown-fields for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? preserveUnknownFields;

  /// scope indicates whether the defined custom resource is cluster- or namespace-scoped. Allowed values are `Cluster` and `Namespaced`.
  String scope;

  /// versions is the list of all API versions of the defined custom resource. Version names are used to compute the order in which served versions are listed in API discovery. If the version string is \"kube-like\", it will sort above non \"kube-like\" version strings, which are ordered lexicographically. \"Kube-like\" versions start with a \"v\", then are followed by a number (the major version), then optionally the string \"alpha\" or \"beta\" and another number (the minor version). These are sorted first by GA > beta > alpha (where GA is a version with no suffix such as beta or alpha), and then by comparing major version, then minor version. An example sorted list of versions: v10, v2, v1, v11beta2, v10beta3, v3beta1, v12alpha1, v11alpha2, foo1, foo10.
  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion>
      versions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec &&
          other.conversion == conversion &&
          other.group == group &&
          other.names == names &&
          other.preserveUnknownFields == preserveUnknownFields &&
          other.scope == scope &&
          other.versions == versions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conversion == null ? 0 : conversion!.hashCode) +
      (group.hashCode) +
      (names.hashCode) +
      (preserveUnknownFields == null ? 0 : preserveUnknownFields!.hashCode) +
      (scope.hashCode) +
      (versions.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec[conversion=$conversion, group=$group, names=$names, preserveUnknownFields=$preserveUnknownFields, scope=$scope, versions=$versions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.conversion != null) {
      json[r'conversion'] = this.conversion;
    } else {
      json[r'conversion'] = null;
    }
    json[r'group'] = this.group;
    json[r'names'] = this.names;
    if (this.preserveUnknownFields != null) {
      json[r'preserveUnknownFields'] = this.preserveUnknownFields;
    } else {
      json[r'preserveUnknownFields'] = null;
    }
    json[r'scope'] = this.scope;
    json[r'versions'] = this.versions;
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec(
        conversion:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion
                .fromJson(json[r'conversion']),
        group: mapValueOfType<String>(json, r'group')!,
        names:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
                .fromJson(json[r'names'])!,
        preserveUnknownFields:
            mapValueOfType<bool>(json, r'preserveUnknownFields'),
        scope: mapValueOfType<String>(json, r'scope')!,
        versions:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionVersion
                .listFromJson(json[r'versions'])!,
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec
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
    'group',
    'names',
    'scope',
    'versions',
  };
}
