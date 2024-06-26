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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_post_renderers_inner_kustomize_images_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_post_renderers_inner_kustomize_patches_inner.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize({
    this.images = const [],
    this.patches = const [],
  });

  /// Images is a list of (image name, new name, new tag or digest) for changing image names, tags or digests. This can also be achieved with a patch, but this operator is simpler to specify.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>
      images;

  /// Strategic merge and JSON patches, defined as inline YAML objects, capable of targeting objects based on kind, label and annotation selectors.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>
      patches;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize &&
          deepEquality.equals(other.images, images) &&
          deepEquality.equals(other.patches, patches);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (images.hashCode) + (patches.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize[images=$images, patches=$patches]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'images'] = this.images;
    json[r'patches'] = this.patches;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize(
        images:
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizeImagesInner
                .listFromJson(json[r'images']),
        patches:
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizePatchesInner
                .listFromJson(json[r'patches']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomize
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
