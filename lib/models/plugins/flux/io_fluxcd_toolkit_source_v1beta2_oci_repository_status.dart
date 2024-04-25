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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_status_conditions_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_status_artifact.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_status_observed_layer_selector.dart';

class IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus] instance.
  IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus({
    this.artifact,
    this.conditions = const [],
    this.contentConfigChecksum,
    this.lastHandledReconcileAt,
    this.observedGeneration,
    this.observedIgnore,
    this.observedLayerSelector,
    this.url,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositoryStatusArtifact? artifact;

  /// Conditions holds the conditions for the OCIRepository.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner> conditions;

  /// ContentConfigChecksum is a checksum of all the configurations related to the content of the source artifact: - .spec.ignore - .spec.layerSelector observed in .status.observedGeneration version of the object. This can be used to determine if the content configuration has changed and the artifact needs to be rebuilt. It has the format of `<algo>:<checksum>`, for example: `sha256:<checksum>`.   Deprecated: Replaced with explicit fields for observed artifact content config in the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? contentConfigChecksum;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// ObservedGeneration is the last observed generation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// ObservedIgnore is the observed exclusion patterns used for constructing the source artifact.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedIgnore;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositoryStatusObservedLayerSelector?
      observedLayerSelector;

  /// URL is the download link for the artifact output of the last OCI Repository sync.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus &&
          other.artifact == artifact &&
          deepEquality.equals(other.conditions, conditions) &&
          other.contentConfigChecksum == contentConfigChecksum &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.observedGeneration == observedGeneration &&
          other.observedIgnore == observedIgnore &&
          other.observedLayerSelector == observedLayerSelector &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (artifact == null ? 0 : artifact!.hashCode) +
      (conditions.hashCode) +
      (contentConfigChecksum == null ? 0 : contentConfigChecksum!.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedIgnore == null ? 0 : observedIgnore!.hashCode) +
      (observedLayerSelector == null ? 0 : observedLayerSelector!.hashCode) +
      (url == null ? 0 : url!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus[artifact=$artifact, conditions=$conditions, contentConfigChecksum=$contentConfigChecksum, lastHandledReconcileAt=$lastHandledReconcileAt, observedGeneration=$observedGeneration, observedIgnore=$observedIgnore, observedLayerSelector=$observedLayerSelector, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.artifact != null) {
      json[r'artifact'] = this.artifact;
    } else {
      json[r'artifact'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.contentConfigChecksum != null) {
      json[r'contentConfigChecksum'] = this.contentConfigChecksum;
    } else {
      json[r'contentConfigChecksum'] = null;
    }
    if (this.lastHandledReconcileAt != null) {
      json[r'lastHandledReconcileAt'] = this.lastHandledReconcileAt;
    } else {
      json[r'lastHandledReconcileAt'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.observedIgnore != null) {
      json[r'observedIgnore'] = this.observedIgnore;
    } else {
      json[r'observedIgnore'] = null;
    }
    if (this.observedLayerSelector != null) {
      json[r'observedLayerSelector'] = this.observedLayerSelector;
    } else {
      json[r'observedLayerSelector'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus(
        artifact:
            IoFluxcdToolkitSourceV1beta2OCIRepositoryStatusArtifact.fromJson(
                json[r'artifact']),
        conditions: IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner
            .listFromJson(json[r'conditions']),
        contentConfigChecksum:
            mapValueOfType<String>(json, r'contentConfigChecksum'),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedIgnore: mapValueOfType<String>(json, r'observedIgnore'),
        observedLayerSelector:
            IoFluxcdToolkitSourceV1beta2OCIRepositoryStatusObservedLayerSelector
                .fromJson(json[r'observedLayerSelector']),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2OCIRepositoryStatus.listFromJson(
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
