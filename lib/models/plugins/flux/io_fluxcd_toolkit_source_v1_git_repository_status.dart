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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_include_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_status_artifact.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_status_included_artifacts_inner.dart';

class IoFluxcdToolkitSourceV1GitRepositoryStatus {
  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositoryStatus] instance.
  IoFluxcdToolkitSourceV1GitRepositoryStatus({
    this.artifact,
    this.conditions = const [],
    this.includedArtifacts = const [],
    this.lastHandledReconcileAt,
    this.observedGeneration,
    this.observedIgnore,
    this.observedInclude = const [],
    this.observedRecurseSubmodules,
    this.sourceVerificationMode,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1GitRepositoryStatusArtifact? artifact;

  /// Conditions holds the conditions for the GitRepository.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner> conditions;

  /// IncludedArtifacts contains a list of the last successfully included Artifacts as instructed by GitRepositorySpec.Include.
  List<IoFluxcdToolkitSourceV1GitRepositoryStatusIncludedArtifactsInner>
      includedArtifacts;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// ObservedGeneration is the last observed generation of the GitRepository object.
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

  /// ObservedInclude is the observed list of GitRepository resources used to produce the current Artifact.
  List<IoFluxcdToolkitSourceV1GitRepositorySpecIncludeInner> observedInclude;

  /// ObservedRecurseSubmodules is the observed resource submodules configuration used to produce the current Artifact.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? observedRecurseSubmodules;

  /// SourceVerificationMode is the last used verification mode indicating which Git object(s) have been verified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sourceVerificationMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1GitRepositoryStatus &&
          other.artifact == artifact &&
          deepEquality.equals(other.conditions, conditions) &&
          deepEquality.equals(other.includedArtifacts, includedArtifacts) &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.observedGeneration == observedGeneration &&
          other.observedIgnore == observedIgnore &&
          deepEquality.equals(other.observedInclude, observedInclude) &&
          other.observedRecurseSubmodules == observedRecurseSubmodules &&
          other.sourceVerificationMode == sourceVerificationMode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (artifact == null ? 0 : artifact!.hashCode) +
      (conditions.hashCode) +
      (includedArtifacts.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedIgnore == null ? 0 : observedIgnore!.hashCode) +
      (observedInclude.hashCode) +
      (observedRecurseSubmodules == null
          ? 0
          : observedRecurseSubmodules!.hashCode) +
      (sourceVerificationMode == null ? 0 : sourceVerificationMode!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1GitRepositoryStatus[artifact=$artifact, conditions=$conditions, includedArtifacts=$includedArtifacts, lastHandledReconcileAt=$lastHandledReconcileAt, observedGeneration=$observedGeneration, observedIgnore=$observedIgnore, observedInclude=$observedInclude, observedRecurseSubmodules=$observedRecurseSubmodules, sourceVerificationMode=$sourceVerificationMode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.artifact != null) {
      json[r'artifact'] = this.artifact;
    } else {
      json[r'artifact'] = null;
    }
    json[r'conditions'] = this.conditions;
    json[r'includedArtifacts'] = this.includedArtifacts;
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
    json[r'observedInclude'] = this.observedInclude;
    if (this.observedRecurseSubmodules != null) {
      json[r'observedRecurseSubmodules'] = this.observedRecurseSubmodules;
    } else {
      json[r'observedRecurseSubmodules'] = null;
    }
    if (this.sourceVerificationMode != null) {
      json[r'sourceVerificationMode'] = this.sourceVerificationMode;
    } else {
      json[r'sourceVerificationMode'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositoryStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1GitRepositoryStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1GitRepositoryStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1GitRepositoryStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1GitRepositoryStatus(
        artifact: IoFluxcdToolkitSourceV1GitRepositoryStatusArtifact.fromJson(
            json[r'artifact']),
        conditions: IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner
            .listFromJson(json[r'conditions']),
        includedArtifacts:
            IoFluxcdToolkitSourceV1GitRepositoryStatusIncludedArtifactsInner
                .listFromJson(json[r'includedArtifacts']),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedIgnore: mapValueOfType<String>(json, r'observedIgnore'),
        observedInclude:
            IoFluxcdToolkitSourceV1GitRepositorySpecIncludeInner.listFromJson(
                json[r'observedInclude']),
        observedRecurseSubmodules:
            mapValueOfType<bool>(json, r'observedRecurseSubmodules'),
        sourceVerificationMode:
            mapValueOfType<String>(json, r'sourceVerificationMode'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1GitRepositoryStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1GitRepositoryStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1GitRepositoryStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1GitRepositoryStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1GitRepositoryStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1GitRepositoryStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1GitRepositoryStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1GitRepositoryStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1GitRepositoryStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1GitRepositoryStatus.listFromJson(
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
