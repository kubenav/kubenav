//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_aws_elastic_block_store_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_azure_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_azure_file_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_ceph_fs_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_cinder_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_csi_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_fc_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_flex_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_flocker_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_gce_persistent_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_glusterfs_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_host_path_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_iscsi_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_local_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_nfs_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_photon_persistent_disk_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_portworx_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_quobyte_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_rbd_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_scale_io_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_storage_os_persistent_volume_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_volume_node_affinity.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_vsphere_virtual_disk_volume_source.dart';

class IoK8sApiCoreV1PersistentVolumeSpec {
  /// Returns a new [IoK8sApiCoreV1PersistentVolumeSpec] instance.
  IoK8sApiCoreV1PersistentVolumeSpec({
    this.accessModes = const [],
    this.awsElasticBlockStore,
    this.azureDisk,
    this.azureFile,
    this.capacity = const {},
    this.cephfs,
    this.cinder,
    this.claimRef,
    this.csi,
    this.fc,
    this.flexVolume,
    this.flocker,
    this.gcePersistentDisk,
    this.glusterfs,
    this.hostPath,
    this.iscsi,
    this.local,
    this.mountOptions = const [],
    this.nfs,
    this.nodeAffinity,
    this.persistentVolumeReclaimPolicy,
    this.photonPersistentDisk,
    this.portworxVolume,
    this.quobyte,
    this.rbd,
    this.scaleIO,
    this.storageClassName,
    this.storageos,
    this.volumeMode,
    this.vsphereVolume,
  });

  /// AccessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
  List<String> accessModes;

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
  IoK8sApiCoreV1AzureFilePersistentVolumeSource? azureFile;

  /// A description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
  Map<String, String> capacity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CephFSPersistentVolumeSource? cephfs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CinderPersistentVolumeSource? cinder;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectReference? claimRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1CSIPersistentVolumeSource? csi;

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
  IoK8sApiCoreV1FlexPersistentVolumeSource? flexVolume;

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
  IoK8sApiCoreV1GlusterfsPersistentVolumeSource? glusterfs;

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
  IoK8sApiCoreV1ISCSIPersistentVolumeSource? iscsi;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1LocalVolumeSource? local;

  /// A list of mount options, e.g. [\"ro\", \"soft\"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
  List<String> mountOptions;

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
  IoK8sApiCoreV1VolumeNodeAffinity? nodeAffinity;

  /// What happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming  Possible enum values:  - `\"Delete\"` means the volume will be deleted from Kubernetes on release from its claim. The volume plugin must support Deletion.  - `\"Recycle\"` means the volume will be recycled back into the pool of unbound persistent volumes on release from its claim. The volume plugin must support Recycling.  - `\"Retain\"` means the volume will be left in its current phase (Released) for manual reclamation by the administrator. The default policy is Retain.
  IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum?
      persistentVolumeReclaimPolicy;

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
  IoK8sApiCoreV1QuobyteVolumeSource? quobyte;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1RBDPersistentVolumeSource? rbd;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ScaleIOPersistentVolumeSource? scaleIO;

  /// Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? storageClassName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1StorageOSPersistentVolumeSource? storageos;

  /// volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? volumeMode;

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
      other is IoK8sApiCoreV1PersistentVolumeSpec &&
          other.accessModes == accessModes &&
          other.awsElasticBlockStore == awsElasticBlockStore &&
          other.azureDisk == azureDisk &&
          other.azureFile == azureFile &&
          other.capacity == capacity &&
          other.cephfs == cephfs &&
          other.cinder == cinder &&
          other.claimRef == claimRef &&
          other.csi == csi &&
          other.fc == fc &&
          other.flexVolume == flexVolume &&
          other.flocker == flocker &&
          other.gcePersistentDisk == gcePersistentDisk &&
          other.glusterfs == glusterfs &&
          other.hostPath == hostPath &&
          other.iscsi == iscsi &&
          other.local == local &&
          other.mountOptions == mountOptions &&
          other.nfs == nfs &&
          other.nodeAffinity == nodeAffinity &&
          other.persistentVolumeReclaimPolicy ==
              persistentVolumeReclaimPolicy &&
          other.photonPersistentDisk == photonPersistentDisk &&
          other.portworxVolume == portworxVolume &&
          other.quobyte == quobyte &&
          other.rbd == rbd &&
          other.scaleIO == scaleIO &&
          other.storageClassName == storageClassName &&
          other.storageos == storageos &&
          other.volumeMode == volumeMode &&
          other.vsphereVolume == vsphereVolume;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessModes.hashCode) +
      (awsElasticBlockStore == null ? 0 : awsElasticBlockStore!.hashCode) +
      (azureDisk == null ? 0 : azureDisk!.hashCode) +
      (azureFile == null ? 0 : azureFile!.hashCode) +
      (capacity.hashCode) +
      (cephfs == null ? 0 : cephfs!.hashCode) +
      (cinder == null ? 0 : cinder!.hashCode) +
      (claimRef == null ? 0 : claimRef!.hashCode) +
      (csi == null ? 0 : csi!.hashCode) +
      (fc == null ? 0 : fc!.hashCode) +
      (flexVolume == null ? 0 : flexVolume!.hashCode) +
      (flocker == null ? 0 : flocker!.hashCode) +
      (gcePersistentDisk == null ? 0 : gcePersistentDisk!.hashCode) +
      (glusterfs == null ? 0 : glusterfs!.hashCode) +
      (hostPath == null ? 0 : hostPath!.hashCode) +
      (iscsi == null ? 0 : iscsi!.hashCode) +
      (local == null ? 0 : local!.hashCode) +
      (mountOptions.hashCode) +
      (nfs == null ? 0 : nfs!.hashCode) +
      (nodeAffinity == null ? 0 : nodeAffinity!.hashCode) +
      (persistentVolumeReclaimPolicy == null
          ? 0
          : persistentVolumeReclaimPolicy!.hashCode) +
      (photonPersistentDisk == null ? 0 : photonPersistentDisk!.hashCode) +
      (portworxVolume == null ? 0 : portworxVolume!.hashCode) +
      (quobyte == null ? 0 : quobyte!.hashCode) +
      (rbd == null ? 0 : rbd!.hashCode) +
      (scaleIO == null ? 0 : scaleIO!.hashCode) +
      (storageClassName == null ? 0 : storageClassName!.hashCode) +
      (storageos == null ? 0 : storageos!.hashCode) +
      (volumeMode == null ? 0 : volumeMode!.hashCode) +
      (vsphereVolume == null ? 0 : vsphereVolume!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PersistentVolumeSpec[accessModes=$accessModes, awsElasticBlockStore=$awsElasticBlockStore, azureDisk=$azureDisk, azureFile=$azureFile, capacity=$capacity, cephfs=$cephfs, cinder=$cinder, claimRef=$claimRef, csi=$csi, fc=$fc, flexVolume=$flexVolume, flocker=$flocker, gcePersistentDisk=$gcePersistentDisk, glusterfs=$glusterfs, hostPath=$hostPath, iscsi=$iscsi, local=$local, mountOptions=$mountOptions, nfs=$nfs, nodeAffinity=$nodeAffinity, persistentVolumeReclaimPolicy=$persistentVolumeReclaimPolicy, photonPersistentDisk=$photonPersistentDisk, portworxVolume=$portworxVolume, quobyte=$quobyte, rbd=$rbd, scaleIO=$scaleIO, storageClassName=$storageClassName, storageos=$storageos, volumeMode=$volumeMode, vsphereVolume=$vsphereVolume]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'accessModes'] = accessModes;
    if (awsElasticBlockStore != null) {
      json[r'awsElasticBlockStore'] = awsElasticBlockStore;
    }
    if (azureDisk != null) {
      json[r'azureDisk'] = azureDisk;
    }
    if (azureFile != null) {
      json[r'azureFile'] = azureFile;
    }
    json[r'capacity'] = capacity;
    if (cephfs != null) {
      json[r'cephfs'] = cephfs;
    }
    if (cinder != null) {
      json[r'cinder'] = cinder;
    }
    if (claimRef != null) {
      json[r'claimRef'] = claimRef;
    }
    if (csi != null) {
      json[r'csi'] = csi;
    }
    if (fc != null) {
      json[r'fc'] = fc;
    }
    if (flexVolume != null) {
      json[r'flexVolume'] = flexVolume;
    }
    if (flocker != null) {
      json[r'flocker'] = flocker;
    }
    if (gcePersistentDisk != null) {
      json[r'gcePersistentDisk'] = gcePersistentDisk;
    }
    if (glusterfs != null) {
      json[r'glusterfs'] = glusterfs;
    }
    if (hostPath != null) {
      json[r'hostPath'] = hostPath;
    }
    if (iscsi != null) {
      json[r'iscsi'] = iscsi;
    }
    if (local != null) {
      json[r'local'] = local;
    }
    json[r'mountOptions'] = mountOptions;
    if (nfs != null) {
      json[r'nfs'] = nfs;
    }
    if (nodeAffinity != null) {
      json[r'nodeAffinity'] = nodeAffinity;
    }
    if (persistentVolumeReclaimPolicy != null) {
      json[r'persistentVolumeReclaimPolicy'] = persistentVolumeReclaimPolicy;
    }
    if (photonPersistentDisk != null) {
      json[r'photonPersistentDisk'] = photonPersistentDisk;
    }
    if (portworxVolume != null) {
      json[r'portworxVolume'] = portworxVolume;
    }
    if (quobyte != null) {
      json[r'quobyte'] = quobyte;
    }
    if (rbd != null) {
      json[r'rbd'] = rbd;
    }
    if (scaleIO != null) {
      json[r'scaleIO'] = scaleIO;
    }
    if (storageClassName != null) {
      json[r'storageClassName'] = storageClassName;
    }
    if (storageos != null) {
      json[r'storageos'] = storageos;
    }
    if (volumeMode != null) {
      json[r'volumeMode'] = volumeMode;
    }
    if (vsphereVolume != null) {
      json[r'vsphereVolume'] = vsphereVolume;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PersistentVolumeSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PersistentVolumeSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PersistentVolumeSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PersistentVolumeSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PersistentVolumeSpec(
        accessModes: json[r'accessModes'] is List
            ? (json[r'accessModes'] as List).cast<String>()
            : const [],
        awsElasticBlockStore:
            IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource.fromJson(
                json[r'awsElasticBlockStore']),
        azureDisk:
            IoK8sApiCoreV1AzureDiskVolumeSource.fromJson(json[r'azureDisk']),
        azureFile: IoK8sApiCoreV1AzureFilePersistentVolumeSource.fromJson(
            json[r'azureFile']),
        capacity: mapCastOfType<String, String>(json, r'capacity') ?? const {},
        cephfs: IoK8sApiCoreV1CephFSPersistentVolumeSource.fromJson(
            json[r'cephfs']),
        cinder: IoK8sApiCoreV1CinderPersistentVolumeSource.fromJson(
            json[r'cinder']),
        claimRef: IoK8sApiCoreV1ObjectReference.fromJson(json[r'claimRef']),
        csi: IoK8sApiCoreV1CSIPersistentVolumeSource.fromJson(json[r'csi']),
        fc: IoK8sApiCoreV1FCVolumeSource.fromJson(json[r'fc']),
        flexVolume: IoK8sApiCoreV1FlexPersistentVolumeSource.fromJson(
            json[r'flexVolume']),
        flocker: IoK8sApiCoreV1FlockerVolumeSource.fromJson(json[r'flocker']),
        gcePersistentDisk: IoK8sApiCoreV1GCEPersistentDiskVolumeSource.fromJson(
            json[r'gcePersistentDisk']),
        glusterfs: IoK8sApiCoreV1GlusterfsPersistentVolumeSource.fromJson(
            json[r'glusterfs']),
        hostPath:
            IoK8sApiCoreV1HostPathVolumeSource.fromJson(json[r'hostPath']),
        iscsi:
            IoK8sApiCoreV1ISCSIPersistentVolumeSource.fromJson(json[r'iscsi']),
        local: IoK8sApiCoreV1LocalVolumeSource.fromJson(json[r'local']),
        mountOptions: json[r'mountOptions'] is List
            ? (json[r'mountOptions'] as List).cast<String>()
            : const [],
        nfs: IoK8sApiCoreV1NFSVolumeSource.fromJson(json[r'nfs']),
        nodeAffinity:
            IoK8sApiCoreV1VolumeNodeAffinity.fromJson(json[r'nodeAffinity']),
        persistentVolumeReclaimPolicy:
            IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
                .fromJson(json[r'persistentVolumeReclaimPolicy']),
        photonPersistentDisk:
            IoK8sApiCoreV1PhotonPersistentDiskVolumeSource.fromJson(
                json[r'photonPersistentDisk']),
        portworxVolume: IoK8sApiCoreV1PortworxVolumeSource.fromJson(
            json[r'portworxVolume']),
        quobyte: IoK8sApiCoreV1QuobyteVolumeSource.fromJson(json[r'quobyte']),
        rbd: IoK8sApiCoreV1RBDPersistentVolumeSource.fromJson(json[r'rbd']),
        scaleIO: IoK8sApiCoreV1ScaleIOPersistentVolumeSource.fromJson(
            json[r'scaleIO']),
        storageClassName: mapValueOfType<String>(json, r'storageClassName'),
        storageos: IoK8sApiCoreV1StorageOSPersistentVolumeSource.fromJson(
            json[r'storageos']),
        volumeMode: mapValueOfType<String>(json, r'volumeMode'),
        vsphereVolume: IoK8sApiCoreV1VsphereVirtualDiskVolumeSource.fromJson(
            json[r'vsphereVolume']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PersistentVolumeSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PersistentVolumeSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PersistentVolumeSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PersistentVolumeSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PersistentVolumeSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PersistentVolumeSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PersistentVolumeSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PersistentVolumeSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PersistentVolumeSpec.listFromJson(
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
  static const requiredKeys = <String>{};
}

/// What happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming  Possible enum values:  - `\"Delete\"` means the volume will be deleted from Kubernetes on release from its claim. The volume plugin must support Deletion.  - `\"Recycle\"` means the volume will be recycled back into the pool of unbound persistent volumes on release from its claim. The volume plugin must support Recycling.  - `\"Retain\"` means the volume will be left in its current phase (Released) for manual reclamation by the administrator. The default policy is Retain.
class IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const delete =
      IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum._(
          r'Delete');
  static const recycle =
      IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum._(
          r'Recycle');
  static const retain =
      IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum._(
          r'Retain');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum].
  static const values =
      <IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum>[
    delete,
    recycle,
    retain,
  ];

  static IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum?
      fromJson(dynamic value) =>
          IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer()
              .decode(value);

  static List<
          IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum].
class IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer {
  factory IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer._();

  String encode(
          IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Delete':
          return IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
              .delete;
        case r'Recycle':
          return IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
              .recycle;
        case r'Retain':
          return IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnum
              .retain;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicyEnumTypeTransformer?
      _instance;
}
