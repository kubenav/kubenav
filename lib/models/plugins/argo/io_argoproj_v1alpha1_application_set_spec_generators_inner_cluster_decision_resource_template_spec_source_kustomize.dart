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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_kustomize_patches_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_source_kustomize_replicas_inner.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize({
    this.apiVersions = const [],
    this.commonAnnotations = const {},
    this.commonAnnotationsEnvsubst,
    this.commonLabels = const {},
    this.components = const [],
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.images = const [],
    this.kubeVersion,
    this.labelWithoutSelector,
    this.namePrefix,
    this.nameSuffix,
    this.namespace,
    this.patches = const [],
    this.replicas = const [],
    this.version,
  });

  List<String> apiVersions;

  Map<String, String> commonAnnotations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? commonAnnotationsEnvsubst;

  Map<String, String> commonLabels;

  List<String> components;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? forceCommonAnnotations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? forceCommonLabels;

  List<String> images;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kubeVersion;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? labelWithoutSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namePrefix;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameSuffix;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  List<IoArgoprojV1alpha1ApplicationOperationSyncSourceKustomizePatchesInner>
      patches;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomizeReplicasInner>
      replicas;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize &&
          deepEquality.equals(other.apiVersions, apiVersions) &&
          deepEquality.equals(other.commonAnnotations, commonAnnotations) &&
          other.commonAnnotationsEnvsubst == commonAnnotationsEnvsubst &&
          deepEquality.equals(other.commonLabels, commonLabels) &&
          deepEquality.equals(other.components, components) &&
          other.forceCommonAnnotations == forceCommonAnnotations &&
          other.forceCommonLabels == forceCommonLabels &&
          deepEquality.equals(other.images, images) &&
          other.kubeVersion == kubeVersion &&
          other.labelWithoutSelector == labelWithoutSelector &&
          other.namePrefix == namePrefix &&
          other.nameSuffix == nameSuffix &&
          other.namespace == namespace &&
          deepEquality.equals(other.patches, patches) &&
          deepEquality.equals(other.replicas, replicas) &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersions.hashCode) +
      (commonAnnotations.hashCode) +
      (commonAnnotationsEnvsubst == null
          ? 0
          : commonAnnotationsEnvsubst!.hashCode) +
      (commonLabels.hashCode) +
      (components.hashCode) +
      (forceCommonAnnotations == null ? 0 : forceCommonAnnotations!.hashCode) +
      (forceCommonLabels == null ? 0 : forceCommonLabels!.hashCode) +
      (images.hashCode) +
      (kubeVersion == null ? 0 : kubeVersion!.hashCode) +
      (labelWithoutSelector == null ? 0 : labelWithoutSelector!.hashCode) +
      (namePrefix == null ? 0 : namePrefix!.hashCode) +
      (nameSuffix == null ? 0 : nameSuffix!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (patches.hashCode) +
      (replicas.hashCode) +
      (version == null ? 0 : version!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize[apiVersions=$apiVersions, commonAnnotations=$commonAnnotations, commonAnnotationsEnvsubst=$commonAnnotationsEnvsubst, commonLabels=$commonLabels, components=$components, forceCommonAnnotations=$forceCommonAnnotations, forceCommonLabels=$forceCommonLabels, images=$images, kubeVersion=$kubeVersion, labelWithoutSelector=$labelWithoutSelector, namePrefix=$namePrefix, nameSuffix=$nameSuffix, namespace=$namespace, patches=$patches, replicas=$replicas, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiVersions'] = this.apiVersions;
    json[r'commonAnnotations'] = this.commonAnnotations;
    if (this.commonAnnotationsEnvsubst != null) {
      json[r'commonAnnotationsEnvsubst'] = this.commonAnnotationsEnvsubst;
    } else {
      json[r'commonAnnotationsEnvsubst'] = null;
    }
    json[r'commonLabels'] = this.commonLabels;
    json[r'components'] = this.components;
    if (this.forceCommonAnnotations != null) {
      json[r'forceCommonAnnotations'] = this.forceCommonAnnotations;
    } else {
      json[r'forceCommonAnnotations'] = null;
    }
    if (this.forceCommonLabels != null) {
      json[r'forceCommonLabels'] = this.forceCommonLabels;
    } else {
      json[r'forceCommonLabels'] = null;
    }
    json[r'images'] = this.images;
    if (this.kubeVersion != null) {
      json[r'kubeVersion'] = this.kubeVersion;
    } else {
      json[r'kubeVersion'] = null;
    }
    if (this.labelWithoutSelector != null) {
      json[r'labelWithoutSelector'] = this.labelWithoutSelector;
    } else {
      json[r'labelWithoutSelector'] = null;
    }
    if (this.namePrefix != null) {
      json[r'namePrefix'] = this.namePrefix;
    } else {
      json[r'namePrefix'] = null;
    }
    if (this.nameSuffix != null) {
      json[r'nameSuffix'] = this.nameSuffix;
    } else {
      json[r'nameSuffix'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    json[r'patches'] = this.patches;
    json[r'replicas'] = this.replicas;
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize(
        apiVersions: json[r'apiVersions'] is Iterable
            ? (json[r'apiVersions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        commonAnnotations:
            mapCastOfType<String, String>(json, r'commonAnnotations') ??
                const {},
        commonAnnotationsEnvsubst:
            mapValueOfType<bool>(json, r'commonAnnotationsEnvsubst'),
        commonLabels:
            mapCastOfType<String, String>(json, r'commonLabels') ?? const {},
        components: json[r'components'] is Iterable
            ? (json[r'components'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        forceCommonAnnotations:
            mapValueOfType<bool>(json, r'forceCommonAnnotations'),
        forceCommonLabels: mapValueOfType<bool>(json, r'forceCommonLabels'),
        images: json[r'images'] is Iterable
            ? (json[r'images'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        kubeVersion: mapValueOfType<String>(json, r'kubeVersion'),
        labelWithoutSelector:
            mapValueOfType<bool>(json, r'labelWithoutSelector'),
        namePrefix: mapValueOfType<String>(json, r'namePrefix'),
        nameSuffix: mapValueOfType<String>(json, r'nameSuffix'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        patches:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceKustomizePatchesInner
                .listFromJson(json[r'patches']),
        replicas:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomizeReplicasInner
                .listFromJson(json[r'replicas']),
        version: mapValueOfType<String>(json, r'version'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceKustomize
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
