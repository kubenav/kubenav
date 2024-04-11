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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_topology_selector_term.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiStorageV1StorageClass {
  /// Returns a new [IoK8sApiStorageV1StorageClass] instance.
  IoK8sApiStorageV1StorageClass({
    this.allowVolumeExpansion,
    this.allowedTopologies = const [],
    this.apiVersion,
    this.kind,
    this.metadata,
    this.mountOptions = const [],
    this.parameters = const {},
    required this.provisioner,
    this.reclaimPolicy,
    this.volumeBindingMode,
  });

  /// AllowVolumeExpansion shows whether the storage class allow volume expand
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowVolumeExpansion;

  /// Restrict the node topologies where volumes can be dynamically provisioned. Each volume plugin defines its own supported topology specifications. An empty TopologySelectorTerm list means there is no topology restriction. This field is only honored by servers that enable the VolumeScheduling feature.
  List<IoK8sApiCoreV1TopologySelectorTerm> allowedTopologies;

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  /// Dynamically provisioned PersistentVolumes of this storage class are created with these mountOptions, e.g. [\"ro\", \"soft\"]. Not validated - mount of the PVs will simply fail if one is invalid.
  List<String> mountOptions;

  /// Parameters holds the parameters for the provisioner that should create volumes of this storage class.
  Map<String, String> parameters;

  /// Provisioner indicates the type of the provisioner.
  String provisioner;

  /// Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reclaimPolicy;

  /// VolumeBindingMode indicates how PersistentVolumeClaims should be provisioned and bound.  When unset, VolumeBindingImmediate is used. This field is only honored by servers that enable the VolumeScheduling feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? volumeBindingMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1StorageClass &&
          other.allowVolumeExpansion == allowVolumeExpansion &&
          other.allowedTopologies == allowedTopologies &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.mountOptions == mountOptions &&
          other.parameters == parameters &&
          other.provisioner == provisioner &&
          other.reclaimPolicy == reclaimPolicy &&
          other.volumeBindingMode == volumeBindingMode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowVolumeExpansion == null ? 0 : allowVolumeExpansion!.hashCode) +
      (allowedTopologies.hashCode) +
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (mountOptions.hashCode) +
      (parameters.hashCode) +
      (provisioner.hashCode) +
      (reclaimPolicy == null ? 0 : reclaimPolicy!.hashCode) +
      (volumeBindingMode == null ? 0 : volumeBindingMode!.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1StorageClass[allowVolumeExpansion=$allowVolumeExpansion, allowedTopologies=$allowedTopologies, apiVersion=$apiVersion, kind=$kind, metadata=$metadata, mountOptions=$mountOptions, parameters=$parameters, provisioner=$provisioner, reclaimPolicy=$reclaimPolicy, volumeBindingMode=$volumeBindingMode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowVolumeExpansion != null) {
      json[r'allowVolumeExpansion'] = this.allowVolumeExpansion;
    } else {
      json[r'allowVolumeExpansion'] = null;
    }
    json[r'allowedTopologies'] = this.allowedTopologies;
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    json[r'mountOptions'] = this.mountOptions;
    json[r'parameters'] = this.parameters;
    json[r'provisioner'] = this.provisioner;
    if (this.reclaimPolicy != null) {
      json[r'reclaimPolicy'] = this.reclaimPolicy;
    } else {
      json[r'reclaimPolicy'] = null;
    }
    if (this.volumeBindingMode != null) {
      json[r'volumeBindingMode'] = this.volumeBindingMode;
    } else {
      json[r'volumeBindingMode'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1StorageClass] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1StorageClass? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1StorageClass[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1StorageClass[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1StorageClass(
        allowVolumeExpansion:
            mapValueOfType<bool>(json, r'allowVolumeExpansion'),
        allowedTopologies: IoK8sApiCoreV1TopologySelectorTerm.listFromJson(
                json[r'allowedTopologies']) ??
            const [],
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        mountOptions: json[r'mountOptions'] is List
            ? (json[r'mountOptions'] as List).cast<String>()
            : const [],
        parameters:
            mapCastOfType<String, String>(json, r'parameters') ?? const {},
        provisioner: mapValueOfType<String>(json, r'provisioner')!,
        reclaimPolicy: mapValueOfType<String>(json, r'reclaimPolicy'),
        volumeBindingMode: mapValueOfType<String>(json, r'volumeBindingMode'),
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1StorageClass>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1StorageClass>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1StorageClass.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1StorageClass> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiStorageV1StorageClass>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1StorageClass.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1StorageClass-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1StorageClass>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1StorageClass>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1StorageClass.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'provisioner',
  };
}
