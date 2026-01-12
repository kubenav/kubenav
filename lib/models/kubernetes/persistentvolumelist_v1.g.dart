// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistentvolumelist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentvolumelistV1 _$PersistentvolumelistV1FromJson(
  Map<String, dynamic> json,
) => PersistentvolumelistV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(_$PersistentvolumelistV1KindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : PersistentvolumelistV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PersistentvolumelistV1ToJson(
  PersistentvolumelistV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$PersistentvolumelistV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$PersistentvolumelistV1KindEnumMap = {
  PersistentvolumelistV1Kind.PERSISTENT_VOLUME_LIST: 'PersistentVolumeList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : Spec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.PERSISTENT_VOLUME: 'PersistentVolume'};

ItemMetadata _$ItemMetadataFromJson(Map<String, dynamic> json) => ItemMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  creationTimestamp: json['creationTimestamp'] == null
      ? null
      : DateTime.parse(json['creationTimestamp'] as String),
  deletionGracePeriodSeconds: (json['deletionGracePeriodSeconds'] as num?)
      ?.toInt(),
  deletionTimestamp: json['deletionTimestamp'] == null
      ? null
      : DateTime.parse(json['deletionTimestamp'] as String),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  generateName: json['generateName'] as String?,
  generation: (json['generation'] as num?)?.toInt(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  managedFields: (json['managedFields'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : OwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$ItemMetadataToJson(ItemMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'creationTimestamp': instance.creationTimestamp?.toIso8601String(),
      'deletionGracePeriodSeconds': instance.deletionGracePeriodSeconds,
      'deletionTimestamp': instance.deletionTimestamp?.toIso8601String(),
      'finalizers': instance.finalizers,
      'generateName': instance.generateName,
      'generation': instance.generation,
      'labels': instance.labels,
      'managedFields': instance.managedFields,
      'name': instance.name,
      'namespace': instance.namespace,
      'ownerReferences': instance.ownerReferences,
      'resourceVersion': instance.resourceVersion,
      'selfLink': instance.selfLink,
      'uid': instance.uid,
    };

ManagedField _$ManagedFieldFromJson(Map<String, dynamic> json) => ManagedField(
  apiVersion: json['apiVersion'] as String?,
  fieldsType: json['fieldsType'] as String?,
  fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
  manager: json['manager'] as String?,
  operation: json['operation'] as String?,
  subresource: json['subresource'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ManagedFieldToJson(ManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

OwnerReference _$OwnerReferenceFromJson(Map<String, dynamic> json) =>
    OwnerReference(
      apiVersion: json['apiVersion'] as String,
      blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
      controller: json['controller'] as bool?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$OwnerReferenceToJson(OwnerReference instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'blockOwnerDeletion': instance.blockOwnerDeletion,
      'controller': instance.controller,
      'kind': instance.kind,
      'name': instance.name,
      'uid': instance.uid,
    };

Spec _$SpecFromJson(Map<String, dynamic> json) => Spec(
  accessModes: (json['accessModes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$AccessModeEnumMap, e))
      .toList(),
  awsElasticBlockStore: json['awsElasticBlockStore'] == null
      ? null
      : AwsElasticBlockStore.fromJson(
          json['awsElasticBlockStore'] as Map<String, dynamic>,
        ),
  azureDisk: json['azureDisk'] == null
      ? null
      : AzureDisk.fromJson(json['azureDisk'] as Map<String, dynamic>),
  azureFile: json['azureFile'] == null
      ? null
      : AzureFile.fromJson(json['azureFile'] as Map<String, dynamic>),
  capacity: json['capacity'] as Map<String, dynamic>?,
  cephfs: json['cephfs'] == null
      ? null
      : Cephfs.fromJson(json['cephfs'] as Map<String, dynamic>),
  cinder: json['cinder'] == null
      ? null
      : Cinder.fromJson(json['cinder'] as Map<String, dynamic>),
  claimRef: json['claimRef'] == null
      ? null
      : ClaimRef.fromJson(json['claimRef'] as Map<String, dynamic>),
  csi: json['csi'] == null
      ? null
      : Csi.fromJson(json['csi'] as Map<String, dynamic>),
  fc: json['fc'] == null
      ? null
      : Fc.fromJson(json['fc'] as Map<String, dynamic>),
  flexVolume: json['flexVolume'] == null
      ? null
      : FlexVolume.fromJson(json['flexVolume'] as Map<String, dynamic>),
  flocker: json['flocker'] == null
      ? null
      : Flocker.fromJson(json['flocker'] as Map<String, dynamic>),
  gcePersistentDisk: json['gcePersistentDisk'] == null
      ? null
      : GcePersistentDisk.fromJson(
          json['gcePersistentDisk'] as Map<String, dynamic>,
        ),
  glusterfs: json['glusterfs'] == null
      ? null
      : Glusterfs.fromJson(json['glusterfs'] as Map<String, dynamic>),
  hostPath: json['hostPath'] == null
      ? null
      : HostPath.fromJson(json['hostPath'] as Map<String, dynamic>),
  iscsi: json['iscsi'] == null
      ? null
      : Iscsi.fromJson(json['iscsi'] as Map<String, dynamic>),
  local: json['local'] == null
      ? null
      : Local.fromJson(json['local'] as Map<String, dynamic>),
  mountOptions: (json['mountOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  nfs: json['nfs'] == null
      ? null
      : Nfs.fromJson(json['nfs'] as Map<String, dynamic>),
  nodeAffinity: json['nodeAffinity'] == null
      ? null
      : NodeAffinity.fromJson(json['nodeAffinity'] as Map<String, dynamic>),
  persistentVolumeReclaimPolicy: $enumDecodeNullable(
    _$PersistentVolumeReclaimPolicyEnumMap,
    json['persistentVolumeReclaimPolicy'],
  ),
  photonPersistentDisk: json['photonPersistentDisk'] == null
      ? null
      : PhotonPersistentDisk.fromJson(
          json['photonPersistentDisk'] as Map<String, dynamic>,
        ),
  portworxVolume: json['portworxVolume'] == null
      ? null
      : PortworxVolume.fromJson(json['portworxVolume'] as Map<String, dynamic>),
  quobyte: json['quobyte'] == null
      ? null
      : Quobyte.fromJson(json['quobyte'] as Map<String, dynamic>),
  rbd: json['rbd'] == null
      ? null
      : Rbd.fromJson(json['rbd'] as Map<String, dynamic>),
  scaleIo: json['scaleIO'] == null
      ? null
      : ScaleIo.fromJson(json['scaleIO'] as Map<String, dynamic>),
  storageClassName: json['storageClassName'] as String?,
  storageos: json['storageos'] == null
      ? null
      : Storageos.fromJson(json['storageos'] as Map<String, dynamic>),
  volumeAttributesClassName: json['volumeAttributesClassName'] as String?,
  volumeMode: $enumDecodeNullable(_$VolumeModeEnumMap, json['volumeMode']),
  vsphereVolume: json['vsphereVolume'] == null
      ? null
      : VsphereVolume.fromJson(json['vsphereVolume'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'accessModes': instance.accessModes
      ?.map((e) => _$AccessModeEnumMap[e]!)
      .toList(),
  'awsElasticBlockStore': instance.awsElasticBlockStore,
  'azureDisk': instance.azureDisk,
  'azureFile': instance.azureFile,
  'capacity': instance.capacity,
  'cephfs': instance.cephfs,
  'cinder': instance.cinder,
  'claimRef': instance.claimRef,
  'csi': instance.csi,
  'fc': instance.fc,
  'flexVolume': instance.flexVolume,
  'flocker': instance.flocker,
  'gcePersistentDisk': instance.gcePersistentDisk,
  'glusterfs': instance.glusterfs,
  'hostPath': instance.hostPath,
  'iscsi': instance.iscsi,
  'local': instance.local,
  'mountOptions': instance.mountOptions,
  'nfs': instance.nfs,
  'nodeAffinity': instance.nodeAffinity,
  'persistentVolumeReclaimPolicy':
      _$PersistentVolumeReclaimPolicyEnumMap[instance
          .persistentVolumeReclaimPolicy],
  'photonPersistentDisk': instance.photonPersistentDisk,
  'portworxVolume': instance.portworxVolume,
  'quobyte': instance.quobyte,
  'rbd': instance.rbd,
  'scaleIO': instance.scaleIo,
  'storageClassName': instance.storageClassName,
  'storageos': instance.storageos,
  'volumeAttributesClassName': instance.volumeAttributesClassName,
  'volumeMode': _$VolumeModeEnumMap[instance.volumeMode],
  'vsphereVolume': instance.vsphereVolume,
};

const _$AccessModeEnumMap = {
  AccessMode.READ_ONLY_MANY: 'ReadOnlyMany',
  AccessMode.READ_WRITE_MANY: 'ReadWriteMany',
  AccessMode.READ_WRITE_ONCE: 'ReadWriteOnce',
  AccessMode.READ_WRITE_ONCE_POD: 'ReadWriteOncePod',
};

const _$PersistentVolumeReclaimPolicyEnumMap = {
  PersistentVolumeReclaimPolicy.DELETE: 'Delete',
  PersistentVolumeReclaimPolicy.RECYCLE: 'Recycle',
  PersistentVolumeReclaimPolicy.RETAIN: 'Retain',
};

const _$VolumeModeEnumMap = {
  VolumeMode.BLOCK: 'Block',
  VolumeMode.FILESYSTEM: 'Filesystem',
};

AwsElasticBlockStore _$AwsElasticBlockStoreFromJson(
  Map<String, dynamic> json,
) => AwsElasticBlockStore(
  fsType: json['fsType'] as String?,
  partition: (json['partition'] as num?)?.toInt(),
  readOnly: json['readOnly'] as bool?,
  volumeId: json['volumeID'] as String,
);

Map<String, dynamic> _$AwsElasticBlockStoreToJson(
  AwsElasticBlockStore instance,
) => <String, dynamic>{
  'fsType': instance.fsType,
  'partition': instance.partition,
  'readOnly': instance.readOnly,
  'volumeID': instance.volumeId,
};

AzureDisk _$AzureDiskFromJson(Map<String, dynamic> json) => AzureDisk(
  cachingMode: $enumDecodeNullable(_$CachingModeEnumMap, json['cachingMode']),
  diskName: json['diskName'] as String,
  diskUri: json['diskURI'] as String,
  fsType: json['fsType'] as String?,
  kind: $enumDecodeNullable(_$AzureDiskKindEnumMap, json['kind']),
  readOnly: json['readOnly'] as bool?,
);

Map<String, dynamic> _$AzureDiskToJson(AzureDisk instance) => <String, dynamic>{
  'cachingMode': _$CachingModeEnumMap[instance.cachingMode],
  'diskName': instance.diskName,
  'diskURI': instance.diskUri,
  'fsType': instance.fsType,
  'kind': _$AzureDiskKindEnumMap[instance.kind],
  'readOnly': instance.readOnly,
};

const _$CachingModeEnumMap = {
  CachingMode.NONE: 'None',
  CachingMode.READ_ONLY: 'ReadOnly',
  CachingMode.READ_WRITE: 'ReadWrite',
};

const _$AzureDiskKindEnumMap = {
  AzureDiskKind.DEDICATED: 'Dedicated',
  AzureDiskKind.MANAGED: 'Managed',
  AzureDiskKind.SHARED: 'Shared',
};

AzureFile _$AzureFileFromJson(Map<String, dynamic> json) => AzureFile(
  readOnly: json['readOnly'] as bool?,
  secretName: json['secretName'] as String,
  secretNamespace: json['secretNamespace'] as String?,
  shareName: json['shareName'] as String,
);

Map<String, dynamic> _$AzureFileToJson(AzureFile instance) => <String, dynamic>{
  'readOnly': instance.readOnly,
  'secretName': instance.secretName,
  'secretNamespace': instance.secretNamespace,
  'shareName': instance.shareName,
};

Cephfs _$CephfsFromJson(Map<String, dynamic> json) => Cephfs(
  monitors: (json['monitors'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  path: json['path'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretFile: json['secretFile'] as String?,
  secretRef: json['secretRef'] == null
      ? null
      : CephfsSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  user: json['user'] as String?,
);

Map<String, dynamic> _$CephfsToJson(Cephfs instance) => <String, dynamic>{
  'monitors': instance.monitors,
  'path': instance.path,
  'readOnly': instance.readOnly,
  'secretFile': instance.secretFile,
  'secretRef': instance.secretRef,
  'user': instance.user,
};

CephfsSecretRef _$CephfsSecretRefFromJson(Map<String, dynamic> json) =>
    CephfsSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$CephfsSecretRefToJson(CephfsSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Cinder _$CinderFromJson(Map<String, dynamic> json) => Cinder(
  fsType: json['fsType'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : CinderSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  volumeId: json['volumeID'] as String,
);

Map<String, dynamic> _$CinderToJson(Cinder instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'volumeID': instance.volumeId,
};

CinderSecretRef _$CinderSecretRefFromJson(Map<String, dynamic> json) =>
    CinderSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$CinderSecretRefToJson(CinderSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

ClaimRef _$ClaimRefFromJson(Map<String, dynamic> json) => ClaimRef(
  apiVersion: json['apiVersion'] as String?,
  fieldPath: json['fieldPath'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$ClaimRefToJson(ClaimRef instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'fieldPath': instance.fieldPath,
  'kind': instance.kind,
  'name': instance.name,
  'namespace': instance.namespace,
  'resourceVersion': instance.resourceVersion,
  'uid': instance.uid,
};

Csi _$CsiFromJson(Map<String, dynamic> json) => Csi(
  controllerExpandSecretRef: json['controllerExpandSecretRef'] == null
      ? null
      : ControllerExpandSecretRef.fromJson(
          json['controllerExpandSecretRef'] as Map<String, dynamic>,
        ),
  controllerPublishSecretRef: json['controllerPublishSecretRef'] == null
      ? null
      : ControllerPublishSecretRef.fromJson(
          json['controllerPublishSecretRef'] as Map<String, dynamic>,
        ),
  driver: json['driver'] as String,
  fsType: json['fsType'] as String?,
  nodeExpandSecretRef: json['nodeExpandSecretRef'] == null
      ? null
      : NodeExpandSecretRef.fromJson(
          json['nodeExpandSecretRef'] as Map<String, dynamic>,
        ),
  nodePublishSecretRef: json['nodePublishSecretRef'] == null
      ? null
      : NodePublishSecretRef.fromJson(
          json['nodePublishSecretRef'] as Map<String, dynamic>,
        ),
  nodeStageSecretRef: json['nodeStageSecretRef'] == null
      ? null
      : NodeStageSecretRef.fromJson(
          json['nodeStageSecretRef'] as Map<String, dynamic>,
        ),
  readOnly: json['readOnly'] as bool?,
  volumeAttributes: (json['volumeAttributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  volumeHandle: json['volumeHandle'] as String,
);

Map<String, dynamic> _$CsiToJson(Csi instance) => <String, dynamic>{
  'controllerExpandSecretRef': instance.controllerExpandSecretRef,
  'controllerPublishSecretRef': instance.controllerPublishSecretRef,
  'driver': instance.driver,
  'fsType': instance.fsType,
  'nodeExpandSecretRef': instance.nodeExpandSecretRef,
  'nodePublishSecretRef': instance.nodePublishSecretRef,
  'nodeStageSecretRef': instance.nodeStageSecretRef,
  'readOnly': instance.readOnly,
  'volumeAttributes': instance.volumeAttributes,
  'volumeHandle': instance.volumeHandle,
};

ControllerExpandSecretRef _$ControllerExpandSecretRefFromJson(
  Map<String, dynamic> json,
) => ControllerExpandSecretRef(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$ControllerExpandSecretRefToJson(
  ControllerExpandSecretRef instance,
) => <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

ControllerPublishSecretRef _$ControllerPublishSecretRefFromJson(
  Map<String, dynamic> json,
) => ControllerPublishSecretRef(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$ControllerPublishSecretRefToJson(
  ControllerPublishSecretRef instance,
) => <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

NodeExpandSecretRef _$NodeExpandSecretRefFromJson(Map<String, dynamic> json) =>
    NodeExpandSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$NodeExpandSecretRefToJson(
  NodeExpandSecretRef instance,
) => <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

NodePublishSecretRef _$NodePublishSecretRefFromJson(
  Map<String, dynamic> json,
) => NodePublishSecretRef(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$NodePublishSecretRefToJson(
  NodePublishSecretRef instance,
) => <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

NodeStageSecretRef _$NodeStageSecretRefFromJson(Map<String, dynamic> json) =>
    NodeStageSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$NodeStageSecretRefToJson(NodeStageSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Fc _$FcFromJson(Map<String, dynamic> json) => Fc(
  fsType: json['fsType'] as String?,
  lun: (json['lun'] as num?)?.toInt(),
  readOnly: json['readOnly'] as bool?,
  targetWwNs: (json['targetWWNs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  wwids: (json['wwids'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FcToJson(Fc instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'lun': instance.lun,
  'readOnly': instance.readOnly,
  'targetWWNs': instance.targetWwNs,
  'wwids': instance.wwids,
};

FlexVolume _$FlexVolumeFromJson(Map<String, dynamic> json) => FlexVolume(
  driver: json['driver'] as String,
  fsType: json['fsType'] as String?,
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : FlexVolumeSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FlexVolumeToJson(FlexVolume instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'fsType': instance.fsType,
      'options': instance.options,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
    };

FlexVolumeSecretRef _$FlexVolumeSecretRefFromJson(Map<String, dynamic> json) =>
    FlexVolumeSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$FlexVolumeSecretRefToJson(
  FlexVolumeSecretRef instance,
) => <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Flocker _$FlockerFromJson(Map<String, dynamic> json) => Flocker(
  datasetName: json['datasetName'] as String?,
  datasetUuid: json['datasetUUID'] as String?,
);

Map<String, dynamic> _$FlockerToJson(Flocker instance) => <String, dynamic>{
  'datasetName': instance.datasetName,
  'datasetUUID': instance.datasetUuid,
};

GcePersistentDisk _$GcePersistentDiskFromJson(Map<String, dynamic> json) =>
    GcePersistentDisk(
      fsType: json['fsType'] as String?,
      partition: (json['partition'] as num?)?.toInt(),
      pdName: json['pdName'] as String,
      readOnly: json['readOnly'] as bool?,
    );

Map<String, dynamic> _$GcePersistentDiskToJson(GcePersistentDisk instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'partition': instance.partition,
      'pdName': instance.pdName,
      'readOnly': instance.readOnly,
    };

Glusterfs _$GlusterfsFromJson(Map<String, dynamic> json) => Glusterfs(
  endpoints: json['endpoints'] as String,
  endpointsNamespace: json['endpointsNamespace'] as String?,
  path: json['path'] as String,
  readOnly: json['readOnly'] as bool?,
);

Map<String, dynamic> _$GlusterfsToJson(Glusterfs instance) => <String, dynamic>{
  'endpoints': instance.endpoints,
  'endpointsNamespace': instance.endpointsNamespace,
  'path': instance.path,
  'readOnly': instance.readOnly,
};

HostPath _$HostPathFromJson(Map<String, dynamic> json) => HostPath(
  path: json['path'] as String,
  type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
);

Map<String, dynamic> _$HostPathToJson(HostPath instance) => <String, dynamic>{
  'path': instance.path,
  'type': _$TypeEnumMap[instance.type],
};

const _$TypeEnumMap = {
  Type.BLOCK_DEVICE: 'BlockDevice',
  Type.CHAR_DEVICE: 'CharDevice',
  Type.DIRECTORY: 'Directory',
  Type.DIRECTORY_OR_CREATE: 'DirectoryOrCreate',
  Type.EMPTY: '',
  Type.FILE: 'File',
  Type.FILE_OR_CREATE: 'FileOrCreate',
  Type.SOCKET: 'Socket',
};

Iscsi _$IscsiFromJson(Map<String, dynamic> json) => Iscsi(
  chapAuthDiscovery: json['chapAuthDiscovery'] as bool?,
  chapAuthSession: json['chapAuthSession'] as bool?,
  fsType: json['fsType'] as String?,
  initiatorName: json['initiatorName'] as String?,
  iqn: json['iqn'] as String,
  iscsiInterface: json['iscsiInterface'] as String?,
  lun: (json['lun'] as num).toInt(),
  portals: (json['portals'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : IscsiSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  targetPortal: json['targetPortal'] as String,
);

Map<String, dynamic> _$IscsiToJson(Iscsi instance) => <String, dynamic>{
  'chapAuthDiscovery': instance.chapAuthDiscovery,
  'chapAuthSession': instance.chapAuthSession,
  'fsType': instance.fsType,
  'initiatorName': instance.initiatorName,
  'iqn': instance.iqn,
  'iscsiInterface': instance.iscsiInterface,
  'lun': instance.lun,
  'portals': instance.portals,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'targetPortal': instance.targetPortal,
};

IscsiSecretRef _$IscsiSecretRefFromJson(Map<String, dynamic> json) =>
    IscsiSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$IscsiSecretRefToJson(IscsiSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Local _$LocalFromJson(Map<String, dynamic> json) =>
    Local(fsType: json['fsType'] as String?, path: json['path'] as String);

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'path': instance.path,
};

Nfs _$NfsFromJson(Map<String, dynamic> json) => Nfs(
  path: json['path'] as String,
  readOnly: json['readOnly'] as bool?,
  server: json['server'] as String,
);

Map<String, dynamic> _$NfsToJson(Nfs instance) => <String, dynamic>{
  'path': instance.path,
  'readOnly': instance.readOnly,
  'server': instance.server,
};

NodeAffinity _$NodeAffinityFromJson(Map<String, dynamic> json) => NodeAffinity(
  required: json['required'] == null
      ? null
      : Required.fromJson(json['required'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NodeAffinityToJson(NodeAffinity instance) =>
    <String, dynamic>{'required': instance.required};

Required _$RequiredFromJson(Map<String, dynamic> json) => Required(
  nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : NodeSelectorTerm.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$RequiredToJson(Required instance) => <String, dynamic>{
  'nodeSelectorTerms': instance.nodeSelectorTerms,
};

NodeSelectorTerm _$NodeSelectorTermFromJson(Map<String, dynamic> json) =>
    NodeSelectorTerm(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchFields: (json['matchFields'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MatchField.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$NodeSelectorTermToJson(NodeSelectorTerm instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

MatchExpression _$MatchExpressionFromJson(Map<String, dynamic> json) =>
    MatchExpression(
      key: json['key'] as String,
      matchExpressionOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpressionToJson(MatchExpression instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.matchExpressionOperator]!,
      'values': instance.values,
    };

const _$OperatorEnumMap = {
  Operator.DOES_NOT_EXIST: 'DoesNotExist',
  Operator.EXISTS: 'Exists',
  Operator.GT: 'Gt',
  Operator.IN: 'In',
  Operator.LT: 'Lt',
  Operator.NOT_IN: 'NotIn',
};

MatchField _$MatchFieldFromJson(Map<String, dynamic> json) => MatchField(
  key: json['key'] as String,
  matchFieldOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$MatchFieldToJson(MatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.matchFieldOperator]!,
      'values': instance.values,
    };

PhotonPersistentDisk _$PhotonPersistentDiskFromJson(
  Map<String, dynamic> json,
) => PhotonPersistentDisk(
  fsType: json['fsType'] as String?,
  pdId: json['pdID'] as String,
);

Map<String, dynamic> _$PhotonPersistentDiskToJson(
  PhotonPersistentDisk instance,
) => <String, dynamic>{'fsType': instance.fsType, 'pdID': instance.pdId};

PortworxVolume _$PortworxVolumeFromJson(Map<String, dynamic> json) =>
    PortworxVolume(
      fsType: json['fsType'] as String?,
      readOnly: json['readOnly'] as bool?,
      volumeId: json['volumeID'] as String,
    );

Map<String, dynamic> _$PortworxVolumeToJson(PortworxVolume instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'readOnly': instance.readOnly,
      'volumeID': instance.volumeId,
    };

Quobyte _$QuobyteFromJson(Map<String, dynamic> json) => Quobyte(
  group: json['group'] as String?,
  readOnly: json['readOnly'] as bool?,
  registry: json['registry'] as String,
  tenant: json['tenant'] as String?,
  user: json['user'] as String?,
  volume: json['volume'] as String,
);

Map<String, dynamic> _$QuobyteToJson(Quobyte instance) => <String, dynamic>{
  'group': instance.group,
  'readOnly': instance.readOnly,
  'registry': instance.registry,
  'tenant': instance.tenant,
  'user': instance.user,
  'volume': instance.volume,
};

Rbd _$RbdFromJson(Map<String, dynamic> json) => Rbd(
  fsType: json['fsType'] as String?,
  image: json['image'] as String,
  keyring: json['keyring'] as String?,
  monitors: (json['monitors'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  pool: json['pool'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : RbdSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  user: json['user'] as String?,
);

Map<String, dynamic> _$RbdToJson(Rbd instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'image': instance.image,
  'keyring': instance.keyring,
  'monitors': instance.monitors,
  'pool': instance.pool,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'user': instance.user,
};

RbdSecretRef _$RbdSecretRefFromJson(Map<String, dynamic> json) => RbdSecretRef(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$RbdSecretRefToJson(RbdSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

ScaleIo _$ScaleIoFromJson(Map<String, dynamic> json) => ScaleIo(
  fsType: json['fsType'] as String?,
  gateway: json['gateway'] as String,
  protectionDomain: json['protectionDomain'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: ScaleIoSecretRef.fromJson(
    json['secretRef'] as Map<String, dynamic>,
  ),
  sslEnabled: json['sslEnabled'] as bool?,
  storageMode: json['storageMode'] as String?,
  storagePool: json['storagePool'] as String?,
  system: json['system'] as String,
  volumeName: json['volumeName'] as String?,
);

Map<String, dynamic> _$ScaleIoToJson(ScaleIo instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'gateway': instance.gateway,
  'protectionDomain': instance.protectionDomain,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'sslEnabled': instance.sslEnabled,
  'storageMode': instance.storageMode,
  'storagePool': instance.storagePool,
  'system': instance.system,
  'volumeName': instance.volumeName,
};

ScaleIoSecretRef _$ScaleIoSecretRefFromJson(Map<String, dynamic> json) =>
    ScaleIoSecretRef(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$ScaleIoSecretRefToJson(ScaleIoSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Storageos _$StorageosFromJson(Map<String, dynamic> json) => Storageos(
  fsType: json['fsType'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : StorageosSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  volumeName: json['volumeName'] as String?,
  volumeNamespace: json['volumeNamespace'] as String?,
);

Map<String, dynamic> _$StorageosToJson(Storageos instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'volumeName': instance.volumeName,
  'volumeNamespace': instance.volumeNamespace,
};

StorageosSecretRef _$StorageosSecretRefFromJson(Map<String, dynamic> json) =>
    StorageosSecretRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      resourceVersion: json['resourceVersion'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$StorageosSecretRefToJson(StorageosSecretRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
      'resourceVersion': instance.resourceVersion,
      'uid': instance.uid,
    };

VsphereVolume _$VsphereVolumeFromJson(Map<String, dynamic> json) =>
    VsphereVolume(
      fsType: json['fsType'] as String?,
      storagePolicyId: json['storagePolicyID'] as String?,
      storagePolicyName: json['storagePolicyName'] as String?,
      volumePath: json['volumePath'] as String,
    );

Map<String, dynamic> _$VsphereVolumeToJson(VsphereVolume instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'storagePolicyID': instance.storagePolicyId,
      'storagePolicyName': instance.storagePolicyName,
      'volumePath': instance.volumePath,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  lastPhaseTransitionTime: json['lastPhaseTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastPhaseTransitionTime'] as String),
  message: json['message'] as String?,
  phase: $enumDecodeNullable(_$PhaseEnumMap, json['phase']),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'lastPhaseTransitionTime': instance.lastPhaseTransitionTime
      ?.toIso8601String(),
  'message': instance.message,
  'phase': _$PhaseEnumMap[instance.phase],
  'reason': instance.reason,
};

const _$PhaseEnumMap = {
  Phase.AVAILABLE: 'Available',
  Phase.BOUND: 'Bound',
  Phase.FAILED: 'Failed',
  Phase.PENDING: 'Pending',
  Phase.RELEASED: 'Released',
};

PersistentvolumelistV1Metadata _$PersistentvolumelistV1MetadataFromJson(
  Map<String, dynamic> json,
) => PersistentvolumelistV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$PersistentvolumelistV1MetadataToJson(
  PersistentvolumelistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
