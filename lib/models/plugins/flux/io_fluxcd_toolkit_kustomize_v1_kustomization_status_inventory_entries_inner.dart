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

class IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner {
  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner] instance.
  IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner({
    required this.id,
    required this.v,
  });

  /// ID is the string representation of the Kubernetes resource object's metadata, in the format '<namespace>_<name>_<group>_<kind>'.
  String id;

  /// Version is the API version of the Kubernetes resource object's kind.
  String v;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner &&
          other.id == id &&
          other.v == v;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (v.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner[id=$id, v=$v]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'v'] = this.v;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner(
        id: mapValueOfType<String>(json, r'id')!,
        v: mapValueOfType<String>(json, r'v')!,
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1KustomizationStatusInventoryEntriesInner
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
    'id',
    'v',
  };
}
