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

import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_names.dart';

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus({
    this.acceptedNames,
    this.conditions = const [],
    this.storedVersions = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames?
      acceptedNames;

  /// conditions indicate state for particular aspects of a CustomResourceDefinition
  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionCondition>
      conditions;

  /// storedVersions lists all versions of CustomResources that were ever persisted. Tracking these versions allows a migration path for stored versions in etcd. The field is mutable so a migration controller can finish a migration to another version (ensuring no old objects are left in storage), and then remove the rest of the versions from this list. Versions may not be removed from `spec.versions` while they exist in this list.
  List<String> storedVersions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus &&
          other.acceptedNames == acceptedNames &&
          other.conditions == conditions &&
          other.storedVersions == storedVersions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (acceptedNames == null ? 0 : acceptedNames!.hashCode) +
      (conditions.hashCode) +
      (storedVersions.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus[acceptedNames=$acceptedNames, conditions=$conditions, storedVersions=$storedVersions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.acceptedNames != null) {
      json[r'acceptedNames'] = this.acceptedNames;
    } else {
      json[r'acceptedNames'] = null;
    }
    json[r'conditions'] = this.conditions;
    json[r'storedVersions'] = this.storedVersions;
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus(
        acceptedNames:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
                .fromJson(json[r'acceptedNames']),
        conditions:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionCondition
                    .listFromJson(json[r'conditions']) ??
                const [],
        storedVersions: json[r'storedVersions'] is List
            ? (json[r'storedVersions'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus
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
