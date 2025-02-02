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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_source_helm_file_parameters_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template_spec_source_helm_parameters_inner.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm({
    this.apiVersions = const [],
    this.fileParameters = const [],
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters = const [],
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.valueFiles = const [],
    this.values,
    this.valuesObject,
    this.version,
  });

  List<String> apiVersions;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelmFileParametersInner>
      fileParameters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreMissingValueFiles;

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
  String? namespace;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelmParametersInner>
      parameters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? passCredentials;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? releaseName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? skipCrds;

  List<String> valueFiles;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? values;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? valuesObject;

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
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm &&
          deepEquality.equals(other.apiVersions, apiVersions) &&
          deepEquality.equals(other.fileParameters, fileParameters) &&
          other.ignoreMissingValueFiles == ignoreMissingValueFiles &&
          other.kubeVersion == kubeVersion &&
          other.namespace == namespace &&
          deepEquality.equals(other.parameters, parameters) &&
          other.passCredentials == passCredentials &&
          other.releaseName == releaseName &&
          other.skipCrds == skipCrds &&
          deepEquality.equals(other.valueFiles, valueFiles) &&
          other.values == values &&
          other.valuesObject == valuesObject &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersions.hashCode) +
      (fileParameters.hashCode) +
      (ignoreMissingValueFiles == null
          ? 0
          : ignoreMissingValueFiles!.hashCode) +
      (kubeVersion == null ? 0 : kubeVersion!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (parameters.hashCode) +
      (passCredentials == null ? 0 : passCredentials!.hashCode) +
      (releaseName == null ? 0 : releaseName!.hashCode) +
      (skipCrds == null ? 0 : skipCrds!.hashCode) +
      (valueFiles.hashCode) +
      (values == null ? 0 : values!.hashCode) +
      (valuesObject == null ? 0 : valuesObject!.hashCode) +
      (version == null ? 0 : version!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm[apiVersions=$apiVersions, fileParameters=$fileParameters, ignoreMissingValueFiles=$ignoreMissingValueFiles, kubeVersion=$kubeVersion, namespace=$namespace, parameters=$parameters, passCredentials=$passCredentials, releaseName=$releaseName, skipCrds=$skipCrds, valueFiles=$valueFiles, values=$values, valuesObject=$valuesObject, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiVersions'] = this.apiVersions;
    json[r'fileParameters'] = this.fileParameters;
    if (this.ignoreMissingValueFiles != null) {
      json[r'ignoreMissingValueFiles'] = this.ignoreMissingValueFiles;
    } else {
      json[r'ignoreMissingValueFiles'] = null;
    }
    if (this.kubeVersion != null) {
      json[r'kubeVersion'] = this.kubeVersion;
    } else {
      json[r'kubeVersion'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    json[r'parameters'] = this.parameters;
    if (this.passCredentials != null) {
      json[r'passCredentials'] = this.passCredentials;
    } else {
      json[r'passCredentials'] = null;
    }
    if (this.releaseName != null) {
      json[r'releaseName'] = this.releaseName;
    } else {
      json[r'releaseName'] = null;
    }
    if (this.skipCrds != null) {
      json[r'skipCrds'] = this.skipCrds;
    } else {
      json[r'skipCrds'] = null;
    }
    json[r'valueFiles'] = this.valueFiles;
    if (this.values != null) {
      json[r'values'] = this.values;
    } else {
      json[r'values'] = null;
    }
    if (this.valuesObject != null) {
      json[r'valuesObject'] = this.valuesObject;
    } else {
      json[r'valuesObject'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm(
        apiVersions: json[r'apiVersions'] is Iterable
            ? (json[r'apiVersions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        fileParameters:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelmFileParametersInner
                .listFromJson(json[r'fileParameters']),
        ignoreMissingValueFiles:
            mapValueOfType<bool>(json, r'ignoreMissingValueFiles'),
        kubeVersion: mapValueOfType<String>(json, r'kubeVersion'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        parameters:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelmParametersInner
                .listFromJson(json[r'parameters']),
        passCredentials: mapValueOfType<bool>(json, r'passCredentials'),
        releaseName: mapValueOfType<String>(json, r'releaseName'),
        skipCrds: mapValueOfType<bool>(json, r'skipCrds'),
        valueFiles: json[r'valueFiles'] is Iterable
            ? (json[r'valueFiles'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        values: mapValueOfType<String>(json, r'values'),
        valuesObject: mapValueOfType<Object>(json, r'valuesObject'),
        version: mapValueOfType<String>(json, r'version'),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplateSpecSourceHelm
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
