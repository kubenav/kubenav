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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_cluster_resource_blacklist_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_destination_service_accounts_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_destinations_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_orphaned_resources.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_roles_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_signature_keys_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_spec_sync_windows_inner.dart';

class IoArgoprojV1alpha1AppProjectSpec {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpec] instance.
  IoArgoprojV1alpha1AppProjectSpec({
    this.clusterResourceBlacklist = const [],
    this.clusterResourceWhitelist = const [],
    this.description,
    this.destinationServiceAccounts = const [],
    this.destinations = const [],
    this.namespaceResourceBlacklist = const [],
    this.namespaceResourceWhitelist = const [],
    this.orphanedResources,
    this.permitOnlyProjectScopedClusters,
    this.roles = const [],
    this.signatureKeys = const [],
    this.sourceNamespaces = const [],
    this.sourceRepos = const [],
    this.syncWindows = const [],
  });

  /// ClusterResourceBlacklist contains list of blacklisted cluster level resources
  List<IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner>
      clusterResourceBlacklist;

  /// ClusterResourceWhitelist contains list of whitelisted cluster level resources
  List<IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner>
      clusterResourceWhitelist;

  /// Description contains optional project description
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// DestinationServiceAccounts holds information about the service accounts to be impersonated for the application sync operation for each destination.
  List<IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>
      destinationServiceAccounts;

  /// Destinations contains list of destinations available for deployment
  List<IoArgoprojV1alpha1AppProjectSpecDestinationsInner> destinations;

  /// NamespaceResourceBlacklist contains list of blacklisted namespace level resources
  List<IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner>
      namespaceResourceBlacklist;

  /// NamespaceResourceWhitelist contains list of whitelisted namespace level resources
  List<IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner>
      namespaceResourceWhitelist;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AppProjectSpecOrphanedResources? orphanedResources;

  /// PermitOnlyProjectScopedClusters determines whether destinations can only reference clusters which are project-scoped
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? permitOnlyProjectScopedClusters;

  /// Roles are user defined RBAC roles associated with this project
  List<IoArgoprojV1alpha1AppProjectSpecRolesInner> roles;

  /// SignatureKeys contains a list of PGP key IDs that commits in Git must be signed with in order to be allowed for sync
  List<IoArgoprojV1alpha1AppProjectSpecSignatureKeysInner> signatureKeys;

  /// SourceNamespaces defines the namespaces application resources are allowed to be created in
  List<String> sourceNamespaces;

  /// SourceRepos contains list of repository URLs which can be used for deployment
  List<String> sourceRepos;

  /// SyncWindows controls when syncs can be run for apps in this project
  List<IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner> syncWindows;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpec &&
          deepEquality.equals(
              other.clusterResourceBlacklist, clusterResourceBlacklist) &&
          deepEquality.equals(
              other.clusterResourceWhitelist, clusterResourceWhitelist) &&
          other.description == description &&
          deepEquality.equals(
              other.destinationServiceAccounts, destinationServiceAccounts) &&
          deepEquality.equals(other.destinations, destinations) &&
          deepEquality.equals(
              other.namespaceResourceBlacklist, namespaceResourceBlacklist) &&
          deepEquality.equals(
              other.namespaceResourceWhitelist, namespaceResourceWhitelist) &&
          other.orphanedResources == orphanedResources &&
          other.permitOnlyProjectScopedClusters ==
              permitOnlyProjectScopedClusters &&
          deepEquality.equals(other.roles, roles) &&
          deepEquality.equals(other.signatureKeys, signatureKeys) &&
          deepEquality.equals(other.sourceNamespaces, sourceNamespaces) &&
          deepEquality.equals(other.sourceRepos, sourceRepos) &&
          deepEquality.equals(other.syncWindows, syncWindows);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clusterResourceBlacklist.hashCode) +
      (clusterResourceWhitelist.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (destinationServiceAccounts.hashCode) +
      (destinations.hashCode) +
      (namespaceResourceBlacklist.hashCode) +
      (namespaceResourceWhitelist.hashCode) +
      (orphanedResources == null ? 0 : orphanedResources!.hashCode) +
      (permitOnlyProjectScopedClusters == null
          ? 0
          : permitOnlyProjectScopedClusters!.hashCode) +
      (roles.hashCode) +
      (signatureKeys.hashCode) +
      (sourceNamespaces.hashCode) +
      (sourceRepos.hashCode) +
      (syncWindows.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpec[clusterResourceBlacklist=$clusterResourceBlacklist, clusterResourceWhitelist=$clusterResourceWhitelist, description=$description, destinationServiceAccounts=$destinationServiceAccounts, destinations=$destinations, namespaceResourceBlacklist=$namespaceResourceBlacklist, namespaceResourceWhitelist=$namespaceResourceWhitelist, orphanedResources=$orphanedResources, permitOnlyProjectScopedClusters=$permitOnlyProjectScopedClusters, roles=$roles, signatureKeys=$signatureKeys, sourceNamespaces=$sourceNamespaces, sourceRepos=$sourceRepos, syncWindows=$syncWindows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'clusterResourceBlacklist'] = this.clusterResourceBlacklist;
    json[r'clusterResourceWhitelist'] = this.clusterResourceWhitelist;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'destinationServiceAccounts'] = this.destinationServiceAccounts;
    json[r'destinations'] = this.destinations;
    json[r'namespaceResourceBlacklist'] = this.namespaceResourceBlacklist;
    json[r'namespaceResourceWhitelist'] = this.namespaceResourceWhitelist;
    if (this.orphanedResources != null) {
      json[r'orphanedResources'] = this.orphanedResources;
    } else {
      json[r'orphanedResources'] = null;
    }
    if (this.permitOnlyProjectScopedClusters != null) {
      json[r'permitOnlyProjectScopedClusters'] =
          this.permitOnlyProjectScopedClusters;
    } else {
      json[r'permitOnlyProjectScopedClusters'] = null;
    }
    json[r'roles'] = this.roles;
    json[r'signatureKeys'] = this.signatureKeys;
    json[r'sourceNamespaces'] = this.sourceNamespaces;
    json[r'sourceRepos'] = this.sourceRepos;
    json[r'syncWindows'] = this.syncWindows;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpec(
        clusterResourceBlacklist:
            IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner
                .listFromJson(json[r'clusterResourceBlacklist']),
        clusterResourceWhitelist:
            IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner
                .listFromJson(json[r'clusterResourceWhitelist']),
        description: mapValueOfType<String>(json, r'description'),
        destinationServiceAccounts:
            IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner
                .listFromJson(json[r'destinationServiceAccounts']),
        destinations:
            IoArgoprojV1alpha1AppProjectSpecDestinationsInner.listFromJson(
                json[r'destinations']),
        namespaceResourceBlacklist:
            IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner
                .listFromJson(json[r'namespaceResourceBlacklist']),
        namespaceResourceWhitelist:
            IoArgoprojV1alpha1AppProjectSpecClusterResourceBlacklistInner
                .listFromJson(json[r'namespaceResourceWhitelist']),
        orphanedResources:
            IoArgoprojV1alpha1AppProjectSpecOrphanedResources.fromJson(
                json[r'orphanedResources']),
        permitOnlyProjectScopedClusters:
            mapValueOfType<bool>(json, r'permitOnlyProjectScopedClusters'),
        roles: IoArgoprojV1alpha1AppProjectSpecRolesInner.listFromJson(
            json[r'roles']),
        signatureKeys:
            IoArgoprojV1alpha1AppProjectSpecSignatureKeysInner.listFromJson(
                json[r'signatureKeys']),
        sourceNamespaces: json[r'sourceNamespaces'] is Iterable
            ? (json[r'sourceNamespaces'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        sourceRepos: json[r'sourceRepos'] is Iterable
            ? (json[r'sourceRepos'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        syncWindows:
            IoArgoprojV1alpha1AppProjectSpecSyncWindowsInner.listFromJson(
                json[r'syncWindows']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AppProjectSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1AppProjectSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AppProjectSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1AppProjectSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1AppProjectSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AppProjectSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1AppProjectSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1AppProjectSpec.listFromJson(
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
