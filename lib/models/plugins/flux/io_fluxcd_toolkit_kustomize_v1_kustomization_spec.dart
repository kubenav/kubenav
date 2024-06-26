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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_depends_on_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_post_renderers_inner_kustomize_images_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_post_renderers_inner_kustomize_patches_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_common_metadata.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_decryption.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_health_checks_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_kube_config.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_post_build.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_spec_source_ref.dart';

class IoFluxcdToolkitKustomizeV1KustomizationSpec {
  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpec] instance.
  IoFluxcdToolkitKustomizeV1KustomizationSpec({
    this.commonMetadata,
    this.components = const [],
    this.decryption,
    this.dependsOn = const [],
    this.force,
    this.healthChecks = const [],
    this.images = const [],
    required this.interval,
    this.kubeConfig,
    this.namePrefix,
    this.nameSuffix,
    this.patches = const [],
    this.path,
    this.postBuild,
    required this.prune,
    this.retryInterval,
    this.serviceAccountName,
    required this.sourceRef,
    this.suspend,
    this.targetNamespace,
    this.timeout,
    this.wait,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1KustomizationSpecCommonMetadata? commonMetadata;

  /// Components specifies relative paths to specifications of other Components.
  List<String> components;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption? decryption;

  /// DependsOn may contain a meta.NamespacedObjectReference slice with references to Kustomization resources that must be ready before this Kustomization can be reconciled.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecDependsOnInner> dependsOn;

  /// Force instructs the controller to recreate resources when patching fails due to an immutable field change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? force;

  /// A list of resources to be included in the health assessment.
  List<IoFluxcdToolkitKustomizeV1KustomizationSpecHealthChecksInner>
      healthChecks;

  /// Images is a list of (image name, new name, new tag or digest) for changing image names, tags or digests. This can also be achieved with a patch, but this operator is simpler to specify.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizeImagesInner>
      images;

  /// The interval at which to reconcile the Kustomization. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  String interval;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1KustomizationSpecKubeConfig? kubeConfig;

  /// NamePrefix will prefix the names of all managed resources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namePrefix;

  /// NameSuffix will suffix the names of all managed resources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameSuffix;

  /// Strategic merge and JSON patches, defined as inline YAML objects, capable of targeting objects based on kind, label and annotation selectors.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizePatchesInner>
      patches;

  /// Path to the directory containing the kustomization.yaml file, or the set of plain YAMLs a kustomization.yaml should be generated for. Defaults to 'None', which translates to the root path of the SourceRef.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitKustomizeV1KustomizationSpecPostBuild? postBuild;

  /// Prune enables garbage collection.
  bool prune;

  /// The interval at which to retry a previously failed reconciliation. When not specified, the controller uses the KustomizationSpec.Interval value to retry failures.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? retryInterval;

  /// The name of the Kubernetes service account to impersonate when reconciling this Kustomization.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef sourceRef;

  /// This flag tells the controller to suspend subsequent kustomize executions, it does not apply to already started executions. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// TargetNamespace sets or overrides the namespace in the kustomization.yaml file.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetNamespace;

  /// Timeout for validation, apply and health checking operations. Defaults to 'Interval' duration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// Wait instructs the controller to check the health of all the reconciled resources. When enabled, the HealthChecks are ignored. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? wait;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1KustomizationSpec &&
          other.commonMetadata == commonMetadata &&
          deepEquality.equals(other.components, components) &&
          other.decryption == decryption &&
          deepEquality.equals(other.dependsOn, dependsOn) &&
          other.force == force &&
          deepEquality.equals(other.healthChecks, healthChecks) &&
          deepEquality.equals(other.images, images) &&
          other.interval == interval &&
          other.kubeConfig == kubeConfig &&
          other.namePrefix == namePrefix &&
          other.nameSuffix == nameSuffix &&
          deepEquality.equals(other.patches, patches) &&
          other.path == path &&
          other.postBuild == postBuild &&
          other.prune == prune &&
          other.retryInterval == retryInterval &&
          other.serviceAccountName == serviceAccountName &&
          other.sourceRef == sourceRef &&
          other.suspend == suspend &&
          other.targetNamespace == targetNamespace &&
          other.timeout == timeout &&
          other.wait == wait;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (commonMetadata == null ? 0 : commonMetadata!.hashCode) +
      (components.hashCode) +
      (decryption == null ? 0 : decryption!.hashCode) +
      (dependsOn.hashCode) +
      (force == null ? 0 : force!.hashCode) +
      (healthChecks.hashCode) +
      (images.hashCode) +
      (interval.hashCode) +
      (kubeConfig == null ? 0 : kubeConfig!.hashCode) +
      (namePrefix == null ? 0 : namePrefix!.hashCode) +
      (nameSuffix == null ? 0 : nameSuffix!.hashCode) +
      (patches.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (postBuild == null ? 0 : postBuild!.hashCode) +
      (prune.hashCode) +
      (retryInterval == null ? 0 : retryInterval!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (sourceRef.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (targetNamespace == null ? 0 : targetNamespace!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (wait == null ? 0 : wait!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1KustomizationSpec[commonMetadata=$commonMetadata, components=$components, decryption=$decryption, dependsOn=$dependsOn, force=$force, healthChecks=$healthChecks, images=$images, interval=$interval, kubeConfig=$kubeConfig, namePrefix=$namePrefix, nameSuffix=$nameSuffix, patches=$patches, path=$path, postBuild=$postBuild, prune=$prune, retryInterval=$retryInterval, serviceAccountName=$serviceAccountName, sourceRef=$sourceRef, suspend=$suspend, targetNamespace=$targetNamespace, timeout=$timeout, wait=$wait]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.commonMetadata != null) {
      json[r'commonMetadata'] = this.commonMetadata;
    } else {
      json[r'commonMetadata'] = null;
    }
    json[r'components'] = this.components;
    if (this.decryption != null) {
      json[r'decryption'] = this.decryption;
    } else {
      json[r'decryption'] = null;
    }
    json[r'dependsOn'] = this.dependsOn;
    if (this.force != null) {
      json[r'force'] = this.force;
    } else {
      json[r'force'] = null;
    }
    json[r'healthChecks'] = this.healthChecks;
    json[r'images'] = this.images;
    json[r'interval'] = this.interval;
    if (this.kubeConfig != null) {
      json[r'kubeConfig'] = this.kubeConfig;
    } else {
      json[r'kubeConfig'] = null;
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
    json[r'patches'] = this.patches;
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.postBuild != null) {
      json[r'postBuild'] = this.postBuild;
    } else {
      json[r'postBuild'] = null;
    }
    json[r'prune'] = this.prune;
    if (this.retryInterval != null) {
      json[r'retryInterval'] = this.retryInterval;
    } else {
      json[r'retryInterval'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
    }
    json[r'sourceRef'] = this.sourceRef;
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.targetNamespace != null) {
      json[r'targetNamespace'] = this.targetNamespace;
    } else {
      json[r'targetNamespace'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    if (this.wait != null) {
      json[r'wait'] = this.wait;
    } else {
      json[r'wait'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1KustomizationSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1KustomizationSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1KustomizationSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1KustomizationSpec(
        commonMetadata:
            IoFluxcdToolkitKustomizeV1KustomizationSpecCommonMetadata.fromJson(
                json[r'commonMetadata']),
        components: json[r'components'] is Iterable
            ? (json[r'components'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        decryption:
            IoFluxcdToolkitKustomizeV1KustomizationSpecDecryption.fromJson(
                json[r'decryption']),
        dependsOn:
            IoFluxcdToolkitHelmV2HelmReleaseSpecDependsOnInner.listFromJson(
                json[r'dependsOn']),
        force: mapValueOfType<bool>(json, r'force'),
        healthChecks:
            IoFluxcdToolkitKustomizeV1KustomizationSpecHealthChecksInner
                .listFromJson(json[r'healthChecks']),
        images:
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizeImagesInner
                .listFromJson(json[r'images']),
        interval: mapValueOfType<String>(json, r'interval')!,
        kubeConfig:
            IoFluxcdToolkitKustomizeV1KustomizationSpecKubeConfig.fromJson(
                json[r'kubeConfig']),
        namePrefix: mapValueOfType<String>(json, r'namePrefix'),
        nameSuffix: mapValueOfType<String>(json, r'nameSuffix'),
        patches:
            IoFluxcdToolkitHelmV2HelmReleaseSpecPostRenderersInnerKustomizePatchesInner
                .listFromJson(json[r'patches']),
        path: mapValueOfType<String>(json, r'path'),
        postBuild:
            IoFluxcdToolkitKustomizeV1KustomizationSpecPostBuild.fromJson(
                json[r'postBuild']),
        prune: mapValueOfType<bool>(json, r'prune')!,
        retryInterval: mapValueOfType<String>(json, r'retryInterval'),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        sourceRef:
            IoFluxcdToolkitKustomizeV1KustomizationSpecSourceRef.fromJson(
                json[r'sourceRef'])!,
        suspend: mapValueOfType<bool>(json, r'suspend'),
        targetNamespace: mapValueOfType<String>(json, r'targetNamespace'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        wait: mapValueOfType<bool>(json, r'wait'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitKustomizeV1KustomizationSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitKustomizeV1KustomizationSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitKustomizeV1KustomizationSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitKustomizeV1KustomizationSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitKustomizeV1KustomizationSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1KustomizationSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1KustomizationSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitKustomizeV1KustomizationSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitKustomizeV1KustomizationSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1KustomizationSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'interval',
    'prune',
    'sourceRef',
  };
}
