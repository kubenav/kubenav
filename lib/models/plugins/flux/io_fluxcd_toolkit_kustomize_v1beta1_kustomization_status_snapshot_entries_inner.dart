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

class IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner {
  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner] instance.
  IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner({
    this.kinds = const {},
    this.namespace,
  });

  /// The list of Kubernetes kinds.
  Map<String, String> kinds;

  /// The namespace of this entry.
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
      other is IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner &&
          deepEquality.equals(other.kinds, kinds) &&
          other.namespace == namespace;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kinds.hashCode) + (namespace == null ? 0 : namespace!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner[kinds=$kinds, namespace=$namespace]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kinds'] = this.kinds;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner(
        kinds: mapCastOfType<String, String>(json, r'kinds')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1beta1KustomizationStatusSnapshotEntriesInner
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
    'kinds',
  };
}
