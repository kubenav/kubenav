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

class IoK8sApimachineryPkgApisMetaV1APIResource {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1APIResource] instance.
  IoK8sApimachineryPkgApisMetaV1APIResource({
    this.categories = const [],
    this.group,
    required this.kind,
    required this.name,
    required this.namespaced,
    this.shortNames = const [],
    required this.singularName,
    this.storageVersionHash,
    this.verbs = const [],
    this.version,
  });

  /// categories is a list of the grouped resources this resource belongs to (e.g. 'all')
  List<String> categories;

  /// group is the preferred group of the resource.  Empty implies the group of the containing resource list. For subresources, this may have a different value, for example: Scale\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  /// kind is the kind for the resource (e.g. 'Foo' is the kind for a resource 'foo')
  String kind;

  /// name is the plural name of the resource.
  String name;

  /// namespaced indicates if a resource is namespaced or not.
  bool namespaced;

  /// shortNames is a list of suggested short names of the resource.
  List<String> shortNames;

  /// singularName is the singular name of the resource.  This allows clients to handle plural and singular opaquely. The singularName is more correct for reporting status on a single item and both singular and plural are allowed from the kubectl CLI interface.
  String singularName;

  /// The hash value of the storage version, the version this resource is converted to when written to the data store. Value must be treated as opaque by clients. Only equality comparison on the value is valid. This is an alpha feature and may change or be removed in the future. The field is populated by the apiserver only if the StorageVersionHash feature gate is enabled. This field will remain optional even if it graduates.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageVersionHash;

  /// verbs is a list of supported kube verbs (this includes get, list, watch, create, update, patch, delete, deletecollection, and proxy)
  List<String> verbs;

  /// version is the preferred version of the resource.  Empty implies the version of the containing resource list For subresources, this may have a different value, for example: v1 (while inside a v1beta1 version of the core resource's group)\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1APIResource &&
          other.categories == categories &&
          other.group == group &&
          other.kind == kind &&
          other.name == name &&
          other.namespaced == namespaced &&
          other.shortNames == shortNames &&
          other.singularName == singularName &&
          other.storageVersionHash == storageVersionHash &&
          other.verbs == verbs &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (categories.hashCode) +
      (group == null ? 0 : group!.hashCode) +
      (kind.hashCode) +
      (name.hashCode) +
      (namespaced.hashCode) +
      (shortNames.hashCode) +
      (singularName.hashCode) +
      (storageVersionHash == null ? 0 : storageVersionHash!.hashCode) +
      (verbs.hashCode) +
      (version == null ? 0 : version!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1APIResource[categories=$categories, group=$group, kind=$kind, name=$name, namespaced=$namespaced, shortNames=$shortNames, singularName=$singularName, storageVersionHash=$storageVersionHash, verbs=$verbs, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'categories'] = categories;
    if (group != null) {
      json[r'group'] = group;
    }
    json[r'kind'] = kind;
    json[r'name'] = name;
    json[r'namespaced'] = namespaced;
    json[r'shortNames'] = shortNames;
    json[r'singularName'] = singularName;
    if (storageVersionHash != null) {
      json[r'storageVersionHash'] = storageVersionHash;
    }
    json[r'verbs'] = verbs;
    if (version != null) {
      json[r'version'] = version;
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1APIResource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1APIResource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1APIResource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1APIResource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1APIResource(
        categories: json[r'categories'] is List
            ? (json[r'categories'] as List).cast<String>()
            : const [],
        group: mapValueOfType<String>(json, r'group'),
        kind: mapValueOfType<String>(json, r'kind')!,
        name: mapValueOfType<String>(json, r'name')!,
        namespaced: mapValueOfType<bool>(json, r'namespaced')!,
        shortNames: json[r'shortNames'] is List
            ? (json[r'shortNames'] as List).cast<String>()
            : const [],
        singularName: mapValueOfType<String>(json, r'singularName')!,
        storageVersionHash: mapValueOfType<String>(json, r'storageVersionHash'),
        verbs: json[r'verbs'] is List
            ? (json[r'verbs'] as List).cast<String>()
            : const [],
        version: mapValueOfType<String>(json, r'version'),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1APIResource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1APIResource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1APIResource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1APIResource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1APIResource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1APIResource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1APIResource-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1APIResource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1APIResource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1APIResource.listFromJson(
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
    'name',
    'namespaced',
    'singularName',
    'verbs',
  };
}
