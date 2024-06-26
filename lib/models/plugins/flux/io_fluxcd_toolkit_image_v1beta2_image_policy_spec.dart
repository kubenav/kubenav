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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_filter_tags.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_image_repository_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_policy_spec_policy.dart';

class IoFluxcdToolkitImageV1beta2ImagePolicySpec {
  /// Returns a new [IoFluxcdToolkitImageV1beta2ImagePolicySpec] instance.
  IoFluxcdToolkitImageV1beta2ImagePolicySpec({
    this.filterTags,
    required this.imageRepositoryRef,
    required this.policy,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags? filterTags;

  IoFluxcdToolkitImageV1beta1ImagePolicySpecImageRepositoryRef
      imageRepositoryRef;

  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy policy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta2ImagePolicySpec &&
          other.filterTags == filterTags &&
          other.imageRepositoryRef == imageRepositoryRef &&
          other.policy == policy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (filterTags == null ? 0 : filterTags!.hashCode) +
      (imageRepositoryRef.hashCode) +
      (policy.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta2ImagePolicySpec[filterTags=$filterTags, imageRepositoryRef=$imageRepositoryRef, policy=$policy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.filterTags != null) {
      json[r'filterTags'] = this.filterTags;
    } else {
      json[r'filterTags'] = null;
    }
    json[r'imageRepositoryRef'] = this.imageRepositoryRef;
    json[r'policy'] = this.policy;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta2ImagePolicySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta2ImagePolicySpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta2ImagePolicySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta2ImagePolicySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta2ImagePolicySpec(
        filterTags:
            IoFluxcdToolkitImageV1beta1ImagePolicySpecFilterTags.fromJson(
                json[r'filterTags']),
        imageRepositoryRef:
            IoFluxcdToolkitImageV1beta1ImagePolicySpecImageRepositoryRef
                .fromJson(json[r'imageRepositoryRef'])!,
        policy: IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicy.fromJson(
            json[r'policy'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta2ImagePolicySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta2ImagePolicySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitImageV1beta2ImagePolicySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta2ImagePolicySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitImageV1beta2ImagePolicySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta2ImagePolicySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta2ImagePolicySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta2ImagePolicySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitImageV1beta2ImagePolicySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta2ImagePolicySpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'imageRepositoryRef',
    'policy',
  };
}
