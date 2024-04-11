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

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale({
    this.labelSelectorPath,
    required this.specReplicasPath,
    required this.statusReplicasPath,
  });

  /// labelSelectorPath defines the JSON path inside of a custom resource that corresponds to Scale `status.selector`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status` or `.spec`. Must be set to work with HorizontalPodAutoscaler. The field pointed by this JSON path must be a string field (not a complex selector struct) which contains a serialized label selector in string form. More info: https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions#scale-subresource If there is no value under the given path in the custom resource, the `status.selector` value in the `/scale` subresource will default to the empty string.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? labelSelectorPath;

  /// specReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `spec.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.spec`. If there is no value under the given path in the custom resource, the `/scale` subresource will return an error on GET.
  String specReplicasPath;

  /// statusReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `status.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status`. If there is no value under the given path in the custom resource, the `status.replicas` value in the `/scale` subresource will default to 0.
  String statusReplicasPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale &&
          other.labelSelectorPath == labelSelectorPath &&
          other.specReplicasPath == specReplicasPath &&
          other.statusReplicasPath == statusReplicasPath;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labelSelectorPath == null ? 0 : labelSelectorPath!.hashCode) +
      (specReplicasPath.hashCode) +
      (statusReplicasPath.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale[labelSelectorPath=$labelSelectorPath, specReplicasPath=$specReplicasPath, statusReplicasPath=$statusReplicasPath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.labelSelectorPath != null) {
      json[r'labelSelectorPath'] = this.labelSelectorPath;
    } else {
      json[r'labelSelectorPath'] = null;
    }
    json[r'specReplicasPath'] = this.specReplicasPath;
    json[r'statusReplicasPath'] = this.statusReplicasPath;
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale(
        labelSelectorPath: mapValueOfType<String>(json, r'labelSelectorPath'),
        specReplicasPath: mapValueOfType<String>(json, r'specReplicasPath')!,
        statusReplicasPath:
            mapValueOfType<String>(json, r'statusReplicasPath')!,
      );
    }
    return null;
  }

  static List<
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceSubresourceScale
                .listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'specReplicasPath',
    'statusReplicasPath',
  };
}
