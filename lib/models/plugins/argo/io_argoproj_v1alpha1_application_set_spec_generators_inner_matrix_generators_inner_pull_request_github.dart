//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_matrix_generators_inner_pull_request_azuredevops_token_ref.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub({
    this.api,
    this.appSecretName,
    this.labels = const [],
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? api;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appSecretName;

  List<String> labels;

  String owner;

  String repo;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestAzuredevopsTokenRef?
      tokenRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub &&
          other.api == api &&
          other.appSecretName == appSecretName &&
          deepEquality.equals(other.labels, labels) &&
          other.owner == owner &&
          other.repo == repo &&
          other.tokenRef == tokenRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (api == null ? 0 : api!.hashCode) +
      (appSecretName == null ? 0 : appSecretName!.hashCode) +
      (labels.hashCode) +
      (owner.hashCode) +
      (repo.hashCode) +
      (tokenRef == null ? 0 : tokenRef!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub[api=$api, appSecretName=$appSecretName, labels=$labels, owner=$owner, repo=$repo, tokenRef=$tokenRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.api != null) {
      json[r'api'] = this.api;
    } else {
      json[r'api'] = null;
    }
    if (this.appSecretName != null) {
      json[r'appSecretName'] = this.appSecretName;
    } else {
      json[r'appSecretName'] = null;
    }
    json[r'labels'] = this.labels;
    json[r'owner'] = this.owner;
    json[r'repo'] = this.repo;
    if (this.tokenRef != null) {
      json[r'tokenRef'] = this.tokenRef;
    } else {
      json[r'tokenRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub(
        api: mapValueOfType<String>(json, r'api'),
        appSecretName: mapValueOfType<String>(json, r'appSecretName'),
        labels: json[r'labels'] is Iterable
            ? (json[r'labels'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        owner: mapValueOfType<String>(json, r'owner')!,
        repo: mapValueOfType<String>(json, r'repo')!,
        tokenRef:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestAzuredevopsTokenRef
                .fromJson(json[r'tokenRef']),
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestGithub
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
    'owner',
    'repo',
  };
}
