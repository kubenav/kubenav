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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_helm_chart_status_artifact.dart';

class IoFluxcdToolkitSourceV1HelmChartStatus {
  /// Returns a new [IoFluxcdToolkitSourceV1HelmChartStatus] instance.
  IoFluxcdToolkitSourceV1HelmChartStatus({
    this.artifact,
    this.conditions = const [],
    this.lastHandledReconcileAt,
    this.observedChartName,
    this.observedGeneration,
    this.observedSourceArtifactRevision,
    this.observedValuesFiles = const [],
    this.url,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmChartStatusArtifact? artifact;

  /// Conditions holds the conditions for the HelmChart.
  List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  /// LastHandledReconcileAt holds the value of the most recent reconcile request value, so a change of the annotation value can be detected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastHandledReconcileAt;

  /// ObservedChartName is the last observed chart name as specified by the resolved chart reference.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedChartName;

  /// ObservedGeneration is the last observed generation of the HelmChart object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// ObservedSourceArtifactRevision is the last observed Artifact.Revision of the HelmChartSpec.SourceRef.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? observedSourceArtifactRevision;

  /// ObservedValuesFiles are the observed value files of the last successful reconciliation. It matches the chart in the last successfully reconciled artifact.
  List<String> observedValuesFiles;

  /// URL is the dynamic fetch link for the latest Artifact. It is provided on a \"best effort\" basis, and using the precise BucketStatus.Artifact data is recommended.
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
      other is IoFluxcdToolkitSourceV1HelmChartStatus &&
          other.artifact == artifact &&
          deepEquality.equals(other.conditions, conditions) &&
          other.lastHandledReconcileAt == lastHandledReconcileAt &&
          other.observedChartName == observedChartName &&
          other.observedGeneration == observedGeneration &&
          other.observedSourceArtifactRevision ==
              observedSourceArtifactRevision &&
          deepEquality.equals(other.observedValuesFiles, observedValuesFiles) &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (artifact == null ? 0 : artifact!.hashCode) +
      (conditions.hashCode) +
      (lastHandledReconcileAt == null ? 0 : lastHandledReconcileAt!.hashCode) +
      (observedChartName == null ? 0 : observedChartName!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (observedSourceArtifactRevision == null
          ? 0
          : observedSourceArtifactRevision!.hashCode) +
      (observedValuesFiles.hashCode) +
      (url == null ? 0 : url!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1HelmChartStatus[artifact=$artifact, conditions=$conditions, lastHandledReconcileAt=$lastHandledReconcileAt, observedChartName=$observedChartName, observedGeneration=$observedGeneration, observedSourceArtifactRevision=$observedSourceArtifactRevision, observedValuesFiles=$observedValuesFiles, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.artifact != null) {
      json[r'artifact'] = this.artifact;
    } else {
      json[r'artifact'] = null;
    }
    json[r'conditions'] = this.conditions;
    if (this.lastHandledReconcileAt != null) {
      json[r'lastHandledReconcileAt'] = this.lastHandledReconcileAt;
    } else {
      json[r'lastHandledReconcileAt'] = null;
    }
    if (this.observedChartName != null) {
      json[r'observedChartName'] = this.observedChartName;
    } else {
      json[r'observedChartName'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.observedSourceArtifactRevision != null) {
      json[r'observedSourceArtifactRevision'] =
          this.observedSourceArtifactRevision;
    } else {
      json[r'observedSourceArtifactRevision'] = null;
    }
    json[r'observedValuesFiles'] = this.observedValuesFiles;
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1HelmChartStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1HelmChartStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1HelmChartStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1HelmChartStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1HelmChartStatus(
        artifact: IoFluxcdToolkitSourceV1HelmChartStatusArtifact.fromJson(
            json[r'artifact']),
        conditions: IoK8sApimachineryPkgApisMetaV1Condition.listFromJson(
            json[r'conditions']),
        lastHandledReconcileAt:
            mapValueOfType<String>(json, r'lastHandledReconcileAt'),
        observedChartName: mapValueOfType<String>(json, r'observedChartName'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        observedSourceArtifactRevision:
            mapValueOfType<String>(json, r'observedSourceArtifactRevision'),
        observedValuesFiles: json[r'observedValuesFiles'] is Iterable
            ? (json[r'observedValuesFiles'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1HelmChartStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1HelmChartStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1HelmChartStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1HelmChartStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1HelmChartStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1HelmChartStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1HelmChartStatus-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1HelmChartStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1HelmChartStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1HelmChartStatus.listFromJson(
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
