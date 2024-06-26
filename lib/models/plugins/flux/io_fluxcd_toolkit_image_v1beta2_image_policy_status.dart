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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';

class IoFluxcdToolkitImageV1beta2ImagePolicyStatus {
  /// Returns a new [IoFluxcdToolkitImageV1beta2ImagePolicyStatus] instance.
  IoFluxcdToolkitImageV1beta2ImagePolicyStatus({
    this.conditions = const [],
    this.latestImage,
    this.observedGeneration,
    this.observedPreviousImage,
  });

  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// LatestImage gives the first in the list of images scanned by the image repository, when filtered and ordered according to the policy.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? latestImage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// ObservedPreviousImage is the observed previous LatestImage. It is used to keep track of the previous and current images.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedPreviousImage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta2ImagePolicyStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.latestImage == latestImage &&
          other.observedGeneration == observedGeneration &&
          other.observedPreviousImage == observedPreviousImage;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (latestImage == null ? 0 : latestImage!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedPreviousImage == null ? 0 : observedPreviousImage!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta2ImagePolicyStatus[conditions=$conditions, latestImage=$latestImage, observedGeneration=$observedGeneration, observedPreviousImage=$observedPreviousImage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.latestImage != null) {
      json[r'latestImage'] = this.latestImage;
    } else {
      json[r'latestImage'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.observedPreviousImage != null) {
      json[r'observedPreviousImage'] = this.observedPreviousImage;
    } else {
      json[r'observedPreviousImage'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta2ImagePolicyStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta2ImagePolicyStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta2ImagePolicyStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta2ImagePolicyStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta2ImagePolicyStatus(
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        latestImage: mapValueOfType<String>(json, r'latestImage'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedPreviousImage:
            mapValueOfType<String>(json, r'observedPreviousImage'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta2ImagePolicyStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta2ImagePolicyStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta2ImagePolicyStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta2ImagePolicyStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitImageV1beta2ImagePolicyStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta2ImagePolicyStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta2ImagePolicyStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta2ImagePolicyStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitImageV1beta2ImagePolicyStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta2ImagePolicyStatus.listFromJson(
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
