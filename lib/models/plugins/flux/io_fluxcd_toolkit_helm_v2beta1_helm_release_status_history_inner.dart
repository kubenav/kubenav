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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_status_history_inner_test_hooks_value.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner({
    this.apiVersion,
    required this.chartName,
    required this.chartVersion,
    required this.configDigest,
    this.deleted,
    required this.digest,
    required this.firstDeployed,
    required this.lastDeployed,
    required this.name,
    required this.namespace,
    required this.status,
    this.testHooks = const {},
    required this.version,
  });

  /// APIVersion is the API version of the Snapshot. Provisional: when the calculation method of the Digest field is changed, this field will be used to distinguish between the old and new methods.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// ChartName is the chart name of the release object in storage.
  String chartName;

  /// ChartVersion is the chart version of the release object in storage.
  String chartVersion;

  /// ConfigDigest is the checksum of the config (better known as \"values\") of the release object in storage. It has the format of `<algo>:<checksum>`.
  String configDigest;

  /// Deleted is when the release was deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deleted;

  /// Digest is the checksum of the release object in storage. It has the format of `<algo>:<checksum>`.
  String digest;

  /// FirstDeployed is when the release was first deployed.
  DateTime firstDeployed;

  /// LastDeployed is when the release was last deployed.
  DateTime lastDeployed;

  /// Name is the name of the release.
  String name;

  /// Namespace is the namespace the release is deployed to.
  String namespace;

  /// Status is the current state of the release.
  String status;

  /// TestHooks is the list of test hooks for the release as observed to be run by the controller.
  Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue>
      testHooks;

  /// Version is the version of the release object in storage.
  int version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner &&
          other.apiVersion == apiVersion &&
          other.chartName == chartName &&
          other.chartVersion == chartVersion &&
          other.configDigest == configDigest &&
          other.deleted == deleted &&
          other.digest == digest &&
          other.firstDeployed == firstDeployed &&
          other.lastDeployed == lastDeployed &&
          other.name == name &&
          other.namespace == namespace &&
          other.status == status &&
          deepEquality.equals(other.testHooks, testHooks) &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (chartName.hashCode) +
      (chartVersion.hashCode) +
      (configDigest.hashCode) +
      (deleted == null ? 0 : deleted!.hashCode) +
      (digest.hashCode) +
      (firstDeployed.hashCode) +
      (lastDeployed.hashCode) +
      (name.hashCode) +
      (namespace.hashCode) +
      (status.hashCode) +
      (testHooks.hashCode) +
      (version.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner[apiVersion=$apiVersion, chartName=$chartName, chartVersion=$chartVersion, configDigest=$configDigest, deleted=$deleted, digest=$digest, firstDeployed=$firstDeployed, lastDeployed=$lastDeployed, name=$name, namespace=$namespace, status=$status, testHooks=$testHooks, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    json[r'chartName'] = this.chartName;
    json[r'chartVersion'] = this.chartVersion;
    json[r'configDigest'] = this.configDigest;
    if (this.deleted != null) {
      json[r'deleted'] = this.deleted!.toUtc().toIso8601String();
    } else {
      json[r'deleted'] = null;
    }
    json[r'digest'] = this.digest;
    json[r'firstDeployed'] = this.firstDeployed.toUtc().toIso8601String();
    json[r'lastDeployed'] = this.lastDeployed.toUtc().toIso8601String();
    json[r'name'] = this.name;
    json[r'namespace'] = this.namespace;
    json[r'status'] = this.status;
    json[r'testHooks'] = this.testHooks;
    json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        chartName: mapValueOfType<String>(json, r'chartName')!,
        chartVersion: mapValueOfType<String>(json, r'chartVersion')!,
        configDigest: mapValueOfType<String>(json, r'configDigest')!,
        deleted: mapDateTime(json, r'deleted', r''),
        digest: mapValueOfType<String>(json, r'digest')!,
        firstDeployed: mapDateTime(json, r'firstDeployed', r'')!,
        lastDeployed: mapDateTime(json, r'lastDeployed', r'')!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
        status: mapValueOfType<String>(json, r'status')!,
        testHooks:
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInnerTestHooksValue
                .mapFromJson(json[r'testHooks']),
        version: mapValueOfType<int>(json, r'version')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitHelmV2beta1HelmReleaseStatusHistoryInner
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
    'chartName',
    'chartVersion',
    'configDigest',
    'digest',
    'firstDeployed',
    'lastDeployed',
    'name',
    'namespace',
    'status',
    'version',
  };
}
