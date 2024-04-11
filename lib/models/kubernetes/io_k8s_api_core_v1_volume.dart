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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_aws_elastic_block_store_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_azure_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_azure_file_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_ceph_fs_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_cinder_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_csi_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_downward_api_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_empty_dir_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_ephemeral_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_fc_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_flex_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_flocker_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_gce_persistent_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_git_repo_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_glusterfs_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_host_path_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_iscsi_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_nfs_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_claim_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_photon_persistent_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_portworx_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_projected_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_quobyte_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_rbd_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_scale_io_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_storage_os_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_vsphere_virtual_disk_volume_source.dart';

class IoK8sApiCoreV1Volume {
  /// Returns a new [IoK8sApiCoreV1Volume] instance.
  IoK8sApiCoreV1Volume({
    this.awsElasticBlockStore,
    this.azureDisk,
    this.azureFile,
    this.cephfs,
    this.cinder,
    this.configMap,
    this.csi,
    this.downwardAPI,
    this.emptyDir,
    this.ephemeral,
    this.fc,
    this.flexVolume,
    this.flocker,
    this.gcePersistentDisk,
    this.gitRepo,
    this.glusterfs,
    this.hostPath,
    this.iscsi,
    required this.name,
    this.nfs,
    this.persistentVolumeClaim,
    this.photonPersistentDisk,
    this.portworxVolume,
    this.projected,
    this.quobyte,
    this.rbd,
    this.scaleIO,
    this.secret,
    this.storageos,
    this.vsphereVolume,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource? awsElasticBlockStore;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1AzureDiskVolumeSource? azureDisk;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1AzureFileVolumeSource? azureFile;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CephFSVolumeSource? cephfs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CinderVolumeSource? cinder;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ConfigMapVolumeSource? configMap;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CSIVolumeSource? csi;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1DownwardAPIVolumeSource? downwardAPI;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1EmptyDirVolumeSource? emptyDir;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1EphemeralVolumeSource? ephemeral;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1FCVolumeSource? fc;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1FlexVolumeSource? flexVolume;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1FlockerVolumeSource? flocker;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1GCEPersistentDiskVolumeSource? gcePersistentDisk;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1GitRepoVolumeSource? gitRepo;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1GlusterfsVolumeSource? glusterfs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1HostPathVolumeSource? hostPath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ISCSIVolumeSource? iscsi;

  /// name of the volume. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NFSVolumeSource? nfs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PersistentVolumeClaimVolumeSource? persistentVolumeClaim;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PhotonPersistentDiskVolumeSource? photonPersistentDisk;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PortworxVolumeSource? portworxVolume;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ProjectedVolumeSource? projected;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1QuobyteVolumeSource? quobyte;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1RBDVolumeSource? rbd;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ScaleIOVolumeSource? scaleIO;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretVolumeSource? secret;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1StorageOSVolumeSource? storageos;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1VsphereVirtualDiskVolumeSource? vsphereVolume;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Volume &&
          other.awsElasticBlockStore == awsElasticBlockStore &&
          other.azureDisk == azureDisk &&
          other.azureFile == azureFile &&
          other.cephfs == cephfs &&
          other.cinder == cinder &&
          other.configMap == configMap &&
          other.csi == csi &&
          other.downwardAPI == downwardAPI &&
          other.emptyDir == emptyDir &&
          other.ephemeral == ephemeral &&
          other.fc == fc &&
          other.flexVolume == flexVolume &&
          other.flocker == flocker &&
          other.gcePersistentDisk == gcePersistentDisk &&
          other.gitRepo == gitRepo &&
          other.glusterfs == glusterfs &&
          other.hostPath == hostPath &&
          other.iscsi == iscsi &&
          other.name == name &&
          other.nfs == nfs &&
          other.persistentVolumeClaim == persistentVolumeClaim &&
          other.photonPersistentDisk == photonPersistentDisk &&
          other.portworxVolume == portworxVolume &&
          other.projected == projected &&
          other.quobyte == quobyte &&
          other.rbd == rbd &&
          other.scaleIO == scaleIO &&
          other.secret == secret &&
          other.storageos == storageos &&
          other.vsphereVolume == vsphereVolume;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (awsElasticBlockStore == null ? 0 : awsElasticBlockStore!.hashCode) +
      (azureDisk == null ? 0 : azureDisk!.hashCode) +
      (azureFile == null ? 0 : azureFile!.hashCode) +
      (cephfs == null ? 0 : cephfs!.hashCode) +
      (cinder == null ? 0 : cinder!.hashCode) +
      (configMap == null ? 0 : configMap!.hashCode) +
      (csi == null ? 0 : csi!.hashCode) +
      (downwardAPI == null ? 0 : downwardAPI!.hashCode) +
      (emptyDir == null ? 0 : emptyDir!.hashCode) +
      (ephemeral == null ? 0 : ephemeral!.hashCode) +
      (fc == null ? 0 : fc!.hashCode) +
      (flexVolume == null ? 0 : flexVolume!.hashCode) +
      (flocker == null ? 0 : flocker!.hashCode) +
      (gcePersistentDisk == null ? 0 : gcePersistentDisk!.hashCode) +
      (gitRepo == null ? 0 : gitRepo!.hashCode) +
      (glusterfs == null ? 0 : glusterfs!.hashCode) +
      (hostPath == null ? 0 : hostPath!.hashCode) +
      (iscsi == null ? 0 : iscsi!.hashCode) +
      (name.hashCode) +
      (nfs == null ? 0 : nfs!.hashCode) +
      (persistentVolumeClaim == null ? 0 : persistentVolumeClaim!.hashCode) +
      (photonPersistentDisk == null ? 0 : photonPersistentDisk!.hashCode) +
      (portworxVolume == null ? 0 : portworxVolume!.hashCode) +
      (projected == null ? 0 : projected!.hashCode) +
      (quobyte == null ? 0 : quobyte!.hashCode) +
      (rbd == null ? 0 : rbd!.hashCode) +
      (scaleIO == null ? 0 : scaleIO!.hashCode) +
      (secret == null ? 0 : secret!.hashCode) +
      (storageos == null ? 0 : storageos!.hashCode) +
      (vsphereVolume == null ? 0 : vsphereVolume!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Volume[awsElasticBlockStore=$awsElasticBlockStore, azureDisk=$azureDisk, azureFile=$azureFile, cephfs=$cephfs, cinder=$cinder, configMap=$configMap, csi=$csi, downwardAPI=$downwardAPI, emptyDir=$emptyDir, ephemeral=$ephemeral, fc=$fc, flexVolume=$flexVolume, flocker=$flocker, gcePersistentDisk=$gcePersistentDisk, gitRepo=$gitRepo, glusterfs=$glusterfs, hostPath=$hostPath, iscsi=$iscsi, name=$name, nfs=$nfs, persistentVolumeClaim=$persistentVolumeClaim, photonPersistentDisk=$photonPersistentDisk, portworxVolume=$portworxVolume, projected=$projected, quobyte=$quobyte, rbd=$rbd, scaleIO=$scaleIO, secret=$secret, storageos=$storageos, vsphereVolume=$vsphereVolume]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.awsElasticBlockStore != null) {
      json[r'awsElasticBlockStore'] = this.awsElasticBlockStore;
    } else {
      json[r'awsElasticBlockStore'] = null;
    }
    if (this.azureDisk != null) {
      json[r'azureDisk'] = this.azureDisk;
    } else {
      json[r'azureDisk'] = null;
    }
    if (this.azureFile != null) {
      json[r'azureFile'] = this.azureFile;
    } else {
      json[r'azureFile'] = null;
    }
    if (this.cephfs != null) {
      json[r'cephfs'] = this.cephfs;
    } else {
      json[r'cephfs'] = null;
    }
    if (this.cinder != null) {
      json[r'cinder'] = this.cinder;
    } else {
      json[r'cinder'] = null;
    }
    if (this.configMap != null) {
      json[r'configMap'] = this.configMap;
    } else {
      json[r'configMap'] = null;
    }
    if (this.csi != null) {
      json[r'csi'] = this.csi;
    } else {
      json[r'csi'] = null;
    }
    if (this.downwardAPI != null) {
      json[r'downwardAPI'] = this.downwardAPI;
    } else {
      json[r'downwardAPI'] = null;
    }
    if (this.emptyDir != null) {
      json[r'emptyDir'] = this.emptyDir;
    } else {
      json[r'emptyDir'] = null;
    }
    if (this.ephemeral != null) {
      json[r'ephemeral'] = this.ephemeral;
    } else {
      json[r'ephemeral'] = null;
    }
    if (this.fc != null) {
      json[r'fc'] = this.fc;
    } else {
      json[r'fc'] = null;
    }
    if (this.flexVolume != null) {
      json[r'flexVolume'] = this.flexVolume;
    } else {
      json[r'flexVolume'] = null;
    }
    if (this.flocker != null) {
      json[r'flocker'] = this.flocker;
    } else {
      json[r'flocker'] = null;
    }
    if (this.gcePersistentDisk != null) {
      json[r'gcePersistentDisk'] = this.gcePersistentDisk;
    } else {
      json[r'gcePersistentDisk'] = null;
    }
    if (this.gitRepo != null) {
      json[r'gitRepo'] = this.gitRepo;
    } else {
      json[r'gitRepo'] = null;
    }
    if (this.glusterfs != null) {
      json[r'glusterfs'] = this.glusterfs;
    } else {
      json[r'glusterfs'] = null;
    }
    if (this.hostPath != null) {
      json[r'hostPath'] = this.hostPath;
    } else {
      json[r'hostPath'] = null;
    }
    if (this.iscsi != null) {
      json[r'iscsi'] = this.iscsi;
    } else {
      json[r'iscsi'] = null;
    }
    json[r'name'] = this.name;
    if (this.nfs != null) {
      json[r'nfs'] = this.nfs;
    } else {
      json[r'nfs'] = null;
    }
    if (this.persistentVolumeClaim != null) {
      json[r'persistentVolumeClaim'] = this.persistentVolumeClaim;
    } else {
      json[r'persistentVolumeClaim'] = null;
    }
    if (this.photonPersistentDisk != null) {
      json[r'photonPersistentDisk'] = this.photonPersistentDisk;
    } else {
      json[r'photonPersistentDisk'] = null;
    }
    if (this.portworxVolume != null) {
      json[r'portworxVolume'] = this.portworxVolume;
    } else {
      json[r'portworxVolume'] = null;
    }
    if (this.projected != null) {
      json[r'projected'] = this.projected;
    } else {
      json[r'projected'] = null;
    }
    if (this.quobyte != null) {
      json[r'quobyte'] = this.quobyte;
    } else {
      json[r'quobyte'] = null;
    }
    if (this.rbd != null) {
      json[r'rbd'] = this.rbd;
    } else {
      json[r'rbd'] = null;
    }
    if (this.scaleIO != null) {
      json[r'scaleIO'] = this.scaleIO;
    } else {
      json[r'scaleIO'] = null;
    }
    if (this.secret != null) {
      json[r'secret'] = this.secret;
    } else {
      json[r'secret'] = null;
    }
    if (this.storageos != null) {
      json[r'storageos'] = this.storageos;
    } else {
      json[r'storageos'] = null;
    }
    if (this.vsphereVolume != null) {
      json[r'vsphereVolume'] = this.vsphereVolume;
    } else {
      json[r'vsphereVolume'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Volume] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Volume? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Volume[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Volume[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Volume(
        awsElasticBlockStore:
            IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource.fromJson(
                json[r'awsElasticBlockStore']),
        azureDisk:
            IoK8sApiCoreV1AzureDiskVolumeSource.fromJson(json[r'azureDisk']),
        azureFile:
            IoK8sApiCoreV1AzureFileVolumeSource.fromJson(json[r'azureFile']),
        cephfs: IoK8sApiCoreV1CephFSVolumeSource.fromJson(json[r'cephfs']),
        cinder: IoK8sApiCoreV1CinderVolumeSource.fromJson(json[r'cinder']),
        configMap:
            IoK8sApiCoreV1ConfigMapVolumeSource.fromJson(json[r'configMap']),
        csi: IoK8sApiCoreV1CSIVolumeSource.fromJson(json[r'csi']),
        downwardAPI: IoK8sApiCoreV1DownwardAPIVolumeSource.fromJson(
            json[r'downwardAPI']),
        emptyDir:
            IoK8sApiCoreV1EmptyDirVolumeSource.fromJson(json[r'emptyDir']),
        ephemeral:
            IoK8sApiCoreV1EphemeralVolumeSource.fromJson(json[r'ephemeral']),
        fc: IoK8sApiCoreV1FCVolumeSource.fromJson(json[r'fc']),
        flexVolume:
            IoK8sApiCoreV1FlexVolumeSource.fromJson(json[r'flexVolume']),
        flocker: IoK8sApiCoreV1FlockerVolumeSource.fromJson(json[r'flocker']),
        gcePersistentDisk: IoK8sApiCoreV1GCEPersistentDiskVolumeSource.fromJson(
            json[r'gcePersistentDisk']),
        gitRepo: IoK8sApiCoreV1GitRepoVolumeSource.fromJson(json[r'gitRepo']),
        glusterfs:
            IoK8sApiCoreV1GlusterfsVolumeSource.fromJson(json[r'glusterfs']),
        hostPath:
            IoK8sApiCoreV1HostPathVolumeSource.fromJson(json[r'hostPath']),
        iscsi: IoK8sApiCoreV1ISCSIVolumeSource.fromJson(json[r'iscsi']),
        name: mapValueOfType<String>(json, r'name')!,
        nfs: IoK8sApiCoreV1NFSVolumeSource.fromJson(json[r'nfs']),
        persistentVolumeClaim:
            IoK8sApiCoreV1PersistentVolumeClaimVolumeSource.fromJson(
                json[r'persistentVolumeClaim']),
        photonPersistentDisk:
            IoK8sApiCoreV1PhotonPersistentDiskVolumeSource.fromJson(
                json[r'photonPersistentDisk']),
        portworxVolume: IoK8sApiCoreV1PortworxVolumeSource.fromJson(
            json[r'portworxVolume']),
        projected:
            IoK8sApiCoreV1ProjectedVolumeSource.fromJson(json[r'projected']),
        quobyte: IoK8sApiCoreV1QuobyteVolumeSource.fromJson(json[r'quobyte']),
        rbd: IoK8sApiCoreV1RBDVolumeSource.fromJson(json[r'rbd']),
        scaleIO: IoK8sApiCoreV1ScaleIOVolumeSource.fromJson(json[r'scaleIO']),
        secret: IoK8sApiCoreV1SecretVolumeSource.fromJson(json[r'secret']),
        storageos:
            IoK8sApiCoreV1StorageOSVolumeSource.fromJson(json[r'storageos']),
        vsphereVolume: IoK8sApiCoreV1VsphereVirtualDiskVolumeSource.fromJson(
            json[r'vsphereVolume']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Volume>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Volume>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Volume.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Volume> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Volume>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Volume.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Volume-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Volume>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Volume>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Volume.listFromJson(
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
    'name',
  };
}
