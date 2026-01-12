import 'package:json_annotation/json_annotation.dart';

part 'deviceclasslist_resource_v1.g.dart';

///DeviceClassList is a collection of classes.
@JsonSerializable()
class DeviceclasslistResourceV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Items is the list of resource classes.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  DeviceclasslistResourceV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  DeviceclasslistResourceV1Metadata? metadata;

  DeviceclasslistResourceV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory DeviceclasslistResourceV1.fromJson(Map<String, dynamic> json) =>
      _$DeviceclasslistResourceV1FromJson(json);

  Map<String, dynamic> toJson() => _$DeviceclasslistResourceV1ToJson(this);
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

  ///DeviceClassSpec is used in a [DeviceClass] to define what can be allocated and how to
  ///configure it.
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
  @JsonValue('DeviceClass')
  DEVICE_CLASS,
}

final itemKindValues = EnumValues({'DeviceClass': ItemKind.DEVICE_CLASS});

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

///DeviceClassSpec is used in a [DeviceClass] to define what can be allocated and how to
///configure it.
@JsonSerializable()
class Spec {
  ///Config defines configuration parameters that apply to each device that is claimed via
  ///this class. Some classses may potentially be satisfied by multiple drivers, so each
  ///instance of a vendor configuration applies to exactly one driver.
  ///
  ///They are passed to the driver, but are not considered while allocating the claim.
  @JsonKey(name: 'config')
  List<Config?>? config;

  ///ExtendedResourceName is the extended resource name for the devices of this class. The
  ///devices of this class can be used to satisfy a pod's extended resource requests. It has
  ///the same format as the name of a pod's extended resource. It should be unique among all
  ///the device classes in a cluster. If two device classes have the same name, then the class
  ///created later is picked to satisfy a pod's extended resource requests. If two classes are
  ///created at the same time, then the name of the class lexicographically sorted first is
  ///picked.
  ///
  ///This is an alpha field.
  @JsonKey(name: 'extendedResourceName')
  String? extendedResourceName;

  ///Each selector must be satisfied by a device which is claimed via this class.
  @JsonKey(name: 'selectors')
  List<Selector?>? selectors;

  Spec({this.config, this.extendedResourceName, this.selectors});

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Config {
  ///OpaqueDeviceConfiguration contains configuration parameters for a driver in a format
  ///defined by the driver vendor.
  @JsonKey(name: 'opaque')
  Opaque? opaque;

  Config({this.opaque});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class Opaque {
  ///Driver is used to determine which kubelet plugin needs to be passed these configuration
  ///parameters.
  ///
  ///An admission policy provided by the driver developer could use this to decide whether it
  ///needs to validate them.
  ///
  ///Must be a DNS subdomain and should end with a DNS domain owned by the vendor of the
  ///driver. It should use only lower case characters.
  @JsonKey(name: 'driver')
  String driver;

  ///RawExtension is used to hold extensions in external versions.
  ///
  ///To use this, make a field which has RawExtension as its type in your external, versioned
  ///struct, and Object in your internal struct. You also need to register your various plugin
  ///types.
  ///
  ///// Internal package:
  ///
  ///type MyAPIObject struct {
  ///runtime.TypeMeta `json:",inline"`
  ///MyPlugin runtime.Object `json:"myPlugin"`
  ///}
  ///
  ///type PluginA struct {
  ///AOption string `json:"aOption"`
  ///}
  ///
  ///// External package:
  ///
  ///type MyAPIObject struct {
  ///runtime.TypeMeta `json:",inline"`
  ///MyPlugin runtime.RawExtension `json:"myPlugin"`
  ///}
  ///
  ///type PluginA struct {
  ///AOption string `json:"aOption"`
  ///}
  ///
  ///// On the wire, the JSON will look something like this:
  ///
  ///{
  ///"kind":"MyAPIObject",
  ///"apiVersion":"v1",
  ///"myPlugin": {
  ///"kind":"PluginA",
  ///"aOption":"foo",
  ///},
  ///}
  ///
  ///So what happens? Decode first uses json or yaml to unmarshal the serialized data into
  ///your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The
  ///next step is to copy (using pkg/conversion) into the internal struct. The runtime
  ///package's DefaultScheme has conversion functions installed which will unpack the JSON
  ///stored in RawExtension, turning it into the correct object type, and storing it in the
  ///Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown
  ///object will be created and stored.)
  @JsonKey(name: 'parameters')
  Map<String, dynamic> parameters;

  Opaque({required this.driver, required this.parameters});

  factory Opaque.fromJson(Map<String, dynamic> json) => _$OpaqueFromJson(json);

  Map<String, dynamic> toJson() => _$OpaqueToJson(this);
}

@JsonSerializable()
class Selector {
  ///CELDeviceSelector contains a CEL expression for selecting a device.
  @JsonKey(name: 'cel')
  Cel? cel;

  Selector({this.cel});

  factory Selector.fromJson(Map<String, dynamic> json) =>
      _$SelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorToJson(this);
}

@JsonSerializable()
class Cel {
  ///Expression is a CEL expression which evaluates a single device. It must evaluate to true
  ///when the device under consideration satisfies the desired criteria, and false when it
  ///does not. Any other result is an error and causes allocation of devices to abort.
  ///
  ///The expression's input is an object named "device", which carries the following
  ///properties:
  ///- driver (string): the name of the driver which defines this device.
  ///- attributes (map[string]object): the device's attributes, grouped by prefix
  ///(e.g. device.attributes["dra.example.com"] evaluates to an object with all
  ///of the attributes which were prefixed by "dra.example.com".
  ///- capacity (map[string]object): the device's capacities, grouped by prefix.
  ///- allowMultipleAllocations (bool): the allowMultipleAllocations property of the device
  ///(v1.34+ with the DRAConsumableCapacity feature enabled).
  ///
  ///Example: Consider a device with driver="dra.example.com", which exposes two attributes
  ///named "model" and "ext.example.com/family" and which exposes one capacity named
  ///"modules". This input to this expression would have the following fields:
  ///
  ///device.driver
  ///device.attributes["dra.example.com"].model
  ///device.attributes["ext.example.com"].family
  ///device.capacity["dra.example.com"].modules
  ///
  ///The device.driver field can be used to check for a specific driver, either as a
  ///high-level precondition (i.e. you only want to consider devices from this driver) or as
  ///part of a multi-clause expression that is meant to consider devices from different
  ///drivers.
  ///
  ///The value type of each attribute is defined by the device definition, and users who write
  ///these expressions must consult the documentation for their specific drivers. The value
  ///type of each capacity is Quantity.
  ///
  ///If an unknown prefix is used as a lookup in either device.attributes or device.capacity,
  ///an empty map will be returned. Any reference to an unknown field will cause an evaluation
  ///error and allocation to abort.
  ///
  ///A robust expression should check for the existence of attributes before referencing
  ///them.
  ///
  ///For ease of use, the cel.bind() function is enabled, and can be used to simplify
  ///expressions that access multiple attributes with the same domain. For example:
  ///
  ///cel.bind(dra, device.attributes["dra.example.com"], dra.someBool && dra.anotherBool)
  ///
  ///The length of the expression must be smaller or equal to 10 Ki. The cost of evaluating it
  ///is also limited based on the estimated number of logical steps.
  @JsonKey(name: 'expression')
  String expression;

  Cel({required this.expression});

  factory Cel.fromJson(Map<String, dynamic> json) => _$CelFromJson(json);

  Map<String, dynamic> toJson() => _$CelToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum DeviceclasslistResourceV1Kind {
  @JsonValue('DeviceClassList')
  DEVICE_CLASS_LIST,
}

final deviceclasslistResourceV1KindValues = EnumValues({
  'DeviceClassList': DeviceclasslistResourceV1Kind.DEVICE_CLASS_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class DeviceclasslistResourceV1Metadata {
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

  DeviceclasslistResourceV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory DeviceclasslistResourceV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$DeviceclasslistResourceV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeviceclasslistResourceV1MetadataToJson(this);
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
