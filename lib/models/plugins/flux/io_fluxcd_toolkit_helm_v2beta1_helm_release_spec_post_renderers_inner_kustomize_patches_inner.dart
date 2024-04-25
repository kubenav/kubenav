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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_post_renderers_inner_kustomize_patches_inner_target.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner({
    required this.patch_,
    this.target,
  });

  /// Patch contains an inline StrategicMerge patch or an inline JSON6902 patch with an array of operation objects.
  String patch_;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInnerTarget?
      target;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner &&
          other.patch_ == patch_ &&
          other.target == target;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (patch_.hashCode) + (target == null ? 0 : target!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner[patch_=$patch_, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'patch'] = this.patch_;
    if (this.target != null) {
      json[r'target'] = this.target;
    } else {
      json[r'target'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner(
        patch_: mapValueOfType<String>(json, r'patch')!,
        target:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInnerTarget
                .fromJson(json[r'target']),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizePatchesInner
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
    'patch',
  };
}
