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

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner({
    this.digest,
    required this.name,
    this.newName,
    this.newTag,
  });

  /// Digest is the value used to replace the original image tag. If digest is present NewTag value is ignored.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? digest;

  /// Name is a tag-less image name.
  String name;

  /// NewName is the value used to replace the original name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newName;

  /// NewTag is the value used to replace the original tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? newTag;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner &&
          other.digest == digest &&
          other.name == name &&
          other.newName == newName &&
          other.newTag == newTag;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (digest == null ? 0 : digest!.hashCode) +
      (name.hashCode) +
      (newName == null ? 0 : newName!.hashCode) +
      (newTag == null ? 0 : newTag!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner[digest=$digest, name=$name, newName=$newName, newTag=$newTag]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.digest != null) {
      json[r'digest'] = this.digest;
    } else {
      json[r'digest'] = null;
    }
    json[r'name'] = this.name;
    if (this.newName != null) {
      json[r'newName'] = this.newName;
    } else {
      json[r'newName'] = null;
    }
    if (this.newTag != null) {
      json[r'newTag'] = this.newTag;
    } else {
      json[r'newTag'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner(
        digest: mapValueOfType<String>(json, r'digest'),
        name: mapValueOfType<String>(json, r'name')!,
        newName: mapValueOfType<String>(json, r'newName'),
        newTag: mapValueOfType<String>(json, r'newTag'),
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecPostRenderersInnerKustomizeImagesInner
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
    'name',
  };
}
