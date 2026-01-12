import 'package:json_annotation/json_annotation.dart';

part 'resourceclaimtemplatelist_resource_v1.g.dart';

///ResourceClaimTemplateList is a collection of claim templates.
@JsonSerializable()
class ResourceclaimtemplatelistResourceV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Items is the list of resource claim templates.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ResourceclaimtemplatelistResourceV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ResourceclaimtemplatelistResourceV1Metadata? metadata;

  ResourceclaimtemplatelistResourceV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ResourceclaimtemplatelistResourceV1.fromJson(
    Map<String, dynamic> json,
  ) => _$ResourceclaimtemplatelistResourceV1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceclaimtemplatelistResourceV1ToJson(this);
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

  ///ResourceClaimTemplateSpec contains the metadata and fields for a ResourceClaim.
  @JsonKey(name: 'spec')
  ItemSpec spec;

  Item({this.apiVersion, this.kind, this.metadata, required this.spec});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('ResourceClaimTemplate')
  RESOURCE_CLAIM_TEMPLATE,
}

final itemKindValues = EnumValues({
  'ResourceClaimTemplate': ItemKind.RESOURCE_CLAIM_TEMPLATE,
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
  List<PurpleManagedField?>? managedFields;

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
  List<PurpleOwnerReference?>? ownerReferences;

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
class PurpleManagedField {
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

  PurpleManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory PurpleManagedField.fromJson(Map<String, dynamic> json) =>
      _$PurpleManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleManagedFieldToJson(this);
}

@JsonSerializable()
class PurpleOwnerReference {
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

  PurpleOwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory PurpleOwnerReference.fromJson(Map<String, dynamic> json) =>
      _$PurpleOwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleOwnerReferenceToJson(this);
}

///ResourceClaimTemplateSpec contains the metadata and fields for a ResourceClaim.
@JsonSerializable()
class ItemSpec {
  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  SpecMetadata? metadata;

  ///ResourceClaimSpec defines what is being requested in a ResourceClaim and how to configure
  ///it.
  @JsonKey(name: 'spec')
  SpecSpec spec;

  ItemSpec({this.metadata, required this.spec});

  factory ItemSpec.fromJson(Map<String, dynamic> json) =>
      _$ItemSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSpecToJson(this);
}

@JsonSerializable()
class SpecMetadata {
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
  List<FluffyManagedField?>? managedFields;

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
  List<FluffyOwnerReference?>? ownerReferences;

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

  SpecMetadata({
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

  factory SpecMetadata.fromJson(Map<String, dynamic> json) =>
      _$SpecMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$SpecMetadataToJson(this);
}

@JsonSerializable()
class FluffyManagedField {
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

  FluffyManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory FluffyManagedField.fromJson(Map<String, dynamic> json) =>
      _$FluffyManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyManagedFieldToJson(this);
}

@JsonSerializable()
class FluffyOwnerReference {
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

  FluffyOwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory FluffyOwnerReference.fromJson(Map<String, dynamic> json) =>
      _$FluffyOwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyOwnerReferenceToJson(this);
}

///ResourceClaimSpec defines what is being requested in a ResourceClaim and how to configure
///it.
@JsonSerializable()
class SpecSpec {
  ///DeviceClaim defines how to request devices with a ResourceClaim.
  @JsonKey(name: 'devices')
  Devices? devices;

  SpecSpec({this.devices});

  factory SpecSpec.fromJson(Map<String, dynamic> json) =>
      _$SpecSpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecSpecToJson(this);
}

@JsonSerializable()
class Devices {
  ///This field holds configuration for multiple potential drivers which could satisfy
  ///requests in this claim. It is ignored while allocating the claim.
  @JsonKey(name: 'config')
  List<Config?>? config;

  ///These constraints must be satisfied by the set of devices that get allocated for the
  ///claim.
  @JsonKey(name: 'constraints')
  List<Constraint?>? constraints;

  ///Requests represent individual requests for distinct devices which must all be satisfied.
  ///If empty, nothing needs to be allocated.
  @JsonKey(name: 'requests')
  List<Request?>? requests;

  Devices({this.config, this.constraints, this.requests});

  factory Devices.fromJson(Map<String, dynamic> json) =>
      _$DevicesFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesToJson(this);
}

@JsonSerializable()
class Config {
  ///OpaqueDeviceConfiguration contains configuration parameters for a driver in a format
  ///defined by the driver vendor.
  @JsonKey(name: 'opaque')
  Opaque? opaque;

  ///Requests lists the names of requests where the configuration applies. If empty, it
  ///applies to all requests.
  ///
  ///References to subrequests must include the name of the main request and may include the
  ///subrequest using the format <main request>[/<subrequest>]. If just the main request is
  ///given, the configuration applies to all subrequests.
  @JsonKey(name: 'requests')
  List<String?>? requests;

  Config({this.opaque, this.requests});

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
class Constraint {
  ///DistinctAttribute requires that all devices in question have this attribute and that its
  ///type and value are unique across those devices.
  ///
  ///This acts as the inverse of MatchAttribute.
  ///
  ///This constraint is used to avoid allocating multiple requests to the same device by
  ///ensuring attribute-level differentiation.
  ///
  ///This is useful for scenarios where resource requests must be fulfilled by separate
  ///physical devices. For example, a container requests two network interfaces that must be
  ///allocated from two different physical NICs.
  @JsonKey(name: 'distinctAttribute')
  String? distinctAttribute;

  ///MatchAttribute requires that all devices in question have this attribute and that its
  ///type and value are the same across those devices.
  ///
  ///For example, if you specified "dra.example.com/numa" (a hypothetical example!), then only
  ///devices in the same NUMA node will be chosen. A device which does not have that attribute
  ///will not be chosen. All devices should use a value of the same type for this attribute
  ///because that is part of its specification, but if one device doesn't, then it also will
  ///not be chosen.
  ///
  ///Must include the domain qualifier.
  @JsonKey(name: 'matchAttribute')
  String? matchAttribute;

  ///Requests is a list of the one or more requests in this claim which must co-satisfy this
  ///constraint. If a request is fulfilled by multiple devices, then all of the devices must
  ///satisfy the constraint. If this is not specified, this constraint applies to all requests
  ///in this claim.
  ///
  ///References to subrequests must include the name of the main request and may include the
  ///subrequest using the format <main request>[/<subrequest>]. If just the main request is
  ///given, the constraint applies to all subrequests.
  @JsonKey(name: 'requests')
  List<String?>? requests;

  Constraint({this.distinctAttribute, this.matchAttribute, this.requests});

  factory Constraint.fromJson(Map<String, dynamic> json) =>
      _$ConstraintFromJson(json);

  Map<String, dynamic> toJson() => _$ConstraintToJson(this);
}

@JsonSerializable()
class Request {
  ///ExactDeviceRequest is a request for one or more identical devices.
  @JsonKey(name: 'exactly')
  Exactly? exactly;

  ///FirstAvailable contains subrequests, of which exactly one will be selected by the
  ///scheduler. It tries to satisfy them in the order in which they are listed here. So if
  ///there are two entries in the list, the scheduler will only check the second one if it
  ///determines that the first one can not be used.
  ///
  ///DRA does not yet implement scoring, so the scheduler will select the first set of devices
  ///that satisfies all the requests in the claim. And if the requirements can be satisfied on
  ///more than one node, other scheduling features will determine which node is chosen. This
  ///means that the set of devices allocated to a claim might not be the optimal set available
  ///to the cluster. Scoring will be implemented later.
  @JsonKey(name: 'firstAvailable')
  List<FirstAvailable?>? firstAvailable;

  ///Name can be used to reference this request in a pod.spec.containers[].resources.claims
  ///entry and in a constraint of the claim.
  ///
  ///References using the name in the DeviceRequest will uniquely identify a request when the
  ///Exactly field is set. When the FirstAvailable field is set, a reference to the name of
  ///the DeviceRequest will match whatever subrequest is chosen by the scheduler.
  ///
  ///Must be a DNS label.
  @JsonKey(name: 'name')
  String name;

  Request({this.exactly, this.firstAvailable, required this.name});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable()
class Exactly {
  ///AdminAccess indicates that this is a claim for administrative access to the device(s).
  ///Claims with AdminAccess are expected to be used for monitoring or other management
  ///services for a device.  They ignore all ordinary claims to the device with respect to
  ///access modes and any resource allocations.
  ///
  ///This is an alpha field and requires enabling the DRAAdminAccess feature gate. Admin
  ///access is disabled if this field is unset or set to false, otherwise it is enabled.
  @JsonKey(name: 'adminAccess')
  bool? adminAccess;

  ///AllocationMode and its related fields define how devices are allocated to satisfy this
  ///request. Supported values are:
  ///
  ///- ExactCount: This request is for a specific number of devices.
  ///This is the default. The exact number is provided in the
  ///count field.
  ///
  ///- All: This request is for all of the matching devices in a pool.
  ///At least one device must exist on the node for the allocation to succeed.
  ///Allocation will fail if some devices are already allocated,
  ///unless adminAccess is requested.
  ///
  ///If AllocationMode is not specified, the default mode is ExactCount. If the mode is
  ///ExactCount and count is not specified, the default count is one. Any other requests must
  ///specify this field.
  ///
  ///More modes may get added in the future. Clients must refuse to handle requests with
  ///unknown modes.
  ///
  ///
  ///Possible enum values:
  ///- `"All"`
  ///- `"ExactCount"`
  @JsonKey(name: 'allocationMode')
  AllocationMode? allocationMode;

  ///CapacityRequirements defines the capacity requirements for a specific device request.
  @JsonKey(name: 'capacity')
  ExactlyCapacity? capacity;

  ///Count is used only when the count mode is "ExactCount". Must be greater than zero. If
  ///AllocationMode is ExactCount and this field is not specified, the default is one.
  @JsonKey(name: 'count')
  int? count;

  ///DeviceClassName references a specific DeviceClass, which can define additional
  ///configuration and selectors to be inherited by this request.
  ///
  ///A DeviceClassName is required.
  ///
  ///Administrators may use this to restrict which devices may get requested by only
  ///installing classes with selectors for permitted devices. If users are free to request
  ///anything without restrictions, then administrators can create an empty DeviceClass for
  ///users to reference.
  @JsonKey(name: 'deviceClassName')
  String deviceClassName;

  ///Selectors define criteria which must be satisfied by a specific device in order for that
  ///device to be considered for this request. All selectors must be satisfied for a device to
  ///be considered.
  @JsonKey(name: 'selectors')
  List<ExactlySelector?>? selectors;

  ///If specified, the request's tolerations.
  ///
  ///Tolerations for NoSchedule are required to allocate a device which has a taint with that
  ///effect. The same applies to NoExecute.
  ///
  ///In addition, should any of the allocated devices get tainted with NoExecute after
  ///allocation and that effect is not tolerated, then all pods consuming the ResourceClaim
  ///get deleted to evict them. The scheduler will not let new pods reserve the claim while it
  ///has these tainted devices. Once all pods are evicted, the claim will get deallocated.
  ///
  ///The maximum number of tolerations is 16.
  ///
  ///This is an alpha field and requires enabling the DRADeviceTaints feature gate.
  @JsonKey(name: 'tolerations')
  List<ExactlyToleration?>? tolerations;

  Exactly({
    this.adminAccess,
    this.allocationMode,
    this.capacity,
    this.count,
    required this.deviceClassName,
    this.selectors,
    this.tolerations,
  });

  factory Exactly.fromJson(Map<String, dynamic> json) =>
      _$ExactlyFromJson(json);

  Map<String, dynamic> toJson() => _$ExactlyToJson(this);
}

///AllocationMode and its related fields define how devices are allocated to satisfy this
///request. Supported values are:
///
///- ExactCount: This request is for a specific number of devices.
///This is the default. The exact number is provided in the
///count field.
///
///- All: This request is for all of the matching devices in a pool.
///At least one device must exist on the node for the allocation to succeed.
///Allocation will fail if some devices are already allocated,
///unless adminAccess is requested.
///
///If AllocationMode is not specified, the default mode is ExactCount. If the mode is
///ExactCount and count is not specified, the default count is one. Any other requests must
///specify this field.
///
///More modes may get added in the future. Clients must refuse to handle requests with
///unknown modes.
///
///
///Possible enum values:
///- `"All"`
///- `"ExactCount"`
///
///AllocationMode and its related fields define how devices are allocated to satisfy this
///subrequest. Supported values are:
///
///- ExactCount: This request is for a specific number of devices.
///This is the default. The exact number is provided in the
///count field.
///
///- All: This subrequest is for all of the matching devices in a pool.
///Allocation will fail if some devices are already allocated,
///unless adminAccess is requested.
///
///If AllocationMode is not specified, the default mode is ExactCount. If the mode is
///ExactCount and count is not specified, the default count is one. Any other subrequests
///must specify this field.
///
///More modes may get added in the future. Clients must refuse to handle requests with
///unknown modes.
///
///
///Possible enum values:
///- `"All"`
///- `"ExactCount"`
enum AllocationMode {
  @JsonValue('All')
  ALL,
  @JsonValue('ExactCount')
  EXACT_COUNT,
}

final allocationModeValues = EnumValues({
  'All': AllocationMode.ALL,
  'ExactCount': AllocationMode.EXACT_COUNT,
});

@JsonSerializable()
class ExactlyCapacity {
  ///Requests represent individual device resource requests for distinct resources, all of
  ///which must be provided by the device.
  ///
  ///This value is used as an additional filtering condition against the available capacity on
  ///the device. This is semantically equivalent to a CEL selector with
  ///`device.capacity[<domain>].<name>.compareTo(quantity(<request quantity>)) >= 0`. For
  ///example, device.capacity['test-driver.cdi.k8s.io'].counters.compareTo(quantity('2')) >=
  ///0.
  ///
  ///When a requestPolicy is defined, the requested amount is adjusted upward to the nearest
  ///valid value based on the policy. If the requested amount cannot be adjusted to a valid
  ///value—because it exceeds what the requestPolicy allows— the device is considered
  ///ineligible for allocation.
  ///
  ///For any capacity that is not explicitly requested: - If no requestPolicy is set, the
  ///default consumed capacity is equal to the full device capacity
  ///(i.e., the whole device is claimed).
  ///- If a requestPolicy is set, the default consumed capacity is determined according to
  ///that policy.
  ///
  ///If the device allows multiple allocation, the aggregated amount across all requests must
  ///not exceed the capacity value. The consumed capacity, which may be adjusted based on the
  ///requestPolicy if defined, is recorded in the resource claim’s
  ///status.devices[*].consumedCapacity field.
  @JsonKey(name: 'requests')
  Map<String, dynamic>? requests;

  ExactlyCapacity({this.requests});

  factory ExactlyCapacity.fromJson(Map<String, dynamic> json) =>
      _$ExactlyCapacityFromJson(json);

  Map<String, dynamic> toJson() => _$ExactlyCapacityToJson(this);
}

@JsonSerializable()
class ExactlySelector {
  ///CELDeviceSelector contains a CEL expression for selecting a device.
  @JsonKey(name: 'cel')
  PurpleCel? cel;

  ExactlySelector({this.cel});

  factory ExactlySelector.fromJson(Map<String, dynamic> json) =>
      _$ExactlySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ExactlySelectorToJson(this);
}

@JsonSerializable()
class PurpleCel {
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

  PurpleCel({required this.expression});

  factory PurpleCel.fromJson(Map<String, dynamic> json) =>
      _$PurpleCelFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleCelToJson(this);
}

@JsonSerializable()
class ExactlyToleration {
  ///Effect indicates the taint effect to match. Empty means match all taint effects. When
  ///specified, allowed values are NoSchedule and NoExecute.
  ///
  ///
  ///Possible enum values:
  ///- `"NoExecute"` Evict any already-running pods that do not tolerate the device taint.
  ///- `"NoSchedule"` Do not allow new pods to schedule which use a tainted device unless they
  ///tolerate the taint, but allow all pods submitted to Kubelet without going through the
  ///scheduler to start, and allow all already-running pods to continue running.
  ///- `"None"` No effect, the taint is purely informational.
  @JsonKey(name: 'effect')
  Effect? effect;

  ///Key is the taint key that the toleration applies to. Empty means match all taint keys. If
  ///the key is empty, operator must be Exists; this combination means to match all values and
  ///all keys. Must be a label name.
  @JsonKey(name: 'key')
  String? key;

  ///Operator represents a key's relationship to the value. Valid operators are Exists and
  ///Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a
  ///ResourceClaim can tolerate all taints of a particular category.
  ///
  ///
  ///Possible enum values:
  ///- `"Equal"`
  ///- `"Exists"`
  @JsonKey(name: 'operator')
  Operator? tolerationOperator;

  ///TolerationSeconds represents the period of time the toleration (which must be of effect
  ///NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not
  ///set, which means tolerate the taint forever (do not evict). Zero and negative values will
  ///be treated as 0 (evict immediately) by the system. If larger than zero, the time when the
  ///pod needs to be evicted is calculated as <time when taint was adedd> + <toleration
  ///seconds>.
  @JsonKey(name: 'tolerationSeconds')
  int? tolerationSeconds;

  ///Value is the taint value the toleration matches to. If the operator is Exists, the value
  ///must be empty, otherwise just a regular string. Must be a label value.
  @JsonKey(name: 'value')
  String? value;

  ExactlyToleration({
    this.effect,
    this.key,
    this.tolerationOperator,
    this.tolerationSeconds,
    this.value,
  });

  factory ExactlyToleration.fromJson(Map<String, dynamic> json) =>
      _$ExactlyTolerationFromJson(json);

  Map<String, dynamic> toJson() => _$ExactlyTolerationToJson(this);
}

///Effect indicates the taint effect to match. Empty means match all taint effects. When
///specified, allowed values are NoSchedule and NoExecute.
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

///Operator represents a key's relationship to the value. Valid operators are Exists and
///Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a
///ResourceClaim can tolerate all taints of a particular category.
///
///
///Possible enum values:
///- `"Equal"`
///- `"Exists"`
enum Operator {
  @JsonValue('Equal')
  EQUAL,
  @JsonValue('Exists')
  EXISTS,
}

final operatorValues = EnumValues({
  'Equal': Operator.EQUAL,
  'Exists': Operator.EXISTS,
});

@JsonSerializable()
class FirstAvailable {
  ///AllocationMode and its related fields define how devices are allocated to satisfy this
  ///subrequest. Supported values are:
  ///
  ///- ExactCount: This request is for a specific number of devices.
  ///This is the default. The exact number is provided in the
  ///count field.
  ///
  ///- All: This subrequest is for all of the matching devices in a pool.
  ///Allocation will fail if some devices are already allocated,
  ///unless adminAccess is requested.
  ///
  ///If AllocationMode is not specified, the default mode is ExactCount. If the mode is
  ///ExactCount and count is not specified, the default count is one. Any other subrequests
  ///must specify this field.
  ///
  ///More modes may get added in the future. Clients must refuse to handle requests with
  ///unknown modes.
  ///
  ///
  ///Possible enum values:
  ///- `"All"`
  ///- `"ExactCount"`
  @JsonKey(name: 'allocationMode')
  AllocationMode? allocationMode;

  ///CapacityRequirements defines the capacity requirements for a specific device request.
  @JsonKey(name: 'capacity')
  FirstAvailableCapacity? capacity;

  ///Count is used only when the count mode is "ExactCount". Must be greater than zero. If
  ///AllocationMode is ExactCount and this field is not specified, the default is one.
  @JsonKey(name: 'count')
  int? count;

  ///DeviceClassName references a specific DeviceClass, which can define additional
  ///configuration and selectors to be inherited by this subrequest.
  ///
  ///A class is required. Which classes are available depends on the cluster.
  ///
  ///Administrators may use this to restrict which devices may get requested by only
  ///installing classes with selectors for permitted devices. If users are free to request
  ///anything without restrictions, then administrators can create an empty DeviceClass for
  ///users to reference.
  @JsonKey(name: 'deviceClassName')
  String deviceClassName;

  ///Name can be used to reference this subrequest in the list of constraints or the list of
  ///configurations for the claim. References must use the format <main
  ///request>/<subrequest>.
  ///
  ///Must be a DNS label.
  @JsonKey(name: 'name')
  String name;

  ///Selectors define criteria which must be satisfied by a specific device in order for that
  ///device to be considered for this subrequest. All selectors must be satisfied for a device
  ///to be considered.
  @JsonKey(name: 'selectors')
  List<FirstAvailableSelector?>? selectors;

  ///If specified, the request's tolerations.
  ///
  ///Tolerations for NoSchedule are required to allocate a device which has a taint with that
  ///effect. The same applies to NoExecute.
  ///
  ///In addition, should any of the allocated devices get tainted with NoExecute after
  ///allocation and that effect is not tolerated, then all pods consuming the ResourceClaim
  ///get deleted to evict them. The scheduler will not let new pods reserve the claim while it
  ///has these tainted devices. Once all pods are evicted, the claim will get deallocated.
  ///
  ///The maximum number of tolerations is 16.
  ///
  ///This is an alpha field and requires enabling the DRADeviceTaints feature gate.
  @JsonKey(name: 'tolerations')
  List<FirstAvailableToleration?>? tolerations;

  FirstAvailable({
    this.allocationMode,
    this.capacity,
    this.count,
    required this.deviceClassName,
    required this.name,
    this.selectors,
    this.tolerations,
  });

  factory FirstAvailable.fromJson(Map<String, dynamic> json) =>
      _$FirstAvailableFromJson(json);

  Map<String, dynamic> toJson() => _$FirstAvailableToJson(this);
}

@JsonSerializable()
class FirstAvailableCapacity {
  ///Requests represent individual device resource requests for distinct resources, all of
  ///which must be provided by the device.
  ///
  ///This value is used as an additional filtering condition against the available capacity on
  ///the device. This is semantically equivalent to a CEL selector with
  ///`device.capacity[<domain>].<name>.compareTo(quantity(<request quantity>)) >= 0`. For
  ///example, device.capacity['test-driver.cdi.k8s.io'].counters.compareTo(quantity('2')) >=
  ///0.
  ///
  ///When a requestPolicy is defined, the requested amount is adjusted upward to the nearest
  ///valid value based on the policy. If the requested amount cannot be adjusted to a valid
  ///value—because it exceeds what the requestPolicy allows— the device is considered
  ///ineligible for allocation.
  ///
  ///For any capacity that is not explicitly requested: - If no requestPolicy is set, the
  ///default consumed capacity is equal to the full device capacity
  ///(i.e., the whole device is claimed).
  ///- If a requestPolicy is set, the default consumed capacity is determined according to
  ///that policy.
  ///
  ///If the device allows multiple allocation, the aggregated amount across all requests must
  ///not exceed the capacity value. The consumed capacity, which may be adjusted based on the
  ///requestPolicy if defined, is recorded in the resource claim’s
  ///status.devices[*].consumedCapacity field.
  @JsonKey(name: 'requests')
  Map<String, dynamic>? requests;

  FirstAvailableCapacity({this.requests});

  factory FirstAvailableCapacity.fromJson(Map<String, dynamic> json) =>
      _$FirstAvailableCapacityFromJson(json);

  Map<String, dynamic> toJson() => _$FirstAvailableCapacityToJson(this);
}

@JsonSerializable()
class FirstAvailableSelector {
  ///CELDeviceSelector contains a CEL expression for selecting a device.
  @JsonKey(name: 'cel')
  FluffyCel? cel;

  FirstAvailableSelector({this.cel});

  factory FirstAvailableSelector.fromJson(Map<String, dynamic> json) =>
      _$FirstAvailableSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FirstAvailableSelectorToJson(this);
}

@JsonSerializable()
class FluffyCel {
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

  FluffyCel({required this.expression});

  factory FluffyCel.fromJson(Map<String, dynamic> json) =>
      _$FluffyCelFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyCelToJson(this);
}

@JsonSerializable()
class FirstAvailableToleration {
  ///Effect indicates the taint effect to match. Empty means match all taint effects. When
  ///specified, allowed values are NoSchedule and NoExecute.
  ///
  ///
  ///Possible enum values:
  ///- `"NoExecute"` Evict any already-running pods that do not tolerate the device taint.
  ///- `"NoSchedule"` Do not allow new pods to schedule which use a tainted device unless they
  ///tolerate the taint, but allow all pods submitted to Kubelet without going through the
  ///scheduler to start, and allow all already-running pods to continue running.
  ///- `"None"` No effect, the taint is purely informational.
  @JsonKey(name: 'effect')
  Effect? effect;

  ///Key is the taint key that the toleration applies to. Empty means match all taint keys. If
  ///the key is empty, operator must be Exists; this combination means to match all values and
  ///all keys. Must be a label name.
  @JsonKey(name: 'key')
  String? key;

  ///Operator represents a key's relationship to the value. Valid operators are Exists and
  ///Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a
  ///ResourceClaim can tolerate all taints of a particular category.
  ///
  ///
  ///Possible enum values:
  ///- `"Equal"`
  ///- `"Exists"`
  @JsonKey(name: 'operator')
  Operator? tolerationOperator;

  ///TolerationSeconds represents the period of time the toleration (which must be of effect
  ///NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not
  ///set, which means tolerate the taint forever (do not evict). Zero and negative values will
  ///be treated as 0 (evict immediately) by the system. If larger than zero, the time when the
  ///pod needs to be evicted is calculated as <time when taint was adedd> + <toleration
  ///seconds>.
  @JsonKey(name: 'tolerationSeconds')
  int? tolerationSeconds;

  ///Value is the taint value the toleration matches to. If the operator is Exists, the value
  ///must be empty, otherwise just a regular string. Must be a label value.
  @JsonKey(name: 'value')
  String? value;

  FirstAvailableToleration({
    this.effect,
    this.key,
    this.tolerationOperator,
    this.tolerationSeconds,
    this.value,
  });

  factory FirstAvailableToleration.fromJson(Map<String, dynamic> json) =>
      _$FirstAvailableTolerationFromJson(json);

  Map<String, dynamic> toJson() => _$FirstAvailableTolerationToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ResourceclaimtemplatelistResourceV1Kind {
  @JsonValue('ResourceClaimTemplateList')
  RESOURCE_CLAIM_TEMPLATE_LIST,
}

final resourceclaimtemplatelistResourceV1KindValues = EnumValues({
  'ResourceClaimTemplateList':
      ResourceclaimtemplatelistResourceV1Kind.RESOURCE_CLAIM_TEMPLATE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ResourceclaimtemplatelistResourceV1Metadata {
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

  ResourceclaimtemplatelistResourceV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ResourceclaimtemplatelistResourceV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ResourceclaimtemplatelistResourceV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceclaimtemplatelistResourceV1MetadataToJson(this);
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
