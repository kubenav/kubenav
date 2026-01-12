import 'package:json_annotation/json_annotation.dart';

part 'nodelist_v1.g.dart';

///NodeList is the whole list of all Nodes which have been registered with master.
@JsonSerializable()
class NodelistV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of nodes
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  NodelistV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  NodelistV1Metadata? metadata;

  NodelistV1({this.apiVersion, required this.items, this.kind, this.metadata});

  factory NodelistV1.fromJson(Map<String, dynamic> json) =>
      _$NodelistV1FromJson(json);

  Map<String, dynamic> toJson() => _$NodelistV1ToJson(this);
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

  ///NodeSpec describes the attributes that a node is created with.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///NodeStatus is information about the current status of a node.
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
  @JsonValue('Node')
  NODE,
}

final itemKindValues = EnumValues({'Node': ItemKind.NODE});

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
  ///NodeConfigSource specifies a source of node configuration. Exactly one subfield
  ///(excluding metadata) must be non-nil. This API is deprecated since 1.22
  @JsonKey(name: 'configSource')
  ConfigSource? configSource;

  ///Deprecated. Not all kubelets will set this field. Remove field after 1.13. see:
  ///https://issues.k8s.io/61966
  @JsonKey(name: 'externalID')
  String? externalId;

  ///PodCIDR represents the pod IP range assigned to the node.
  @JsonKey(name: 'podCIDR')
  String? podCidr;

  ///podCIDRs represents the IP ranges assigned to the node for usage by Pods on that node. If
  ///this field is specified, the 0th entry must match the podCIDR field. It may contain at
  ///most 1 value for each of IPv4 and IPv6.
  @JsonKey(name: 'podCIDRs')
  List<String?>? podCidRs;

  ///ID of the node assigned by the cloud provider in the format:
  ///<ProviderName>://<ProviderSpecificNodeID>
  @JsonKey(name: 'providerID')
  String? providerId;

  ///If specified, the node's taints.
  @JsonKey(name: 'taints')
  List<Taint?>? taints;

  ///Unschedulable controls node schedulability of new pods. By default, node is schedulable.
  ///More info: https://kubernetes.io/docs/concepts/nodes/node/#manual-node-administration
  @JsonKey(name: 'unschedulable')
  bool? unschedulable;

  Spec({
    this.configSource,
    this.externalId,
    this.podCidr,
    this.podCidRs,
    this.providerId,
    this.taints,
    this.unschedulable,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class ConfigSource {
  ///ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config
  ///source for the Node. This API is deprecated since 1.22:
  ///https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration
  @JsonKey(name: 'configMap')
  ConfigSourceConfigMap? configMap;

  ConfigSource({this.configMap});

  factory ConfigSource.fromJson(Map<String, dynamic> json) =>
      _$ConfigSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigSourceToJson(this);
}

@JsonSerializable()
class ConfigSourceConfigMap {
  ///KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the
  ///KubeletConfiguration structure This field is required in all cases.
  @JsonKey(name: 'kubeletConfigKey')
  String kubeletConfigKey;

  ///Name is the metadata.name of the referenced ConfigMap. This field is required in all
  ///cases.
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the metadata.namespace of the referenced ConfigMap. This field is required
  ///in all cases.
  @JsonKey(name: 'namespace')
  String namespace;

  ///ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field
  ///is forbidden in Node.Spec, and required in Node.Status.
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in
  ///Node.Spec, and required in Node.Status.
  @JsonKey(name: 'uid')
  String? uid;

  ConfigSourceConfigMap({
    required this.kubeletConfigKey,
    required this.name,
    required this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory ConfigSourceConfigMap.fromJson(Map<String, dynamic> json) =>
      _$ConfigSourceConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigSourceConfigMapToJson(this);
}

@JsonSerializable()
class Taint {
  ///Required. The effect of the taint on pods that do not tolerate the taint. Valid effects
  ///are NoSchedule, PreferNoSchedule and NoExecute.
  ///
  ///Possible enum values:
  ///- `"NoExecute"` Evict any already-running pods that do not tolerate the taint. Currently
  ///enforced by NodeController.
  ///- `"NoSchedule"` Do not allow new pods to schedule onto the node unless they tolerate the
  ///taint, but allow all pods submitted to Kubelet without going through the scheduler to
  ///start, and allow all already-running pods to continue running. Enforced by the
  ///scheduler.
  ///- `"PreferNoSchedule"` Like TaintEffectNoSchedule, but the scheduler tries not to
  ///schedule new pods onto the node, rather than prohibiting new pods from scheduling onto
  ///the node entirely. Enforced by the scheduler.
  @JsonKey(name: 'effect')
  Effect effect;

  ///Required. The taint key to be applied to a node.
  @JsonKey(name: 'key')
  String key;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'timeAdded')
  DateTime? timeAdded;

  ///The taint value corresponding to the taint key.
  @JsonKey(name: 'value')
  String? value;

  Taint({required this.effect, required this.key, this.timeAdded, this.value});

  factory Taint.fromJson(Map<String, dynamic> json) => _$TaintFromJson(json);

  Map<String, dynamic> toJson() => _$TaintToJson(this);
}

///Required. The effect of the taint on pods that do not tolerate the taint. Valid effects
///are NoSchedule, PreferNoSchedule and NoExecute.
///
///Possible enum values:
///- `"NoExecute"` Evict any already-running pods that do not tolerate the taint. Currently
///enforced by NodeController.
///- `"NoSchedule"` Do not allow new pods to schedule onto the node unless they tolerate the
///taint, but allow all pods submitted to Kubelet without going through the scheduler to
///start, and allow all already-running pods to continue running. Enforced by the
///scheduler.
///- `"PreferNoSchedule"` Like TaintEffectNoSchedule, but the scheduler tries not to
///schedule new pods onto the node, rather than prohibiting new pods from scheduling onto
///the node entirely. Enforced by the scheduler.
enum Effect {
  @JsonValue('NoExecute')
  NO_EXECUTE,
  @JsonValue('NoSchedule')
  NO_SCHEDULE,
  @JsonValue('PreferNoSchedule')
  PREFER_NO_SCHEDULE,
}

final effectValues = EnumValues({
  'NoExecute': Effect.NO_EXECUTE,
  'NoSchedule': Effect.NO_SCHEDULE,
  'PreferNoSchedule': Effect.PREFER_NO_SCHEDULE,
});

@JsonSerializable()
class Status {
  ///List of addresses reachable to the node. Queried from cloud provider, if available. More
  ///info: https://kubernetes.io/docs/reference/node/node-status/#addresses Note: This field
  ///is declared as mergeable, but the merge key is not sufficiently unique, which can cause
  ///data corruption when it is merged. Callers should instead use a full-replacement patch.
  ///See https://pr.k8s.io/79391 for an example. Consumers should assume that addresses can
  ///change during the lifetime of a Node. However, there are some exceptions where this may
  ///not be possible, such as Pods that inherit a Node's address in its own status or
  ///consumers of the downward API (status.hostIP).
  @JsonKey(name: 'addresses')
  List<Address?>? addresses;

  ///Allocatable represents the resources of a node that are available for scheduling.
  ///Defaults to Capacity.
  @JsonKey(name: 'allocatable')
  Map<String, dynamic>? allocatable;

  ///Capacity represents the total resources of a node. More info:
  ///https://kubernetes.io/docs/reference/node/node-status/#capacity
  @JsonKey(name: 'capacity')
  Map<String, dynamic>? capacity;

  ///Conditions is an array of current observed node conditions. More info:
  ///https://kubernetes.io/docs/reference/node/node-status/#condition
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///NodeConfigStatus describes the status of the config assigned by Node.Spec.ConfigSource.
  @JsonKey(name: 'config')
  Config? config;

  ///NodeDaemonEndpoints lists ports opened by daemons running on the Node.
  @JsonKey(name: 'daemonEndpoints')
  DaemonEndpoints? daemonEndpoints;

  ///DeclaredFeatures represents the features related to feature gates that are declared by
  ///the node.
  @JsonKey(name: 'declaredFeatures')
  List<String?>? declaredFeatures;

  ///NodeFeatures describes the set of features implemented by the CRI implementation. The
  ///features contained in the NodeFeatures should depend only on the cri implementation
  ///independent of runtime handlers.
  @JsonKey(name: 'features')
  StatusFeatures? features;

  ///List of container images on this node
  @JsonKey(name: 'images')
  List<Image?>? images;

  ///NodeSystemInfo is a set of ids/uuids to uniquely identify the node.
  @JsonKey(name: 'nodeInfo')
  NodeInfo? nodeInfo;

  ///NodePhase is the recently observed lifecycle phase of the node. More info:
  ///https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never populated, and
  ///now is deprecated.
  ///
  ///Possible enum values:
  ///- `"Pending"` means the node has been created/added by the system, but not configured.
  ///- `"Running"` means the node has been configured and has Kubernetes components running.
  ///- `"Terminated"` means the node has been removed from the cluster.
  @JsonKey(name: 'phase')
  Phase? phase;

  ///The available runtime handlers.
  @JsonKey(name: 'runtimeHandlers')
  List<RuntimeHandler?>? runtimeHandlers;

  ///List of volumes that are attached to the node.
  @JsonKey(name: 'volumesAttached')
  List<VolumesAttached?>? volumesAttached;

  ///List of attachable volumes in use (mounted) by the node.
  @JsonKey(name: 'volumesInUse')
  List<String?>? volumesInUse;

  Status({
    this.addresses,
    this.allocatable,
    this.capacity,
    this.conditions,
    this.config,
    this.daemonEndpoints,
    this.declaredFeatures,
    this.features,
    this.images,
    this.nodeInfo,
    this.phase,
    this.runtimeHandlers,
    this.volumesAttached,
    this.volumesInUse,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Address {
  ///The node address.
  @JsonKey(name: 'address')
  String address;

  ///Node address type, one of Hostname, ExternalIP or InternalIP.
  @JsonKey(name: 'type')
  String type;

  Address({required this.address, required this.type});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastHeartbeatTime')
  DateTime? lastHeartbeatTime;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///Human readable message indicating details about last transition.
  @JsonKey(name: 'message')
  String? message;

  ///(brief) reason for the condition's last transition.
  @JsonKey(name: 'reason')
  String? reason;

  ///Status of the condition, one of True, False, Unknown.
  @JsonKey(name: 'status')
  String status;

  ///Type of node condition.
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastHeartbeatTime,
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
class Config {
  ///NodeConfigSource specifies a source of node configuration. Exactly one subfield
  ///(excluding metadata) must be non-nil. This API is deprecated since 1.22
  @JsonKey(name: 'active')
  Active? active;

  ///NodeConfigSource specifies a source of node configuration. Exactly one subfield
  ///(excluding metadata) must be non-nil. This API is deprecated since 1.22
  @JsonKey(name: 'assigned')
  Assigned? assigned;

  ///Error describes any problems reconciling the Spec.ConfigSource to the Active config.
  ///Errors may occur, for example, attempting to checkpoint Spec.ConfigSource to the local
  ///Assigned record, attempting to checkpoint the payload associated with Spec.ConfigSource,
  ///attempting to load or validate the Assigned config, etc. Errors may occur at different
  ///points while syncing config. Earlier errors (e.g. download or checkpointing errors) will
  ///not result in a rollback to LastKnownGood, and may resolve across Kubelet retries. Later
  ///errors (e.g. loading or validating a checkpointed config) will result in a rollback to
  ///LastKnownGood. In the latter case, it is usually possible to resolve the error by fixing
  ///the config assigned in Spec.ConfigSource. You can find additional information for
  ///debugging by searching the error message in the Kubelet log. Error is a human-readable
  ///description of the error state; machines can check whether or not Error is empty, but
  ///should not rely on the stability of the Error text across Kubelet versions.
  @JsonKey(name: 'error')
  String? error;

  ///NodeConfigSource specifies a source of node configuration. Exactly one subfield
  ///(excluding metadata) must be non-nil. This API is deprecated since 1.22
  @JsonKey(name: 'lastKnownGood')
  LastKnownGood? lastKnownGood;

  Config({this.active, this.assigned, this.error, this.lastKnownGood});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class Active {
  ///ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config
  ///source for the Node. This API is deprecated since 1.22:
  ///https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration
  @JsonKey(name: 'configMap')
  ActiveConfigMap? configMap;

  Active({this.configMap});

  factory Active.fromJson(Map<String, dynamic> json) => _$ActiveFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveToJson(this);
}

@JsonSerializable()
class ActiveConfigMap {
  ///KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the
  ///KubeletConfiguration structure This field is required in all cases.
  @JsonKey(name: 'kubeletConfigKey')
  String kubeletConfigKey;

  ///Name is the metadata.name of the referenced ConfigMap. This field is required in all
  ///cases.
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the metadata.namespace of the referenced ConfigMap. This field is required
  ///in all cases.
  @JsonKey(name: 'namespace')
  String namespace;

  ///ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field
  ///is forbidden in Node.Spec, and required in Node.Status.
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in
  ///Node.Spec, and required in Node.Status.
  @JsonKey(name: 'uid')
  String? uid;

  ActiveConfigMap({
    required this.kubeletConfigKey,
    required this.name,
    required this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory ActiveConfigMap.fromJson(Map<String, dynamic> json) =>
      _$ActiveConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveConfigMapToJson(this);
}

@JsonSerializable()
class Assigned {
  ///ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config
  ///source for the Node. This API is deprecated since 1.22:
  ///https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration
  @JsonKey(name: 'configMap')
  AssignedConfigMap? configMap;

  Assigned({this.configMap});

  factory Assigned.fromJson(Map<String, dynamic> json) =>
      _$AssignedFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedToJson(this);
}

@JsonSerializable()
class AssignedConfigMap {
  ///KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the
  ///KubeletConfiguration structure This field is required in all cases.
  @JsonKey(name: 'kubeletConfigKey')
  String kubeletConfigKey;

  ///Name is the metadata.name of the referenced ConfigMap. This field is required in all
  ///cases.
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the metadata.namespace of the referenced ConfigMap. This field is required
  ///in all cases.
  @JsonKey(name: 'namespace')
  String namespace;

  ///ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field
  ///is forbidden in Node.Spec, and required in Node.Status.
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in
  ///Node.Spec, and required in Node.Status.
  @JsonKey(name: 'uid')
  String? uid;

  AssignedConfigMap({
    required this.kubeletConfigKey,
    required this.name,
    required this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory AssignedConfigMap.fromJson(Map<String, dynamic> json) =>
      _$AssignedConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedConfigMapToJson(this);
}

@JsonSerializable()
class LastKnownGood {
  ///ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config
  ///source for the Node. This API is deprecated since 1.22:
  ///https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration
  @JsonKey(name: 'configMap')
  LastKnownGoodConfigMap? configMap;

  LastKnownGood({this.configMap});

  factory LastKnownGood.fromJson(Map<String, dynamic> json) =>
      _$LastKnownGoodFromJson(json);

  Map<String, dynamic> toJson() => _$LastKnownGoodToJson(this);
}

@JsonSerializable()
class LastKnownGoodConfigMap {
  ///KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the
  ///KubeletConfiguration structure This field is required in all cases.
  @JsonKey(name: 'kubeletConfigKey')
  String kubeletConfigKey;

  ///Name is the metadata.name of the referenced ConfigMap. This field is required in all
  ///cases.
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the metadata.namespace of the referenced ConfigMap. This field is required
  ///in all cases.
  @JsonKey(name: 'namespace')
  String namespace;

  ///ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field
  ///is forbidden in Node.Spec, and required in Node.Status.
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in
  ///Node.Spec, and required in Node.Status.
  @JsonKey(name: 'uid')
  String? uid;

  LastKnownGoodConfigMap({
    required this.kubeletConfigKey,
    required this.name,
    required this.namespace,
    this.resourceVersion,
    this.uid,
  });

  factory LastKnownGoodConfigMap.fromJson(Map<String, dynamic> json) =>
      _$LastKnownGoodConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$LastKnownGoodConfigMapToJson(this);
}

@JsonSerializable()
class DaemonEndpoints {
  ///DaemonEndpoint contains information about a single Daemon endpoint.
  @JsonKey(name: 'kubeletEndpoint')
  KubeletEndpoint? kubeletEndpoint;

  DaemonEndpoints({this.kubeletEndpoint});

  factory DaemonEndpoints.fromJson(Map<String, dynamic> json) =>
      _$DaemonEndpointsFromJson(json);

  Map<String, dynamic> toJson() => _$DaemonEndpointsToJson(this);
}

@JsonSerializable()
class KubeletEndpoint {
  ///Port number of the given endpoint.
  @JsonKey(name: 'Port')
  int port;

  KubeletEndpoint({required this.port});

  factory KubeletEndpoint.fromJson(Map<String, dynamic> json) =>
      _$KubeletEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$KubeletEndpointToJson(this);
}

@JsonSerializable()
class StatusFeatures {
  ///SupplementalGroupsPolicy is set to true if the runtime supports SupplementalGroupsPolicy
  ///and ContainerUser.
  @JsonKey(name: 'supplementalGroupsPolicy')
  bool? supplementalGroupsPolicy;

  StatusFeatures({this.supplementalGroupsPolicy});

  factory StatusFeatures.fromJson(Map<String, dynamic> json) =>
      _$StatusFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$StatusFeaturesToJson(this);
}

@JsonSerializable()
class Image {
  ///Names by which this image is known. e.g. ["kubernetes.example/hyperkube:v1.0.7",
  ///"cloud-vendor.registry.example/cloud-vendor/hyperkube:v1.0.7"]
  @JsonKey(name: 'names')
  List<String?>? names;

  ///The size of the image in bytes.
  @JsonKey(name: 'sizeBytes')
  int? sizeBytes;

  Image({this.names, this.sizeBytes});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class NodeInfo {
  ///The Architecture reported by the node
  @JsonKey(name: 'architecture')
  String architecture;

  ///Boot ID reported by the node.
  @JsonKey(name: 'bootID')
  String bootId;

  ///ContainerRuntime Version reported by the node through runtime remote API (e.g.
  ///containerd://1.4.2).
  @JsonKey(name: 'containerRuntimeVersion')
  String containerRuntimeVersion;

  ///Kernel Version reported by the node from 'uname -r' (e.g. 3.16.0-0.bpo.4-amd64).
  @JsonKey(name: 'kernelVersion')
  String kernelVersion;

  ///Kubelet Version reported by the node.
  @JsonKey(name: 'kubeletVersion')
  String kubeletVersion;

  ///Deprecated: KubeProxy Version reported by the node.
  @JsonKey(name: 'kubeProxyVersion')
  String kubeProxyVersion;

  ///MachineID reported by the node. For unique machine identification in the cluster this
  ///field is preferred. Learn more from man(5) machine-id:
  ///http://man7.org/linux/man-pages/man5/machine-id.5.html
  @JsonKey(name: 'machineID')
  String machineId;

  ///The Operating System reported by the node
  @JsonKey(name: 'operatingSystem')
  String operatingSystem;

  ///OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7 (wheezy)).
  @JsonKey(name: 'osImage')
  String osImage;

  ///NodeSwapStatus represents swap memory information.
  @JsonKey(name: 'swap')
  Swap? swap;

  ///SystemUUID reported by the node. For unique machine identification MachineID is
  ///preferred. This field is specific to Red Hat hosts
  ///https://access.redhat.com/documentation/en-us/red_hat_subscription_management/1/html/rhsm/uuid
  @JsonKey(name: 'systemUUID')
  String systemUuid;

  NodeInfo({
    required this.architecture,
    required this.bootId,
    required this.containerRuntimeVersion,
    required this.kernelVersion,
    required this.kubeletVersion,
    required this.kubeProxyVersion,
    required this.machineId,
    required this.operatingSystem,
    required this.osImage,
    this.swap,
    required this.systemUuid,
  });

  factory NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$NodeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NodeInfoToJson(this);
}

@JsonSerializable()
class Swap {
  ///Total amount of swap memory in bytes.
  @JsonKey(name: 'capacity')
  int? capacity;

  Swap({this.capacity});

  factory Swap.fromJson(Map<String, dynamic> json) => _$SwapFromJson(json);

  Map<String, dynamic> toJson() => _$SwapToJson(this);
}

///NodePhase is the recently observed lifecycle phase of the node. More info:
///https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never populated, and
///now is deprecated.
///
///Possible enum values:
///- `"Pending"` means the node has been created/added by the system, but not configured.
///- `"Running"` means the node has been configured and has Kubernetes components running.
///- `"Terminated"` means the node has been removed from the cluster.
enum Phase {
  @JsonValue('Pending')
  PENDING,
  @JsonValue('Running')
  RUNNING,
  @JsonValue('Terminated')
  TERMINATED,
}

final phaseValues = EnumValues({
  'Pending': Phase.PENDING,
  'Running': Phase.RUNNING,
  'Terminated': Phase.TERMINATED,
});

@JsonSerializable()
class RuntimeHandler {
  ///NodeRuntimeHandlerFeatures is a set of features implemented by the runtime handler.
  @JsonKey(name: 'features')
  RuntimeHandlerFeatures? features;

  ///Runtime handler name. Empty for the default runtime handler.
  @JsonKey(name: 'name')
  String? name;

  RuntimeHandler({this.features, this.name});

  factory RuntimeHandler.fromJson(Map<String, dynamic> json) =>
      _$RuntimeHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeHandlerToJson(this);
}

@JsonSerializable()
class RuntimeHandlerFeatures {
  ///RecursiveReadOnlyMounts is set to true if the runtime handler supports
  ///RecursiveReadOnlyMounts.
  @JsonKey(name: 'recursiveReadOnlyMounts')
  bool? recursiveReadOnlyMounts;

  ///UserNamespaces is set to true if the runtime handler supports UserNamespaces, including
  ///for volumes.
  @JsonKey(name: 'userNamespaces')
  bool? userNamespaces;

  RuntimeHandlerFeatures({this.recursiveReadOnlyMounts, this.userNamespaces});

  factory RuntimeHandlerFeatures.fromJson(Map<String, dynamic> json) =>
      _$RuntimeHandlerFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$RuntimeHandlerFeaturesToJson(this);
}

@JsonSerializable()
class VolumesAttached {
  ///DevicePath represents the device path where the volume should be available
  @JsonKey(name: 'devicePath')
  String devicePath;

  ///Name of the attached volume
  @JsonKey(name: 'name')
  String name;

  VolumesAttached({required this.devicePath, required this.name});

  factory VolumesAttached.fromJson(Map<String, dynamic> json) =>
      _$VolumesAttachedFromJson(json);

  Map<String, dynamic> toJson() => _$VolumesAttachedToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum NodelistV1Kind {
  @JsonValue('NodeList')
  NODE_LIST,
}

final nodelistV1KindValues = EnumValues({'NodeList': NodelistV1Kind.NODE_LIST});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class NodelistV1Metadata {
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

  NodelistV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory NodelistV1Metadata.fromJson(Map<String, dynamic> json) =>
      _$NodelistV1MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$NodelistV1MetadataToJson(this);
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
