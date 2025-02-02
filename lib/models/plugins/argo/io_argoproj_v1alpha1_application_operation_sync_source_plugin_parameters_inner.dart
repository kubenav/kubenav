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

class IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner] instance.
  IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner({
    this.array = const [],
    this.map = const {},
    this.name,
    this.string,
  });

  /// Array is the value of an array type parameter.
  List<String> array;

  /// Map is the value of a map type parameter.
  Map<String, String> map;

  /// Name is the name identifying a parameter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// String_ is the value of a string type parameter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? string;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner &&
          deepEquality.equals(other.array, array) &&
          deepEquality.equals(other.map, map) &&
          other.name == name &&
          other.string == string;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (array.hashCode) +
      (map.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (string == null ? 0 : string!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner[array=$array, map=$map, name=$name, string=$string]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'array'] = this.array;
    json[r'map'] = this.map;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.string != null) {
      json[r'string'] = this.string;
    } else {
      json[r'string'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner(
        array: json[r'array'] is Iterable
            ? (json[r'array'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        map: mapCastOfType<String, String>(json, r'map') ?? const {},
        name: mapValueOfType<String>(json, r'name'),
        string: mapValueOfType<String>(json, r'string'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationSyncSourcePluginParametersInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
