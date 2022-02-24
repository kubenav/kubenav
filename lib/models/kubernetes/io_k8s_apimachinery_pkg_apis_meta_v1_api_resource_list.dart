//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApimachineryPkgApisMetaV1APIResourceList {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1APIResourceList] instance.
  IoK8sApimachineryPkgApisMetaV1APIResourceList({
    this.apiVersion,
    required this.groupVersion,
    this.kind,
    this.resources = const [],
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// groupVersion is the group and version this APIResourceList is for.
  String groupVersion;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// resources contains the name of the resources and if they are namespaced.
  List<IoK8sApimachineryPkgApisMetaV1APIResource> resources;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1APIResourceList &&
          other.apiVersion == apiVersion &&
          other.groupVersion == groupVersion &&
          other.kind == kind &&
          other.resources == resources;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (groupVersion.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (resources.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1APIResourceList[apiVersion=$apiVersion, groupVersion=$groupVersion, kind=$kind, resources=$resources]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    json[r'groupVersion'] = groupVersion;
    if (kind != null) {
      json[r'kind'] = kind;
    }
    json[r'resources'] = resources;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1APIResourceList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1APIResourceList? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1APIResourceList[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1APIResourceList[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1APIResourceList(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        groupVersion: mapValueOfType<String>(json, r'groupVersion')!,
        kind: mapValueOfType<String>(json, r'kind'),
        resources: IoK8sApimachineryPkgApisMetaV1APIResource.listFromJson(
            json[r'resources'])!,
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1APIResourceList>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1APIResourceList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApimachineryPkgApisMetaV1APIResourceList.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1APIResourceList> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1APIResourceList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1APIResourceList.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1APIResourceList-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1APIResourceList>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1APIResourceList>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1APIResourceList.listFromJson(
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
    'groupVersion',
    'resources',
  };
}
