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

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps({
    required this.accessTokenRef,
    this.allBranches,
    this.api,
    required this.organization,
    required this.teamProject,
  });

  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestAzuredevopsTokenRef
      accessTokenRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allBranches;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? api;

  String organization;

  String teamProject;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps &&
          other.accessTokenRef == accessTokenRef &&
          other.allBranches == allBranches &&
          other.api == api &&
          other.organization == organization &&
          other.teamProject == teamProject;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessTokenRef.hashCode) +
      (allBranches == null ? 0 : allBranches!.hashCode) +
      (api == null ? 0 : api!.hashCode) +
      (organization.hashCode) +
      (teamProject.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps[accessTokenRef=$accessTokenRef, allBranches=$allBranches, api=$api, organization=$organization, teamProject=$teamProject]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'accessTokenRef'] = this.accessTokenRef;
    if (this.allBranches != null) {
      json[r'allBranches'] = this.allBranches;
    } else {
      json[r'allBranches'] = null;
    }
    if (this.api != null) {
      json[r'api'] = this.api;
    } else {
      json[r'api'] = null;
    }
    json[r'organization'] = this.organization;
    json[r'teamProject'] = this.teamProject;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps(
        accessTokenRef:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerPullRequestAzuredevopsTokenRef
                .fromJson(json[r'accessTokenRef'])!,
        allBranches: mapValueOfType<bool>(json, r'allBranches'),
        api: mapValueOfType<String>(json, r'api'),
        organization: mapValueOfType<String>(json, r'organization')!,
        teamProject: mapValueOfType<String>(json, r'teamProject')!,
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerMatrixGeneratorsInnerScmProviderAzureDevOps
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
    'accessTokenRef',
    'organization',
    'teamProject',
  };
}
