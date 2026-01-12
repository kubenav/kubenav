import 'package:json_annotation/json_annotation.dart';

part 'resourceslicelist_resource_v1.g.dart';

///ResourceSliceList is a collection of ResourceSlices.
@JsonSerializable()
class ResourceslicelistResourceV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Items is the list of resource ResourceSlices.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ResourceslicelistResourceV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ResourceslicelistResourceV1Metadata? metadata;

  ResourceslicelistResourceV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ResourceslicelistResourceV1.fromJson(Map<String, dynamic> json) =>
      _$ResourceslicelistResourceV1FromJson(json);

  Map<String, dynamic> toJson() => _$ResourceslicelistResourceV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('resource.k8s.io/v1')
  RESOURCE_K8_S_IO_V1,
}

final apiVersionValues = EnumValues({
  'resource.k8s.io/v1': ApiVersion.RESOURCE_K8_S_IO_V1,
});

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

  ///ResourceSliceSpec contains the information published by the driver in one ResourceSlice.
  @JsonKey(name: 'spec')
  Spec spec;

  Item({this.apiVersion, this.kind, this.metadata, required this.spec});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('ResourceSlice')
  RESOURCE_SLICE,
}

final itemKindValues = EnumValues({'ResourceSlice': ItemKind.RESOURCE_SLICE});

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

///ResourceSliceSpec contains the information published by the driver in one ResourceSlice.
@JsonSerializable()
class Spec {
  ///AllNodes indicates that all nodes have access to the resources in the pool.
  ///
  ///Exactly one of NodeName, NodeSelector, AllNodes, and PerDeviceNodeSelection must be set.
  @JsonKey(name: 'allNodes')
  bool? allNodes;

  ///Devices lists some or all of the devices in this pool.
  ///
  ///Must not have more than 128 entries. If any device uses taints or consumes counters the
  ///limit is 64.
  ///
  ///Only one of Devices and SharedCounters can be set in a ResourceSlice.
  @JsonKey(name: 'devices')
  List<Device?>? devices;

  ///Driver identifies the DRA driver providing the capacity information. A field selector can
  ///be used to list only ResourceSlice objects with a certain driver name.
  ///
  ///Must be a DNS subdomain and should end with a DNS domain owned by the vendor of the
  ///driver. It should use only lower case characters. This field is immutable.
  @JsonKey(name: 'driver')
  String driver;

  ///NodeName identifies the node which provides the resources in this pool. A field selector
  ///can be used to list only ResourceSlice objects belonging to a certain node.
  ///
  ///This field can be used to limit access from nodes to ResourceSlices with the same node
  ///name. It also indicates to autoscalers that adding new nodes of the same type as some old
  ///node might also make new resources available.
  ///
  ///Exactly one of NodeName, NodeSelector, AllNodes, and PerDeviceNodeSelection must be set.
  ///This field is immutable.
  @JsonKey(name: 'nodeName')
  String? nodeName;

  ///A node selector represents the union of the results of one or more label queries over a
  ///set of nodes; that is, it represents the OR of the selectors represented by the node
  ///selector terms.
  @JsonKey(name: 'nodeSelector')
  SpecNodeSelector? nodeSelector;

  ///PerDeviceNodeSelection defines whether the access from nodes to resources in the pool is
  ///set on the ResourceSlice level or on each device. If it is set to true, every device
  ///defined the ResourceSlice must specify this individually.
  ///
  ///Exactly one of NodeName, NodeSelector, AllNodes, and PerDeviceNodeSelection must be set.
  @JsonKey(name: 'perDeviceNodeSelection')
  bool? perDeviceNodeSelection;

  ///ResourcePool describes the pool that ResourceSlices belong to.
  @JsonKey(name: 'pool')
  Pool pool;

  ///SharedCounters defines a list of counter sets, each of which has a name and a list of
  ///counters available.
  ///
  ///The names of the counter sets must be unique in the ResourcePool.
  ///
  ///Only one of Devices and SharedCounters can be set in a ResourceSlice.
  ///
  ///The maximum number of counter sets is 8.
  @JsonKey(name: 'sharedCounters')
  List<SharedCounter?>? sharedCounters;

  Spec({
    this.allNodes,
    this.devices,
    required this.driver,
    this.nodeName,
    this.nodeSelector,
    this.perDeviceNodeSelection,
    required this.pool,
    this.sharedCounters,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Device {
  ///AllNodes indicates that all nodes have access to the device.
  ///
  ///Must only be set if Spec.PerDeviceNodeSelection is set to true. At most one of NodeName,
  ///NodeSelector and AllNodes can be set.
  @JsonKey(name: 'allNodes')
  bool? allNodes;

  ///AllowMultipleAllocations marks whether the device is allowed to be allocated to multiple
  ///DeviceRequests.
  ///
  ///If AllowMultipleAllocations is set to true, the device can be allocated more than once,
  ///and all of its capacity is consumable, regardless of whether the requestPolicy is defined
  ///or not.
  @JsonKey(name: 'allowMultipleAllocations')
  bool? allowMultipleAllocations;

  ///Attributes defines the set of attributes for this device. The name of each attribute must
  ///be unique in that set.
  ///
  ///The maximum number of attributes and capacities combined is 32.
  @JsonKey(name: 'attributes')
  Map<String, Attribute?>? attributes;

  ///BindingConditions defines the conditions for proceeding with binding. All of these
  ///conditions must be set in the per-device status conditions with a value of True to
  ///proceed with binding the pod to the node while scheduling the pod.
  ///
  ///The maximum number of binding conditions is 4.
  ///
  ///The conditions must be a valid condition type string.
  ///
  ///This is an alpha field and requires enabling the DRADeviceBindingConditions and
  ///DRAResourceClaimDeviceStatus feature gates.
  @JsonKey(name: 'bindingConditions')
  List<String?>? bindingConditions;

  ///BindingFailureConditions defines the conditions for binding failure. They may be set in
  ///the per-device status conditions. If any is set to "True", a binding failure occurred.
  ///
  ///The maximum number of binding failure conditions is 4.
  ///
  ///The conditions must be a valid condition type string.
  ///
  ///This is an alpha field and requires enabling the DRADeviceBindingConditions and
  ///DRAResourceClaimDeviceStatus feature gates.
  @JsonKey(name: 'bindingFailureConditions')
  List<String?>? bindingFailureConditions;

  ///BindsToNode indicates if the usage of an allocation involving this device has to be
  ///limited to exactly the node that was chosen when allocating the claim. If set to true,
  ///the scheduler will set the ResourceClaim.Status.Allocation.NodeSelector to match the node
  ///where the allocation was made.
  ///
  ///This is an alpha field and requires enabling the DRADeviceBindingConditions and
  ///DRAResourceClaimDeviceStatus feature gates.
  @JsonKey(name: 'bindsToNode')
  bool? bindsToNode;

  ///Capacity defines the set of capacities for this device. The name of each capacity must be
  ///unique in that set.
  ///
  ///The maximum number of attributes and capacities combined is 32.
  @JsonKey(name: 'capacity')
  Map<String, Capacity?>? capacity;

  ///ConsumesCounters defines a list of references to sharedCounters and the set of counters
  ///that the device will consume from those counter sets.
  ///
  ///There can only be a single entry per counterSet.
  ///
  ///The maximum number of device counter consumptions per device is 2.
  @JsonKey(name: 'consumesCounters')
  List<ConsumesCounter?>? consumesCounters;

  ///Name is unique identifier among all devices managed by the driver in the pool. It must be
  ///a DNS label.
  @JsonKey(name: 'name')
  String name;

  ///NodeName identifies the node where the device is available.
  ///
  ///Must only be set if Spec.PerDeviceNodeSelection is set to true. At most one of NodeName,
  ///NodeSelector and AllNodes can be set.
  @JsonKey(name: 'nodeName')
  String? nodeName;

  ///A node selector represents the union of the results of one or more label queries over a
  ///set of nodes; that is, it represents the OR of the selectors represented by the node
  ///selector terms.
  @JsonKey(name: 'nodeSelector')
  DeviceNodeSelector? nodeSelector;

  ///If specified, these are the driver-defined taints.
  ///
  ///The maximum number of taints is 16. If taints are set for any device in a ResourceSlice,
  ///then the maximum number of allowed devices per ResourceSlice is 64 instead of 128.
  ///
  ///This is an alpha field and requires enabling the DRADeviceTaints feature gate.
  @JsonKey(name: 'taints')
  List<Taint?>? taints;

  Device({
    this.allNodes,
    this.allowMultipleAllocations,
    this.attributes,
    this.bindingConditions,
    this.bindingFailureConditions,
    this.bindsToNode,
    this.capacity,
    this.consumesCounters,
    required this.name,
    this.nodeName,
    this.nodeSelector,
    this.taints,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class Attribute {
  ///BoolValue is a true/false value.
  @JsonKey(name: 'bool')
  bool? attributeBool;

  ///IntValue is a number.
  @JsonKey(name: 'int')
  int? attributeInt;

  ///StringValue is a string. Must not be longer than 64 characters.
  @JsonKey(name: 'string')
  String? string;

  ///VersionValue is a semantic version according to semver.org spec 2.0.0. Must not be longer
  ///than 64 characters.
  @JsonKey(name: 'version')
  String? version;

  Attribute({this.attributeBool, this.attributeInt, this.string, this.version});

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Capacity {
  ///CapacityRequestPolicy defines how requests consume device capacity.
  ///
  ///Must not set more than one ValidRequestValues.
  @JsonKey(name: 'requestPolicy')
  RequestPolicy? requestPolicy;
  @JsonKey(name: 'value')
  dynamic value;

  Capacity({this.requestPolicy, required this.value});

  factory Capacity.fromJson(Map<String, dynamic> json) =>
      _$CapacityFromJson(json);

  Map<String, dynamic> toJson() => _$CapacityToJson(this);
}

@JsonSerializable()
class RequestPolicy {
  @JsonKey(name: 'default')
  dynamic requestPolicyDefault;

  ///CapacityRequestPolicyRange defines a valid range for consumable capacity values.
  ///
  ///- If the requested amount is less than Min, it is rounded up to the Min value.
  ///- If Step is set and the requested amount is between Min and Max but not aligned with
  ///Step,
  ///it will be rounded up to the next value equal to Min + (n * Step).
  ///- If Step is not set, the requested amount is used as-is if it falls within the range Min
  ///to Max (if set).
  ///- If the requested or rounded amount exceeds Max (if set), the request does not satisfy
  ///the policy,
  ///and the device cannot be allocated.
  @JsonKey(name: 'validRange')
  ValidRange? validRange;

  ///ValidValues defines a set of acceptable quantity values in consuming requests.
  ///
  ///Must not contain more than 10 entries. Must be sorted in ascending order.
  ///
  ///If this field is set, Default must be defined and it must be included in ValidValues
  ///list.
  ///
  ///If the requested amount does not match any valid value but smaller than some valid
  ///values, the scheduler calculates the smallest valid value that is greater than or equal
  ///to the request. That is: min(ceil(requestedValue) ∈ validValues), where requestedValue ≤
  ///max(validValues).
  ///
  ///If the requested amount exceeds all valid values, the request violates the policy, and
  ///this device cannot be allocated.
  @JsonKey(name: 'validValues')
  List<dynamic>? validValues;

  RequestPolicy({this.requestPolicyDefault, this.validRange, this.validValues});

  factory RequestPolicy.fromJson(Map<String, dynamic> json) =>
      _$RequestPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPolicyToJson(this);
}

@JsonSerializable()
class ValidRange {
  @JsonKey(name: 'max')
  dynamic max;
  @JsonKey(name: 'min')
  dynamic min;
  @JsonKey(name: 'step')
  dynamic step;

  ValidRange({this.max, required this.min, this.step});

  factory ValidRange.fromJson(Map<String, dynamic> json) =>
      _$ValidRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ValidRangeToJson(this);
}

@JsonSerializable()
class ConsumesCounter {
  ///Counters defines the counters that will be consumed by the device.
  ///
  ///The maximum number of counters is 32.
  @JsonKey(name: 'counters')
  Map<String, ConsumesCounterCounter?> counters;

  ///CounterSet is the name of the set from which the counters defined will be consumed.
  @JsonKey(name: 'counterSet')
  String counterSet;

  ConsumesCounter({required this.counters, required this.counterSet});

  factory ConsumesCounter.fromJson(Map<String, dynamic> json) =>
      _$ConsumesCounterFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumesCounterToJson(this);
}

@JsonSerializable()
class ConsumesCounterCounter {
  @JsonKey(name: 'value')
  dynamic value;

  ConsumesCounterCounter({required this.value});

  factory ConsumesCounterCounter.fromJson(Map<String, dynamic> json) =>
      _$ConsumesCounterCounterFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumesCounterCounterToJson(this);
}

@JsonSerializable()
class DeviceNodeSelector {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<PurpleNodeSelectorTerm?> nodeSelectorTerms;

  DeviceNodeSelector({required this.nodeSelectorTerms});

  factory DeviceNodeSelector.fromJson(Map<String, dynamic> json) =>
      _$DeviceNodeSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceNodeSelectorToJson(this);
}

@JsonSerializable()
class PurpleNodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<PurpleMatchField?>? matchFields;

  PurpleNodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory PurpleNodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$PurpleNodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleNodeSelectorTermToJson(this);
}

@JsonSerializable()
class PurpleMatchExpression {
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

  PurpleMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory PurpleMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$PurpleMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMatchExpressionToJson(this);
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
class PurpleMatchField {
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

  PurpleMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory PurpleMatchField.fromJson(Map<String, dynamic> json) =>
      _$PurpleMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMatchFieldToJson(this);
}

@JsonSerializable()
class Taint {
  ///The effect of the taint on claims that do not tolerate the taint and through such claims
  ///on the pods using them.
  ///
  ///Valid effects are None, NoSchedule and NoExecute. PreferNoSchedule as used for nodes is
  ///not valid here. More effects may get added in the future. Consumers must treat unknown
  ///effects like None.
  ///
  ///
  ///Possible enum values:
  ///- `"NoExecute"` Evict any already-running pods that do not tolerate the device taint.
  ///- `"NoSchedule"` Do not allow new pods to schedule which use a tainted device unless they
  ///tolerate the taint, but allow all pods submitted to Kubelet without going through the
  ///scheduler to start, and allow all already-running pods to continue running.
  ///- `"None"` No effect, the taint is purely informational.
  @JsonKey(name: 'effect')
  Effect effect;

  ///The taint key to be applied to a device. Must be a label name.
  @JsonKey(name: 'key')
  String key;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'timeAdded')
  DateTime? timeAdded;

  ///The taint value corresponding to the taint key. Must be a label value.
  @JsonKey(name: 'value')
  String? value;

  Taint({required this.effect, required this.key, this.timeAdded, this.value});

  factory Taint.fromJson(Map<String, dynamic> json) => _$TaintFromJson(json);

  Map<String, dynamic> toJson() => _$TaintToJson(this);
}

///The effect of the taint on claims that do not tolerate the taint and through such claims
///on the pods using them.
///
///Valid effects are None, NoSchedule and NoExecute. PreferNoSchedule as used for nodes is
///not valid here. More effects may get added in the future. Consumers must treat unknown
///effects like None.
///
///
///Possible enum values:
///- `"NoExecute"` Evict any already-running pods that do not tolerate the device taint.
///- `"NoSchedule"` Do not allow new pods to schedule which use a tainted device unless they
///tolerate the taint, but allow all pods submitted to Kubelet without going through the
///scheduler to start, and allow all already-running pods to continue running.
///- `"None"` No effect, the taint is purely informational.
enum Effect {
  @JsonValue('None')
  NONE,
  @JsonValue('NoExecute')
  NO_EXECUTE,
  @JsonValue('NoSchedule')
  NO_SCHEDULE,
}

final effectValues = EnumValues({
  'None': Effect.NONE,
  'NoExecute': Effect.NO_EXECUTE,
  'NoSchedule': Effect.NO_SCHEDULE,
});

@JsonSerializable()
class SpecNodeSelector {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<FluffyNodeSelectorTerm?> nodeSelectorTerms;

  SpecNodeSelector({required this.nodeSelectorTerms});

  factory SpecNodeSelector.fromJson(Map<String, dynamic> json) =>
      _$SpecNodeSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SpecNodeSelectorToJson(this);
}

@JsonSerializable()
class FluffyNodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<FluffyMatchField?>? matchFields;

  FluffyNodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory FluffyNodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$FluffyNodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyNodeSelectorTermToJson(this);
}

@JsonSerializable()
class FluffyMatchExpression {
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

  FluffyMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory FluffyMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$FluffyMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMatchExpressionToJson(this);
}

@JsonSerializable()
class FluffyMatchField {
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

  FluffyMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory FluffyMatchField.fromJson(Map<String, dynamic> json) =>
      _$FluffyMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMatchFieldToJson(this);
}

///ResourcePool describes the pool that ResourceSlices belong to.
@JsonSerializable()
class Pool {
  ///Generation tracks the change in a pool over time. Whenever a driver changes something
  ///about one or more of the resources in a pool, it must change the generation in all
  ///ResourceSlices which are part of that pool. Consumers of ResourceSlices should only
  ///consider resources from the pool with the highest generation number. The generation may
  ///be reset by drivers, which should be fine for consumers, assuming that all ResourceSlices
  ///in a pool are updated to match or deleted.
  ///
  ///Combined with ResourceSliceCount, this mechanism enables consumers to detect pools which
  ///are comprised of multiple ResourceSlices and are in an incomplete state.
  @JsonKey(name: 'generation')
  int generation;

  ///Name is used to identify the pool. For node-local devices, this is often the node name,
  ///but this is not required.
  ///
  ///It must not be longer than 253 characters and must consist of one or more DNS sub-domains
  ///separated by slashes. This field is immutable.
  @JsonKey(name: 'name')
  String name;

  ///ResourceSliceCount is the total number of ResourceSlices in the pool at this generation
  ///number. Must be greater than zero.
  ///
  ///Consumers can use this to check whether they have seen all ResourceSlices belonging to
  ///the same pool.
  @JsonKey(name: 'resourceSliceCount')
  int resourceSliceCount;

  Pool({
    required this.generation,
    required this.name,
    required this.resourceSliceCount,
  });

  factory Pool.fromJson(Map<String, dynamic> json) => _$PoolFromJson(json);

  Map<String, dynamic> toJson() => _$PoolToJson(this);
}

@JsonSerializable()
class SharedCounter {
  ///Counters defines the set of counters for this CounterSet The name of each counter must be
  ///unique in that set and must be a DNS label.
  ///
  ///The maximum number of counters is 32.
  @JsonKey(name: 'counters')
  Map<String, SharedCounterCounter?> counters;

  ///Name defines the name of the counter set. It must be a DNS label.
  @JsonKey(name: 'name')
  String name;

  SharedCounter({required this.counters, required this.name});

  factory SharedCounter.fromJson(Map<String, dynamic> json) =>
      _$SharedCounterFromJson(json);

  Map<String, dynamic> toJson() => _$SharedCounterToJson(this);
}

@JsonSerializable()
class SharedCounterCounter {
  @JsonKey(name: 'value')
  dynamic value;

  SharedCounterCounter({required this.value});

  factory SharedCounterCounter.fromJson(Map<String, dynamic> json) =>
      _$SharedCounterCounterFromJson(json);

  Map<String, dynamic> toJson() => _$SharedCounterCounterToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ResourceslicelistResourceV1Kind {
  @JsonValue('ResourceSliceList')
  RESOURCE_SLICE_LIST,
}

final resourceslicelistResourceV1KindValues = EnumValues({
  'ResourceSliceList': ResourceslicelistResourceV1Kind.RESOURCE_SLICE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ResourceslicelistResourceV1Metadata {
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

  ResourceslicelistResourceV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ResourceslicelistResourceV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ResourceslicelistResourceV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceslicelistResourceV1MetadataToJson(this);
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
