//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_rollout_status_canary_weights_additional_inner.dart';

class IoArgoprojV1alpha1RolloutStatusCanaryWeights {
  /// Returns a new [IoArgoprojV1alpha1RolloutStatusCanaryWeights] instance.
  IoArgoprojV1alpha1RolloutStatusCanaryWeights({
    this.additional = const [],
    required this.canary,
    required this.stable,
    this.verified,
  });

  List<IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner> additional;

  IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner canary;

  IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner stable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? verified;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1RolloutStatusCanaryWeights &&
          deepEquality.equals(other.additional, additional) &&
          other.canary == canary &&
          other.stable == stable &&
          other.verified == verified;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (additional.hashCode) +
      (canary.hashCode) +
      (stable.hashCode) +
      (verified == null ? 0 : verified!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1RolloutStatusCanaryWeights[additional=$additional, canary=$canary, stable=$stable, verified=$verified]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'additional'] = this.additional;
    json[r'canary'] = this.canary;
    json[r'stable'] = this.stable;
    if (this.verified != null) {
      json[r'verified'] = this.verified;
    } else {
      json[r'verified'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1RolloutStatusCanaryWeights] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1RolloutStatusCanaryWeights? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1RolloutStatusCanaryWeights[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1RolloutStatusCanaryWeights[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1RolloutStatusCanaryWeights(
        additional: IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner
            .listFromJson(json[r'additional']),
        canary: IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner
            .fromJson(json[r'canary'])!,
        stable: IoArgoprojV1alpha1RolloutStatusCanaryWeightsAdditionalInner
            .fromJson(json[r'stable'])!,
        verified: mapValueOfType<bool>(json, r'verified'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1RolloutStatusCanaryWeights> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1RolloutStatusCanaryWeights>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1RolloutStatusCanaryWeights.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1RolloutStatusCanaryWeights> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1RolloutStatusCanaryWeights>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1RolloutStatusCanaryWeights.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1RolloutStatusCanaryWeights-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1RolloutStatusCanaryWeights>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1RolloutStatusCanaryWeights>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1RolloutStatusCanaryWeights.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'canary',
    'stable',
  };
}
