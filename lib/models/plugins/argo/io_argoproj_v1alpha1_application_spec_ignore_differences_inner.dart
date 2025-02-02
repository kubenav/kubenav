//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner] instance.
  IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner({
    this.group,
    this.jqPathExpressions = const [],
    this.jsonPointers = const [],
    required this.kind,
    this.managedFieldsManagers = const [],
    this.name,
    this.namespace,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  List<String> jqPathExpressions;

  List<String> jsonPointers;

  String kind;

  /// ManagedFieldsManagers is a list of trusted managers. Fields mutated by those managers will take precedence over the desired state defined in the SCM and won't be displayed in diffs
  List<String> managedFieldsManagers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner &&
          other.group == group &&
          deepEquality.equals(other.jqPathExpressions, jqPathExpressions) &&
          deepEquality.equals(other.jsonPointers, jsonPointers) &&
          other.kind == kind &&
          deepEquality.equals(
              other.managedFieldsManagers, managedFieldsManagers) &&
          other.name == name &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (group == null ? 0 : group!.hashCode) +
      (jqPathExpressions.hashCode) +
      (jsonPointers.hashCode) +
      (kind.hashCode) +
      (managedFieldsManagers.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner[group=$group, jqPathExpressions=$jqPathExpressions, jsonPointers=$jsonPointers, kind=$kind, managedFieldsManagers=$managedFieldsManagers, name=$name, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.group != null) {
      json[r'group'] = this.group;
    } else {
      json[r'group'] = null;
    }
    json[r'jqPathExpressions'] = this.jqPathExpressions;
    json[r'jsonPointers'] = this.jsonPointers;
    json[r'kind'] = this.kind;
    json[r'managedFieldsManagers'] = this.managedFieldsManagers;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner(
        group: mapValueOfType<String>(json, r'group'),
        jqPathExpressions: json[r'jqPathExpressions'] is Iterable
            ? (json[r'jqPathExpressions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        jsonPointers: json[r'jsonPointers'] is Iterable
            ? (json[r'jsonPointers'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        kind: mapValueOfType<String>(json, r'kind')!,
        managedFieldsManagers: json[r'managedFieldsManagers'] is Iterable
            ? (json[r'managedFieldsManagers'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        name: mapValueOfType<String>(json, r'name'),
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationSpecIgnoreDifferencesInner
            .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'kind',
  };
}
