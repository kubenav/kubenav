import 'package:json_annotation/json_annotation.dart';

part 'persistentvolumelist_v1.g.dart';

///PersistentVolumeList is a list of PersistentVolume items.
@JsonSerializable()
class PersistentvolumelistV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///items is a list of persistent volumes. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  PersistentvolumelistV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  PersistentvolumelistV1Metadata? metadata;

  PersistentvolumelistV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory PersistentvolumelistV1.fromJson(Map<String, dynamic> json) =>
      _$PersistentvolumelistV1FromJson(json);

  Map<String, dynamic> toJson() => _$PersistentvolumelistV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('v1')
  V1,
}

final apiVersionValues = EnumValues({'v1': ApiVersion.V1});

@JsonSerializable()
class Item {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ItemKind? kind;

  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  ItemMetadata? metadata;

  ///PersistentVolumeSpec is the specification of a persistent volume.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///PersistentVolumeStatus is the current status of a persistent volume.
  @JsonKey(name: 'status')
  Status? status;

  Item({this.apiVersion, this.kind, this.metadata, this.spec, this.status});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('PersistentVolume')
  PERSISTENT_VOLUME,
}

final itemKindValues = EnumValues({
  'PersistentVolume': ItemKind.PERSISTENT_VOLUME,
});

@JsonSerializable()
class ItemMetadata {
  ///Annotations is an unstructured key value map stored with a resource that may be set by
  ///external tools to store and retrieve arbitrary metadata. They are not queryable and
  ///should be preserved when modifying objects. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'creationTimestamp')
  DateTime? creationTimestamp;

  ///Number of seconds allowed for this object to gracefully terminate before it will be
  ///removed from the system. Only set when deletionTimestamp is also set. May only be
  ///shortened. Read-only.
  @JsonKey(name: 'deletionGracePeriodSeconds')
  int? deletionGracePeriodSeconds;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'deletionTimestamp')
  DateTime? deletionTimestamp;

  ///Must be empty before the object is deleted from the registry. Each entry is an identifier
  ///for the responsible component that will remove the entry from the list. If the
  ///deletionTimestamp of the object is non-nil, entries in this list can only be removed.
  ///Finalizers may be processed and removed in any order.  Order is NOT enforced because it
  ///introduces significant risk of stuck finalizers. finalizers is a shared field, any actor
  ///with permission can reorder it. If the finalizer list is processed in order, then this
  ///can lead to a situation in which the component responsible for the first finalizer in the
  ///list is waiting for a signal (field value, external system, or other) produced by a
  ///component responsible for a finalizer later in the list, resulting in a deadlock. Without
  ///enforced ordering finalizers are free to order amongst themselves and are not vulnerable
  ///to ordering changes in the list.
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;

  ///GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF
  ///the Name field has not been provided. If this field is used, the name returned to the
  ///client will be different than the name passed. This value will also be combined with a
  ///unique suffix. The provided value has the same validation rules as the Name field, and
  ///may be truncated by the length of the suffix required to make the value unique on the
  ///server.
  ///
  ///If this field is specified and the generated name exists, the server will return a 409.
  ///
  ///Applied only if Name is not specified. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
  @JsonKey(name: 'generateName')
  String? generateName;

  ///A sequence number representing a specific generation of the desired state. Populated by
  ///the system. Read-only.
  @JsonKey(name: 'generation')
  int? generation;

  ///Map of string keys and values that can be used to organize and categorize (scope and
  ///select) objects. May match selectors of replication controllers and services. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ///ManagedFields maps workflow-id and version to the set of fields that are managed by that
  ///workflow. This is mostly for internal housekeeping, and users typically shouldn't need to
  ///set or understand this field. A workflow can be the user's name, a controller's name, or
  ///the name of a specific apply path like "ci-cd". The set of fields is always in the
  ///version that the workflow used when modifying the object.
  @JsonKey(name: 'managedFields')
  List<ManagedField?>? managedFields;

  ///Name must be unique within a namespace. Is required when creating resources, although
  ///some resources may allow a client to request the generation of an appropriate name
  ///automatically. Name is primarily intended for creation idempotence and configuration
  ///definition. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String? name;

  ///Namespace defines the space within which each name must be unique. An empty namespace is
  ///equivalent to the "default" namespace, but "default" is the canonical representation. Not
  ///all objects are required to be scoped to a namespace - the value of this field for those
  ///objects will be empty.
  ///
  ///Must be a DNS_LABEL. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces
  @JsonKey(name: 'namespace')
  String? namespace;

  ///List of objects depended by this object. If ALL objects in the list have been deleted,
  ///this object will be garbage collected. If this object is managed by a controller, then an
  ///entry in this list will point to this controller, with the controller field set to true.
  ///There cannot be more than one managing controller.
  @JsonKey(name: 'ownerReferences')
  List<OwnerReference?>? ownerReferences;

  ///An opaque value that represents the internal version of this object that can be used by
  ///clients to determine when objects have changed. May be used for optimistic concurrency,
  ///change detection, and the watch operation on a resource or set of resources. Clients must
  ///treat these values as opaque and passed unmodified back to the server. They may only be
  ///valid for a particular resource or set of resources.
  ///
  ///Populated by the system. Read-only. Value must be treated as opaque by clients and . More
  ///info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  ///UID is the unique in time and space value for this object. It is typically generated by
  ///the server on successful creation of a resource and is not allowed to change on PUT
  ///operations.
  ///
  ///Populated by the system. Read-only. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String? uid;

  ItemMetadata({
    this.annotations,
    this.creationTimestamp,
    this.deletionGracePeriodSeconds,
    this.deletionTimestamp,
    this.finalizers,
    this.generateName,
    this.generation,
    this.labels,
    this.managedFields,
    this.name,
    this.namespace,
    this.ownerReferences,
    this.resourceVersion,
    this.selfLink,
    this.uid,
  });

  factory ItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$ItemMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMetadataToJson(this);
}

@JsonSerializable()
class ManagedField {
  ///APIVersion defines the version of this resource that this field set applies to. The
  ///format is "group/version" just like the top-level APIVersion field. It is necessary to
  ///track the version of a field set because it cannot be automatically converted.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///FieldsType is the discriminator for the different fields format and version. There is
  ///currently only one possible value: "FieldsV1"
  @JsonKey(name: 'fieldsType')
  String? fieldsType;

  ///FieldsV1 stores a set of fields in a data structure like a Trie, in JSON format.
  ///
  ///Each key is either a '.' representing the field itself, and will always map to an empty
  ///set, or a string representing a sub-field or item. The string will follow one of these
  ///four formats: 'f:<name>', where <name> is the name of a field in a struct, or key in a
  ///map 'v:<value>', where <value> is the exact json formatted value of a list item
  ///'i:<index>', where <index> is position of a item in a list 'k:<keys>', where <keys> is a
  ///map of  a list item's key fields to their unique values If a key maps to an empty Fields
  ///value, the field that key represents is part of the set.
  ///
  ///The exact format is defined in sigs.k8s.io/structured-merge-diff
  @JsonKey(name: 'fieldsV1')
  Map<String, dynamic>? fieldsV1;

  ///Manager is an identifier of the workflow managing these fields.
  @JsonKey(name: 'manager')
  String? manager;

  ///Operation is the type of operation which lead to this ManagedFieldsEntry being created.
  ///The only valid values for this field are 'Apply' and 'Update'.
  @JsonKey(name: 'operation')
  String? operation;

  ///Subresource is the name of the subresource used to update that object, or empty string if
  ///the object was updated through the main resource. The value of this field is used to
  ///distinguish between managers, even if they share the same name. For example, a status
  ///update will be distinct from a regular update using the same manager name. Note that the
  ///APIVersion field is not related to the Subresource field and it always corresponds to the
  ///version of the main resource.
  @JsonKey(name: 'subresource')
  String? subresource;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'time')
  DateTime? time;

  ManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory ManagedField.fromJson(Map<String, dynamic> json) =>
      _$ManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedFieldToJson(this);
}

@JsonSerializable()
class OwnerReference {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String apiVersion;

  ///If true, AND if the owner has the "foregroundDeletion" finalizer, then the owner cannot
  ///be deleted from the key-value store until this reference is removed. See
  ///https://kubernetes.io/docs/concepts/architecture/garbage-collection/#foreground-deletion
  ///for how the garbage collector interacts with this field and enforces the foreground
  ///deletion. Defaults to false. To set this field, a user needs "delete" permission of the
  ///owner, otherwise 422 (Unprocessable Entity) will be returned.
  @JsonKey(name: 'blockOwnerDeletion')
  bool? blockOwnerDeletion;

  ///If true, this reference points to the managing controller.
  @JsonKey(name: 'controller')
  bool? controller;

  ///Kind of the referent. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///Name of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String name;

  ///UID of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String uid;

  OwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory OwnerReference.fromJson(Map<String, dynamic> json) =>
      _$OwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerReferenceToJson(this);
}

@JsonSerializable()
class Spec {
  ///accessModes contains all ways the volume can be mounted. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
  @JsonKey(name: 'accessModes')
  List<AccessMode>? accessModes;

  ///Represents a Persistent Disk resource in AWS.
  ///
  ///An AWS EBS disk must exist before mounting to a container. The disk must also be in the
  ///same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS
  ///EBS volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'awsElasticBlockStore')
  AwsElasticBlockStore? awsElasticBlockStore;

  ///AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
  @JsonKey(name: 'azureDisk')
  AzureDisk? azureDisk;

  ///AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
  @JsonKey(name: 'azureFile')
  AzureFile? azureFile;

  ///capacity is the description of the persistent volume's resources and capacity. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
  @JsonKey(name: 'capacity')
  Map<String, dynamic>? capacity;

  ///Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'cephfs')
  Cephfs? cephfs;

  ///Represents a cinder volume resource in Openstack. A Cinder volume must exist before
  ///mounting to a container. The volume must also be in the same region as the kubelet.
  ///Cinder volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'cinder')
  Cinder? cinder;

  ///ObjectReference contains enough information to let you inspect or modify the referred
  ///object.
  @JsonKey(name: 'claimRef')
  ClaimRef? claimRef;

  ///Represents storage that is managed by an external CSI volume driver
  @JsonKey(name: 'csi')
  Csi? csi;

  ///Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as
  ///read/write once. Fibre Channel volumes support ownership management and SELinux
  ///relabeling.
  @JsonKey(name: 'fc')
  Fc? fc;

  ///FlexPersistentVolumeSource represents a generic persistent volume resource that is
  ///provisioned/attached using an exec based plugin.
  @JsonKey(name: 'flexVolume')
  FlexVolume? flexVolume;

  ///Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName
  ///and datasetUUID should be set. Flocker volumes do not support ownership management or
  ///SELinux relabeling.
  @JsonKey(name: 'flocker')
  Flocker? flocker;

  ///Represents a Persistent Disk resource in Google Compute Engine.
  ///
  ///A GCE PD must exist before mounting to a container. The disk must also be in the same GCE
  ///project and zone as the kubelet. A GCE PD can only be mounted as read/write once or
  ///read-only many times. GCE PDs support ownership management and SELinux relabeling.
  @JsonKey(name: 'gcePersistentDisk')
  GcePersistentDisk? gcePersistentDisk;

  ///Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'glusterfs')
  Glusterfs? glusterfs;

  ///Represents a host path mapped into a pod. Host path volumes do not support ownership
  ///management or SELinux relabeling.
  @JsonKey(name: 'hostPath')
  HostPath? hostPath;

  ///ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted
  ///as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'iscsi')
  Iscsi? iscsi;

  ///Local represents directly-attached storage with node affinity
  @JsonKey(name: 'local')
  Local? local;

  ///mountOptions is the list of mount options, e.g. ["ro", "soft"]. Not validated - mount
  ///will simply fail if one is invalid. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
  @JsonKey(name: 'mountOptions')
  List<String?>? mountOptions;

  ///Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support
  ///ownership management or SELinux relabeling.
  @JsonKey(name: 'nfs')
  Nfs? nfs;

  ///VolumeNodeAffinity defines constraints that limit what nodes this volume can be accessed
  ///from.
  @JsonKey(name: 'nodeAffinity')
  NodeAffinity? nodeAffinity;

  ///persistentVolumeReclaimPolicy defines what happens to a persistent volume when released
  ///from its claim. Valid options are Retain (default for manually created
  ///PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and
  ///Recycle (deprecated). Recycle must be supported by the volume plugin underlying this
  ///PersistentVolume. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
  ///
  ///Possible enum values:
  ///- `"Delete"` means the volume will be deleted from Kubernetes on release from its claim.
  ///The volume plugin must support Deletion.
  ///- `"Recycle"` means the volume will be recycled back into the pool of unbound persistent
  ///volumes on release from its claim. The volume plugin must support Recycling.
  ///- `"Retain"` means the volume will be left in its current phase (Released) for manual
  ///reclamation by the administrator. The default policy is Retain.
  @JsonKey(name: 'persistentVolumeReclaimPolicy')
  PersistentVolumeReclaimPolicy? persistentVolumeReclaimPolicy;

  ///Represents a Photon Controller persistent disk resource.
  @JsonKey(name: 'photonPersistentDisk')
  PhotonPersistentDisk? photonPersistentDisk;

  ///PortworxVolumeSource represents a Portworx volume resource.
  @JsonKey(name: 'portworxVolume')
  PortworxVolume? portworxVolume;

  ///Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'quobyte')
  Quobyte? quobyte;

  ///Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes
  ///support ownership management and SELinux relabeling.
  @JsonKey(name: 'rbd')
  Rbd? rbd;

  ///ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume
  @JsonKey(name: 'scaleIO')
  ScaleIo? scaleIo;

  ///storageClassName is the name of StorageClass to which this persistent volume belongs.
  ///Empty value means that this volume does not belong to any StorageClass.
  @JsonKey(name: 'storageClassName')
  String? storageClassName;

  ///Represents a StorageOS persistent volume resource.
  @JsonKey(name: 'storageos')
  Storageos? storageos;

  ///Name of VolumeAttributesClass to which this persistent volume belongs. Empty value is not
  ///allowed. When this field is not set, it indicates that this volume does not belong to any
  ///VolumeAttributesClass. This field is mutable and can be changed by the CSI driver after a
  ///volume has been updated successfully to a new class. For an unbound PersistentVolume, the
  ///volumeAttributesClassName will be matched with unbound PersistentVolumeClaims during the
  ///binding process.
  @JsonKey(name: 'volumeAttributesClassName')
  String? volumeAttributesClassName;

  ///volumeMode defines if a volume is intended to be used with a formatted filesystem or to
  ///remain in raw block state. Value of Filesystem is implied when not included in spec.
  ///
  ///Possible enum values:
  ///- `"Block"` means the volume will not be formatted with a filesystem and will remain a
  ///raw block device.
  ///- `"Filesystem"` means the volume will be or is formatted with a filesystem.
  @JsonKey(name: 'volumeMode')
  VolumeMode? volumeMode;

  ///Represents a vSphere volume resource.
  @JsonKey(name: 'vsphereVolume')
  VsphereVolume? vsphereVolume;

  Spec({
    this.accessModes,
    this.awsElasticBlockStore,
    this.azureDisk,
    this.azureFile,
    this.capacity,
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
    this.mountOptions,
    this.nfs,
    this.nodeAffinity,
    this.persistentVolumeReclaimPolicy,
    this.photonPersistentDisk,
    this.portworxVolume,
    this.quobyte,
    this.rbd,
    this.scaleIo,
    this.storageClassName,
    this.storageos,
    this.volumeAttributesClassName,
    this.volumeMode,
    this.vsphereVolume,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

enum AccessMode {
  @JsonValue('ReadOnlyMany')
  READ_ONLY_MANY,
  @JsonValue('ReadWriteMany')
  READ_WRITE_MANY,
  @JsonValue('ReadWriteOnce')
  READ_WRITE_ONCE,
  @JsonValue('ReadWriteOncePod')
  READ_WRITE_ONCE_POD,
}

final accessModeValues = EnumValues({
  'ReadOnlyMany': AccessMode.READ_ONLY_MANY,
  'ReadWriteMany': AccessMode.READ_WRITE_MANY,
  'ReadWriteOnce': AccessMode.READ_WRITE_ONCE,
  'ReadWriteOncePod': AccessMode.READ_WRITE_ONCE_POD,
});

@JsonSerializable()
class AwsElasticBlockStore {
  ///fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the
  ///filesystem type is supported by the host operating system. Examples: "ext4", "xfs",
  ///"ntfs". Implicitly inferred to be "ext4" if unspecified. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  @JsonKey(name: 'fsType')
  String? fsType;

  ///partition is the partition in the volume that you want to mount. If omitted, the default
  ///is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as
  ///"1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property
  ///empty).
  @JsonKey(name: 'partition')
  int? partition;

  ///readOnly value true will force the readOnly setting in VolumeMounts. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///volumeID is unique ID of the persistent disk resource in AWS (Amazon EBS volume). More
  ///info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
  @JsonKey(name: 'volumeID')
  String volumeId;

  AwsElasticBlockStore({
    this.fsType,
    this.partition,
    this.readOnly,
    required this.volumeId,
  });

  factory AwsElasticBlockStore.fromJson(Map<String, dynamic> json) =>
      _$AwsElasticBlockStoreFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElasticBlockStoreToJson(this);
}

@JsonSerializable()
class AzureDisk {
  ///cachingMode is the Host Caching mode: None, Read Only, Read Write.
  ///
  ///Possible enum values:
  ///- `"None"`
  ///- `"ReadOnly"`
  ///- `"ReadWrite"`
  @JsonKey(name: 'cachingMode')
  CachingMode? cachingMode;

  ///diskName is the Name of the data disk in the blob storage
  @JsonKey(name: 'diskName')
  String diskName;

  ///diskURI is the URI of data disk in the blob storage
  @JsonKey(name: 'diskURI')
  String diskUri;

  ///fsType is Filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///kind expected values are Shared: multiple blob disks per storage account  Dedicated:
  ///single blob disk per storage account  Managed: azure managed data disk (only in managed
  ///availability set). defaults to shared
  ///
  ///Possible enum values:
  ///- `"Dedicated"`
  ///- `"Managed"`
  ///- `"Shared"`
  @JsonKey(name: 'kind')
  AzureDiskKind? kind;

  ///readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  AzureDisk({
    this.cachingMode,
    required this.diskName,
    required this.diskUri,
    this.fsType,
    this.kind,
    this.readOnly,
  });

  factory AzureDisk.fromJson(Map<String, dynamic> json) =>
      _$AzureDiskFromJson(json);

  Map<String, dynamic> toJson() => _$AzureDiskToJson(this);
}

///cachingMode is the Host Caching mode: None, Read Only, Read Write.
///
///Possible enum values:
///- `"None"`
///- `"ReadOnly"`
///- `"ReadWrite"`
enum CachingMode {
  @JsonValue('None')
  NONE,
  @JsonValue('ReadOnly')
  READ_ONLY,
  @JsonValue('ReadWrite')
  READ_WRITE,
}

final cachingModeValues = EnumValues({
  'None': CachingMode.NONE,
  'ReadOnly': CachingMode.READ_ONLY,
  'ReadWrite': CachingMode.READ_WRITE,
});

///kind expected values are Shared: multiple blob disks per storage account  Dedicated:
///single blob disk per storage account  Managed: azure managed data disk (only in managed
///availability set). defaults to shared
///
///Possible enum values:
///- `"Dedicated"`
///- `"Managed"`
///- `"Shared"`
enum AzureDiskKind {
  @JsonValue('Dedicated')
  DEDICATED,
  @JsonValue('Managed')
  MANAGED,
  @JsonValue('Shared')
  SHARED,
}

final azureDiskKindValues = EnumValues({
  'Dedicated': AzureDiskKind.DEDICATED,
  'Managed': AzureDiskKind.MANAGED,
  'Shared': AzureDiskKind.SHARED,
});

@JsonSerializable()
class AzureFile {
  ///readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///secretName is the name of secret that contains Azure Storage Account Name and Key
  @JsonKey(name: 'secretName')
  String secretName;

  ///secretNamespace is the namespace of the secret that contains Azure Storage Account Name
  ///and Key default is the same as the Pod
  @JsonKey(name: 'secretNamespace')
  String? secretNamespace;

  ///shareName is the azure Share Name
  @JsonKey(name: 'shareName')
  String shareName;

  AzureFile({
    this.readOnly,
    required this.secretName,
    this.secretNamespace,
    required this.shareName,
  });

  factory AzureFile.fromJson(Map<String, dynamic> json) =>
      _$AzureFileFromJson(json);

  Map<String, dynamic> toJson() => _$AzureFileToJson(this);
}

@JsonSerializable()
class Cephfs {
  ///monitors is Required: Monitors is a collection of Ceph monitors More info:
  ///https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  @JsonKey(name: 'monitors')
  List<String?> monitors;

  ///path is Optional: Used as the mounted root, rather than the full Ceph tree, default is /
  @JsonKey(name: 'path')
  String? path;

  ///readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the
  ///ReadOnly setting in VolumeMounts. More info:
  ///https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///secretFile is Optional: SecretFile is the path to key ring for User, default is
  ////etc/ceph/user.secret More info:
  ///https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  @JsonKey(name: 'secretFile')
  String? secretFile;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  CephfsSecretRef? secretRef;

  ///user is Optional: User is the rados user name, default is admin More info:
  ///https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
  @JsonKey(name: 'user')
  String? user;

  Cephfs({
    required this.monitors,
    this.path,
    this.readOnly,
    this.secretFile,
    this.secretRef,
    this.user,
  });

  factory Cephfs.fromJson(Map<String, dynamic> json) => _$CephfsFromJson(json);

  Map<String, dynamic> toJson() => _$CephfsToJson(this);
}

@JsonSerializable()
class CephfsSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  CephfsSecretRef({this.name, this.namespace});

  factory CephfsSecretRef.fromJson(Map<String, dynamic> json) =>
      _$CephfsSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$CephfsSecretRefToJson(this);
}

@JsonSerializable()
class Cinder {
  ///fsType Filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
  @JsonKey(name: 'fsType')
  String? fsType;

  ///readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the
  ///ReadOnly setting in VolumeMounts. More info:
  ///https://examples.k8s.io/mysql-cinder-pd/README.md
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  CinderSecretRef? secretRef;

  ///volumeID used to identify the volume in cinder. More info:
  ///https://examples.k8s.io/mysql-cinder-pd/README.md
  @JsonKey(name: 'volumeID')
  String volumeId;

  Cinder({this.fsType, this.readOnly, this.secretRef, required this.volumeId});

  factory Cinder.fromJson(Map<String, dynamic> json) => _$CinderFromJson(json);

  Map<String, dynamic> toJson() => _$CinderToJson(this);
}

@JsonSerializable()
class CinderSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  CinderSecretRef({this.name, this.namespace});

  factory CinderSecretRef.fromJson(Map<String, dynamic> json) =>
      _$CinderSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$CinderSecretRefToJson(this);
}

@JsonSerializable()
class ClaimRef {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///If referring to a piece of an object instead of an entire object, this string should
  ///contain a valid JSON/Go field access statement, such as
  ///desiredState.manifest.containers[2]. For example, if the object reference is to a
  ///container within a pod, this would take on a value like: "spec.containers{name}" (where
  ///"name" refers to the name of the container that triggered the event) or if no container
  ///name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax
  ///is chosen only to have some well-defined way of referencing a part of an object.
  @JsonKey(name: 'fieldPath')
  String? fieldPath;

  ///Kind of the referent. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String? kind;

  ///Name of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Namespace of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Specific resourceVersion to which this reference is made, if any. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
  @JsonKey(name: 'uid')
  String? uid;

  ClaimRef({
    this.apiVersion,
    this.fieldPath,
    this.kind,
    this.name,
    this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory ClaimRef.fromJson(Map<String, dynamic> json) =>
      _$ClaimRefFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimRefToJson(this);
}

@JsonSerializable()
class Csi {
  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'controllerExpandSecretRef')
  ControllerExpandSecretRef? controllerExpandSecretRef;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'controllerPublishSecretRef')
  ControllerPublishSecretRef? controllerPublishSecretRef;

  ///driver is the name of the driver to use for this volume. Required.
  @JsonKey(name: 'driver')
  String driver;

  ///fsType to mount. Must be a filesystem type supported by the host operating system. Ex.
  ///"ext4", "xfs", "ntfs".
  @JsonKey(name: 'fsType')
  String? fsType;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'nodeExpandSecretRef')
  NodeExpandSecretRef? nodeExpandSecretRef;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'nodePublishSecretRef')
  NodePublishSecretRef? nodePublishSecretRef;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'nodeStageSecretRef')
  NodeStageSecretRef? nodeStageSecretRef;

  ///readOnly value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///volumeAttributes of the volume to publish.
  @JsonKey(name: 'volumeAttributes')
  Map<String, String?>? volumeAttributes;

  ///volumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume
  ///to refer to the volume on all subsequent calls. Required.
  @JsonKey(name: 'volumeHandle')
  String volumeHandle;

  Csi({
    this.controllerExpandSecretRef,
    this.controllerPublishSecretRef,
    required this.driver,
    this.fsType,
    this.nodeExpandSecretRef,
    this.nodePublishSecretRef,
    this.nodeStageSecretRef,
    this.readOnly,
    this.volumeAttributes,
    required this.volumeHandle,
  });

  factory Csi.fromJson(Map<String, dynamic> json) => _$CsiFromJson(json);

  Map<String, dynamic> toJson() => _$CsiToJson(this);
}

@JsonSerializable()
class ControllerExpandSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  ControllerExpandSecretRef({this.name, this.namespace});

  factory ControllerExpandSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ControllerExpandSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ControllerExpandSecretRefToJson(this);
}

@JsonSerializable()
class ControllerPublishSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  ControllerPublishSecretRef({this.name, this.namespace});

  factory ControllerPublishSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ControllerPublishSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ControllerPublishSecretRefToJson(this);
}

@JsonSerializable()
class NodeExpandSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  NodeExpandSecretRef({this.name, this.namespace});

  factory NodeExpandSecretRef.fromJson(Map<String, dynamic> json) =>
      _$NodeExpandSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$NodeExpandSecretRefToJson(this);
}

@JsonSerializable()
class NodePublishSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  NodePublishSecretRef({this.name, this.namespace});

  factory NodePublishSecretRef.fromJson(Map<String, dynamic> json) =>
      _$NodePublishSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$NodePublishSecretRefToJson(this);
}

@JsonSerializable()
class NodeStageSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  NodeStageSecretRef({this.name, this.namespace});

  factory NodeStageSecretRef.fromJson(Map<String, dynamic> json) =>
      _$NodeStageSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$NodeStageSecretRefToJson(this);
}

@JsonSerializable()
class Fc {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///lun is Optional: FC target lun number
  @JsonKey(name: 'lun')
  int? lun;

  ///readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the
  ///ReadOnly setting in VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///targetWWNs is Optional: FC target worldwide names (WWNs)
  @JsonKey(name: 'targetWWNs')
  List<String?>? targetWwNs;

  ///wwids Optional: FC volume world wide identifiers (wwids) Either wwids or combination of
  ///targetWWNs and lun must be set, but not both simultaneously.
  @JsonKey(name: 'wwids')
  List<String?>? wwids;

  Fc({this.fsType, this.lun, this.readOnly, this.targetWwNs, this.wwids});

  factory Fc.fromJson(Map<String, dynamic> json) => _$FcFromJson(json);

  Map<String, dynamic> toJson() => _$FcToJson(this);
}

@JsonSerializable()
class FlexVolume {
  ///driver is the name of the driver to use for this volume.
  @JsonKey(name: 'driver')
  String driver;

  ///fsType is the Filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume
  ///script.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///options is Optional: this field holds extra command options if any.
  @JsonKey(name: 'options')
  Map<String, String?>? options;

  ///readOnly is Optional: defaults to false (read/write). ReadOnly here will force the
  ///ReadOnly setting in VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  FlexVolumeSecretRef? secretRef;

  FlexVolume({
    required this.driver,
    this.fsType,
    this.options,
    this.readOnly,
    this.secretRef,
  });

  factory FlexVolume.fromJson(Map<String, dynamic> json) =>
      _$FlexVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$FlexVolumeToJson(this);
}

@JsonSerializable()
class FlexVolumeSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  FlexVolumeSecretRef({this.name, this.namespace});

  factory FlexVolumeSecretRef.fromJson(Map<String, dynamic> json) =>
      _$FlexVolumeSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$FlexVolumeSecretRefToJson(this);
}

@JsonSerializable()
class Flocker {
  ///datasetName is Name of the dataset stored as metadata -> name on the dataset for Flocker
  ///should be considered as deprecated
  @JsonKey(name: 'datasetName')
  String? datasetName;

  ///datasetUUID is the UUID of the dataset. This is unique identifier of a Flocker dataset
  @JsonKey(name: 'datasetUUID')
  String? datasetUuid;

  Flocker({this.datasetName, this.datasetUuid});

  factory Flocker.fromJson(Map<String, dynamic> json) =>
      _$FlockerFromJson(json);

  Map<String, dynamic> toJson() => _$FlockerToJson(this);
}

@JsonSerializable()
class GcePersistentDisk {
  ///fsType is filesystem type of the volume that you want to mount. Tip: Ensure that the
  ///filesystem type is supported by the host operating system. Examples: "ext4", "xfs",
  ///"ntfs". Implicitly inferred to be "ext4" if unspecified. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
  @JsonKey(name: 'fsType')
  String? fsType;

  ///partition is the partition in the volume that you want to mount. If omitted, the default
  ///is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as
  ///"1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property
  ///empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
  @JsonKey(name: 'partition')
  int? partition;

  ///pdName is unique name of the PD resource in GCE. Used to identify the disk in GCE. More
  ///info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
  @JsonKey(name: 'pdName')
  String pdName;

  ///readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More
  ///info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  GcePersistentDisk({
    this.fsType,
    this.partition,
    required this.pdName,
    this.readOnly,
  });

  factory GcePersistentDisk.fromJson(Map<String, dynamic> json) =>
      _$GcePersistentDiskFromJson(json);

  Map<String, dynamic> toJson() => _$GcePersistentDiskToJson(this);
}

@JsonSerializable()
class Glusterfs {
  ///endpoints is the endpoint name that details Glusterfs topology. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'endpoints')
  String endpoints;

  ///endpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is
  ///empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'endpointsNamespace')
  String? endpointsNamespace;

  ///path is the Glusterfs volume path. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'path')
  String path;

  ///readOnly here will force the Glusterfs volume to be mounted with read-only permissions.
  ///Defaults to false. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  Glusterfs({
    required this.endpoints,
    this.endpointsNamespace,
    required this.path,
    this.readOnly,
  });

  factory Glusterfs.fromJson(Map<String, dynamic> json) =>
      _$GlusterfsFromJson(json);

  Map<String, dynamic> toJson() => _$GlusterfsToJson(this);
}

@JsonSerializable()
class HostPath {
  ///path of the directory on the host. If the path is a symlink, it will follow the link to
  ///the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
  @JsonKey(name: 'path')
  String path;

  ///type for HostPath Volume Defaults to "" More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#hostpath
  ///
  ///Possible enum values:
  ///- `""` For backwards compatible, leave it empty if unset
  ///- `"BlockDevice"` A block device must exist at the given path
  ///- `"CharDevice"` A character device must exist at the given path
  ///- `"Directory"` A directory must exist at the given path
  ///- `"DirectoryOrCreate"` If nothing exists at the given path, an empty directory will be
  ///created there as needed with file mode 0755, having the same group and ownership with
  ///Kubelet.
  ///- `"File"` A file must exist at the given path
  ///- `"FileOrCreate"` If nothing exists at the given path, an empty file will be created
  ///there as needed with file mode 0644, having the same group and ownership with Kubelet.
  ///- `"Socket"` A UNIX socket must exist at the given path
  @JsonKey(name: 'type')
  Type? type;

  HostPath({required this.path, this.type});

  factory HostPath.fromJson(Map<String, dynamic> json) =>
      _$HostPathFromJson(json);

  Map<String, dynamic> toJson() => _$HostPathToJson(this);
}

///type for HostPath Volume Defaults to "" More info:
///https://kubernetes.io/docs/concepts/storage/volumes#hostpath
///
///Possible enum values:
///- `""` For backwards compatible, leave it empty if unset
///- `"BlockDevice"` A block device must exist at the given path
///- `"CharDevice"` A character device must exist at the given path
///- `"Directory"` A directory must exist at the given path
///- `"DirectoryOrCreate"` If nothing exists at the given path, an empty directory will be
///created there as needed with file mode 0755, having the same group and ownership with
///Kubelet.
///- `"File"` A file must exist at the given path
///- `"FileOrCreate"` If nothing exists at the given path, an empty file will be created
///there as needed with file mode 0644, having the same group and ownership with Kubelet.
///- `"Socket"` A UNIX socket must exist at the given path
enum Type {
  @JsonValue('BlockDevice')
  BLOCK_DEVICE,
  @JsonValue('CharDevice')
  CHAR_DEVICE,
  @JsonValue('Directory')
  DIRECTORY,
  @JsonValue('DirectoryOrCreate')
  DIRECTORY_OR_CREATE,
  @JsonValue('')
  EMPTY,
  @JsonValue('File')
  FILE,
  @JsonValue('FileOrCreate')
  FILE_OR_CREATE,
  @JsonValue('Socket')
  SOCKET,
}

final typeValues = EnumValues({
  'BlockDevice': Type.BLOCK_DEVICE,
  'CharDevice': Type.CHAR_DEVICE,
  'Directory': Type.DIRECTORY,
  'DirectoryOrCreate': Type.DIRECTORY_OR_CREATE,
  '': Type.EMPTY,
  'File': Type.FILE,
  'FileOrCreate': Type.FILE_OR_CREATE,
  'Socket': Type.SOCKET,
});

@JsonSerializable()
class Iscsi {
  ///chapAuthDiscovery defines whether support iSCSI Discovery CHAP authentication
  @JsonKey(name: 'chapAuthDiscovery')
  bool? chapAuthDiscovery;

  ///chapAuthSession defines whether support iSCSI Session CHAP authentication
  @JsonKey(name: 'chapAuthSession')
  bool? chapAuthSession;

  ///fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the
  ///filesystem type is supported by the host operating system. Examples: "ext4", "xfs",
  ///"ntfs". Implicitly inferred to be "ext4" if unspecified. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#iscsi
  @JsonKey(name: 'fsType')
  String? fsType;

  ///initiatorName is the custom iSCSI Initiator Name. If initiatorName is specified with
  ///iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be
  ///created for the connection.
  @JsonKey(name: 'initiatorName')
  String? initiatorName;

  ///iqn is Target iSCSI Qualified Name.
  @JsonKey(name: 'iqn')
  String iqn;

  ///iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default'
  ///(tcp).
  @JsonKey(name: 'iscsiInterface')
  String? iscsiInterface;

  ///lun is iSCSI Target Lun number.
  @JsonKey(name: 'lun')
  int lun;

  ///portals is the iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if
  ///the port is other than default (typically TCP ports 860 and 3260).
  @JsonKey(name: 'portals')
  List<String?>? portals;

  ///readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  IscsiSecretRef? secretRef;

  ///targetPortal is iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the
  ///port is other than default (typically TCP ports 860 and 3260).
  @JsonKey(name: 'targetPortal')
  String targetPortal;

  Iscsi({
    this.chapAuthDiscovery,
    this.chapAuthSession,
    this.fsType,
    this.initiatorName,
    required this.iqn,
    this.iscsiInterface,
    required this.lun,
    this.portals,
    this.readOnly,
    this.secretRef,
    required this.targetPortal,
  });

  factory Iscsi.fromJson(Map<String, dynamic> json) => _$IscsiFromJson(json);

  Map<String, dynamic> toJson() => _$IscsiToJson(this);
}

@JsonSerializable()
class IscsiSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  IscsiSecretRef({this.name, this.namespace});

  factory IscsiSecretRef.fromJson(Map<String, dynamic> json) =>
      _$IscsiSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$IscsiSecretRefToJson(this);
}

@JsonSerializable()
class Local {
  ///fsType is the filesystem type to mount. It applies only when the Path is a block device.
  ///Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs",
  ///"ntfs". The default value is to auto-select a filesystem if unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///path of the full path to the volume on the node. It can be either a directory or block
  ///device (disk, partition, ...).
  @JsonKey(name: 'path')
  String path;

  Local({this.fsType, required this.path});

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);

  Map<String, dynamic> toJson() => _$LocalToJson(this);
}

@JsonSerializable()
class Nfs {
  ///path that is exported by the NFS server. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#nfs
  @JsonKey(name: 'path')
  String path;

  ///readOnly here will force the NFS export to be mounted with read-only permissions.
  ///Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///server is the hostname or IP address of the NFS server. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#nfs
  @JsonKey(name: 'server')
  String server;

  Nfs({required this.path, this.readOnly, required this.server});

  factory Nfs.fromJson(Map<String, dynamic> json) => _$NfsFromJson(json);

  Map<String, dynamic> toJson() => _$NfsToJson(this);
}

@JsonSerializable()
class NodeAffinity {
  ///A node selector represents the union of the results of one or more label queries over a
  ///set of nodes; that is, it represents the OR of the selectors represented by the node
  ///selector terms.
  @JsonKey(name: 'required')
  Required? required;

  NodeAffinity({this.required});

  factory NodeAffinity.fromJson(Map<String, dynamic> json) =>
      _$NodeAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$NodeAffinityToJson(this);
}

@JsonSerializable()
class Required {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<NodeSelectorTerm?> nodeSelectorTerms;

  Required({required this.nodeSelectorTerms});

  factory Required.fromJson(Map<String, dynamic> json) =>
      _$RequiredFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredToJson(this);
}

@JsonSerializable()
class NodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<MatchField?>? matchFields;

  NodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory NodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorTermToJson(this);
}

@JsonSerializable()
class MatchExpression {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values. Valid operators are In, NotIn,
  ///Exists, DoesNotExist. Gt, and Lt.
  ///
  ///Possible enum values:
  ///- `"DoesNotExist"`
  ///- `"Exists"`
  ///- `"Gt"`
  ///- `"In"`
  ///- `"Lt"`
  ///- `"NotIn"`
  @JsonKey(name: 'operator')
  Operator matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  MatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression.fromJson(Map<String, dynamic> json) =>
      _$MatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpressionToJson(this);
}

///Represents a key's relationship to a set of values. Valid operators are In, NotIn,
///Exists, DoesNotExist. Gt, and Lt.
///
///Possible enum values:
///- `"DoesNotExist"`
///- `"Exists"`
///- `"Gt"`
///- `"In"`
///- `"Lt"`
///- `"NotIn"`
enum Operator {
  @JsonValue('DoesNotExist')
  DOES_NOT_EXIST,
  @JsonValue('Exists')
  EXISTS,
  @JsonValue('Gt')
  GT,
  @JsonValue('In')
  IN,
  @JsonValue('Lt')
  LT,
  @JsonValue('NotIn')
  NOT_IN,
}

final operatorValues = EnumValues({
  'DoesNotExist': Operator.DOES_NOT_EXIST,
  'Exists': Operator.EXISTS,
  'Gt': Operator.GT,
  'In': Operator.IN,
  'Lt': Operator.LT,
  'NotIn': Operator.NOT_IN,
});

@JsonSerializable()
class MatchField {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values. Valid operators are In, NotIn,
  ///Exists, DoesNotExist. Gt, and Lt.
  ///
  ///Possible enum values:
  ///- `"DoesNotExist"`
  ///- `"Exists"`
  ///- `"Gt"`
  ///- `"In"`
  ///- `"Lt"`
  ///- `"NotIn"`
  @JsonKey(name: 'operator')
  Operator matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  MatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory MatchField.fromJson(Map<String, dynamic> json) =>
      _$MatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$MatchFieldToJson(this);
}

///persistentVolumeReclaimPolicy defines what happens to a persistent volume when released
///from its claim. Valid options are Retain (default for manually created
///PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and
///Recycle (deprecated). Recycle must be supported by the volume plugin underlying this
///PersistentVolume. More info:
///https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
///
///Possible enum values:
///- `"Delete"` means the volume will be deleted from Kubernetes on release from its claim.
///The volume plugin must support Deletion.
///- `"Recycle"` means the volume will be recycled back into the pool of unbound persistent
///volumes on release from its claim. The volume plugin must support Recycling.
///- `"Retain"` means the volume will be left in its current phase (Released) for manual
///reclamation by the administrator. The default policy is Retain.
enum PersistentVolumeReclaimPolicy {
  @JsonValue('Delete')
  DELETE,
  @JsonValue('Recycle')
  RECYCLE,
  @JsonValue('Retain')
  RETAIN,
}

final persistentVolumeReclaimPolicyValues = EnumValues({
  'Delete': PersistentVolumeReclaimPolicy.DELETE,
  'Recycle': PersistentVolumeReclaimPolicy.RECYCLE,
  'Retain': PersistentVolumeReclaimPolicy.RETAIN,
});

@JsonSerializable()
class PhotonPersistentDisk {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///pdID is the ID that identifies Photon Controller persistent disk
  @JsonKey(name: 'pdID')
  String pdId;

  PhotonPersistentDisk({this.fsType, required this.pdId});

  factory PhotonPersistentDisk.fromJson(Map<String, dynamic> json) =>
      _$PhotonPersistentDiskFromJson(json);

  Map<String, dynamic> toJson() => _$PhotonPersistentDiskToJson(this);
}

@JsonSerializable()
class PortworxVolume {
  ///fSType represents the filesystem type to mount Must be a filesystem type supported by the
  ///host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///volumeID uniquely identifies a Portworx volume
  @JsonKey(name: 'volumeID')
  String volumeId;

  PortworxVolume({this.fsType, this.readOnly, required this.volumeId});

  factory PortworxVolume.fromJson(Map<String, dynamic> json) =>
      _$PortworxVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$PortworxVolumeToJson(this);
}

@JsonSerializable()
class Quobyte {
  ///group to map volume access to Default is no group
  @JsonKey(name: 'group')
  String? group;

  ///readOnly here will force the Quobyte volume to be mounted with read-only permissions.
  ///Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///registry represents a single or multiple Quobyte Registry services specified as a string
  ///as host:port pair (multiple entries are separated with commas) which acts as the central
  ///registry for volumes
  @JsonKey(name: 'registry')
  String registry;

  ///tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned
  ///Quobyte volumes, value is set by the plugin
  @JsonKey(name: 'tenant')
  String? tenant;

  ///user to map volume access to Defaults to serivceaccount user
  @JsonKey(name: 'user')
  String? user;

  ///volume is a string that references an already created Quobyte volume by name.
  @JsonKey(name: 'volume')
  String volume;

  Quobyte({
    this.group,
    this.readOnly,
    required this.registry,
    this.tenant,
    this.user,
    required this.volume,
  });

  factory Quobyte.fromJson(Map<String, dynamic> json) =>
      _$QuobyteFromJson(json);

  Map<String, dynamic> toJson() => _$QuobyteToJson(this);
}

@JsonSerializable()
class Rbd {
  ///fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the
  ///filesystem type is supported by the host operating system. Examples: "ext4", "xfs",
  ///"ntfs". Implicitly inferred to be "ext4" if unspecified. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#rbd
  @JsonKey(name: 'fsType')
  String? fsType;

  ///image is the rados image name. More info:
  ///https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'image')
  String image;

  ///keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info:
  ///https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'keyring')
  String? keyring;

  ///monitors is a collection of Ceph monitors. More info:
  ///https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'monitors')
  List<String?> monitors;

  ///pool is the rados pool name. Default is rbd. More info:
  ///https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'pool')
  String? pool;

  ///readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More
  ///info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  RbdSecretRef? secretRef;

  ///user is the rados user name. Default is admin. More info:
  ///https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
  @JsonKey(name: 'user')
  String? user;

  Rbd({
    this.fsType,
    required this.image,
    this.keyring,
    required this.monitors,
    this.pool,
    this.readOnly,
    this.secretRef,
    this.user,
  });

  factory Rbd.fromJson(Map<String, dynamic> json) => _$RbdFromJson(json);

  Map<String, dynamic> toJson() => _$RbdToJson(this);
}

@JsonSerializable()
class RbdSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  RbdSecretRef({this.name, this.namespace});

  factory RbdSecretRef.fromJson(Map<String, dynamic> json) =>
      _$RbdSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$RbdSecretRefToJson(this);
}

@JsonSerializable()
class ScaleIo {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs"
  @JsonKey(name: 'fsType')
  String? fsType;

  ///gateway is the host address of the ScaleIO API Gateway.
  @JsonKey(name: 'gateway')
  String gateway;

  ///protectionDomain is the name of the ScaleIO Protection Domain for the configured storage.
  @JsonKey(name: 'protectionDomain')
  String? protectionDomain;

  ///readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///SecretReference represents a Secret Reference. It has enough information to retrieve
  ///secret in any namespace
  @JsonKey(name: 'secretRef')
  ScaleIoSecretRef secretRef;

  ///sslEnabled is the flag to enable/disable SSL communication with Gateway, default false
  @JsonKey(name: 'sslEnabled')
  bool? sslEnabled;

  ///storageMode indicates whether the storage for a volume should be ThickProvisioned or
  ///ThinProvisioned. Default is ThinProvisioned.
  @JsonKey(name: 'storageMode')
  String? storageMode;

  ///storagePool is the ScaleIO Storage Pool associated with the protection domain.
  @JsonKey(name: 'storagePool')
  String? storagePool;

  ///system is the name of the storage system as configured in ScaleIO.
  @JsonKey(name: 'system')
  String system;

  ///volumeName is the name of a volume already created in the ScaleIO system that is
  ///associated with this volume source.
  @JsonKey(name: 'volumeName')
  String? volumeName;

  ScaleIo({
    this.fsType,
    required this.gateway,
    this.protectionDomain,
    this.readOnly,
    required this.secretRef,
    this.sslEnabled,
    this.storageMode,
    this.storagePool,
    required this.system,
    this.volumeName,
  });

  factory ScaleIo.fromJson(Map<String, dynamic> json) =>
      _$ScaleIoFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleIoToJson(this);
}

///SecretReference represents a Secret Reference. It has enough information to retrieve
///secret in any namespace
@JsonSerializable()
class ScaleIoSecretRef {
  ///name is unique within a namespace to reference a secret resource.
  @JsonKey(name: 'name')
  String? name;

  ///namespace defines the space within which the secret name must be unique.
  @JsonKey(name: 'namespace')
  String? namespace;

  ScaleIoSecretRef({this.name, this.namespace});

  factory ScaleIoSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ScaleIoSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleIoSecretRefToJson(this);
}

@JsonSerializable()
class Storageos {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///ObjectReference contains enough information to let you inspect or modify the referred
  ///object.
  @JsonKey(name: 'secretRef')
  StorageosSecretRef? secretRef;

  ///volumeName is the human-readable name of the StorageOS volume.  Volume names are only
  ///unique within a namespace.
  @JsonKey(name: 'volumeName')
  String? volumeName;

  ///volumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is
  ///specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping
  ///to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to
  ///override the default behaviour. Set to "default" if you are not using namespaces within
  ///StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
  @JsonKey(name: 'volumeNamespace')
  String? volumeNamespace;

  Storageos({
    this.fsType,
    this.readOnly,
    this.secretRef,
    this.volumeName,
    this.volumeNamespace,
  });

  factory Storageos.fromJson(Map<String, dynamic> json) =>
      _$StorageosFromJson(json);

  Map<String, dynamic> toJson() => _$StorageosToJson(this);
}

@JsonSerializable()
class StorageosSecretRef {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///If referring to a piece of an object instead of an entire object, this string should
  ///contain a valid JSON/Go field access statement, such as
  ///desiredState.manifest.containers[2]. For example, if the object reference is to a
  ///container within a pod, this would take on a value like: "spec.containers{name}" (where
  ///"name" refers to the name of the container that triggered the event) or if no container
  ///name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax
  ///is chosen only to have some well-defined way of referencing a part of an object.
  @JsonKey(name: 'fieldPath')
  String? fieldPath;

  ///Kind of the referent. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String? kind;

  ///Name of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Namespace of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Specific resourceVersion to which this reference is made, if any. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
  @JsonKey(name: 'uid')
  String? uid;

  StorageosSecretRef({
    this.apiVersion,
    this.fieldPath,
    this.kind,
    this.name,
    this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory StorageosSecretRef.fromJson(Map<String, dynamic> json) =>
      _$StorageosSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$StorageosSecretRefToJson(this);
}

///volumeMode defines if a volume is intended to be used with a formatted filesystem or to
///remain in raw block state. Value of Filesystem is implied when not included in spec.
///
///Possible enum values:
///- `"Block"` means the volume will not be formatted with a filesystem and will remain a
///raw block device.
///- `"Filesystem"` means the volume will be or is formatted with a filesystem.
enum VolumeMode {
  @JsonValue('Block')
  BLOCK,
  @JsonValue('Filesystem')
  FILESYSTEM,
}

final volumeModeValues = EnumValues({
  'Block': VolumeMode.BLOCK,
  'Filesystem': VolumeMode.FILESYSTEM,
});

@JsonSerializable()
class VsphereVolume {
  ///fsType is filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///storagePolicyID is the storage Policy Based Management (SPBM) profile ID associated with
  ///the StoragePolicyName.
  @JsonKey(name: 'storagePolicyID')
  String? storagePolicyId;

  ///storagePolicyName is the storage Policy Based Management (SPBM) profile name.
  @JsonKey(name: 'storagePolicyName')
  String? storagePolicyName;

  ///volumePath is the path that identifies vSphere volume vmdk
  @JsonKey(name: 'volumePath')
  String volumePath;

  VsphereVolume({
    this.fsType,
    this.storagePolicyId,
    this.storagePolicyName,
    required this.volumePath,
  });

  factory VsphereVolume.fromJson(Map<String, dynamic> json) =>
      _$VsphereVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VsphereVolumeToJson(this);
}

@JsonSerializable()
class Status {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastPhaseTransitionTime')
  DateTime? lastPhaseTransitionTime;

  ///message is a human-readable message indicating details about why the volume is in this
  ///state.
  @JsonKey(name: 'message')
  String? message;

  ///phase indicates if a volume is available, bound to a claim, or released by a claim. More
  ///info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase
  ///
  ///Possible enum values:
  ///- `"Available"` used for PersistentVolumes that are not yet bound Available volumes are
  ///held by the binder and matched to PersistentVolumeClaims
  ///- `"Bound"` used for PersistentVolumes that are bound
  ///- `"Failed"` used for PersistentVolumes that failed to be correctly recycled or deleted
  ///after being released from a claim
  ///- `"Pending"` used for PersistentVolumes that are not available
  ///- `"Released"` used for PersistentVolumes where the bound PersistentVolumeClaim was
  ///deleted released volumes must be recycled before becoming available again this phase is
  ///used by the persistent volume claim binder to signal to another process to reclaim the
  ///resource
  @JsonKey(name: 'phase')
  Phase? phase;

  ///reason is a brief CamelCase string that describes any failure and is meant for machine
  ///parsing and tidy display in the CLI.
  @JsonKey(name: 'reason')
  String? reason;

  Status({this.lastPhaseTransitionTime, this.message, this.phase, this.reason});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

///phase indicates if a volume is available, bound to a claim, or released by a claim. More
///info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase
///
///Possible enum values:
///- `"Available"` used for PersistentVolumes that are not yet bound Available volumes are
///held by the binder and matched to PersistentVolumeClaims
///- `"Bound"` used for PersistentVolumes that are bound
///- `"Failed"` used for PersistentVolumes that failed to be correctly recycled or deleted
///after being released from a claim
///- `"Pending"` used for PersistentVolumes that are not available
///- `"Released"` used for PersistentVolumes where the bound PersistentVolumeClaim was
///deleted released volumes must be recycled before becoming available again this phase is
///used by the persistent volume claim binder to signal to another process to reclaim the
///resource
enum Phase {
  @JsonValue('Available')
  AVAILABLE,
  @JsonValue('Bound')
  BOUND,
  @JsonValue('Failed')
  FAILED,
  @JsonValue('Pending')
  PENDING,
  @JsonValue('Released')
  RELEASED,
}

final phaseValues = EnumValues({
  'Available': Phase.AVAILABLE,
  'Bound': Phase.BOUND,
  'Failed': Phase.FAILED,
  'Pending': Phase.PENDING,
  'Released': Phase.RELEASED,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum PersistentvolumelistV1Kind {
  @JsonValue('PersistentVolumeList')
  PERSISTENT_VOLUME_LIST,
}

final persistentvolumelistV1KindValues = EnumValues({
  'PersistentVolumeList': PersistentvolumelistV1Kind.PERSISTENT_VOLUME_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class PersistentvolumelistV1Metadata {
  ///continue may be set if the user set a limit on the number of items returned, and
  ///indicates that the server has more data available. The value is opaque and may be used to
  ///issue another request to the endpoint that served this list to retrieve the next set of
  ///available objects. Continuing a consistent list may not be possible if the server
  ///configuration has changed or more than a few minutes have passed. The resourceVersion
  ///field returned when using this continue value will be identical to the value in the first
  ///response, unless you have received this token from an error message.
  @JsonKey(name: 'continue')
  String? metadataContinue;

  ///remainingItemCount is the number of subsequent items in the list which are not included
  ///in this list response. If the list request contained label or field selectors, then the
  ///number of remaining items is unknown and the field will be left unset and omitted during
  ///serialization. If the list is complete (either because it is not chunking or because this
  ///is the last chunk), then there are no more remaining items and this field will be left
  ///unset and omitted during serialization. Servers older than v1.15 do not set this field.
  ///The intended use of the remainingItemCount is *estimating* the size of a collection.
  ///Clients should not rely on the remainingItemCount to be set or to be exact.
  @JsonKey(name: 'remainingItemCount')
  int? remainingItemCount;

  ///String that identifies the server's internal version of this object that can be used by
  ///clients to determine when objects have changed. Value must be treated as opaque by
  ///clients and passed unmodified back to the server. Populated by the system. Read-only.
  ///More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  PersistentvolumelistV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory PersistentvolumelistV1Metadata.fromJson(Map<String, dynamic> json) =>
      _$PersistentvolumelistV1MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PersistentvolumelistV1MetadataToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
