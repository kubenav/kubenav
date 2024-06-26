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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_policy_alphabetical.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_policy_numerical.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_policy_semver.dart';

class IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy] instance.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy({
    this.alphabetical,
    this.numerical,
    this.semver,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical? alphabetical;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyNumerical? numerical;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver? semver;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy &&
          other.alphabetical == alphabetical &&
          other.numerical == numerical &&
          other.semver == semver;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (alphabetical == null ? 0 : alphabetical!.hashCode) +
      (numerical == null ? 0 : numerical!.hashCode) +
      (semver == null ? 0 : semver!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy[alphabetical=$alphabetical, numerical=$numerical, semver=$semver]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.alphabetical != null) {
      json[r'alphabetical'] = this.alphabetical;
    } else {
      json[r'alphabetical'] = null;
    }
    if (this.numerical != null) {
      json[r'numerical'] = this.numerical;
    } else {
      json[r'numerical'] = null;
    }
    if (this.semver != null) {
      json[r'semver'] = this.semver;
    } else {
      json[r'semver'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy(
        alphabetical:
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical
                .fromJson(json[r'alphabetical']),
        numerical:
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyNumerical.fromJson(
                json[r'numerical']),
        semver: IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicySemver.fromJson(
            json[r'semver']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy.listFromJson(
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
