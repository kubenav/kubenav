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

class IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry] instance.
  IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  /// APIVersion defines the version of this resource that this field set applies to. The format is \"group/version\" just like the top-level APIVersion field. It is necessary to track the version of a field set because it cannot be automatically converted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// FieldsType is the discriminator for the different fields format and version. There is currently only one possible value: \"FieldsV1\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldsType;

  /// FieldsV1 stores a set of fields in a data structure like a Trie, in JSON format.  Each key is either a '.' representing the field itself, and will always map to an empty set, or a string representing a sub-field or item. The string will follow one of these four formats: 'f:<name>', where <name> is the name of a field in a struct, or key in a map 'v:<value>', where <value> is the exact json formatted value of a list item 'i:<index>', where <index> is position of a item in a list 'k:<keys>', where <keys> is a map of  a list item's key fields to their unique values If a key maps to an empty Fields value, the field that key represents is part of the set.  The exact format is defined in sigs.k8s.io/structured-merge-diff
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? fieldsV1;

  /// Manager is an identifier of the workflow managing these fields.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? manager;

  /// Operation is the type of operation which lead to this ManagedFieldsEntry being created. The only valid values for this field are 'Apply' and 'Update'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? operation;

  /// Subresource is the name of the subresource used to update that object, or empty string if the object was updated through the main resource. The value of this field is used to distinguish between managers, even if they share the same name. For example, a status update will be distinct from a regular update using the same manager name. Note that the APIVersion field is not related to the Subresource field and it always corresponds to the version of the main resource.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subresource;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? time;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry &&
          other.apiVersion == apiVersion &&
          other.fieldsType == fieldsType &&
          other.fieldsV1 == fieldsV1 &&
          other.manager == manager &&
          other.operation == operation &&
          other.subresource == subresource &&
          other.time == time;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (fieldsType == null ? 0 : fieldsType!.hashCode) +
      (fieldsV1 == null ? 0 : fieldsV1!.hashCode) +
      (manager == null ? 0 : manager!.hashCode) +
      (operation == null ? 0 : operation!.hashCode) +
      (subresource == null ? 0 : subresource!.hashCode) +
      (time == null ? 0 : time!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry[apiVersion=$apiVersion, fieldsType=$fieldsType, fieldsV1=$fieldsV1, manager=$manager, operation=$operation, subresource=$subresource, time=$time]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    if (fieldsType != null) {
      json[r'fieldsType'] = fieldsType;
    }
    if (fieldsV1 != null) {
      json[r'fieldsV1'] = fieldsV1;
    }
    if (manager != null) {
      json[r'manager'] = manager;
    }
    if (operation != null) {
      json[r'operation'] = operation;
    }
    if (subresource != null) {
      json[r'subresource'] = subresource;
    }
    if (time != null) {
      json[r'time'] = time!.toUtc().toIso8601String();
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        fieldsType: mapValueOfType<String>(json, r'fieldsType'),
        fieldsV1: mapValueOfType<Object>(json, r'fieldsV1'),
        manager: mapValueOfType<String>(json, r'manager'),
        operation: mapValueOfType<String>(json, r'operation'),
        subresource: mapValueOfType<String>(json, r'subresource'),
        time: mapDateTime(json, r'time', ''),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry.listFromJson(
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
