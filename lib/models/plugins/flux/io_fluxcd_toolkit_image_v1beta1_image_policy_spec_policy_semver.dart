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

class IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver] instance.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver({
    required this.range,
  });

  /// Range gives a semver range for the image tag; the highest version within the range that's a tag yields the latest image.
  String range;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver &&
          other.range == range;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (range.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver[range=$range]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'range'] = this.range;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver(
        range: mapValueOfType<String>(json, r'range')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'range',
  };
}
