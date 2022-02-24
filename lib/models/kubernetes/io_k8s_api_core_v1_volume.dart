//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

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

  /// Volume's name. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
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
    if (awsElasticBlockStore != null) {
      json[r'awsElasticBlockStore'] = awsElasticBlockStore;
    }
    if (azureDisk != null) {
      json[r'azureDisk'] = azureDisk;
    }
    if (azureFile != null) {
      json[r'azureFile'] = azureFile;
    }
    if (cephfs != null) {
      json[r'cephfs'] = cephfs;
    }
    if (cinder != null) {
      json[r'cinder'] = cinder;
    }
    if (configMap != null) {
      json[r'configMap'] = configMap;
    }
    if (csi != null) {
      json[r'csi'] = csi;
    }
    if (downwardAPI != null) {
      json[r'downwardAPI'] = downwardAPI;
    }
    if (emptyDir != null) {
      json[r'emptyDir'] = emptyDir;
    }
    if (ephemeral != null) {
      json[r'ephemeral'] = ephemeral;
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
    if (gitRepo != null) {
      json[r'gitRepo'] = gitRepo;
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
    json[r'name'] = name;
    if (nfs != null) {
      json[r'nfs'] = nfs;
    }
    if (persistentVolumeClaim != null) {
      json[r'persistentVolumeClaim'] = persistentVolumeClaim;
    }
    if (photonPersistentDisk != null) {
      json[r'photonPersistentDisk'] = photonPersistentDisk;
    }
    if (portworxVolume != null) {
      json[r'portworxVolume'] = portworxVolume;
    }
    if (projected != null) {
      json[r'projected'] = projected;
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
    if (secret != null) {
      json[r'secret'] = secret;
    }
    if (storageos != null) {
      json[r'storageos'] = storageos;
    }
    if (vsphereVolume != null) {
      json[r'vsphereVolume'] = vsphereVolume;
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
