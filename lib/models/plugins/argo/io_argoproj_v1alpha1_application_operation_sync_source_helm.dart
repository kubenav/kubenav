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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_helm_file_parameters_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_operation_sync_source_helm_parameters_inner.dart';

class IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm {
  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm] instance.
  IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm({
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

  /// APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default, Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  List<String> apiVersions;

  /// FileParameters are file parameters to the helm template
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourceHelmFileParametersInner>
      fileParameters;

  /// IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreMissingValueFiles;

  /// KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD uses the Kubernetes version of the target cluster.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kubeVersion;

  /// Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  /// Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
  List<IoArgoprojV1alpha1ApplicationOperationSyncSourceHelmParametersInner>
      parameters;

  /// PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? passCredentials;

  /// ReleaseName is the Helm release name to use. If omitted it will use the application name
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? releaseName;

  /// SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? skipCrds;

  /// ValuesFiles is a list of Helm value files to use when generating a template
  List<String> valueFiles;

  /// Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? values;

  /// ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? valuesObject;

  /// Version is the Helm version to use for templating (\"3\")
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
      other is IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm &&
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
      'IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm[apiVersions=$apiVersions, fileParameters=$fileParameters, ignoreMissingValueFiles=$ignoreMissingValueFiles, kubeVersion=$kubeVersion, namespace=$namespace, parameters=$parameters, passCredentials=$passCredentials, releaseName=$releaseName, skipCrds=$skipCrds, valueFiles=$valueFiles, values=$values, valuesObject=$valuesObject, version=$version]';

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

  /// Returns a new [IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm(
        apiVersions: json[r'apiVersions'] is Iterable
            ? (json[r'apiVersions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        fileParameters:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceHelmFileParametersInner
                .listFromJson(json[r'fileParameters']),
        ignoreMissingValueFiles:
            mapValueOfType<bool>(json, r'ignoreMissingValueFiles'),
        kubeVersion: mapValueOfType<String>(json, r'kubeVersion'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        parameters:
            IoArgoprojV1alpha1ApplicationOperationSyncSourceHelmParametersInner
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

  static List<IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationOperationSyncSourceHelm.listFromJson(
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
