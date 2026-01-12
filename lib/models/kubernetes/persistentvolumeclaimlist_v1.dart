import 'package:json_annotation/json_annotation.dart';

part 'persistentvolumeclaimlist_v1.g.dart';

///PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
@JsonSerializable()
class PersistentvolumeclaimlistV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///items is a list of persistent volume claims. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  PersistentvolumeclaimlistV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  PersistentvolumeclaimlistV1Metadata? metadata;

  PersistentvolumeclaimlistV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory PersistentvolumeclaimlistV1.fromJson(Map<String, dynamic> json) =>
      _$PersistentvolumeclaimlistV1FromJson(json);

  Map<String, dynamic> toJson() => _$PersistentvolumeclaimlistV1ToJson(this);
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

  ///PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a
  ///Source for provider-specific attributes
  @JsonKey(name: 'spec')
  Spec? spec;

  ///PersistentVolumeClaimStatus is the current status of a persistent volume claim.
  @JsonKey(name: 'status')
  StatusClass? status;

  Item({this.apiVersion, this.kind, this.metadata, this.spec, this.status});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('PersistentVolumeClaim')
  PERSISTENT_VOLUME_CLAIM,
}

final itemKindValues = EnumValues({
  'PersistentVolumeClaim': ItemKind.PERSISTENT_VOLUME_CLAIM,
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
  ///accessModes contains the desired access modes the volume should have. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
  @JsonKey(name: 'accessModes')
  List<AccessMode>? accessModes;

  ///TypedLocalObjectReference contains enough information to let you locate the typed
  ///referenced object inside the same namespace.
  @JsonKey(name: 'dataSource')
  DataSource? dataSource;

  ///TypedObjectReference contains enough information to let you locate the typed referenced
  ///object
  @JsonKey(name: 'dataSourceRef')
  DataSourceRef? dataSourceRef;

  ///VolumeResourceRequirements describes the storage resource requirements for a volume.
  @JsonKey(name: 'resources')
  Resources? resources;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  Selector? selector;

  ///storageClassName is the name of the StorageClass required by the claim. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
  @JsonKey(name: 'storageClassName')
  String? storageClassName;

  ///volumeAttributesClassName may be used to set the VolumeAttributesClass used by this
  ///claim. If specified, the CSI driver will create or update the volume with the attributes
  ///defined in the corresponding VolumeAttributesClass. This has a different purpose than
  ///storageClassName, it can be changed after the claim is created. An empty string or nil
  ///value indicates that no VolumeAttributesClass will be applied to the claim. If the claim
  ///enters an Infeasible error state, this field can be reset to its previous value
  ///(including nil) to cancel the modification. If the resource referred to by
  ///volumeAttributesClass does not exist, this PersistentVolumeClaim will be set to a Pending
  ///state, as reflected by the modifyVolumeStatus field, until such as a resource exists.
  ///More info: https://kubernetes.io/docs/concepts/storage/volume-attributes-classes/
  @JsonKey(name: 'volumeAttributesClassName')
  String? volumeAttributesClassName;

  ///volumeMode defines what type of volume is required by the claim. Value of Filesystem is
  ///implied when not included in claim spec.
  ///
  ///Possible enum values:
  ///- `"Block"` means the volume will not be formatted with a filesystem and will remain a
  ///raw block device.
  ///- `"Filesystem"` means the volume will be or is formatted with a filesystem.
  @JsonKey(name: 'volumeMode')
  VolumeMode? volumeMode;

  ///volumeName is the binding reference to the PersistentVolume backing this claim.
  @JsonKey(name: 'volumeName')
  String? volumeName;

  Spec({
    this.accessModes,
    this.dataSource,
    this.dataSourceRef,
    this.resources,
    this.selector,
    this.storageClassName,
    this.volumeAttributesClassName,
    this.volumeMode,
    this.volumeName,
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
class DataSource {
  ///APIGroup is the group for the resource being referenced. If APIGroup is not specified,
  ///the specified Kind must be in the core API group. For any other third-party types,
  ///APIGroup is required.
  @JsonKey(name: 'apiGroup')
  String? apiGroup;

  ///Kind is the type of resource being referenced
  @JsonKey(name: 'kind')
  String kind;

  ///Name is the name of resource being referenced
  @JsonKey(name: 'name')
  String name;

  DataSource({this.apiGroup, required this.kind, required this.name});

  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}

@JsonSerializable()
class DataSourceRef {
  ///APIGroup is the group for the resource being referenced. If APIGroup is not specified,
  ///the specified Kind must be in the core API group. For any other third-party types,
  ///APIGroup is required.
  @JsonKey(name: 'apiGroup')
  String? apiGroup;

  ///Kind is the type of resource being referenced
  @JsonKey(name: 'kind')
  String kind;

  ///Name is the name of resource being referenced
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the namespace of resource being referenced Note that when a namespace is
  ///specified, a gateway.networking.k8s.io/ReferenceGrant object is required in the referent
  ///namespace to allow that namespace's owner to accept the reference. See the ReferenceGrant
  ///documentation for details. (Alpha) This field requires the CrossNamespaceVolumeDataSource
  ///feature gate to be enabled.
  @JsonKey(name: 'namespace')
  String? namespace;

  DataSourceRef({
    this.apiGroup,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory DataSourceRef.fromJson(Map<String, dynamic> json) =>
      _$DataSourceRefFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceRefToJson(this);
}

@JsonSerializable()
class Resources {
  ///Limits describes the maximum amount of compute resources allowed. More info:
  ///https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'limits')
  Map<String, dynamic>? limits;

  ///Requests describes the minimum amount of compute resources required. If Requests is
  ///omitted for a container, it defaults to Limits if that is explicitly specified, otherwise
  ///to an implementation-defined value. Requests cannot exceed Limits. More info:
  ///https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'requests')
  Map<String, dynamic>? requests;

  Resources({this.limits, this.requests});

  factory Resources.fromJson(Map<String, dynamic> json) =>
      _$ResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesToJson(this);
}

@JsonSerializable()
class Selector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  Selector({this.matchExpressions, this.matchLabels});

  factory Selector.fromJson(Map<String, dynamic> json) =>
      _$SelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorToJson(this);
}

@JsonSerializable()
class MatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
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

///volumeMode defines what type of volume is required by the claim. Value of Filesystem is
///implied when not included in claim spec.
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
class StatusClass {
  ///accessModes contains the actual access modes the volume backing the PVC has. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
  @JsonKey(name: 'accessModes')
  List<AccessMode>? accessModes;

  ///allocatedResources tracks the resources allocated to a PVC including its capacity. Key
  ///names follow standard Kubernetes label syntax. Valid values are either:
  ///* Un-prefixed keys:
  ///- storage - the capacity of the volume.
  ///* Custom resources must use implementation-defined prefixed names such as
  ///"example.com/my-custom-resource"
  ///Apart from above values - keys that are unprefixed or have kubernetes.io prefix are
  ///considered reserved and hence may not be used.
  ///
  ///Capacity reported here may be larger than the actual capacity when a volume expansion
  ///operation is requested. For storage quota, the larger value from allocatedResources and
  ///PVC.spec.resources is used. If allocatedResources is not set, PVC.spec.resources alone is
  ///used for quota calculation. If a volume expansion capacity request is lowered,
  ///allocatedResources is only lowered if there are no expansion operations in progress and
  ///if the actual volume capacity is equal or lower than the requested capacity.
  ///
  ///A controller that receives PVC update with previously unknown resourceName should ignore
  ///the update for the purpose it was designed. For example - a controller that only is
  ///responsible for resizing capacity of the volume, should ignore PVC updates that change
  ///other valid resources associated with PVC.
  @JsonKey(name: 'allocatedResources')
  Map<String, dynamic>? allocatedResources;

  ///allocatedResourceStatuses stores status of resource being resized for the given PVC. Key
  ///names follow standard Kubernetes label syntax. Valid values are either:
  ///* Un-prefixed keys:
  ///- storage - the capacity of the volume.
  ///* Custom resources must use implementation-defined prefixed names such as
  ///"example.com/my-custom-resource"
  ///Apart from above values - keys that are unprefixed or have kubernetes.io prefix are
  ///considered reserved and hence may not be used.
  ///
  ///ClaimResourceStatus can be in any of following states:
  ///- ControllerResizeInProgress:
  ///State set when resize controller starts resizing the volume in control-plane.
  ///- ControllerResizeFailed:
  ///State set when resize has failed in resize controller with a terminal error.
  ///- NodeResizePending:
  ///State set when resize controller has finished resizing the volume but further resizing
  ///of
  ///volume is needed on the node.
  ///- NodeResizeInProgress:
  ///State set when kubelet starts resizing the volume.
  ///- NodeResizeFailed:
  ///State set when resizing has failed in kubelet with a terminal error. Transient errors
  ///don't set
  ///NodeResizeFailed.
  ///For example: if expanding a PVC for more capacity - this field can be one of the
  ///following states:
  ///- pvc.status.allocatedResourceStatus['storage'] = "ControllerResizeInProgress"
  ///- pvc.status.allocatedResourceStatus['storage'] = "ControllerResizeFailed"
  ///- pvc.status.allocatedResourceStatus['storage'] = "NodeResizePending"
  ///- pvc.status.allocatedResourceStatus['storage'] = "NodeResizeInProgress"
  ///- pvc.status.allocatedResourceStatus['storage'] = "NodeResizeFailed"
  ///When this field is not set, it means that no resize operation is in progress for the
  ///given PVC.
  ///
  ///A controller that receives PVC update with previously unknown resourceName or
  ///ClaimResourceStatus should ignore the update for the purpose it was designed. For example
  ///- a controller that only is responsible for resizing capacity of the volume, should
  ///ignore PVC updates that change other valid resources associated with PVC.
  @JsonKey(name: 'allocatedResourceStatuses')
  Map<String, AllocatedResourceStatus>? allocatedResourceStatuses;

  ///capacity represents the actual resources of the underlying volume.
  @JsonKey(name: 'capacity')
  Map<String, dynamic>? capacity;

  ///conditions is the current Condition of persistent volume claim. If underlying persistent
  ///volume is being resized then the Condition will be set to 'Resizing'.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///currentVolumeAttributesClassName is the current name of the VolumeAttributesClass the PVC
  ///is using. When unset, there is no VolumeAttributeClass applied to this
  ///PersistentVolumeClaim
  @JsonKey(name: 'currentVolumeAttributesClassName')
  String? currentVolumeAttributesClassName;

  ///ModifyVolumeStatus represents the status object of ControllerModifyVolume operation
  @JsonKey(name: 'modifyVolumeStatus')
  ModifyVolumeStatus? modifyVolumeStatus;

  ///phase represents the current phase of PersistentVolumeClaim.
  ///
  ///Possible enum values:
  ///- `"Bound"` used for PersistentVolumeClaims that are bound
  ///- `"Lost"` used for PersistentVolumeClaims that lost their underlying PersistentVolume.
  ///The claim was bound to a PersistentVolume and this volume does not exist any longer and
  ///all data on it was lost.
  ///- `"Pending"` used for PersistentVolumeClaims that are not yet bound
  @JsonKey(name: 'phase')
  Phase? phase;

  StatusClass({
    this.accessModes,
    this.allocatedResources,
    this.allocatedResourceStatuses,
    this.capacity,
    this.conditions,
    this.currentVolumeAttributesClassName,
    this.modifyVolumeStatus,
    this.phase,
  });

  factory StatusClass.fromJson(Map<String, dynamic> json) =>
      _$StatusClassFromJson(json);

  Map<String, dynamic> toJson() => _$StatusClassToJson(this);
}

enum AllocatedResourceStatus {
  @JsonValue('ControllerResizeInfeasible')
  CONTROLLER_RESIZE_INFEASIBLE,
  @JsonValue('ControllerResizeInProgress')
  CONTROLLER_RESIZE_IN_PROGRESS,
  @JsonValue('NodeResizeInfeasible')
  NODE_RESIZE_INFEASIBLE,
  @JsonValue('NodeResizeInProgress')
  NODE_RESIZE_IN_PROGRESS,
  @JsonValue('NodeResizePending')
  NODE_RESIZE_PENDING,
}

final allocatedResourceStatusValues = EnumValues({
  'ControllerResizeInfeasible':
      AllocatedResourceStatus.CONTROLLER_RESIZE_INFEASIBLE,
  'ControllerResizeInProgress':
      AllocatedResourceStatus.CONTROLLER_RESIZE_IN_PROGRESS,
  'NodeResizeInfeasible': AllocatedResourceStatus.NODE_RESIZE_INFEASIBLE,
  'NodeResizeInProgress': AllocatedResourceStatus.NODE_RESIZE_IN_PROGRESS,
  'NodeResizePending': AllocatedResourceStatus.NODE_RESIZE_PENDING,
});

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastProbeTime')
  DateTime? lastProbeTime;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///message is the human-readable message indicating details about last transition.
  @JsonKey(name: 'message')
  String? message;

  ///reason is a unique, this should be a short, machine understandable string that gives the
  ///reason for condition's last transition. If it reports "Resizing" that means the
  ///underlying persistent volume is being resized.
  @JsonKey(name: 'reason')
  String? reason;

  ///Status is the status of the condition. Can be True, False, Unknown. More info:
  ///https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/persistent-volume-claim-v1/#:~:text=state%20of%20pvc-,conditions.status,-(string)%2C%20required
  @JsonKey(name: 'status')
  String status;

  ///Type is the type of the condition. More info:
  ///https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/persistent-volume-claim-v1/#:~:text=set%20to%20%27ResizeStarted%27.-,PersistentVolumeClaimCondition,-contains%20details%20about
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastProbeTime,
    this.lastTransitionTime,
    this.message,
    this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class ModifyVolumeStatus {
  ///status is the status of the ControllerModifyVolume operation. It can be in any of
  ///following states:
  ///- Pending
  ///Pending indicates that the PersistentVolumeClaim cannot be modified due to unmet
  ///requirements, such as
  ///the specified VolumeAttributesClass not existing.
  ///- InProgress
  ///InProgress indicates that the volume is being modified.
  ///- Infeasible
  ///Infeasible indicates that the request has been rejected as invalid by the CSI driver.
  ///To
  ///resolve the error, a valid VolumeAttributesClass needs to be specified.
  ///Note: New statuses can be added in the future. Consumers should check for unknown
  ///statuses and fail appropriately.
  ///
  ///Possible enum values:
  ///- `"InProgress"` InProgress indicates that the volume is being modified
  ///- `"Infeasible"` Infeasible indicates that the request has been rejected as invalid by
  ///the CSI driver. To resolve the error, a valid VolumeAttributesClass needs to be
  ///specified
  ///- `"Pending"` Pending indicates that the PersistentVolumeClaim cannot be modified due to
  ///unmet requirements, such as the specified VolumeAttributesClass not existing
  @JsonKey(name: 'status')
  StatusEnum status;

  ///targetVolumeAttributesClassName is the name of the VolumeAttributesClass the PVC
  ///currently being reconciled
  @JsonKey(name: 'targetVolumeAttributesClassName')
  String? targetVolumeAttributesClassName;

  ModifyVolumeStatus({
    required this.status,
    this.targetVolumeAttributesClassName,
  });

  factory ModifyVolumeStatus.fromJson(Map<String, dynamic> json) =>
      _$ModifyVolumeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyVolumeStatusToJson(this);
}

///status is the status of the ControllerModifyVolume operation. It can be in any of
///following states:
///- Pending
///Pending indicates that the PersistentVolumeClaim cannot be modified due to unmet
///requirements, such as
///the specified VolumeAttributesClass not existing.
///- InProgress
///InProgress indicates that the volume is being modified.
///- Infeasible
///Infeasible indicates that the request has been rejected as invalid by the CSI driver.
///To
///resolve the error, a valid VolumeAttributesClass needs to be specified.
///Note: New statuses can be added in the future. Consumers should check for unknown
///statuses and fail appropriately.
///
///Possible enum values:
///- `"InProgress"` InProgress indicates that the volume is being modified
///- `"Infeasible"` Infeasible indicates that the request has been rejected as invalid by
///the CSI driver. To resolve the error, a valid VolumeAttributesClass needs to be
///specified
///- `"Pending"` Pending indicates that the PersistentVolumeClaim cannot be modified due to
///unmet requirements, such as the specified VolumeAttributesClass not existing
enum StatusEnum {
  @JsonValue('Infeasible')
  INFEASIBLE,
  @JsonValue('InProgress')
  IN_PROGRESS,
  @JsonValue('Pending')
  PENDING,
}

final statusEnumValues = EnumValues({
  'Infeasible': StatusEnum.INFEASIBLE,
  'InProgress': StatusEnum.IN_PROGRESS,
  'Pending': StatusEnum.PENDING,
});

///phase represents the current phase of PersistentVolumeClaim.
///
///Possible enum values:
///- `"Bound"` used for PersistentVolumeClaims that are bound
///- `"Lost"` used for PersistentVolumeClaims that lost their underlying PersistentVolume.
///The claim was bound to a PersistentVolume and this volume does not exist any longer and
///all data on it was lost.
///- `"Pending"` used for PersistentVolumeClaims that are not yet bound
enum Phase {
  @JsonValue('Bound')
  BOUND,
  @JsonValue('Lost')
  LOST,
  @JsonValue('Pending')
  PENDING,
}

final phaseValues = EnumValues({
  'Bound': Phase.BOUND,
  'Lost': Phase.LOST,
  'Pending': Phase.PENDING,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum PersistentvolumeclaimlistV1Kind {
  @JsonValue('PersistentVolumeClaimList')
  PERSISTENT_VOLUME_CLAIM_LIST,
}

final persistentvolumeclaimlistV1KindValues = EnumValues({
  'PersistentVolumeClaimList':
      PersistentvolumeclaimlistV1Kind.PERSISTENT_VOLUME_CLAIM_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class PersistentvolumeclaimlistV1Metadata {
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

  PersistentvolumeclaimlistV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory PersistentvolumeclaimlistV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$PersistentvolumeclaimlistV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersistentvolumeclaimlistV1MetadataToJson(this);
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
