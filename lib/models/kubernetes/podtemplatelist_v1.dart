import 'package:json_annotation/json_annotation.dart';

part 'podtemplatelist_v1.g.dart';

///PodTemplateList is a list of PodTemplates.
@JsonSerializable()
class PodtemplatelistV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of pod templates
  @JsonKey(name: 'items')
  List<PodtemplatelistV1Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  PodtemplatelistV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  PodtemplatelistV1Metadata? metadata;

  PodtemplatelistV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory PodtemplatelistV1.fromJson(Map<String, dynamic> json) =>
      _$PodtemplatelistV1FromJson(json);

  Map<String, dynamic> toJson() => _$PodtemplatelistV1ToJson(this);
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
class PodtemplatelistV1Item {
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

  ///PodTemplateSpec describes the data a pod should have when created from a template
  @JsonKey(name: 'template')
  Template? template;

  PodtemplatelistV1Item({
    this.apiVersion,
    this.kind,
    this.metadata,
    this.template,
  });

  factory PodtemplatelistV1Item.fromJson(Map<String, dynamic> json) =>
      _$PodtemplatelistV1ItemFromJson(json);

  Map<String, dynamic> toJson() => _$PodtemplatelistV1ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('PodTemplate')
  POD_TEMPLATE,
}

final itemKindValues = EnumValues({'PodTemplate': ItemKind.POD_TEMPLATE});

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

@JsonSerializable()
class Template {
  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  TemplateMetadata? metadata;

  ///PodSpec is a description of a pod.
  @JsonKey(name: 'spec')
  TemplateSpec? spec;

  Template({this.metadata, this.spec});

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

@JsonSerializable()
class TemplateMetadata {
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

  TemplateMetadata({
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

  factory TemplateMetadata.fromJson(Map<String, dynamic> json) =>
      _$TemplateMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateMetadataToJson(this);
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

@JsonSerializable()
class TemplateSpec {
  ///Optional duration in seconds the pod may be active on the node relative to StartTime
  ///before the system will actively try to mark it failed and kill associated containers.
  ///Value must be a positive integer.
  @JsonKey(name: 'activeDeadlineSeconds')
  int? activeDeadlineSeconds;

  ///Affinity is a group of affinity scheduling rules.
  @JsonKey(name: 'affinity')
  Affinity? affinity;

  ///AutomountServiceAccountToken indicates whether a service account token should be
  ///automatically mounted.
  @JsonKey(name: 'automountServiceAccountToken')
  bool? automountServiceAccountToken;

  ///List of containers belonging to the pod. Containers cannot currently be added or removed.
  ///There must be at least one container in a Pod. Cannot be updated.
  @JsonKey(name: 'containers')
  List<Container?> containers;

  ///PodDNSConfig defines the DNS parameters of a pod in addition to those generated from
  ///DNSPolicy.
  @JsonKey(name: 'dnsConfig')
  DnsConfig? dnsConfig;

  ///Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are
  ///'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in
  ///DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set
  ///along with hostNetwork, you have to specify DNS policy explicitly to
  ///'ClusterFirstWithHostNet'.
  ///
  ///Possible enum values:
  ///- `"ClusterFirst"` indicates that the pod should use cluster DNS first unless hostNetwork
  ///is true, if it is available, then fall back on the default (as determined by kubelet) DNS
  ///settings.
  ///- `"ClusterFirstWithHostNet"` indicates that the pod should use cluster DNS first, if it
  ///is available, then fall back on the default (as determined by kubelet) DNS settings.
  ///- `"Default"` indicates that the pod should use the default (as determined by kubelet)
  ///DNS settings.
  ///- `"None"` indicates that the pod should use empty DNS settings. DNS parameters such as
  ///nameservers and search paths should be defined via DNSConfig.
  @JsonKey(name: 'dnsPolicy')
  DnsPolicy? dnsPolicy;

  ///EnableServiceLinks indicates whether information about services should be injected into
  ///pod's environment variables, matching the syntax of Docker links. Optional: Defaults to
  ///true.
  @JsonKey(name: 'enableServiceLinks')
  bool? enableServiceLinks;

  ///List of ephemeral containers run in this pod. Ephemeral containers may be run in an
  ///existing pod to perform user-initiated actions such as debugging. This list cannot be
  ///specified when creating a pod, and it cannot be modified by updating the pod spec. In
  ///order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers
  ///subresource.
  @JsonKey(name: 'ephemeralContainers')
  List<EphemeralContainer?>? ephemeralContainers;

  ///HostAliases is an optional list of hosts and IPs that will be injected into the pod's
  ///hosts file if specified.
  @JsonKey(name: 'hostAliases')
  List<HostAlias?>? hostAliases;

  ///Use the host's ipc namespace. Optional: Default to false.
  @JsonKey(name: 'hostIPC')
  bool? hostIpc;

  ///Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a
  ///system-defined value.
  @JsonKey(name: 'hostname')
  String? hostname;

  ///HostnameOverride specifies an explicit override for the pod's hostname as perceived by
  ///the pod. This field only specifies the pod's hostname and does not affect its DNS
  ///records. When this field is set to a non-empty string: - It takes precedence over the
  ///values set in `hostname` and `subdomain`. - The Pod's hostname will be set to this value.
  ///- `setHostnameAsFQDN` must be nil or set to false. - `hostNetwork` must be set to false.
  ///
  ///This field must be a valid DNS subdomain as defined in RFC 1123 and contain at most 64
  ///characters. Requires the HostnameOverride feature gate to be enabled.
  @JsonKey(name: 'hostnameOverride')
  String? hostnameOverride;

  ///Host networking requested for this pod. Use the host's network namespace. When using
  ///HostNetwork you should specify ports so the scheduler is aware. When `hostNetwork` is
  ///true, specified `hostPort` fields in port definitions must match `containerPort`, and
  ///unspecified `hostPort` fields in port definitions are defaulted to match `containerPort`.
  ///Default to false.
  @JsonKey(name: 'hostNetwork')
  bool? hostNetwork;

  ///Use the host's pid namespace. Optional: Default to false.
  @JsonKey(name: 'hostPID')
  bool? hostPid;

  ///Use the host's user namespace. Optional: Default to true. If set to true or not present,
  ///the pod will be run in the host user namespace, useful for when the pod needs a feature
  ///only available to the host user namespace, such as loading a kernel module with
  ///CAP_SYS_MODULE. When set to false, a new userns is created for the pod. Setting false is
  ///useful for mitigating container breakout vulnerabilities even allowing users to run their
  ///containers as root without actually having root privileges on the host. This field is
  ///alpha-level and is only honored by servers that enable the UserNamespacesSupport feature.
  @JsonKey(name: 'hostUsers')
  bool? hostUsers;

  ///ImagePullSecrets is an optional list of references to secrets in the same namespace to
  ///use for pulling any of the images used by this PodSpec. If specified, these secrets will
  ///be passed to individual puller implementations for them to use. More info:
  ///https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
  @JsonKey(name: 'imagePullSecrets')
  List<ImagePullSecret?>? imagePullSecrets;

  ///List of initialization containers belonging to the pod. Init containers are executed in
  ///order prior to containers being started. If any init container fails, the pod is
  ///considered to have failed and is handled according to its restartPolicy. The name for an
  ///init container or normal container must be unique among all containers. Init containers
  ///may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The
  ///resourceRequirements of an init container are taken into account during scheduling by
  ///finding the highest request/limit for each resource type, and then using the max of that
  ///value or the sum of the normal containers. Limits are applied to init containers in a
  ///similar fashion. Init containers cannot currently be added or removed. Cannot be updated.
  ///More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  @JsonKey(name: 'initContainers')
  List<InitContainer?>? initContainers;

  ///NodeName indicates in which node this pod is scheduled. If empty, this pod is a candidate
  ///for scheduling by the scheduler defined in schedulerName. Once this field is set, the
  ///kubelet for this node becomes responsible for the lifecycle of this pod. This field
  ///should not be used to express a desire for the pod to be scheduled on a specific node.
  ///https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodename
  @JsonKey(name: 'nodeName')
  String? nodeName;

  ///NodeSelector is a selector which must be true for the pod to fit on a node. Selector
  ///which must match a node's labels for the pod to be scheduled on that node. More info:
  ///https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
  @JsonKey(name: 'nodeSelector')
  Map<String, String?>? nodeSelector;

  ///PodOS defines the OS parameters of a pod.
  @JsonKey(name: 'os')
  Os? os;

  ///Overhead represents the resource overhead associated with running a pod for a given
  ///RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass
  ///admission controller. If the RuntimeClass admission controller is enabled, overhead must
  ///not be set in Pod create requests. The RuntimeClass admission controller will reject Pod
  ///create requests which have the overhead already set. If RuntimeClass is configured and
  ///selected in the PodSpec, Overhead will be set to the value defined in the corresponding
  ///RuntimeClass, otherwise it will remain unset and treated as zero. More info:
  ///https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md
  @JsonKey(name: 'overhead')
  Map<String, dynamic>? overhead;

  ///PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never,
  ///PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
  ///
  ///Possible enum values:
  ///- `"Never"` means that pod never preempts other pods with lower priority.
  ///- `"PreemptLowerPriority"` means that pod can preempt other pods with lower priority.
  @JsonKey(name: 'preemptionPolicy')
  PreemptionPolicy? preemptionPolicy;

  ///The priority value. Various system components use this field to find the priority of the
  ///pod. When Priority Admission Controller is enabled, it prevents users from setting this
  ///field. The admission controller populates this field from PriorityClassName. The higher
  ///the value, the higher the priority.
  @JsonKey(name: 'priority')
  int? priority;

  ///If specified, indicates the pod's priority. "system-node-critical" and
  ///"system-cluster-critical" are two special keywords which indicate the highest priorities
  ///with the former being the highest priority. Any other name must be defined by creating a
  ///PriorityClass object with that name. If not specified, the pod priority will be default
  ///or zero if there is no default.
  @JsonKey(name: 'priorityClassName')
  String? priorityClassName;

  ///If specified, all readiness gates will be evaluated for pod readiness. A pod is ready
  ///when all its containers are ready AND all conditions specified in the readiness gates
  ///have status equal to "True" More info:
  ///https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates
  @JsonKey(name: 'readinessGates')
  List<ReadinessGate?>? readinessGates;

  ///ResourceClaims defines which ResourceClaims must be allocated and reserved before the Pod
  ///is allowed to start. The resources will be made available to those containers which
  ///consume them by name.
  ///
  ///This is a stable field but requires that the DynamicResourceAllocation feature gate is
  ///enabled.
  ///
  ///This field is immutable.
  @JsonKey(name: 'resourceClaims')
  List<ResourceClaim?>? resourceClaims;

  ///ResourceRequirements describes the compute resource requirements.
  @JsonKey(name: 'resources')
  PurpleResources? resources;

  ///Restart policy for all containers within the pod. One of Always, OnFailure, Never. In
  ///some contexts, only a subset of those values may be permitted. Default to Always. More
  ///info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
  ///
  ///Possible enum values:
  ///- `"Always"`
  ///- `"Never"`
  ///- `"OnFailure"`
  @JsonKey(name: 'restartPolicy')
  RestartPolicy? restartPolicy;

  ///RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should
  ///be used to run this pod.  If no RuntimeClass resource matches the named class, the pod
  ///will not be run. If unset or empty, the "legacy" RuntimeClass will be used, which is an
  ///implicit class with an empty definition that uses the default runtime handler. More info:
  ///https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class
  @JsonKey(name: 'runtimeClassName')
  String? runtimeClassName;

  ///If specified, the pod will be dispatched by specified scheduler. If not specified, the
  ///pod will be dispatched by default scheduler.
  @JsonKey(name: 'schedulerName')
  String? schedulerName;

  ///SchedulingGates is an opaque list of values that if specified will block scheduling the
  ///pod. If schedulingGates is not empty, the pod will stay in the SchedulingGated state and
  ///the scheduler will not attempt to schedule the pod.
  ///
  ///SchedulingGates can only be set at pod creation time, and be removed only afterwards.
  @JsonKey(name: 'schedulingGates')
  List<SchedulingGate?>? schedulingGates;

  ///PodSecurityContext holds pod-level security attributes and common container settings.
  ///Some fields are also present in container.securityContext.  Field values of
  ///container.securityContext take precedence over field values of PodSecurityContext.
  @JsonKey(name: 'securityContext')
  SpecSecurityContext? securityContext;

  ///DeprecatedServiceAccount is a deprecated alias for ServiceAccountName. Deprecated: Use
  ///serviceAccountName instead.
  @JsonKey(name: 'serviceAccount')
  String? serviceAccount;

  ///ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info:
  ///https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///If true the pod's hostname will be configured as the pod's FQDN, rather than the leaf
  ///name (the default). In Linux containers, this means setting the FQDN in the hostname
  ///field of the kernel (the nodename field of struct utsname). In Windows containers, this
  ///means setting the registry value of hostname for the registry key
  ///HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters to FQDN. If a
  ///pod does not have FQDN, this has no effect. Default to false.
  @JsonKey(name: 'setHostnameAsFQDN')
  bool? setHostnameAsFqdn;

  ///Share a single process namespace between all of the containers in a pod. When this is set
  ///containers will be able to view and signal processes from other containers in the same
  ///pod, and the first process in each container will not be assigned PID 1. HostPID and
  ///ShareProcessNamespace cannot both be set. Optional: Default to false.
  @JsonKey(name: 'shareProcessNamespace')
  bool? shareProcessNamespace;

  ///If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod
  ///namespace>.svc.<cluster domain>". If not specified, the pod will not have a domainname at
  ///all.
  @JsonKey(name: 'subdomain')
  String? subdomain;

  ///Optional duration in seconds the pod needs to terminate gracefully. May be decreased in
  ///delete request. Value must be non-negative integer. The value zero indicates stop
  ///immediately via the kill signal (no opportunity to shut down). If this value is nil, the
  ///default grace period will be used instead. The grace period is the duration in seconds
  ///after the processes running in the pod are sent a termination signal and the time when
  ///the processes are forcibly halted with a kill signal. Set this value longer than the
  ///expected cleanup time for your process. Defaults to 30 seconds.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///If specified, the pod's tolerations.
  @JsonKey(name: 'tolerations')
  List<Toleration?>? tolerations;

  ///TopologySpreadConstraints describes how a group of pods ought to spread across topology
  ///domains. Scheduler will schedule pods in a way which abides by the constraints. All
  ///topologySpreadConstraints are ANDed.
  @JsonKey(name: 'topologySpreadConstraints')
  List<TopologySpreadConstraint?>? topologySpreadConstraints;

  ///List of volumes that can be mounted by containers belonging to the pod. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes
  @JsonKey(name: 'volumes')
  List<Volume?>? volumes;

  ///WorkloadReference identifies the Workload object and PodGroup membership that a Pod
  ///belongs to. The scheduler uses this information to apply workload-aware scheduling
  ///semantics.
  @JsonKey(name: 'workloadRef')
  WorkloadRef? workloadRef;

  TemplateSpec({
    this.activeDeadlineSeconds,
    this.affinity,
    this.automountServiceAccountToken,
    required this.containers,
    this.dnsConfig,
    this.dnsPolicy,
    this.enableServiceLinks,
    this.ephemeralContainers,
    this.hostAliases,
    this.hostIpc,
    this.hostname,
    this.hostnameOverride,
    this.hostNetwork,
    this.hostPid,
    this.hostUsers,
    this.imagePullSecrets,
    this.initContainers,
    this.nodeName,
    this.nodeSelector,
    this.os,
    this.overhead,
    this.preemptionPolicy,
    this.priority,
    this.priorityClassName,
    this.readinessGates,
    this.resourceClaims,
    this.resources,
    this.restartPolicy,
    this.runtimeClassName,
    this.schedulerName,
    this.schedulingGates,
    this.securityContext,
    this.serviceAccount,
    this.serviceAccountName,
    this.setHostnameAsFqdn,
    this.shareProcessNamespace,
    this.subdomain,
    this.terminationGracePeriodSeconds,
    this.tolerations,
    this.topologySpreadConstraints,
    this.volumes,
    this.workloadRef,
  });

  factory TemplateSpec.fromJson(Map<String, dynamic> json) =>
      _$TemplateSpecFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateSpecToJson(this);
}

@JsonSerializable()
class Affinity {
  ///Node affinity is a group of node affinity scheduling rules.
  @JsonKey(name: 'nodeAffinity')
  NodeAffinity? nodeAffinity;

  ///Pod affinity is a group of inter pod affinity scheduling rules.
  @JsonKey(name: 'podAffinity')
  PodAffinity? podAffinity;

  ///Pod anti affinity is a group of inter pod anti affinity scheduling rules.
  @JsonKey(name: 'podAntiAffinity')
  PodAntiAffinity? podAntiAffinity;

  Affinity({this.nodeAffinity, this.podAffinity, this.podAntiAffinity});

  factory Affinity.fromJson(Map<String, dynamic> json) =>
      _$AffinityFromJson(json);

  Map<String, dynamic> toJson() => _$AffinityToJson(this);
}

@JsonSerializable()
class NodeAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions
  ///specified by this field, but it may choose a node that violates one or more of the
  ///expressions. The node that is most preferred is the one with the greatest sum of weights,
  ///i.e. for each node that meets all of the scheduling requirements (resource request,
  ///requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through
  ///the elements of this field and adding "weight" to the sum if the node matches the
  ///corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///A node selector represents the union of the results of one or more label queries over a
  ///set of nodes; that is, it represents the OR of the selectors represented by the node
  ///selector terms.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution?
  requiredDuringSchedulingIgnoredDuringExecution;

  NodeAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory NodeAffinity.fromJson(Map<String, dynamic> json) =>
      _$NodeAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$NodeAffinityToJson(this);
}

@JsonSerializable()
class NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution {
  ///A null or empty node selector term matches no objects. The requirements of them are
  ///ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.
  @JsonKey(name: 'preference')
  Preference preference;

  ///Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution({
    required this.preference,
    required this.weight,
  });

  factory NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$NodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$NodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///A null or empty node selector term matches no objects. The requirements of them are
///ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.
@JsonSerializable()
class Preference {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<PreferenceMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<PreferenceMatchField?>? matchFields;

  Preference({this.matchExpressions, this.matchFields});

  factory Preference.fromJson(Map<String, dynamic> json) =>
      _$PreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceToJson(this);
}

@JsonSerializable()
class PreferenceMatchExpression {
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
  MatchExpressionOperator matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  PreferenceMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory PreferenceMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$PreferenceMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceMatchExpressionToJson(this);
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
enum MatchExpressionOperator {
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

final matchExpressionOperatorValues = EnumValues({
  'DoesNotExist': MatchExpressionOperator.DOES_NOT_EXIST,
  'Exists': MatchExpressionOperator.EXISTS,
  'Gt': MatchExpressionOperator.GT,
  'In': MatchExpressionOperator.IN,
  'Lt': MatchExpressionOperator.LT,
  'NotIn': MatchExpressionOperator.NOT_IN,
});

@JsonSerializable()
class PreferenceMatchField {
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
  MatchExpressionOperator matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  PreferenceMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory PreferenceMatchField.fromJson(Map<String, dynamic> json) =>
      _$PreferenceMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceMatchFieldToJson(this);
}

@JsonSerializable()
class NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<NodeSelectorTerm?> nodeSelectorTerms;

  NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution({
    required this.nodeSelectorTerms,
  });

  factory NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$NodeAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$NodeAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class NodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<NodeSelectorTermMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<NodeSelectorTermMatchField?>? matchFields;

  NodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory NodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorTermToJson(this);
}

@JsonSerializable()
class NodeSelectorTermMatchExpression {
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
  MatchExpressionOperator matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  NodeSelectorTermMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory NodeSelectorTermMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorTermMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NodeSelectorTermMatchExpressionToJson(this);
}

@JsonSerializable()
class NodeSelectorTermMatchField {
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
  MatchExpressionOperator matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn, the values array must be
  ///non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If
  ///the operator is Gt or Lt, the values array must have a single element, which will be
  ///interpreted as an integer. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  NodeSelectorTermMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory NodeSelectorTermMatchField.fromJson(Map<String, dynamic> json) =>
      _$NodeSelectorTermMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$NodeSelectorTermMatchFieldToJson(this);
}

@JsonSerializable()
class PodAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions
  ///specified by this field, but it may choose a node that violates one or more of the
  ///expressions. The node that is most preferred is the one with the greatest sum of weights,
  ///i.e. for each node that meets all of the scheduling requirements (resource request,
  ///requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through
  ///the elements of this field and adding "weight" to the sum if the node has pods which
  ///matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most
  ///preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<PodAffinityPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the affinity requirements specified by this field are not met at scheduling time, the
  ///pod will not be scheduled onto the node. If the affinity requirements specified by this
  ///field cease to be met at some point during pod execution (e.g. due to a pod label
  ///update), the system may or may not try to eventually evict the pod from its node. When
  ///there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are
  ///intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<PodAffinityRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  PodAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory PodAffinity.fromJson(Map<String, dynamic> json) =>
      _$PodAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PodAffinityToJson(this);
}

@JsonSerializable()
class PodAffinityPreferredDuringSchedulingIgnoredDuringExecution {
  ///Defines a set of pods (namely those matching the labelSelector relative to the given
  ///namespace(s)) that this pod should be co-located (affinity) or not co-located
  ///(anti-affinity) with, where co-located is defined as running on a node whose value of the
  ///label with key <topologyKey> matches that of any node on which a pod of the set of pods
  ///is running
  @JsonKey(name: 'podAffinityTerm')
  PurplePodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm, in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  PodAffinityPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory PodAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$PodAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$PodAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///Defines a set of pods (namely those matching the labelSelector relative to the given
///namespace(s)) that this pod should be co-located (affinity) or not co-located
///(anti-affinity) with, where co-located is defined as running on a node whose value of the
///label with key <topologyKey> matches that of any node on which a pod of the set of pods
///is running
@JsonSerializable()
class PurplePodAffinityTerm {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  PurpleLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key in (value)` to select the group
  ///of existing pods which pods will be taken into consideration for the incoming pod's pod
  ///(anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The
  ///default value is empty. The same key is forbidden to exist in both matchLabelKeys and
  ///labelSelector. Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key notin (value)` to select the
  ///group of existing pods which pods will be taken into consideration for the incoming pod's
  ///pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored.
  ///The default value is empty. The same key is forbidden to exist in both mismatchLabelKeys
  ///and labelSelector. Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to. The term
  ///is applied to the union of the namespaces listed in this field and the ones selected by
  ///namespaceSelector. null or empty namespaces list and null namespaceSelector means "this
  ///pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  PurpleNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching the labelSelector in the specified namespaces, where co-located is defined as
  ///running on a node whose value of the label with key topologyKey matches that of any node
  ///on which any of the selected pods is running. Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  PurplePodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory PurplePodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$PurplePodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePodAffinityTermToJson(this);
}

@JsonSerializable()
class PurpleLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleLabelSelector({this.matchExpressions, this.matchLabels});

  factory PurpleLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleLabelSelectorToJson(this);
}

@JsonSerializable()
class PurpleMatchExpression {
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

  PurpleMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory PurpleMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$PurpleMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMatchExpressionToJson(this);
}

@JsonSerializable()
class PurpleNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory PurpleNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleNamespaceSelectorToJson(this);
}

@JsonSerializable()
class FluffyMatchExpression {
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
class PodAffinityRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  FluffyLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key in (value)` to select the group
  ///of existing pods which pods will be taken into consideration for the incoming pod's pod
  ///(anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The
  ///default value is empty. The same key is forbidden to exist in both matchLabelKeys and
  ///labelSelector. Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key notin (value)` to select the
  ///group of existing pods which pods will be taken into consideration for the incoming pod's
  ///pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored.
  ///The default value is empty. The same key is forbidden to exist in both mismatchLabelKeys
  ///and labelSelector. Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to. The term
  ///is applied to the union of the namespaces listed in this field and the ones selected by
  ///namespaceSelector. null or empty namespaces list and null namespaceSelector means "this
  ///pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  FluffyNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching the labelSelector in the specified namespaces, where co-located is defined as
  ///running on a node whose value of the label with key topologyKey matches that of any node
  ///on which any of the selected pods is running. Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  PodAffinityRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory PodAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PodAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PodAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class FluffyLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<TentacledMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffyLabelSelector({this.matchExpressions, this.matchLabels});

  factory FluffyLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$FluffyLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyLabelSelectorToJson(this);
}

@JsonSerializable()
class TentacledMatchExpression {
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

  TentacledMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory TentacledMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$TentacledMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledMatchExpressionToJson(this);
}

@JsonSerializable()
class FluffyNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<StickyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffyNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory FluffyNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$FluffyNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyNamespaceSelectorToJson(this);
}

@JsonSerializable()
class StickyMatchExpression {
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

  StickyMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory StickyMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$StickyMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$StickyMatchExpressionToJson(this);
}

@JsonSerializable()
class PodAntiAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity
  ///expressions specified by this field, but it may choose a node that violates one or more
  ///of the expressions. The node that is most preferred is the one with the greatest sum of
  ///weights, i.e. for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by
  ///iterating through the elements of this field and subtracting "weight" from the sum if the
  ///node has pods which matches the corresponding podAffinityTerm; the node(s) with the
  ///highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the anti-affinity requirements specified by this field are not met at scheduling time,
  ///the pod will not be scheduled onto the node. If the anti-affinity requirements specified
  ///by this field cease to be met at some point during pod execution (e.g. due to a pod label
  ///update), the system may or may not try to eventually evict the pod from its node. When
  ///there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are
  ///intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  PodAntiAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory PodAntiAffinity.fromJson(Map<String, dynamic> json) =>
      _$PodAntiAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PodAntiAffinityToJson(this);
}

@JsonSerializable()
class PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution {
  ///Defines a set of pods (namely those matching the labelSelector relative to the given
  ///namespace(s)) that this pod should be co-located (affinity) or not co-located
  ///(anti-affinity) with, where co-located is defined as running on a node whose value of the
  ///label with key <topologyKey> matches that of any node on which a pod of the set of pods
  ///is running
  @JsonKey(name: 'podAffinityTerm')
  FluffyPodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm, in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(
        this,
      );
}

///Defines a set of pods (namely those matching the labelSelector relative to the given
///namespace(s)) that this pod should be co-located (affinity) or not co-located
///(anti-affinity) with, where co-located is defined as running on a node whose value of the
///label with key <topologyKey> matches that of any node on which a pod of the set of pods
///is running
@JsonSerializable()
class FluffyPodAffinityTerm {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  TentacledLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key in (value)` to select the group
  ///of existing pods which pods will be taken into consideration for the incoming pod's pod
  ///(anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The
  ///default value is empty. The same key is forbidden to exist in both matchLabelKeys and
  ///labelSelector. Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key notin (value)` to select the
  ///group of existing pods which pods will be taken into consideration for the incoming pod's
  ///pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored.
  ///The default value is empty. The same key is forbidden to exist in both mismatchLabelKeys
  ///and labelSelector. Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to. The term
  ///is applied to the union of the namespaces listed in this field and the ones selected by
  ///namespaceSelector. null or empty namespaces list and null namespaceSelector means "this
  ///pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  TentacledNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching the labelSelector in the specified namespaces, where co-located is defined as
  ///running on a node whose value of the label with key topologyKey matches that of any node
  ///on which any of the selected pods is running. Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  FluffyPodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory FluffyPodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$FluffyPodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPodAffinityTermToJson(this);
}

@JsonSerializable()
class TentacledLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndigoMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledLabelSelector({this.matchExpressions, this.matchLabels});

  factory TentacledLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledLabelSelectorToJson(this);
}

@JsonSerializable()
class IndigoMatchExpression {
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

  IndigoMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory IndigoMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$IndigoMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoMatchExpressionToJson(this);
}

@JsonSerializable()
class TentacledNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndecentMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory TentacledNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledNamespaceSelectorToJson(this);
}

@JsonSerializable()
class IndecentMatchExpression {
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

  IndecentMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory IndecentMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$IndecentMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentMatchExpressionToJson(this);
}

@JsonSerializable()
class PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  StickyLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key in (value)` to select the group
  ///of existing pods which pods will be taken into consideration for the incoming pod's pod
  ///(anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The
  ///default value is empty. The same key is forbidden to exist in both matchLabelKeys and
  ///labelSelector. Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will be taken into
  ///consideration. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are merged with `labelSelector` as `key notin (value)` to select the
  ///group of existing pods which pods will be taken into consideration for the incoming pod's
  ///pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored.
  ///The default value is empty. The same key is forbidden to exist in both mismatchLabelKeys
  ///and labelSelector. Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to. The term
  ///is applied to the union of the namespaces listed in this field and the ones selected by
  ///namespaceSelector. null or empty namespaces list and null namespaceSelector means "this
  ///pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  StickyNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching the labelSelector in the specified namespaces, where co-located is defined as
  ///running on a node whose value of the label with key topologyKey matches that of any node
  ///on which any of the selected pods is running. Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(
        this,
      );
}

@JsonSerializable()
class StickyLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<HilariousMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickyLabelSelector({this.matchExpressions, this.matchLabels});

  factory StickyLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$StickyLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickyLabelSelectorToJson(this);
}

@JsonSerializable()
class HilariousMatchExpression {
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

  HilariousMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory HilariousMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$HilariousMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousMatchExpressionToJson(this);
}

@JsonSerializable()
class StickyNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<AmbitiousMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickyNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory StickyNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$StickyNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickyNamespaceSelectorToJson(this);
}

@JsonSerializable()
class AmbitiousMatchExpression {
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

  AmbitiousMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory AmbitiousMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousMatchExpressionToJson(this);
}

@JsonSerializable()
class Container {
  ///Arguments to the entrypoint. The container image's CMD is used if this is not provided.
  ///Variable references $(VAR_NAME) are expanded using the container's environment. If a
  ///variable cannot be resolved, the reference in the input string will be unchanged. Double
  ///$$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e.
  ///"$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will
  ///never be expanded, regardless of whether the variable exists or not. Cannot be updated.
  ///More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'args')
  List<String?>? args;

  ///Entrypoint array. Not executed within a shell. The container image's ENTRYPOINT is used
  ///if this is not provided. Variable references $(VAR_NAME) are expanded using the
  ///container's environment. If a variable cannot be resolved, the reference in the input
  ///string will be unchanged. Double $$ are reduced to a single $, which allows for escaping
  ///the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal
  ///"$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the
  ///variable exists or not. Cannot be updated. More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'command')
  List<String?>? command;

  ///List of environment variables to set in the container. Cannot be updated.
  @JsonKey(name: 'env')
  List<ContainerEnv?>? env;

  ///List of sources to populate environment variables in the container. The keys defined
  ///within a source may consist of any printable ASCII characters except '='. When a key
  ///exists in multiple sources, the value associated with the last source will take
  ///precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be
  ///updated.
  @JsonKey(name: 'envFrom')
  List<ContainerEnvFrom?>? envFrom;

  ///Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
  ///This field is optional to allow higher level config management to default or override
  ///container images in workload controllers like Deployments and StatefulSets.
  @JsonKey(name: 'image')
  String? image;

  ///Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag
  ///is specified, or IfNotPresent otherwise. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/containers/images#updating-images
  ///
  ///Possible enum values:
  ///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
  ///fail If the pull fails.
  ///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
  ///will fail if the image isn't present and the pull fails.
  ///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
  ///Container will fail if the image isn't present
  @JsonKey(name: 'imagePullPolicy')
  PullPolicy? imagePullPolicy;

  ///Lifecycle describes actions that the management system should take in response to
  ///container lifecycle events. For the PostStart and PreStop lifecycle handlers, management
  ///of the container blocks until the action is complete, unless the container process fails,
  ///in which case the handler is aborted.
  @JsonKey(name: 'lifecycle')
  ContainerLifecycle? lifecycle;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'livenessProbe')
  ContainerLivenessProbe? livenessProbe;

  ///Name of the container specified as a DNS_LABEL. Each container in a pod must have a
  ///unique name (DNS_LABEL). Cannot be updated.
  @JsonKey(name: 'name')
  String name;

  ///List of ports to expose from the container. Not specifying a port here DOES NOT prevent
  ///that port from being exposed. Any port which is listening on the default "0.0.0.0"
  ///address inside a container will be accessible from the network. Modifying this array with
  ///strategic merge patch may corrupt the data. For more information See
  ///https://github.com/kubernetes/kubernetes/issues/108255. Cannot be updated.
  @JsonKey(name: 'ports')
  List<ContainerPort?>? ports;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'readinessProbe')
  ContainerReadinessProbe? readinessProbe;

  ///Resources resize policy for the container. This field cannot be set on ephemeral
  ///containers.
  @JsonKey(name: 'resizePolicy')
  List<ContainerResizePolicy?>? resizePolicy;

  ///ResourceRequirements describes the compute resource requirements.
  @JsonKey(name: 'resources')
  ContainerResources? resources;

  ///RestartPolicy defines the restart behavior of individual containers in a pod. This
  ///overrides the pod-level restart policy. When this field is not specified, the restart
  ///behavior is defined by the Pod's restart policy and the container type. Additionally,
  ///setting the RestartPolicy as "Always" for the init container will have the following
  ///effect: this init container will be continually restarted on exit until all regular
  ///containers have terminated. Once all regular containers have completed, all init
  ///containers with restartPolicy "Always" will be shut down. This lifecycle differs from
  ///normal init containers and is often referred to as a "sidecar" container. Although this
  ///init container still starts in the init container sequence, it does not wait for the
  ///container to complete before proceeding to the next init container. Instead, the next
  ///init container starts immediately after this init container is started, or after any
  ///startupProbe has successfully completed.
  @JsonKey(name: 'restartPolicy')
  String? restartPolicy;

  ///Represents a list of rules to be checked to determine if the container should be
  ///restarted on exit. The rules are evaluated in order. Once a rule matches a container exit
  ///condition, the remaining rules are ignored. If no rule matches the container exit
  ///condition, the Container-level restart policy determines the whether the container is
  ///restarted or not. Constraints on the rules: - At most 20 rules are allowed. - Rules can
  ///have the same action. - Identical rules are not forbidden in validations. When rules are
  ///specified, container MUST set RestartPolicy explicitly even it if matches the Pod's
  ///RestartPolicy.
  @JsonKey(name: 'restartPolicyRules')
  List<ContainerRestartPolicyRule?>? restartPolicyRules;

  ///SecurityContext holds security configuration that will be applied to a container. Some
  ///fields are present in both SecurityContext and PodSecurityContext.  When both are set,
  ///the values in SecurityContext take precedence.
  @JsonKey(name: 'securityContext')
  ContainerSecurityContext? securityContext;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'startupProbe')
  ContainerStartupProbe? startupProbe;

  ///Whether this container should allocate a buffer for stdin in the container runtime. If
  ///this is not set, reads from stdin in the container will always result in EOF. Default is
  ///false.
  @JsonKey(name: 'stdin')
  bool? stdin;

  ///Whether the container runtime should close the stdin channel after it has been opened by
  ///a single attach. When stdin is true the stdin stream will remain open across multiple
  ///attach sessions. If stdinOnce is set to true, stdin is opened on container start, is
  ///empty until the first client attaches to stdin, and then remains open and accepts data
  ///until the client disconnects, at which time stdin is closed and remains closed until the
  ///container is restarted. If this flag is false, a container processes that reads from
  ///stdin will never receive an EOF. Default is false
  @JsonKey(name: 'stdinOnce')
  bool? stdinOnce;

  ///Optional: Path at which the file to which the container's termination message will be
  ///written is mounted into the container's filesystem. Message written is intended to be
  ///brief final status, such as an assertion failure message. Will be truncated by the node
  ///if greater than 4096 bytes. The total message length across all containers will be
  ///limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
  @JsonKey(name: 'terminationMessagePath')
  String? terminationMessagePath;

  ///Indicate how the termination message should be populated. File will use the contents of
  ///terminationMessagePath to populate the container status message on both success and
  ///failure. FallbackToLogsOnError will use the last chunk of container log output if the
  ///termination message file is empty and the container exited with an error. The log output
  ///is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be
  ///updated.
  ///
  ///Possible enum values:
  ///- `"FallbackToLogsOnError"` will read the most recent contents of the container logs for
  ///the container status message when the container exits with an error and the
  ///terminationMessagePath has no contents.
  ///- `"File"` is the default behavior and will set the container status message to the
  ///contents of the container's terminationMessagePath when the container exits.
  @JsonKey(name: 'terminationMessagePolicy')
  TerminationMessagePolicy? terminationMessagePolicy;

  ///Whether this container should allocate a TTY for itself, also requires 'stdin' to be
  ///true. Default is false.
  @JsonKey(name: 'tty')
  bool? tty;

  ///volumeDevices is the list of block devices to be used by the container.
  @JsonKey(name: 'volumeDevices')
  List<ContainerVolumeDevice?>? volumeDevices;

  ///Pod volumes to mount into the container's filesystem. Cannot be updated.
  @JsonKey(name: 'volumeMounts')
  List<ContainerVolumeMount?>? volumeMounts;

  ///Container's working directory. If not specified, the container runtime's default will be
  ///used, which might be configured in the container image. Cannot be updated.
  @JsonKey(name: 'workingDir')
  String? workingDir;

  Container({
    this.args,
    this.command,
    this.env,
    this.envFrom,
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports,
    this.readinessProbe,
    this.resizePolicy,
    this.resources,
    this.restartPolicy,
    this.restartPolicyRules,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices,
    this.volumeMounts,
    this.workingDir,
  });

  factory Container.fromJson(Map<String, dynamic> json) =>
      _$ContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}

@JsonSerializable()
class ContainerEnv {
  ///Name of the environment variable. May consist of any printable ASCII characters except
  ///'='.
  @JsonKey(name: 'name')
  String name;

  ///Variable references $(VAR_NAME) are expanded using the previously defined environment
  ///variables in the container and any service environment variables. If a variable cannot be
  ///resolved, the reference in the input string will be unchanged. Double $$ are reduced to a
  ///single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will
  ///produce the string literal "$(VAR_NAME)". Escaped references will never be expanded,
  ///regardless of whether the variable exists or not. Defaults to "".
  @JsonKey(name: 'value')
  String? value;

  ///EnvVarSource represents a source for the value of an EnvVar.
  @JsonKey(name: 'valueFrom')
  PurpleValueFrom? valueFrom;

  ContainerEnv({required this.name, this.value, this.valueFrom});

  factory ContainerEnv.fromJson(Map<String, dynamic> json) =>
      _$ContainerEnvFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerEnvToJson(this);
}

@JsonSerializable()
class PurpleValueFrom {
  ///Selects a key from a ConfigMap.
  @JsonKey(name: 'configMapKeyRef')
  PurpleConfigMapKeyRef? configMapKeyRef;

  ///ObjectFieldSelector selects an APIVersioned field of an object.
  @JsonKey(name: 'fieldRef')
  PurpleFieldRef? fieldRef;

  ///FileKeySelector selects a key of the env file.
  @JsonKey(name: 'fileKeyRef')
  PurpleFileKeyRef? fileKeyRef;

  ///ResourceFieldSelector represents container resources (cpu, memory) and their output format
  @JsonKey(name: 'resourceFieldRef')
  PurpleResourceFieldRef? resourceFieldRef;

  ///SecretKeySelector selects a key of a Secret.
  @JsonKey(name: 'secretKeyRef')
  PurpleSecretKeyRef? secretKeyRef;

  PurpleValueFrom({
    this.configMapKeyRef,
    this.fieldRef,
    this.fileKeyRef,
    this.resourceFieldRef,
    this.secretKeyRef,
  });

  factory PurpleValueFrom.fromJson(Map<String, dynamic> json) =>
      _$PurpleValueFromFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleValueFromToJson(this);
}

@JsonSerializable()
class PurpleConfigMapKeyRef {
  ///The key to select.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  PurpleConfigMapKeyRef({required this.key, this.name, this.optional});

  factory PurpleConfigMapKeyRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleConfigMapKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleConfigMapKeyRefToJson(this);
}

@JsonSerializable()
class PurpleFieldRef {
  ///Version of the schema the FieldPath is written in terms of, defaults to "v1".
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Path of the field to select in the specified API version.
  @JsonKey(name: 'fieldPath')
  String fieldPath;

  PurpleFieldRef({this.apiVersion, required this.fieldPath});

  factory PurpleFieldRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFieldRefToJson(this);
}

@JsonSerializable()
class PurpleFileKeyRef {
  ///The key within the env file. An invalid key will prevent the pod from starting. The keys
  ///defined within a source may consist of any printable ASCII characters except '='. During
  ///Alpha stage of the EnvFiles feature gate, the key size is limited to 128 characters.
  @JsonKey(name: 'key')
  String key;

  ///Specify whether the file or its key must be defined. If the file or key does not exist,
  ///then the env var is not published. If optional is set to true and the specified key does
  ///not exist, the environment variable will not be set in the Pod's containers.
  ///
  ///If optional is set to false and the specified key does not exist, an error will be
  ///returned during Pod creation.
  @JsonKey(name: 'optional')
  bool? optional;

  ///The path within the volume from which to select the file. Must be relative and may not
  ///contain the '..' path or start with '..'.
  @JsonKey(name: 'path')
  String path;

  ///The name of the volume mount containing the env file.
  @JsonKey(name: 'volumeName')
  String volumeName;

  PurpleFileKeyRef({
    required this.key,
    this.optional,
    required this.path,
    required this.volumeName,
  });

  factory PurpleFileKeyRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleFileKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFileKeyRefToJson(this);
}

@JsonSerializable()
class PurpleResourceFieldRef {
  ///Container name: required for volumes, optional for env vars
  @JsonKey(name: 'containerName')
  String? containerName;
  @JsonKey(name: 'divisor')
  dynamic divisor;

  ///Required: resource to select
  @JsonKey(name: 'resource')
  String resource;

  PurpleResourceFieldRef({
    this.containerName,
    this.divisor,
    required this.resource,
  });

  factory PurpleResourceFieldRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleResourceFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleResourceFieldRefToJson(this);
}

@JsonSerializable()
class PurpleSecretKeyRef {
  ///The key of the secret to select from.  Must be a valid secret key.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  PurpleSecretKeyRef({required this.key, this.name, this.optional});

  factory PurpleSecretKeyRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleSecretKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSecretKeyRefToJson(this);
}

@JsonSerializable()
class ContainerEnvFrom {
  ///ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
  ///
  ///The contents of the target ConfigMap's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'configMapRef')
  PurpleConfigMapRef? configMapRef;

  ///Optional text to prepend to the name of each environment variable. May consist of any
  ///printable ASCII characters except '='.
  @JsonKey(name: 'prefix')
  String? prefix;

  ///SecretEnvSource selects a Secret to populate the environment variables with.
  ///
  ///The contents of the target Secret's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'secretRef')
  PurpleSecretRef? secretRef;

  ContainerEnvFrom({this.configMapRef, this.prefix, this.secretRef});

  factory ContainerEnvFrom.fromJson(Map<String, dynamic> json) =>
      _$ContainerEnvFromFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerEnvFromToJson(this);
}

@JsonSerializable()
class PurpleConfigMapRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  PurpleConfigMapRef({this.name, this.optional});

  factory PurpleConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleConfigMapRefToJson(this);
}

@JsonSerializable()
class PurpleSecretRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  PurpleSecretRef({this.name, this.optional});

  factory PurpleSecretRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSecretRefToJson(this);
}

///Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag
///is specified, or IfNotPresent otherwise. Cannot be updated. More info:
///https://kubernetes.io/docs/concepts/containers/images#updating-images
///
///Possible enum values:
///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
///fail If the pull fails.
///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
///will fail if the image isn't present and the pull fails.
///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
///Container will fail if the image isn't present
///
///Policy for pulling OCI objects. Possible values are: Always: the kubelet always attempts
///to pull the reference. Container creation will fail If the pull fails. Never: the kubelet
///never pulls the reference and only uses a local image or artifact. Container creation
///will fail if the reference isn't present. IfNotPresent: the kubelet pulls if the
///reference isn't already present on disk. Container creation will fail if the reference
///isn't present and the pull fails. Defaults to Always if :latest tag is specified, or
///IfNotPresent otherwise.
///
///Possible enum values:
///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
///fail If the pull fails.
///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
///will fail if the image isn't present and the pull fails.
///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
///Container will fail if the image isn't present
enum PullPolicy {
  @JsonValue('Always')
  ALWAYS,
  @JsonValue('IfNotPresent')
  IF_NOT_PRESENT,
  @JsonValue('Never')
  NEVER,
}

final pullPolicyValues = EnumValues({
  'Always': PullPolicy.ALWAYS,
  'IfNotPresent': PullPolicy.IF_NOT_PRESENT,
  'Never': PullPolicy.NEVER,
});

@JsonSerializable()
class ContainerLifecycle {
  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'postStart')
  PurplePostStart? postStart;

  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'preStop')
  PurplePreStop? preStop;

  ///StopSignal defines which signal will be sent to a container when it is being stopped. If
  ///not specified, the default is defined by the container runtime in use. StopSignal can
  ///only be set for Pods with a non-empty .spec.os.name
  ///
  ///Possible enum values:
  ///- `"SIGABRT"`
  ///- `"SIGALRM"`
  ///- `"SIGBUS"`
  ///- `"SIGCHLD"`
  ///- `"SIGCLD"`
  ///- `"SIGCONT"`
  ///- `"SIGFPE"`
  ///- `"SIGHUP"`
  ///- `"SIGILL"`
  ///- `"SIGINT"`
  ///- `"SIGIO"`
  ///- `"SIGIOT"`
  ///- `"SIGKILL"`
  ///- `"SIGPIPE"`
  ///- `"SIGPOLL"`
  ///- `"SIGPROF"`
  ///- `"SIGPWR"`
  ///- `"SIGQUIT"`
  ///- `"SIGRTMAX"`
  ///- `"SIGRTMAX-1"`
  ///- `"SIGRTMAX-10"`
  ///- `"SIGRTMAX-11"`
  ///- `"SIGRTMAX-12"`
  ///- `"SIGRTMAX-13"`
  ///- `"SIGRTMAX-14"`
  ///- `"SIGRTMAX-2"`
  ///- `"SIGRTMAX-3"`
  ///- `"SIGRTMAX-4"`
  ///- `"SIGRTMAX-5"`
  ///- `"SIGRTMAX-6"`
  ///- `"SIGRTMAX-7"`
  ///- `"SIGRTMAX-8"`
  ///- `"SIGRTMAX-9"`
  ///- `"SIGRTMIN"`
  ///- `"SIGRTMIN+1"`
  ///- `"SIGRTMIN+10"`
  ///- `"SIGRTMIN+11"`
  ///- `"SIGRTMIN+12"`
  ///- `"SIGRTMIN+13"`
  ///- `"SIGRTMIN+14"`
  ///- `"SIGRTMIN+15"`
  ///- `"SIGRTMIN+2"`
  ///- `"SIGRTMIN+3"`
  ///- `"SIGRTMIN+4"`
  ///- `"SIGRTMIN+5"`
  ///- `"SIGRTMIN+6"`
  ///- `"SIGRTMIN+7"`
  ///- `"SIGRTMIN+8"`
  ///- `"SIGRTMIN+9"`
  ///- `"SIGSEGV"`
  ///- `"SIGSTKFLT"`
  ///- `"SIGSTOP"`
  ///- `"SIGSYS"`
  ///- `"SIGTERM"`
  ///- `"SIGTRAP"`
  ///- `"SIGTSTP"`
  ///- `"SIGTTIN"`
  ///- `"SIGTTOU"`
  ///- `"SIGURG"`
  ///- `"SIGUSR1"`
  ///- `"SIGUSR2"`
  ///- `"SIGVTALRM"`
  ///- `"SIGWINCH"`
  ///- `"SIGXCPU"`
  ///- `"SIGXFSZ"`
  @JsonKey(name: 'stopSignal')
  StopSignal? stopSignal;

  ContainerLifecycle({this.postStart, this.preStop, this.stopSignal});

  factory ContainerLifecycle.fromJson(Map<String, dynamic> json) =>
      _$ContainerLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerLifecycleToJson(this);
}

@JsonSerializable()
class PurplePostStart {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  PurpleExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  PurpleHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  PurpleSleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  PurpleTcpSocket? tcpSocket;

  PurplePostStart({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory PurplePostStart.fromJson(Map<String, dynamic> json) =>
      _$PurplePostStartFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePostStartToJson(this);
}

@JsonSerializable()
class PurpleExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  PurpleExec({this.command});

  factory PurpleExec.fromJson(Map<String, dynamic> json) =>
      _$PurpleExecFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleExecToJson(this);
}

@JsonSerializable()
class PurpleHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<PurpleHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  PurpleHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory PurpleHttpGet.fromJson(Map<String, dynamic> json) =>
      _$PurpleHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHttpGetToJson(this);
}

@JsonSerializable()
class PurpleHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  PurpleHttpHeader({required this.name, required this.value});

  factory PurpleHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$PurpleHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHttpHeaderToJson(this);
}

///Scheme to use for connecting to the host. Defaults to HTTP.
///
///Possible enum values:
///- `"HTTP"` means that the scheme used will be http://
///- `"HTTPS"` means that the scheme used will be https://
enum Scheme {
  @JsonValue('HTTP')
  HTTP,
  @JsonValue('HTTPS')
  HTTPS,
}

final schemeValues = EnumValues({'HTTP': Scheme.HTTP, 'HTTPS': Scheme.HTTPS});

@JsonSerializable()
class PurpleSleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  PurpleSleep({required this.seconds});

  factory PurpleSleep.fromJson(Map<String, dynamic> json) =>
      _$PurpleSleepFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSleepToJson(this);
}

@JsonSerializable()
class PurpleTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  PurpleTcpSocket({this.host, required this.port});

  factory PurpleTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$PurpleTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTcpSocketToJson(this);
}

@JsonSerializable()
class PurplePreStop {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  FluffyExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  FluffyHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  FluffySleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  FluffyTcpSocket? tcpSocket;

  PurplePreStop({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory PurplePreStop.fromJson(Map<String, dynamic> json) =>
      _$PurplePreStopFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePreStopToJson(this);
}

@JsonSerializable()
class FluffyExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  FluffyExec({this.command});

  factory FluffyExec.fromJson(Map<String, dynamic> json) =>
      _$FluffyExecFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyExecToJson(this);
}

@JsonSerializable()
class FluffyHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<FluffyHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  FluffyHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory FluffyHttpGet.fromJson(Map<String, dynamic> json) =>
      _$FluffyHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHttpGetToJson(this);
}

@JsonSerializable()
class FluffyHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  FluffyHttpHeader({required this.name, required this.value});

  factory FluffyHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$FluffyHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHttpHeaderToJson(this);
}

@JsonSerializable()
class FluffySleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  FluffySleep({required this.seconds});

  factory FluffySleep.fromJson(Map<String, dynamic> json) =>
      _$FluffySleepFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySleepToJson(this);
}

@JsonSerializable()
class FluffyTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  FluffyTcpSocket({this.host, required this.port});

  factory FluffyTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$FluffyTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTcpSocketToJson(this);
}

///StopSignal defines which signal will be sent to a container when it is being stopped. If
///not specified, the default is defined by the container runtime in use. StopSignal can
///only be set for Pods with a non-empty .spec.os.name
///
///Possible enum values:
///- `"SIGABRT"`
///- `"SIGALRM"`
///- `"SIGBUS"`
///- `"SIGCHLD"`
///- `"SIGCLD"`
///- `"SIGCONT"`
///- `"SIGFPE"`
///- `"SIGHUP"`
///- `"SIGILL"`
///- `"SIGINT"`
///- `"SIGIO"`
///- `"SIGIOT"`
///- `"SIGKILL"`
///- `"SIGPIPE"`
///- `"SIGPOLL"`
///- `"SIGPROF"`
///- `"SIGPWR"`
///- `"SIGQUIT"`
///- `"SIGRTMAX"`
///- `"SIGRTMAX-1"`
///- `"SIGRTMAX-10"`
///- `"SIGRTMAX-11"`
///- `"SIGRTMAX-12"`
///- `"SIGRTMAX-13"`
///- `"SIGRTMAX-14"`
///- `"SIGRTMAX-2"`
///- `"SIGRTMAX-3"`
///- `"SIGRTMAX-4"`
///- `"SIGRTMAX-5"`
///- `"SIGRTMAX-6"`
///- `"SIGRTMAX-7"`
///- `"SIGRTMAX-8"`
///- `"SIGRTMAX-9"`
///- `"SIGRTMIN"`
///- `"SIGRTMIN+1"`
///- `"SIGRTMIN+10"`
///- `"SIGRTMIN+11"`
///- `"SIGRTMIN+12"`
///- `"SIGRTMIN+13"`
///- `"SIGRTMIN+14"`
///- `"SIGRTMIN+15"`
///- `"SIGRTMIN+2"`
///- `"SIGRTMIN+3"`
///- `"SIGRTMIN+4"`
///- `"SIGRTMIN+5"`
///- `"SIGRTMIN+6"`
///- `"SIGRTMIN+7"`
///- `"SIGRTMIN+8"`
///- `"SIGRTMIN+9"`
///- `"SIGSEGV"`
///- `"SIGSTKFLT"`
///- `"SIGSTOP"`
///- `"SIGSYS"`
///- `"SIGTERM"`
///- `"SIGTRAP"`
///- `"SIGTSTP"`
///- `"SIGTTIN"`
///- `"SIGTTOU"`
///- `"SIGURG"`
///- `"SIGUSR1"`
///- `"SIGUSR2"`
///- `"SIGVTALRM"`
///- `"SIGWINCH"`
///- `"SIGXCPU"`
///- `"SIGXFSZ"`
enum StopSignal {
  @JsonValue('SIGABRT')
  SIGABRT,
  @JsonValue('SIGALRM')
  SIGALRM,
  @JsonValue('SIGBUS')
  SIGBUS,
  @JsonValue('SIGCHLD')
  SIGCHLD,
  @JsonValue('SIGCLD')
  SIGCLD,
  @JsonValue('SIGCONT')
  SIGCONT,
  @JsonValue('SIGFPE')
  SIGFPE,
  @JsonValue('SIGHUP')
  SIGHUP,
  @JsonValue('SIGILL')
  SIGILL,
  @JsonValue('SIGINT')
  SIGINT,
  @JsonValue('SIGIO')
  SIGIO,
  @JsonValue('SIGIOT')
  SIGIOT,
  @JsonValue('SIGKILL')
  SIGKILL,
  @JsonValue('SIGPIPE')
  SIGPIPE,
  @JsonValue('SIGPOLL')
  SIGPOLL,
  @JsonValue('SIGPROF')
  SIGPROF,
  @JsonValue('SIGPWR')
  SIGPWR,
  @JsonValue('SIGQUIT')
  SIGQUIT,
  @JsonValue('SIGRTMAX')
  SIGRTMAX,
  @JsonValue('SIGRTMAX-1')
  SIGRTMAX_1,
  @JsonValue('SIGRTMAX-10')
  SIGRTMAX_10,
  @JsonValue('SIGRTMAX-11')
  SIGRTMAX_11,
  @JsonValue('SIGRTMAX-12')
  SIGRTMAX_12,
  @JsonValue('SIGRTMAX-13')
  SIGRTMAX_13,
  @JsonValue('SIGRTMAX-14')
  SIGRTMAX_14,
  @JsonValue('SIGRTMAX-2')
  SIGRTMAX_2,
  @JsonValue('SIGRTMAX-3')
  SIGRTMAX_3,
  @JsonValue('SIGRTMAX-4')
  SIGRTMAX_4,
  @JsonValue('SIGRTMAX-5')
  SIGRTMAX_5,
  @JsonValue('SIGRTMAX-6')
  SIGRTMAX_6,
  @JsonValue('SIGRTMAX-7')
  SIGRTMAX_7,
  @JsonValue('SIGRTMAX-8')
  SIGRTMAX_8,
  @JsonValue('SIGRTMAX-9')
  SIGRTMAX_9,
  @JsonValue('SIGRTMIN')
  SIGRTMIN,
  @JsonValue('SIGRTMIN+1')
  SIGRTMIN_1,
  @JsonValue('SIGRTMIN+10')
  SIGRTMIN_10,
  @JsonValue('SIGRTMIN+11')
  SIGRTMIN_11,
  @JsonValue('SIGRTMIN+12')
  SIGRTMIN_12,
  @JsonValue('SIGRTMIN+13')
  SIGRTMIN_13,
  @JsonValue('SIGRTMIN+14')
  SIGRTMIN_14,
  @JsonValue('SIGRTMIN+15')
  SIGRTMIN_15,
  @JsonValue('SIGRTMIN+2')
  SIGRTMIN_2,
  @JsonValue('SIGRTMIN+3')
  SIGRTMIN_3,
  @JsonValue('SIGRTMIN+4')
  SIGRTMIN_4,
  @JsonValue('SIGRTMIN+5')
  SIGRTMIN_5,
  @JsonValue('SIGRTMIN+6')
  SIGRTMIN_6,
  @JsonValue('SIGRTMIN+7')
  SIGRTMIN_7,
  @JsonValue('SIGRTMIN+8')
  SIGRTMIN_8,
  @JsonValue('SIGRTMIN+9')
  SIGRTMIN_9,
  @JsonValue('SIGSEGV')
  SIGSEGV,
  @JsonValue('SIGSTKFLT')
  SIGSTKFLT,
  @JsonValue('SIGSTOP')
  SIGSTOP,
  @JsonValue('SIGSYS')
  SIGSYS,
  @JsonValue('SIGTERM')
  SIGTERM,
  @JsonValue('SIGTRAP')
  SIGTRAP,
  @JsonValue('SIGTSTP')
  SIGTSTP,
  @JsonValue('SIGTTIN')
  SIGTTIN,
  @JsonValue('SIGTTOU')
  SIGTTOU,
  @JsonValue('SIGURG')
  SIGURG,
  @JsonValue('SIGUSR1')
  SIGUSR1,
  @JsonValue('SIGUSR2')
  SIGUSR2,
  @JsonValue('SIGVTALRM')
  SIGVTALRM,
  @JsonValue('SIGWINCH')
  SIGWINCH,
  @JsonValue('SIGXCPU')
  SIGXCPU,
  @JsonValue('SIGXFSZ')
  SIGXFSZ,
}

final stopSignalValues = EnumValues({
  'SIGABRT': StopSignal.SIGABRT,
  'SIGALRM': StopSignal.SIGALRM,
  'SIGBUS': StopSignal.SIGBUS,
  'SIGCHLD': StopSignal.SIGCHLD,
  'SIGCLD': StopSignal.SIGCLD,
  'SIGCONT': StopSignal.SIGCONT,
  'SIGFPE': StopSignal.SIGFPE,
  'SIGHUP': StopSignal.SIGHUP,
  'SIGILL': StopSignal.SIGILL,
  'SIGINT': StopSignal.SIGINT,
  'SIGIO': StopSignal.SIGIO,
  'SIGIOT': StopSignal.SIGIOT,
  'SIGKILL': StopSignal.SIGKILL,
  'SIGPIPE': StopSignal.SIGPIPE,
  'SIGPOLL': StopSignal.SIGPOLL,
  'SIGPROF': StopSignal.SIGPROF,
  'SIGPWR': StopSignal.SIGPWR,
  'SIGQUIT': StopSignal.SIGQUIT,
  'SIGRTMAX': StopSignal.SIGRTMAX,
  'SIGRTMAX-1': StopSignal.SIGRTMAX_1,
  'SIGRTMAX-10': StopSignal.SIGRTMAX_10,
  'SIGRTMAX-11': StopSignal.SIGRTMAX_11,
  'SIGRTMAX-12': StopSignal.SIGRTMAX_12,
  'SIGRTMAX-13': StopSignal.SIGRTMAX_13,
  'SIGRTMAX-14': StopSignal.SIGRTMAX_14,
  'SIGRTMAX-2': StopSignal.SIGRTMAX_2,
  'SIGRTMAX-3': StopSignal.SIGRTMAX_3,
  'SIGRTMAX-4': StopSignal.SIGRTMAX_4,
  'SIGRTMAX-5': StopSignal.SIGRTMAX_5,
  'SIGRTMAX-6': StopSignal.SIGRTMAX_6,
  'SIGRTMAX-7': StopSignal.SIGRTMAX_7,
  'SIGRTMAX-8': StopSignal.SIGRTMAX_8,
  'SIGRTMAX-9': StopSignal.SIGRTMAX_9,
  'SIGRTMIN': StopSignal.SIGRTMIN,
  'SIGRTMIN+1': StopSignal.SIGRTMIN_1,
  'SIGRTMIN+10': StopSignal.SIGRTMIN_10,
  'SIGRTMIN+11': StopSignal.SIGRTMIN_11,
  'SIGRTMIN+12': StopSignal.SIGRTMIN_12,
  'SIGRTMIN+13': StopSignal.SIGRTMIN_13,
  'SIGRTMIN+14': StopSignal.SIGRTMIN_14,
  'SIGRTMIN+15': StopSignal.SIGRTMIN_15,
  'SIGRTMIN+2': StopSignal.SIGRTMIN_2,
  'SIGRTMIN+3': StopSignal.SIGRTMIN_3,
  'SIGRTMIN+4': StopSignal.SIGRTMIN_4,
  'SIGRTMIN+5': StopSignal.SIGRTMIN_5,
  'SIGRTMIN+6': StopSignal.SIGRTMIN_6,
  'SIGRTMIN+7': StopSignal.SIGRTMIN_7,
  'SIGRTMIN+8': StopSignal.SIGRTMIN_8,
  'SIGRTMIN+9': StopSignal.SIGRTMIN_9,
  'SIGSEGV': StopSignal.SIGSEGV,
  'SIGSTKFLT': StopSignal.SIGSTKFLT,
  'SIGSTOP': StopSignal.SIGSTOP,
  'SIGSYS': StopSignal.SIGSYS,
  'SIGTERM': StopSignal.SIGTERM,
  'SIGTRAP': StopSignal.SIGTRAP,
  'SIGTSTP': StopSignal.SIGTSTP,
  'SIGTTIN': StopSignal.SIGTTIN,
  'SIGTTOU': StopSignal.SIGTTOU,
  'SIGURG': StopSignal.SIGURG,
  'SIGUSR1': StopSignal.SIGUSR1,
  'SIGUSR2': StopSignal.SIGUSR2,
  'SIGVTALRM': StopSignal.SIGVTALRM,
  'SIGWINCH': StopSignal.SIGWINCH,
  'SIGXCPU': StopSignal.SIGXCPU,
  'SIGXFSZ': StopSignal.SIGXFSZ,
});

@JsonSerializable()
class ContainerLivenessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  TentacledExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  PurpleGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  TentacledHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  TentacledTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  ContainerLivenessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory ContainerLivenessProbe.fromJson(Map<String, dynamic> json) =>
      _$ContainerLivenessProbeFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerLivenessProbeToJson(this);
}

@JsonSerializable()
class TentacledExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  TentacledExec({this.command});

  factory TentacledExec.fromJson(Map<String, dynamic> json) =>
      _$TentacledExecFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledExecToJson(this);
}

@JsonSerializable()
class PurpleGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  PurpleGrpc({required this.port, this.service});

  factory PurpleGrpc.fromJson(Map<String, dynamic> json) =>
      _$PurpleGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleGrpcToJson(this);
}

@JsonSerializable()
class TentacledHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<TentacledHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  TentacledHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory TentacledHttpGet.fromJson(Map<String, dynamic> json) =>
      _$TentacledHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledHttpGetToJson(this);
}

@JsonSerializable()
class TentacledHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  TentacledHttpHeader({required this.name, required this.value});

  factory TentacledHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$TentacledHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledHttpHeaderToJson(this);
}

@JsonSerializable()
class TentacledTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  TentacledTcpSocket({this.host, required this.port});

  factory TentacledTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$TentacledTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTcpSocketToJson(this);
}

@JsonSerializable()
class ContainerPort {
  ///Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x
  ///< 65536.
  @JsonKey(name: 'containerPort')
  int containerPort;

  ///What host IP to bind the external port to.
  @JsonKey(name: 'hostIP')
  String? hostIp;

  ///Number of port to expose on the host. If specified, this must be a valid port number, 0 <
  ///x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do
  ///not need this.
  @JsonKey(name: 'hostPort')
  int? hostPort;

  ///If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in
  ///a pod must have a unique name. Name for the port that can be referred to by services.
  @JsonKey(name: 'name')
  String? name;

  ///Protocol for port. Must be UDP, TCP, or SCTP. Defaults to "TCP".
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  ContainerPort({
    required this.containerPort,
    this.hostIp,
    this.hostPort,
    this.name,
    this.protocol,
  });

  factory ContainerPort.fromJson(Map<String, dynamic> json) =>
      _$ContainerPortFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPortToJson(this);
}

///Protocol for port. Must be UDP, TCP, or SCTP. Defaults to "TCP".
///
///Possible enum values:
///- `"SCTP"` is the SCTP protocol.
///- `"TCP"` is the TCP protocol.
///- `"UDP"` is the UDP protocol.
enum Protocol {
  @JsonValue('SCTP')
  SCTP,
  @JsonValue('TCP')
  TCP,
  @JsonValue('UDP')
  UDP,
}

final protocolValues = EnumValues({
  'SCTP': Protocol.SCTP,
  'TCP': Protocol.TCP,
  'UDP': Protocol.UDP,
});

@JsonSerializable()
class ContainerReadinessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  StickyExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  FluffyGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  StickyHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  StickyTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  ContainerReadinessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory ContainerReadinessProbe.fromJson(Map<String, dynamic> json) =>
      _$ContainerReadinessProbeFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerReadinessProbeToJson(this);
}

@JsonSerializable()
class StickyExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  StickyExec({this.command});

  factory StickyExec.fromJson(Map<String, dynamic> json) =>
      _$StickyExecFromJson(json);

  Map<String, dynamic> toJson() => _$StickyExecToJson(this);
}

@JsonSerializable()
class FluffyGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  FluffyGrpc({required this.port, this.service});

  factory FluffyGrpc.fromJson(Map<String, dynamic> json) =>
      _$FluffyGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyGrpcToJson(this);
}

@JsonSerializable()
class StickyHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<StickyHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  StickyHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory StickyHttpGet.fromJson(Map<String, dynamic> json) =>
      _$StickyHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$StickyHttpGetToJson(this);
}

@JsonSerializable()
class StickyHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  StickyHttpHeader({required this.name, required this.value});

  factory StickyHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$StickyHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$StickyHttpHeaderToJson(this);
}

@JsonSerializable()
class StickyTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  StickyTcpSocket({this.host, required this.port});

  factory StickyTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$StickyTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$StickyTcpSocketToJson(this);
}

@JsonSerializable()
class ContainerResizePolicy {
  ///Name of the resource to which this resource resize policy applies. Supported values: cpu,
  ///memory.
  @JsonKey(name: 'resourceName')
  String resourceName;

  ///Restart policy to apply when specified resource is resized. If not specified, it defaults
  ///to NotRequired.
  @JsonKey(name: 'restartPolicy')
  String restartPolicy;

  ContainerResizePolicy({
    required this.resourceName,
    required this.restartPolicy,
  });

  factory ContainerResizePolicy.fromJson(Map<String, dynamic> json) =>
      _$ContainerResizePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResizePolicyToJson(this);
}

@JsonSerializable()
class ContainerResources {
  ///Claims lists the names of resources, defined in spec.resourceClaims, that are used by
  ///this container.
  ///
  ///This field depends on the DynamicResourceAllocation feature gate.
  ///
  ///This field is immutable. It can only be set for containers.
  @JsonKey(name: 'claims')
  List<PurpleClaim?>? claims;

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

  ContainerResources({this.claims, this.limits, this.requests});

  factory ContainerResources.fromJson(Map<String, dynamic> json) =>
      _$ContainerResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResourcesToJson(this);
}

@JsonSerializable()
class PurpleClaim {
  ///Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this
  ///field is used. It makes that resource available inside a container.
  @JsonKey(name: 'name')
  String name;

  ///Request is the name chosen for a request in the referenced claim. If empty, everything
  ///from the claim is made available, otherwise only the result of this request.
  @JsonKey(name: 'request')
  String? request;

  PurpleClaim({required this.name, this.request});

  factory PurpleClaim.fromJson(Map<String, dynamic> json) =>
      _$PurpleClaimFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleClaimToJson(this);
}

@JsonSerializable()
class ContainerRestartPolicyRule {
  ///Specifies the action taken on a container exit if the requirements are satisfied. The
  ///only possible value is "Restart" to restart the container.
  @JsonKey(name: 'action')
  String action;

  ///ContainerRestartRuleOnExitCodes describes the condition for handling an exited container
  ///based on its exit codes.
  @JsonKey(name: 'exitCodes')
  PurpleExitCodes? exitCodes;

  ContainerRestartPolicyRule({required this.action, this.exitCodes});

  factory ContainerRestartPolicyRule.fromJson(Map<String, dynamic> json) =>
      _$ContainerRestartPolicyRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerRestartPolicyRuleToJson(this);
}

@JsonSerializable()
class PurpleExitCodes {
  ///Represents the relationship between the container exit code(s) and the specified values.
  ///Possible values are: - In: the requirement is satisfied if the container exit code is in
  ///the
  ///set of specified values.
  ///- NotIn: the requirement is satisfied if the container exit code is
  ///not in the set of specified values.
  @JsonKey(name: 'operator')
  String exitCodesOperator;

  ///Specifies the set of values to check for container exit codes. At most 255 elements are
  ///allowed.
  @JsonKey(name: 'values')
  List<int?>? values;

  PurpleExitCodes({required this.exitCodesOperator, this.values});

  factory PurpleExitCodes.fromJson(Map<String, dynamic> json) =>
      _$PurpleExitCodesFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleExitCodesToJson(this);
}

@JsonSerializable()
class ContainerSecurityContext {
  ///AllowPrivilegeEscalation controls whether a process can gain more privileges than its
  ///parent process. This bool directly controls if the no_new_privs flag will be set on the
  ///container process. AllowPrivilegeEscalation is true always when the container is: 1) run
  ///as Privileged 2) has CAP_SYS_ADMIN Note that this field cannot be set when spec.os.name
  ///is windows.
  @JsonKey(name: 'allowPrivilegeEscalation')
  bool? allowPrivilegeEscalation;

  ///AppArmorProfile defines a pod or container's AppArmor settings.
  @JsonKey(name: 'appArmorProfile')
  PurpleAppArmorProfile? appArmorProfile;

  ///Adds and removes POSIX capabilities from running containers.
  @JsonKey(name: 'capabilities')
  PurpleCapabilities? capabilities;

  ///Run container in privileged mode. Processes in privileged containers are essentially
  ///equivalent to root on the host. Defaults to false. Note that this field cannot be set
  ///when spec.os.name is windows.
  @JsonKey(name: 'privileged')
  bool? privileged;

  ///procMount denotes the type of proc mount to use for the containers. The default value is
  ///Default which uses the container runtime defaults for readonly paths and masked paths.
  ///This requires the ProcMountType feature flag to be enabled. Note that this field cannot
  ///be set when spec.os.name is windows.
  ///
  ///Possible enum values:
  ///- `"Default"` uses the container runtime defaults for readonly and masked paths for
  ////proc. Most container runtimes mask certain paths in /proc to avoid accidental security
  ///exposure of special devices or information.
  ///- `"Unmasked"` bypasses the default masking behavior of the container runtime and ensures
  ///the newly created /proc the container stays in tact with no modifications.
  @JsonKey(name: 'procMount')
  ProcMount? procMount;

  ///Whether this container has a read-only root filesystem. Default is false. Note that this
  ///field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'readOnlyRootFilesystem')
  bool? readOnlyRootFilesystem;

  ///The GID to run the entrypoint of the container process. Uses runtime default if unset.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence. Note that
  ///this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user. If true, the Kubelet will
  ///validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to
  ///start the container if it does. If unset or false, no such validation will be performed.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process. Defaults to user specified in
  ///image metadata if unspecified. May also be set in PodSecurityContext.  If set in both
  ///SecurityContext and PodSecurityContext, the value specified in SecurityContext takes
  ///precedence. Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///SeccompProfile defines a pod/container's seccomp profile settings. Only one profile
  ///source may be set.
  @JsonKey(name: 'seccompProfile')
  PurpleSeccompProfile? seccompProfile;

  ///SELinuxOptions are the labels to be applied to the container
  @JsonKey(name: 'seLinuxOptions')
  PurpleSeLinuxOptions? seLinuxOptions;

  ///WindowsSecurityContextOptions contain Windows-specific options and credentials.
  @JsonKey(name: 'windowsOptions')
  PurpleWindowsOptions? windowsOptions;

  ContainerSecurityContext({
    this.allowPrivilegeEscalation,
    this.appArmorProfile,
    this.capabilities,
    this.privileged,
    this.procMount,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxOptions,
    this.windowsOptions,
  });

  factory ContainerSecurityContext.fromJson(Map<String, dynamic> json) =>
      _$ContainerSecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerSecurityContextToJson(this);
}

@JsonSerializable()
class PurpleAppArmorProfile {
  ///localhostProfile indicates a profile loaded on the node that should be used. The profile
  ///must be preconfigured on the node to work. Must match the loaded name of the profile.
  ///Must be set if and only if type is "Localhost".
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of AppArmor profile will be applied. Valid options are:
  ///Localhost - a profile pre-loaded on the node.
  ///RuntimeDefault - the container runtime's default profile.
  ///Unconfined - no AppArmor enforcement.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates that a profile pre-loaded on the node should be used.
  ///- `"RuntimeDefault"` indicates that the container runtime's default AppArmor profile
  ///should be used.
  ///- `"Unconfined"` indicates that no AppArmor profile should be enforced.
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  PurpleAppArmorProfile({this.localhostProfile, required this.type});

  factory PurpleAppArmorProfile.fromJson(Map<String, dynamic> json) =>
      _$PurpleAppArmorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAppArmorProfileToJson(this);
}

///type indicates which kind of AppArmor profile will be applied. Valid options are:
///Localhost - a profile pre-loaded on the node.
///RuntimeDefault - the container runtime's default profile.
///Unconfined - no AppArmor enforcement.
///
///Possible enum values:
///- `"Localhost"` indicates that a profile pre-loaded on the node should be used.
///- `"RuntimeDefault"` indicates that the container runtime's default AppArmor profile
///should be used.
///- `"Unconfined"` indicates that no AppArmor profile should be enforced.
///
///type indicates which kind of seccomp profile will be applied. Valid options are:
///
///Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the
///container runtime default profile should be used. Unconfined - no profile should be
///applied.
///
///Possible enum values:
///- `"Localhost"` indicates a profile defined in a file on the node should be used. The
///file's location relative to <kubelet-root-dir>/seccomp.
///- `"RuntimeDefault"` represents the default container runtime seccomp profile.
///- `"Unconfined"` indicates no seccomp profile is applied (A.K.A. unconfined).
enum AppArmorProfileType {
  @JsonValue('Localhost')
  LOCALHOST,
  @JsonValue('RuntimeDefault')
  RUNTIME_DEFAULT,
  @JsonValue('Unconfined')
  UNCONFINED,
}

final appArmorProfileTypeValues = EnumValues({
  'Localhost': AppArmorProfileType.LOCALHOST,
  'RuntimeDefault': AppArmorProfileType.RUNTIME_DEFAULT,
  'Unconfined': AppArmorProfileType.UNCONFINED,
});

@JsonSerializable()
class PurpleCapabilities {
  ///Added capabilities
  @JsonKey(name: 'add')
  List<String?>? add;

  ///Removed capabilities
  @JsonKey(name: 'drop')
  List<String?>? drop;

  PurpleCapabilities({this.add, this.drop});

  factory PurpleCapabilities.fromJson(Map<String, dynamic> json) =>
      _$PurpleCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleCapabilitiesToJson(this);
}

///procMount denotes the type of proc mount to use for the containers. The default value is
///Default which uses the container runtime defaults for readonly paths and masked paths.
///This requires the ProcMountType feature flag to be enabled. Note that this field cannot
///be set when spec.os.name is windows.
///
///Possible enum values:
///- `"Default"` uses the container runtime defaults for readonly and masked paths for
////proc. Most container runtimes mask certain paths in /proc to avoid accidental security
///exposure of special devices or information.
///- `"Unmasked"` bypasses the default masking behavior of the container runtime and ensures
///the newly created /proc the container stays in tact with no modifications.
enum ProcMount {
  @JsonValue('Default')
  DEFAULT,
  @JsonValue('Unmasked')
  UNMASKED,
}

final procMountValues = EnumValues({
  'Default': ProcMount.DEFAULT,
  'Unmasked': ProcMount.UNMASKED,
});

@JsonSerializable()
class PurpleSeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  PurpleSeLinuxOptions({this.level, this.role, this.type, this.user});

  factory PurpleSeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$PurpleSeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSeLinuxOptionsToJson(this);
}

@JsonSerializable()
class PurpleSeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used. The
  ///profile must be preconfigured on the node to work. Must be a descending path, relative to
  ///the kubelet's configured seccomp profile location. Must be set if type is "Localhost".
  ///Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied. Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the
  ///container runtime default profile should be used. Unconfined - no profile should be
  ///applied.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates a profile defined in a file on the node should be used. The
  ///file's location relative to <kubelet-root-dir>/seccomp.
  ///- `"RuntimeDefault"` represents the default container runtime seccomp profile.
  ///- `"Unconfined"` indicates no seccomp profile is applied (A.K.A. unconfined).
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  PurpleSeccompProfile({this.localhostProfile, required this.type});

  factory PurpleSeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$PurpleSeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSeccompProfileToJson(this);
}

@JsonSerializable()
class PurpleWindowsOptions {
  ///GMSACredentialSpec is where the GMSA admission webhook
  ///(https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA
  ///credential spec named by the GMSACredentialSpecName field.
  @JsonKey(name: 'gmsaCredentialSpec')
  String? gmsaCredentialSpec;

  ///GMSACredentialSpecName is the name of the GMSA credential spec to use.
  @JsonKey(name: 'gmsaCredentialSpecName')
  String? gmsaCredentialSpecName;

  ///HostProcess determines if a container should be run as a 'Host Process' container. All of
  ///a Pod's containers must have the same effective HostProcess value (it is not allowed to
  ///have a mix of HostProcess containers and non-HostProcess containers). In addition, if
  ///HostProcess is true then HostNetwork must also be set to true.
  @JsonKey(name: 'hostProcess')
  bool? hostProcess;

  ///The UserName in Windows to run the entrypoint of the container process. Defaults to the
  ///user specified in image metadata if unspecified. May also be set in PodSecurityContext.
  ///If set in both SecurityContext and PodSecurityContext, the value specified in
  ///SecurityContext takes precedence.
  @JsonKey(name: 'runAsUserName')
  String? runAsUserName;

  PurpleWindowsOptions({
    this.gmsaCredentialSpec,
    this.gmsaCredentialSpecName,
    this.hostProcess,
    this.runAsUserName,
  });

  factory PurpleWindowsOptions.fromJson(Map<String, dynamic> json) =>
      _$PurpleWindowsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleWindowsOptionsToJson(this);
}

@JsonSerializable()
class ContainerStartupProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  IndigoExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  TentacledGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  IndigoHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  IndigoTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  ContainerStartupProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory ContainerStartupProbe.fromJson(Map<String, dynamic> json) =>
      _$ContainerStartupProbeFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerStartupProbeToJson(this);
}

@JsonSerializable()
class IndigoExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  IndigoExec({this.command});

  factory IndigoExec.fromJson(Map<String, dynamic> json) =>
      _$IndigoExecFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoExecToJson(this);
}

@JsonSerializable()
class TentacledGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  TentacledGrpc({required this.port, this.service});

  factory TentacledGrpc.fromJson(Map<String, dynamic> json) =>
      _$TentacledGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledGrpcToJson(this);
}

@JsonSerializable()
class IndigoHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<IndigoHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  IndigoHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory IndigoHttpGet.fromJson(Map<String, dynamic> json) =>
      _$IndigoHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoHttpGetToJson(this);
}

@JsonSerializable()
class IndigoHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  IndigoHttpHeader({required this.name, required this.value});

  factory IndigoHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$IndigoHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoHttpHeaderToJson(this);
}

@JsonSerializable()
class IndigoTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  IndigoTcpSocket({this.host, required this.port});

  factory IndigoTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$IndigoTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoTcpSocketToJson(this);
}

///Indicate how the termination message should be populated. File will use the contents of
///terminationMessagePath to populate the container status message on both success and
///failure. FallbackToLogsOnError will use the last chunk of container log output if the
///termination message file is empty and the container exited with an error. The log output
///is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be
///updated.
///
///Possible enum values:
///- `"FallbackToLogsOnError"` will read the most recent contents of the container logs for
///the container status message when the container exits with an error and the
///terminationMessagePath has no contents.
///- `"File"` is the default behavior and will set the container status message to the
///contents of the container's terminationMessagePath when the container exits.
enum TerminationMessagePolicy {
  @JsonValue('FallbackToLogsOnError')
  FALLBACK_TO_LOGS_ON_ERROR,
  @JsonValue('File')
  FILE,
}

final terminationMessagePolicyValues = EnumValues({
  'FallbackToLogsOnError': TerminationMessagePolicy.FALLBACK_TO_LOGS_ON_ERROR,
  'File': TerminationMessagePolicy.FILE,
});

@JsonSerializable()
class ContainerVolumeDevice {
  ///devicePath is the path inside of the container that the device will be mapped to.
  @JsonKey(name: 'devicePath')
  String devicePath;

  ///name must match the name of a persistentVolumeClaim in the pod
  @JsonKey(name: 'name')
  String name;

  ContainerVolumeDevice({required this.devicePath, required this.name});

  factory ContainerVolumeDevice.fromJson(Map<String, dynamic> json) =>
      _$ContainerVolumeDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerVolumeDeviceToJson(this);
}

@JsonSerializable()
class ContainerVolumeMount {
  ///Path within the container at which the volume should be mounted.  Must not contain ':'.
  @JsonKey(name: 'mountPath')
  String mountPath;

  ///mountPropagation determines how mounts are propagated from the host to container and the
  ///other way around. When not set, MountPropagationNone is used. This field is beta in 1.10.
  ///When RecursiveReadOnly is set to IfPossible or to Enabled, MountPropagation must be None
  ///or unspecified (which defaults to None).
  ///
  ///Possible enum values:
  ///- `"Bidirectional"` means that the volume in a container will receive new mounts from the
  ///host or other containers, and its own mounts will be propagated from the container to the
  ///host or other containers. Note that this mode is recursively applied to all mounts in the
  ///volume ("rshared" in Linux terminology).
  ///- `"HostToContainer"` means that the volume in a container will receive new mounts from
  ///the host or other containers, but filesystems mounted inside the container won't be
  ///propagated to the host or other containers. Note that this mode is recursively applied to
  ///all mounts in the volume ("rslave" in Linux terminology).
  ///- `"None"` means that the volume in a container will not receive new mounts from the host
  ///or other containers, and filesystems mounted inside the container won't be propagated to
  ///the host or other containers. Note that this mode corresponds to "private" in Linux
  ///terminology.
  @JsonKey(name: 'mountPropagation')
  MountPropagation? mountPropagation;

  ///This must match the Name of a Volume.
  @JsonKey(name: 'name')
  String name;

  ///Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///RecursiveReadOnly specifies whether read-only mounts should be handled recursively.
  ///
  ///If ReadOnly is false, this field has no meaning and must be unspecified.
  ///
  ///If ReadOnly is true, and this field is set to Disabled, the mount is not made recursively
  ///read-only.  If this field is set to IfPossible, the mount is made recursively read-only,
  ///if it is supported by the container runtime.  If this field is set to Enabled, the mount
  ///is made recursively read-only if it is supported by the container runtime, otherwise the
  ///pod will not be started and an error will be generated to indicate the reason.
  ///
  ///If this field is set to IfPossible or Enabled, MountPropagation must be set to None (or
  ///be unspecified, which defaults to None).
  ///
  ///If this field is not specified, it is treated as an equivalent of Disabled.
  @JsonKey(name: 'recursiveReadOnly')
  String? recursiveReadOnly;

  ///Path within the volume from which the container's volume should be mounted. Defaults to
  ///"" (volume's root).
  @JsonKey(name: 'subPath')
  String? subPath;

  ///Expanded path within the volume from which the container's volume should be mounted.
  ///Behaves similarly to SubPath but environment variable references $(VAR_NAME) are expanded
  ///using the container's environment. Defaults to "" (volume's root). SubPathExpr and
  ///SubPath are mutually exclusive.
  @JsonKey(name: 'subPathExpr')
  String? subPathExpr;

  ContainerVolumeMount({
    required this.mountPath,
    this.mountPropagation,
    required this.name,
    this.readOnly,
    this.recursiveReadOnly,
    this.subPath,
    this.subPathExpr,
  });

  factory ContainerVolumeMount.fromJson(Map<String, dynamic> json) =>
      _$ContainerVolumeMountFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerVolumeMountToJson(this);
}

///mountPropagation determines how mounts are propagated from the host to container and the
///other way around. When not set, MountPropagationNone is used. This field is beta in 1.10.
///When RecursiveReadOnly is set to IfPossible or to Enabled, MountPropagation must be None
///or unspecified (which defaults to None).
///
///Possible enum values:
///- `"Bidirectional"` means that the volume in a container will receive new mounts from the
///host or other containers, and its own mounts will be propagated from the container to the
///host or other containers. Note that this mode is recursively applied to all mounts in the
///volume ("rshared" in Linux terminology).
///- `"HostToContainer"` means that the volume in a container will receive new mounts from
///the host or other containers, but filesystems mounted inside the container won't be
///propagated to the host or other containers. Note that this mode is recursively applied to
///all mounts in the volume ("rslave" in Linux terminology).
///- `"None"` means that the volume in a container will not receive new mounts from the host
///or other containers, and filesystems mounted inside the container won't be propagated to
///the host or other containers. Note that this mode corresponds to "private" in Linux
///terminology.
enum MountPropagation {
  @JsonValue('Bidirectional')
  BIDIRECTIONAL,
  @JsonValue('HostToContainer')
  HOST_TO_CONTAINER,
  @JsonValue('None')
  NONE,
}

final mountPropagationValues = EnumValues({
  'Bidirectional': MountPropagation.BIDIRECTIONAL,
  'HostToContainer': MountPropagation.HOST_TO_CONTAINER,
  'None': MountPropagation.NONE,
});

@JsonSerializable()
class DnsConfig {
  ///A list of DNS name server IP addresses. This will be appended to the base nameservers
  ///generated from DNSPolicy. Duplicated nameservers will be removed.
  @JsonKey(name: 'nameservers')
  List<String?>? nameservers;

  ///A list of DNS resolver options. This will be merged with the base options generated from
  ///DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will
  ///override those that appear in the base DNSPolicy.
  @JsonKey(name: 'options')
  List<Option?>? options;

  ///A list of DNS search domains for host-name lookup. This will be appended to the base
  ///search paths generated from DNSPolicy. Duplicated search paths will be removed.
  @JsonKey(name: 'searches')
  List<String?>? searches;

  DnsConfig({this.nameservers, this.options, this.searches});

  factory DnsConfig.fromJson(Map<String, dynamic> json) =>
      _$DnsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DnsConfigToJson(this);
}

@JsonSerializable()
class Option {
  ///Name is this DNS resolver option's name. Required.
  @JsonKey(name: 'name')
  String? name;

  ///Value is this DNS resolver option's value.
  @JsonKey(name: 'value')
  String? value;

  Option({this.name, this.value});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

///Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are
///'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in
///DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set
///along with hostNetwork, you have to specify DNS policy explicitly to
///'ClusterFirstWithHostNet'.
///
///Possible enum values:
///- `"ClusterFirst"` indicates that the pod should use cluster DNS first unless hostNetwork
///is true, if it is available, then fall back on the default (as determined by kubelet) DNS
///settings.
///- `"ClusterFirstWithHostNet"` indicates that the pod should use cluster DNS first, if it
///is available, then fall back on the default (as determined by kubelet) DNS settings.
///- `"Default"` indicates that the pod should use the default (as determined by kubelet)
///DNS settings.
///- `"None"` indicates that the pod should use empty DNS settings. DNS parameters such as
///nameservers and search paths should be defined via DNSConfig.
enum DnsPolicy {
  @JsonValue('ClusterFirst')
  CLUSTER_FIRST,
  @JsonValue('ClusterFirstWithHostNet')
  CLUSTER_FIRST_WITH_HOST_NET,
  @JsonValue('Default')
  DEFAULT,
  @JsonValue('None')
  NONE,
}

final dnsPolicyValues = EnumValues({
  'ClusterFirst': DnsPolicy.CLUSTER_FIRST,
  'ClusterFirstWithHostNet': DnsPolicy.CLUSTER_FIRST_WITH_HOST_NET,
  'Default': DnsPolicy.DEFAULT,
  'None': DnsPolicy.NONE,
});

@JsonSerializable()
class EphemeralContainer {
  ///Arguments to the entrypoint. The image's CMD is used if this is not provided. Variable
  ///references $(VAR_NAME) are expanded using the container's environment. If a variable
  ///cannot be resolved, the reference in the input string will be unchanged. Double $$ are
  ///reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e.
  ///"$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will
  ///never be expanded, regardless of whether the variable exists or not. Cannot be updated.
  ///More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'args')
  List<String?>? args;

  ///Entrypoint array. Not executed within a shell. The image's ENTRYPOINT is used if this is
  ///not provided. Variable references $(VAR_NAME) are expanded using the container's
  ///environment. If a variable cannot be resolved, the reference in the input string will be
  ///unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME)
  ///syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped
  ///references will never be expanded, regardless of whether the variable exists or not.
  ///Cannot be updated. More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'command')
  List<String?>? command;

  ///List of environment variables to set in the container. Cannot be updated.
  @JsonKey(name: 'env')
  List<EphemeralContainerEnv?>? env;

  ///List of sources to populate environment variables in the container. The keys defined
  ///within a source may consist of any printable ASCII characters except '='. When a key
  ///exists in multiple sources, the value associated with the last source will take
  ///precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be
  ///updated.
  @JsonKey(name: 'envFrom')
  List<EphemeralContainerEnvFrom?>? envFrom;

  ///Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
  @JsonKey(name: 'image')
  String? image;

  ///Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag
  ///is specified, or IfNotPresent otherwise. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/containers/images#updating-images
  ///
  ///Possible enum values:
  ///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
  ///fail If the pull fails.
  ///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
  ///will fail if the image isn't present and the pull fails.
  ///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
  ///Container will fail if the image isn't present
  @JsonKey(name: 'imagePullPolicy')
  PullPolicy? imagePullPolicy;

  ///Lifecycle describes actions that the management system should take in response to
  ///container lifecycle events. For the PostStart and PreStop lifecycle handlers, management
  ///of the container blocks until the action is complete, unless the container process fails,
  ///in which case the handler is aborted.
  @JsonKey(name: 'lifecycle')
  EphemeralContainerLifecycle? lifecycle;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'livenessProbe')
  EphemeralContainerLivenessProbe? livenessProbe;

  ///Name of the ephemeral container specified as a DNS_LABEL. This name must be unique among
  ///all containers, init containers and ephemeral containers.
  @JsonKey(name: 'name')
  String name;

  ///Ports are not allowed for ephemeral containers.
  @JsonKey(name: 'ports')
  List<EphemeralContainerPort?>? ports;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'readinessProbe')
  EphemeralContainerReadinessProbe? readinessProbe;

  ///Resources resize policy for the container.
  @JsonKey(name: 'resizePolicy')
  List<EphemeralContainerResizePolicy?>? resizePolicy;

  ///ResourceRequirements describes the compute resource requirements.
  @JsonKey(name: 'resources')
  EphemeralContainerResources? resources;

  ///Restart policy for the container to manage the restart behavior of each container within
  ///a pod. You cannot set this field on ephemeral containers.
  @JsonKey(name: 'restartPolicy')
  String? restartPolicy;

  ///Represents a list of rules to be checked to determine if the container should be
  ///restarted on exit. You cannot set this field on ephemeral containers.
  @JsonKey(name: 'restartPolicyRules')
  List<EphemeralContainerRestartPolicyRule?>? restartPolicyRules;

  ///SecurityContext holds security configuration that will be applied to a container. Some
  ///fields are present in both SecurityContext and PodSecurityContext.  When both are set,
  ///the values in SecurityContext take precedence.
  @JsonKey(name: 'securityContext')
  EphemeralContainerSecurityContext? securityContext;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'startupProbe')
  EphemeralContainerStartupProbe? startupProbe;

  ///Whether this container should allocate a buffer for stdin in the container runtime. If
  ///this is not set, reads from stdin in the container will always result in EOF. Default is
  ///false.
  @JsonKey(name: 'stdin')
  bool? stdin;

  ///Whether the container runtime should close the stdin channel after it has been opened by
  ///a single attach. When stdin is true the stdin stream will remain open across multiple
  ///attach sessions. If stdinOnce is set to true, stdin is opened on container start, is
  ///empty until the first client attaches to stdin, and then remains open and accepts data
  ///until the client disconnects, at which time stdin is closed and remains closed until the
  ///container is restarted. If this flag is false, a container processes that reads from
  ///stdin will never receive an EOF. Default is false
  @JsonKey(name: 'stdinOnce')
  bool? stdinOnce;

  ///If set, the name of the container from PodSpec that this ephemeral container targets. The
  ///ephemeral container will be run in the namespaces (IPC, PID, etc) of this container. If
  ///not set then the ephemeral container uses the namespaces configured in the Pod spec.
  ///
  ///The container runtime must implement support for this feature. If the runtime does not
  ///support namespace targeting then the result of setting this field is undefined.
  @JsonKey(name: 'targetContainerName')
  String? targetContainerName;

  ///Optional: Path at which the file to which the container's termination message will be
  ///written is mounted into the container's filesystem. Message written is intended to be
  ///brief final status, such as an assertion failure message. Will be truncated by the node
  ///if greater than 4096 bytes. The total message length across all containers will be
  ///limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
  @JsonKey(name: 'terminationMessagePath')
  String? terminationMessagePath;

  ///Indicate how the termination message should be populated. File will use the contents of
  ///terminationMessagePath to populate the container status message on both success and
  ///failure. FallbackToLogsOnError will use the last chunk of container log output if the
  ///termination message file is empty and the container exited with an error. The log output
  ///is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be
  ///updated.
  ///
  ///Possible enum values:
  ///- `"FallbackToLogsOnError"` will read the most recent contents of the container logs for
  ///the container status message when the container exits with an error and the
  ///terminationMessagePath has no contents.
  ///- `"File"` is the default behavior and will set the container status message to the
  ///contents of the container's terminationMessagePath when the container exits.
  @JsonKey(name: 'terminationMessagePolicy')
  TerminationMessagePolicy? terminationMessagePolicy;

  ///Whether this container should allocate a TTY for itself, also requires 'stdin' to be
  ///true. Default is false.
  @JsonKey(name: 'tty')
  bool? tty;

  ///volumeDevices is the list of block devices to be used by the container.
  @JsonKey(name: 'volumeDevices')
  List<EphemeralContainerVolumeDevice?>? volumeDevices;

  ///Pod volumes to mount into the container's filesystem. Subpath mounts are not allowed for
  ///ephemeral containers. Cannot be updated.
  @JsonKey(name: 'volumeMounts')
  List<EphemeralContainerVolumeMount?>? volumeMounts;

  ///Container's working directory. If not specified, the container runtime's default will be
  ///used, which might be configured in the container image. Cannot be updated.
  @JsonKey(name: 'workingDir')
  String? workingDir;

  EphemeralContainer({
    this.args,
    this.command,
    this.env,
    this.envFrom,
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports,
    this.readinessProbe,
    this.resizePolicy,
    this.resources,
    this.restartPolicy,
    this.restartPolicyRules,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.targetContainerName,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices,
    this.volumeMounts,
    this.workingDir,
  });

  factory EphemeralContainer.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerToJson(this);
}

@JsonSerializable()
class EphemeralContainerEnv {
  ///Name of the environment variable. May consist of any printable ASCII characters except
  ///'='.
  @JsonKey(name: 'name')
  String name;

  ///Variable references $(VAR_NAME) are expanded using the previously defined environment
  ///variables in the container and any service environment variables. If a variable cannot be
  ///resolved, the reference in the input string will be unchanged. Double $$ are reduced to a
  ///single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will
  ///produce the string literal "$(VAR_NAME)". Escaped references will never be expanded,
  ///regardless of whether the variable exists or not. Defaults to "".
  @JsonKey(name: 'value')
  String? value;

  ///EnvVarSource represents a source for the value of an EnvVar.
  @JsonKey(name: 'valueFrom')
  FluffyValueFrom? valueFrom;

  EphemeralContainerEnv({required this.name, this.value, this.valueFrom});

  factory EphemeralContainerEnv.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerEnvFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerEnvToJson(this);
}

@JsonSerializable()
class FluffyValueFrom {
  ///Selects a key from a ConfigMap.
  @JsonKey(name: 'configMapKeyRef')
  FluffyConfigMapKeyRef? configMapKeyRef;

  ///ObjectFieldSelector selects an APIVersioned field of an object.
  @JsonKey(name: 'fieldRef')
  FluffyFieldRef? fieldRef;

  ///FileKeySelector selects a key of the env file.
  @JsonKey(name: 'fileKeyRef')
  FluffyFileKeyRef? fileKeyRef;

  ///ResourceFieldSelector represents container resources (cpu, memory) and their output format
  @JsonKey(name: 'resourceFieldRef')
  FluffyResourceFieldRef? resourceFieldRef;

  ///SecretKeySelector selects a key of a Secret.
  @JsonKey(name: 'secretKeyRef')
  FluffySecretKeyRef? secretKeyRef;

  FluffyValueFrom({
    this.configMapKeyRef,
    this.fieldRef,
    this.fileKeyRef,
    this.resourceFieldRef,
    this.secretKeyRef,
  });

  factory FluffyValueFrom.fromJson(Map<String, dynamic> json) =>
      _$FluffyValueFromFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyValueFromToJson(this);
}

@JsonSerializable()
class FluffyConfigMapKeyRef {
  ///The key to select.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  FluffyConfigMapKeyRef({required this.key, this.name, this.optional});

  factory FluffyConfigMapKeyRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyConfigMapKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyConfigMapKeyRefToJson(this);
}

@JsonSerializable()
class FluffyFieldRef {
  ///Version of the schema the FieldPath is written in terms of, defaults to "v1".
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Path of the field to select in the specified API version.
  @JsonKey(name: 'fieldPath')
  String fieldPath;

  FluffyFieldRef({this.apiVersion, required this.fieldPath});

  factory FluffyFieldRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFieldRefToJson(this);
}

@JsonSerializable()
class FluffyFileKeyRef {
  ///The key within the env file. An invalid key will prevent the pod from starting. The keys
  ///defined within a source may consist of any printable ASCII characters except '='. During
  ///Alpha stage of the EnvFiles feature gate, the key size is limited to 128 characters.
  @JsonKey(name: 'key')
  String key;

  ///Specify whether the file or its key must be defined. If the file or key does not exist,
  ///then the env var is not published. If optional is set to true and the specified key does
  ///not exist, the environment variable will not be set in the Pod's containers.
  ///
  ///If optional is set to false and the specified key does not exist, an error will be
  ///returned during Pod creation.
  @JsonKey(name: 'optional')
  bool? optional;

  ///The path within the volume from which to select the file. Must be relative and may not
  ///contain the '..' path or start with '..'.
  @JsonKey(name: 'path')
  String path;

  ///The name of the volume mount containing the env file.
  @JsonKey(name: 'volumeName')
  String volumeName;

  FluffyFileKeyRef({
    required this.key,
    this.optional,
    required this.path,
    required this.volumeName,
  });

  factory FluffyFileKeyRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyFileKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFileKeyRefToJson(this);
}

@JsonSerializable()
class FluffyResourceFieldRef {
  ///Container name: required for volumes, optional for env vars
  @JsonKey(name: 'containerName')
  String? containerName;
  @JsonKey(name: 'divisor')
  dynamic divisor;

  ///Required: resource to select
  @JsonKey(name: 'resource')
  String resource;

  FluffyResourceFieldRef({
    this.containerName,
    this.divisor,
    required this.resource,
  });

  factory FluffyResourceFieldRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyResourceFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyResourceFieldRefToJson(this);
}

@JsonSerializable()
class FluffySecretKeyRef {
  ///The key of the secret to select from.  Must be a valid secret key.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  FluffySecretKeyRef({required this.key, this.name, this.optional});

  factory FluffySecretKeyRef.fromJson(Map<String, dynamic> json) =>
      _$FluffySecretKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySecretKeyRefToJson(this);
}

@JsonSerializable()
class EphemeralContainerEnvFrom {
  ///ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
  ///
  ///The contents of the target ConfigMap's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'configMapRef')
  FluffyConfigMapRef? configMapRef;

  ///Optional text to prepend to the name of each environment variable. May consist of any
  ///printable ASCII characters except '='.
  @JsonKey(name: 'prefix')
  String? prefix;

  ///SecretEnvSource selects a Secret to populate the environment variables with.
  ///
  ///The contents of the target Secret's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'secretRef')
  FluffySecretRef? secretRef;

  EphemeralContainerEnvFrom({this.configMapRef, this.prefix, this.secretRef});

  factory EphemeralContainerEnvFrom.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerEnvFromFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerEnvFromToJson(this);
}

@JsonSerializable()
class FluffyConfigMapRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  FluffyConfigMapRef({this.name, this.optional});

  factory FluffyConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyConfigMapRefToJson(this);
}

@JsonSerializable()
class FluffySecretRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  FluffySecretRef({this.name, this.optional});

  factory FluffySecretRef.fromJson(Map<String, dynamic> json) =>
      _$FluffySecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySecretRefToJson(this);
}

@JsonSerializable()
class EphemeralContainerLifecycle {
  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'postStart')
  FluffyPostStart? postStart;

  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'preStop')
  FluffyPreStop? preStop;

  ///StopSignal defines which signal will be sent to a container when it is being stopped. If
  ///not specified, the default is defined by the container runtime in use. StopSignal can
  ///only be set for Pods with a non-empty .spec.os.name
  ///
  ///Possible enum values:
  ///- `"SIGABRT"`
  ///- `"SIGALRM"`
  ///- `"SIGBUS"`
  ///- `"SIGCHLD"`
  ///- `"SIGCLD"`
  ///- `"SIGCONT"`
  ///- `"SIGFPE"`
  ///- `"SIGHUP"`
  ///- `"SIGILL"`
  ///- `"SIGINT"`
  ///- `"SIGIO"`
  ///- `"SIGIOT"`
  ///- `"SIGKILL"`
  ///- `"SIGPIPE"`
  ///- `"SIGPOLL"`
  ///- `"SIGPROF"`
  ///- `"SIGPWR"`
  ///- `"SIGQUIT"`
  ///- `"SIGRTMAX"`
  ///- `"SIGRTMAX-1"`
  ///- `"SIGRTMAX-10"`
  ///- `"SIGRTMAX-11"`
  ///- `"SIGRTMAX-12"`
  ///- `"SIGRTMAX-13"`
  ///- `"SIGRTMAX-14"`
  ///- `"SIGRTMAX-2"`
  ///- `"SIGRTMAX-3"`
  ///- `"SIGRTMAX-4"`
  ///- `"SIGRTMAX-5"`
  ///- `"SIGRTMAX-6"`
  ///- `"SIGRTMAX-7"`
  ///- `"SIGRTMAX-8"`
  ///- `"SIGRTMAX-9"`
  ///- `"SIGRTMIN"`
  ///- `"SIGRTMIN+1"`
  ///- `"SIGRTMIN+10"`
  ///- `"SIGRTMIN+11"`
  ///- `"SIGRTMIN+12"`
  ///- `"SIGRTMIN+13"`
  ///- `"SIGRTMIN+14"`
  ///- `"SIGRTMIN+15"`
  ///- `"SIGRTMIN+2"`
  ///- `"SIGRTMIN+3"`
  ///- `"SIGRTMIN+4"`
  ///- `"SIGRTMIN+5"`
  ///- `"SIGRTMIN+6"`
  ///- `"SIGRTMIN+7"`
  ///- `"SIGRTMIN+8"`
  ///- `"SIGRTMIN+9"`
  ///- `"SIGSEGV"`
  ///- `"SIGSTKFLT"`
  ///- `"SIGSTOP"`
  ///- `"SIGSYS"`
  ///- `"SIGTERM"`
  ///- `"SIGTRAP"`
  ///- `"SIGTSTP"`
  ///- `"SIGTTIN"`
  ///- `"SIGTTOU"`
  ///- `"SIGURG"`
  ///- `"SIGUSR1"`
  ///- `"SIGUSR2"`
  ///- `"SIGVTALRM"`
  ///- `"SIGWINCH"`
  ///- `"SIGXCPU"`
  ///- `"SIGXFSZ"`
  @JsonKey(name: 'stopSignal')
  StopSignal? stopSignal;

  EphemeralContainerLifecycle({this.postStart, this.preStop, this.stopSignal});

  factory EphemeralContainerLifecycle.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerLifecycleToJson(this);
}

@JsonSerializable()
class FluffyPostStart {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  IndecentExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  IndecentHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  TentacledSleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  IndecentTcpSocket? tcpSocket;

  FluffyPostStart({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory FluffyPostStart.fromJson(Map<String, dynamic> json) =>
      _$FluffyPostStartFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPostStartToJson(this);
}

@JsonSerializable()
class IndecentExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  IndecentExec({this.command});

  factory IndecentExec.fromJson(Map<String, dynamic> json) =>
      _$IndecentExecFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentExecToJson(this);
}

@JsonSerializable()
class IndecentHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<IndecentHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  IndecentHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory IndecentHttpGet.fromJson(Map<String, dynamic> json) =>
      _$IndecentHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentHttpGetToJson(this);
}

@JsonSerializable()
class IndecentHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  IndecentHttpHeader({required this.name, required this.value});

  factory IndecentHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$IndecentHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentHttpHeaderToJson(this);
}

@JsonSerializable()
class TentacledSleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  TentacledSleep({required this.seconds});

  factory TentacledSleep.fromJson(Map<String, dynamic> json) =>
      _$TentacledSleepFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSleepToJson(this);
}

@JsonSerializable()
class IndecentTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  IndecentTcpSocket({this.host, required this.port});

  factory IndecentTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$IndecentTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentTcpSocketToJson(this);
}

@JsonSerializable()
class FluffyPreStop {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  HilariousExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  HilariousHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  StickySleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  HilariousTcpSocket? tcpSocket;

  FluffyPreStop({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory FluffyPreStop.fromJson(Map<String, dynamic> json) =>
      _$FluffyPreStopFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPreStopToJson(this);
}

@JsonSerializable()
class HilariousExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  HilariousExec({this.command});

  factory HilariousExec.fromJson(Map<String, dynamic> json) =>
      _$HilariousExecFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousExecToJson(this);
}

@JsonSerializable()
class HilariousHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<HilariousHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  HilariousHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory HilariousHttpGet.fromJson(Map<String, dynamic> json) =>
      _$HilariousHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousHttpGetToJson(this);
}

@JsonSerializable()
class HilariousHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  HilariousHttpHeader({required this.name, required this.value});

  factory HilariousHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$HilariousHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousHttpHeaderToJson(this);
}

@JsonSerializable()
class StickySleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  StickySleep({required this.seconds});

  factory StickySleep.fromJson(Map<String, dynamic> json) =>
      _$StickySleepFromJson(json);

  Map<String, dynamic> toJson() => _$StickySleepToJson(this);
}

@JsonSerializable()
class HilariousTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  HilariousTcpSocket({this.host, required this.port});

  factory HilariousTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$HilariousTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousTcpSocketToJson(this);
}

@JsonSerializable()
class EphemeralContainerLivenessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  AmbitiousExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  StickyGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  AmbitiousHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  AmbitiousTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  EphemeralContainerLivenessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory EphemeralContainerLivenessProbe.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerLivenessProbeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EphemeralContainerLivenessProbeToJson(this);
}

@JsonSerializable()
class AmbitiousExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  AmbitiousExec({this.command});

  factory AmbitiousExec.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousExecFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousExecToJson(this);
}

@JsonSerializable()
class StickyGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  StickyGrpc({required this.port, this.service});

  factory StickyGrpc.fromJson(Map<String, dynamic> json) =>
      _$StickyGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$StickyGrpcToJson(this);
}

@JsonSerializable()
class AmbitiousHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<AmbitiousHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  AmbitiousHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory AmbitiousHttpGet.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousHttpGetToJson(this);
}

@JsonSerializable()
class AmbitiousHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  AmbitiousHttpHeader({required this.name, required this.value});

  factory AmbitiousHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousHttpHeaderToJson(this);
}

@JsonSerializable()
class AmbitiousTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  AmbitiousTcpSocket({this.host, required this.port});

  factory AmbitiousTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousTcpSocketToJson(this);
}

@JsonSerializable()
class EphemeralContainerPort {
  ///Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x
  ///< 65536.
  @JsonKey(name: 'containerPort')
  int containerPort;

  ///What host IP to bind the external port to.
  @JsonKey(name: 'hostIP')
  String? hostIp;

  ///Number of port to expose on the host. If specified, this must be a valid port number, 0 <
  ///x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do
  ///not need this.
  @JsonKey(name: 'hostPort')
  int? hostPort;

  ///If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in
  ///a pod must have a unique name. Name for the port that can be referred to by services.
  @JsonKey(name: 'name')
  String? name;

  ///Protocol for port. Must be UDP, TCP, or SCTP. Defaults to "TCP".
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  EphemeralContainerPort({
    required this.containerPort,
    this.hostIp,
    this.hostPort,
    this.name,
    this.protocol,
  });

  factory EphemeralContainerPort.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerPortFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerPortToJson(this);
}

@JsonSerializable()
class EphemeralContainerReadinessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  CunningExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  IndigoGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  CunningHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  CunningTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  EphemeralContainerReadinessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory EphemeralContainerReadinessProbe.fromJson(
    Map<String, dynamic> json,
  ) => _$EphemeralContainerReadinessProbeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EphemeralContainerReadinessProbeToJson(this);
}

@JsonSerializable()
class CunningExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  CunningExec({this.command});

  factory CunningExec.fromJson(Map<String, dynamic> json) =>
      _$CunningExecFromJson(json);

  Map<String, dynamic> toJson() => _$CunningExecToJson(this);
}

@JsonSerializable()
class IndigoGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  IndigoGrpc({required this.port, this.service});

  factory IndigoGrpc.fromJson(Map<String, dynamic> json) =>
      _$IndigoGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoGrpcToJson(this);
}

@JsonSerializable()
class CunningHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<CunningHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  CunningHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory CunningHttpGet.fromJson(Map<String, dynamic> json) =>
      _$CunningHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$CunningHttpGetToJson(this);
}

@JsonSerializable()
class CunningHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  CunningHttpHeader({required this.name, required this.value});

  factory CunningHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$CunningHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$CunningHttpHeaderToJson(this);
}

@JsonSerializable()
class CunningTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  CunningTcpSocket({this.host, required this.port});

  factory CunningTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$CunningTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$CunningTcpSocketToJson(this);
}

@JsonSerializable()
class EphemeralContainerResizePolicy {
  ///Name of the resource to which this resource resize policy applies. Supported values: cpu,
  ///memory.
  @JsonKey(name: 'resourceName')
  String resourceName;

  ///Restart policy to apply when specified resource is resized. If not specified, it defaults
  ///to NotRequired.
  @JsonKey(name: 'restartPolicy')
  String restartPolicy;

  EphemeralContainerResizePolicy({
    required this.resourceName,
    required this.restartPolicy,
  });

  factory EphemeralContainerResizePolicy.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerResizePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerResizePolicyToJson(this);
}

@JsonSerializable()
class EphemeralContainerResources {
  ///Claims lists the names of resources, defined in spec.resourceClaims, that are used by
  ///this container.
  ///
  ///This field depends on the DynamicResourceAllocation feature gate.
  ///
  ///This field is immutable. It can only be set for containers.
  @JsonKey(name: 'claims')
  List<FluffyClaim?>? claims;

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

  EphemeralContainerResources({this.claims, this.limits, this.requests});

  factory EphemeralContainerResources.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerResourcesToJson(this);
}

@JsonSerializable()
class FluffyClaim {
  ///Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this
  ///field is used. It makes that resource available inside a container.
  @JsonKey(name: 'name')
  String name;

  ///Request is the name chosen for a request in the referenced claim. If empty, everything
  ///from the claim is made available, otherwise only the result of this request.
  @JsonKey(name: 'request')
  String? request;

  FluffyClaim({required this.name, this.request});

  factory FluffyClaim.fromJson(Map<String, dynamic> json) =>
      _$FluffyClaimFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyClaimToJson(this);
}

@JsonSerializable()
class EphemeralContainerRestartPolicyRule {
  ///Specifies the action taken on a container exit if the requirements are satisfied. The
  ///only possible value is "Restart" to restart the container.
  @JsonKey(name: 'action')
  String action;

  ///ContainerRestartRuleOnExitCodes describes the condition for handling an exited container
  ///based on its exit codes.
  @JsonKey(name: 'exitCodes')
  FluffyExitCodes? exitCodes;

  EphemeralContainerRestartPolicyRule({required this.action, this.exitCodes});

  factory EphemeralContainerRestartPolicyRule.fromJson(
    Map<String, dynamic> json,
  ) => _$EphemeralContainerRestartPolicyRuleFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EphemeralContainerRestartPolicyRuleToJson(this);
}

@JsonSerializable()
class FluffyExitCodes {
  ///Represents the relationship between the container exit code(s) and the specified values.
  ///Possible values are: - In: the requirement is satisfied if the container exit code is in
  ///the
  ///set of specified values.
  ///- NotIn: the requirement is satisfied if the container exit code is
  ///not in the set of specified values.
  @JsonKey(name: 'operator')
  String exitCodesOperator;

  ///Specifies the set of values to check for container exit codes. At most 255 elements are
  ///allowed.
  @JsonKey(name: 'values')
  List<int?>? values;

  FluffyExitCodes({required this.exitCodesOperator, this.values});

  factory FluffyExitCodes.fromJson(Map<String, dynamic> json) =>
      _$FluffyExitCodesFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyExitCodesToJson(this);
}

@JsonSerializable()
class EphemeralContainerSecurityContext {
  ///AllowPrivilegeEscalation controls whether a process can gain more privileges than its
  ///parent process. This bool directly controls if the no_new_privs flag will be set on the
  ///container process. AllowPrivilegeEscalation is true always when the container is: 1) run
  ///as Privileged 2) has CAP_SYS_ADMIN Note that this field cannot be set when spec.os.name
  ///is windows.
  @JsonKey(name: 'allowPrivilegeEscalation')
  bool? allowPrivilegeEscalation;

  ///AppArmorProfile defines a pod or container's AppArmor settings.
  @JsonKey(name: 'appArmorProfile')
  FluffyAppArmorProfile? appArmorProfile;

  ///Adds and removes POSIX capabilities from running containers.
  @JsonKey(name: 'capabilities')
  FluffyCapabilities? capabilities;

  ///Run container in privileged mode. Processes in privileged containers are essentially
  ///equivalent to root on the host. Defaults to false. Note that this field cannot be set
  ///when spec.os.name is windows.
  @JsonKey(name: 'privileged')
  bool? privileged;

  ///procMount denotes the type of proc mount to use for the containers. The default value is
  ///Default which uses the container runtime defaults for readonly paths and masked paths.
  ///This requires the ProcMountType feature flag to be enabled. Note that this field cannot
  ///be set when spec.os.name is windows.
  ///
  ///Possible enum values:
  ///- `"Default"` uses the container runtime defaults for readonly and masked paths for
  ////proc. Most container runtimes mask certain paths in /proc to avoid accidental security
  ///exposure of special devices or information.
  ///- `"Unmasked"` bypasses the default masking behavior of the container runtime and ensures
  ///the newly created /proc the container stays in tact with no modifications.
  @JsonKey(name: 'procMount')
  ProcMount? procMount;

  ///Whether this container has a read-only root filesystem. Default is false. Note that this
  ///field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'readOnlyRootFilesystem')
  bool? readOnlyRootFilesystem;

  ///The GID to run the entrypoint of the container process. Uses runtime default if unset.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence. Note that
  ///this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user. If true, the Kubelet will
  ///validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to
  ///start the container if it does. If unset or false, no such validation will be performed.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process. Defaults to user specified in
  ///image metadata if unspecified. May also be set in PodSecurityContext.  If set in both
  ///SecurityContext and PodSecurityContext, the value specified in SecurityContext takes
  ///precedence. Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///SeccompProfile defines a pod/container's seccomp profile settings. Only one profile
  ///source may be set.
  @JsonKey(name: 'seccompProfile')
  FluffySeccompProfile? seccompProfile;

  ///SELinuxOptions are the labels to be applied to the container
  @JsonKey(name: 'seLinuxOptions')
  FluffySeLinuxOptions? seLinuxOptions;

  ///WindowsSecurityContextOptions contain Windows-specific options and credentials.
  @JsonKey(name: 'windowsOptions')
  FluffyWindowsOptions? windowsOptions;

  EphemeralContainerSecurityContext({
    this.allowPrivilegeEscalation,
    this.appArmorProfile,
    this.capabilities,
    this.privileged,
    this.procMount,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxOptions,
    this.windowsOptions,
  });

  factory EphemeralContainerSecurityContext.fromJson(
    Map<String, dynamic> json,
  ) => _$EphemeralContainerSecurityContextFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EphemeralContainerSecurityContextToJson(this);
}

@JsonSerializable()
class FluffyAppArmorProfile {
  ///localhostProfile indicates a profile loaded on the node that should be used. The profile
  ///must be preconfigured on the node to work. Must match the loaded name of the profile.
  ///Must be set if and only if type is "Localhost".
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of AppArmor profile will be applied. Valid options are:
  ///Localhost - a profile pre-loaded on the node.
  ///RuntimeDefault - the container runtime's default profile.
  ///Unconfined - no AppArmor enforcement.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates that a profile pre-loaded on the node should be used.
  ///- `"RuntimeDefault"` indicates that the container runtime's default AppArmor profile
  ///should be used.
  ///- `"Unconfined"` indicates that no AppArmor profile should be enforced.
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  FluffyAppArmorProfile({this.localhostProfile, required this.type});

  factory FluffyAppArmorProfile.fromJson(Map<String, dynamic> json) =>
      _$FluffyAppArmorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAppArmorProfileToJson(this);
}

@JsonSerializable()
class FluffyCapabilities {
  ///Added capabilities
  @JsonKey(name: 'add')
  List<String?>? add;

  ///Removed capabilities
  @JsonKey(name: 'drop')
  List<String?>? drop;

  FluffyCapabilities({this.add, this.drop});

  factory FluffyCapabilities.fromJson(Map<String, dynamic> json) =>
      _$FluffyCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyCapabilitiesToJson(this);
}

@JsonSerializable()
class FluffySeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  FluffySeLinuxOptions({this.level, this.role, this.type, this.user});

  factory FluffySeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$FluffySeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySeLinuxOptionsToJson(this);
}

@JsonSerializable()
class FluffySeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used. The
  ///profile must be preconfigured on the node to work. Must be a descending path, relative to
  ///the kubelet's configured seccomp profile location. Must be set if type is "Localhost".
  ///Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied. Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the
  ///container runtime default profile should be used. Unconfined - no profile should be
  ///applied.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates a profile defined in a file on the node should be used. The
  ///file's location relative to <kubelet-root-dir>/seccomp.
  ///- `"RuntimeDefault"` represents the default container runtime seccomp profile.
  ///- `"Unconfined"` indicates no seccomp profile is applied (A.K.A. unconfined).
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  FluffySeccompProfile({this.localhostProfile, required this.type});

  factory FluffySeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$FluffySeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySeccompProfileToJson(this);
}

@JsonSerializable()
class FluffyWindowsOptions {
  ///GMSACredentialSpec is where the GMSA admission webhook
  ///(https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA
  ///credential spec named by the GMSACredentialSpecName field.
  @JsonKey(name: 'gmsaCredentialSpec')
  String? gmsaCredentialSpec;

  ///GMSACredentialSpecName is the name of the GMSA credential spec to use.
  @JsonKey(name: 'gmsaCredentialSpecName')
  String? gmsaCredentialSpecName;

  ///HostProcess determines if a container should be run as a 'Host Process' container. All of
  ///a Pod's containers must have the same effective HostProcess value (it is not allowed to
  ///have a mix of HostProcess containers and non-HostProcess containers). In addition, if
  ///HostProcess is true then HostNetwork must also be set to true.
  @JsonKey(name: 'hostProcess')
  bool? hostProcess;

  ///The UserName in Windows to run the entrypoint of the container process. Defaults to the
  ///user specified in image metadata if unspecified. May also be set in PodSecurityContext.
  ///If set in both SecurityContext and PodSecurityContext, the value specified in
  ///SecurityContext takes precedence.
  @JsonKey(name: 'runAsUserName')
  String? runAsUserName;

  FluffyWindowsOptions({
    this.gmsaCredentialSpec,
    this.gmsaCredentialSpecName,
    this.hostProcess,
    this.runAsUserName,
  });

  factory FluffyWindowsOptions.fromJson(Map<String, dynamic> json) =>
      _$FluffyWindowsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyWindowsOptionsToJson(this);
}

@JsonSerializable()
class EphemeralContainerStartupProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  MagentaExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  IndecentGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  MagentaHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  MagentaTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  EphemeralContainerStartupProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory EphemeralContainerStartupProbe.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerStartupProbeFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerStartupProbeToJson(this);
}

@JsonSerializable()
class MagentaExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  MagentaExec({this.command});

  factory MagentaExec.fromJson(Map<String, dynamic> json) =>
      _$MagentaExecFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaExecToJson(this);
}

@JsonSerializable()
class IndecentGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  IndecentGrpc({required this.port, this.service});

  factory IndecentGrpc.fromJson(Map<String, dynamic> json) =>
      _$IndecentGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentGrpcToJson(this);
}

@JsonSerializable()
class MagentaHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<MagentaHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  MagentaHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory MagentaHttpGet.fromJson(Map<String, dynamic> json) =>
      _$MagentaHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaHttpGetToJson(this);
}

@JsonSerializable()
class MagentaHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  MagentaHttpHeader({required this.name, required this.value});

  factory MagentaHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$MagentaHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaHttpHeaderToJson(this);
}

@JsonSerializable()
class MagentaTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  MagentaTcpSocket({this.host, required this.port});

  factory MagentaTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$MagentaTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaTcpSocketToJson(this);
}

@JsonSerializable()
class EphemeralContainerVolumeDevice {
  ///devicePath is the path inside of the container that the device will be mapped to.
  @JsonKey(name: 'devicePath')
  String devicePath;

  ///name must match the name of a persistentVolumeClaim in the pod
  @JsonKey(name: 'name')
  String name;

  EphemeralContainerVolumeDevice({
    required this.devicePath,
    required this.name,
  });

  factory EphemeralContainerVolumeDevice.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerVolumeDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerVolumeDeviceToJson(this);
}

@JsonSerializable()
class EphemeralContainerVolumeMount {
  ///Path within the container at which the volume should be mounted.  Must not contain ':'.
  @JsonKey(name: 'mountPath')
  String mountPath;

  ///mountPropagation determines how mounts are propagated from the host to container and the
  ///other way around. When not set, MountPropagationNone is used. This field is beta in 1.10.
  ///When RecursiveReadOnly is set to IfPossible or to Enabled, MountPropagation must be None
  ///or unspecified (which defaults to None).
  ///
  ///Possible enum values:
  ///- `"Bidirectional"` means that the volume in a container will receive new mounts from the
  ///host or other containers, and its own mounts will be propagated from the container to the
  ///host or other containers. Note that this mode is recursively applied to all mounts in the
  ///volume ("rshared" in Linux terminology).
  ///- `"HostToContainer"` means that the volume in a container will receive new mounts from
  ///the host or other containers, but filesystems mounted inside the container won't be
  ///propagated to the host or other containers. Note that this mode is recursively applied to
  ///all mounts in the volume ("rslave" in Linux terminology).
  ///- `"None"` means that the volume in a container will not receive new mounts from the host
  ///or other containers, and filesystems mounted inside the container won't be propagated to
  ///the host or other containers. Note that this mode corresponds to "private" in Linux
  ///terminology.
  @JsonKey(name: 'mountPropagation')
  MountPropagation? mountPropagation;

  ///This must match the Name of a Volume.
  @JsonKey(name: 'name')
  String name;

  ///Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///RecursiveReadOnly specifies whether read-only mounts should be handled recursively.
  ///
  ///If ReadOnly is false, this field has no meaning and must be unspecified.
  ///
  ///If ReadOnly is true, and this field is set to Disabled, the mount is not made recursively
  ///read-only.  If this field is set to IfPossible, the mount is made recursively read-only,
  ///if it is supported by the container runtime.  If this field is set to Enabled, the mount
  ///is made recursively read-only if it is supported by the container runtime, otherwise the
  ///pod will not be started and an error will be generated to indicate the reason.
  ///
  ///If this field is set to IfPossible or Enabled, MountPropagation must be set to None (or
  ///be unspecified, which defaults to None).
  ///
  ///If this field is not specified, it is treated as an equivalent of Disabled.
  @JsonKey(name: 'recursiveReadOnly')
  String? recursiveReadOnly;

  ///Path within the volume from which the container's volume should be mounted. Defaults to
  ///"" (volume's root).
  @JsonKey(name: 'subPath')
  String? subPath;

  ///Expanded path within the volume from which the container's volume should be mounted.
  ///Behaves similarly to SubPath but environment variable references $(VAR_NAME) are expanded
  ///using the container's environment. Defaults to "" (volume's root). SubPathExpr and
  ///SubPath are mutually exclusive.
  @JsonKey(name: 'subPathExpr')
  String? subPathExpr;

  EphemeralContainerVolumeMount({
    required this.mountPath,
    this.mountPropagation,
    required this.name,
    this.readOnly,
    this.recursiveReadOnly,
    this.subPath,
    this.subPathExpr,
  });

  factory EphemeralContainerVolumeMount.fromJson(Map<String, dynamic> json) =>
      _$EphemeralContainerVolumeMountFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralContainerVolumeMountToJson(this);
}

@JsonSerializable()
class HostAlias {
  ///Hostnames for the above IP address.
  @JsonKey(name: 'hostnames')
  List<String?>? hostnames;

  ///IP address of the host file entry.
  @JsonKey(name: 'ip')
  String ip;

  HostAlias({this.hostnames, required this.ip});

  factory HostAlias.fromJson(Map<String, dynamic> json) =>
      _$HostAliasFromJson(json);

  Map<String, dynamic> toJson() => _$HostAliasToJson(this);
}

@JsonSerializable()
class ImagePullSecret {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ImagePullSecret({this.name});

  factory ImagePullSecret.fromJson(Map<String, dynamic> json) =>
      _$ImagePullSecretFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePullSecretToJson(this);
}

@JsonSerializable()
class InitContainer {
  ///Arguments to the entrypoint. The container image's CMD is used if this is not provided.
  ///Variable references $(VAR_NAME) are expanded using the container's environment. If a
  ///variable cannot be resolved, the reference in the input string will be unchanged. Double
  ///$$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e.
  ///"$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will
  ///never be expanded, regardless of whether the variable exists or not. Cannot be updated.
  ///More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'args')
  List<String?>? args;

  ///Entrypoint array. Not executed within a shell. The container image's ENTRYPOINT is used
  ///if this is not provided. Variable references $(VAR_NAME) are expanded using the
  ///container's environment. If a variable cannot be resolved, the reference in the input
  ///string will be unchanged. Double $$ are reduced to a single $, which allows for escaping
  ///the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal
  ///"$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the
  ///variable exists or not. Cannot be updated. More info:
  ///https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  @JsonKey(name: 'command')
  List<String?>? command;

  ///List of environment variables to set in the container. Cannot be updated.
  @JsonKey(name: 'env')
  List<InitContainerEnv?>? env;

  ///List of sources to populate environment variables in the container. The keys defined
  ///within a source may consist of any printable ASCII characters except '='. When a key
  ///exists in multiple sources, the value associated with the last source will take
  ///precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be
  ///updated.
  @JsonKey(name: 'envFrom')
  List<InitContainerEnvFrom?>? envFrom;

  ///Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
  ///This field is optional to allow higher level config management to default or override
  ///container images in workload controllers like Deployments and StatefulSets.
  @JsonKey(name: 'image')
  String? image;

  ///Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag
  ///is specified, or IfNotPresent otherwise. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/containers/images#updating-images
  ///
  ///Possible enum values:
  ///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
  ///fail If the pull fails.
  ///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
  ///will fail if the image isn't present and the pull fails.
  ///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
  ///Container will fail if the image isn't present
  @JsonKey(name: 'imagePullPolicy')
  PullPolicy? imagePullPolicy;

  ///Lifecycle describes actions that the management system should take in response to
  ///container lifecycle events. For the PostStart and PreStop lifecycle handlers, management
  ///of the container blocks until the action is complete, unless the container process fails,
  ///in which case the handler is aborted.
  @JsonKey(name: 'lifecycle')
  InitContainerLifecycle? lifecycle;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'livenessProbe')
  InitContainerLivenessProbe? livenessProbe;

  ///Name of the container specified as a DNS_LABEL. Each container in a pod must have a
  ///unique name (DNS_LABEL). Cannot be updated.
  @JsonKey(name: 'name')
  String name;

  ///List of ports to expose from the container. Not specifying a port here DOES NOT prevent
  ///that port from being exposed. Any port which is listening on the default "0.0.0.0"
  ///address inside a container will be accessible from the network. Modifying this array with
  ///strategic merge patch may corrupt the data. For more information See
  ///https://github.com/kubernetes/kubernetes/issues/108255. Cannot be updated.
  @JsonKey(name: 'ports')
  List<InitContainerPort?>? ports;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'readinessProbe')
  InitContainerReadinessProbe? readinessProbe;

  ///Resources resize policy for the container. This field cannot be set on ephemeral
  ///containers.
  @JsonKey(name: 'resizePolicy')
  List<InitContainerResizePolicy?>? resizePolicy;

  ///ResourceRequirements describes the compute resource requirements.
  @JsonKey(name: 'resources')
  InitContainerResources? resources;

  ///RestartPolicy defines the restart behavior of individual containers in a pod. This
  ///overrides the pod-level restart policy. When this field is not specified, the restart
  ///behavior is defined by the Pod's restart policy and the container type. Additionally,
  ///setting the RestartPolicy as "Always" for the init container will have the following
  ///effect: this init container will be continually restarted on exit until all regular
  ///containers have terminated. Once all regular containers have completed, all init
  ///containers with restartPolicy "Always" will be shut down. This lifecycle differs from
  ///normal init containers and is often referred to as a "sidecar" container. Although this
  ///init container still starts in the init container sequence, it does not wait for the
  ///container to complete before proceeding to the next init container. Instead, the next
  ///init container starts immediately after this init container is started, or after any
  ///startupProbe has successfully completed.
  @JsonKey(name: 'restartPolicy')
  String? restartPolicy;

  ///Represents a list of rules to be checked to determine if the container should be
  ///restarted on exit. The rules are evaluated in order. Once a rule matches a container exit
  ///condition, the remaining rules are ignored. If no rule matches the container exit
  ///condition, the Container-level restart policy determines the whether the container is
  ///restarted or not. Constraints on the rules: - At most 20 rules are allowed. - Rules can
  ///have the same action. - Identical rules are not forbidden in validations. When rules are
  ///specified, container MUST set RestartPolicy explicitly even it if matches the Pod's
  ///RestartPolicy.
  @JsonKey(name: 'restartPolicyRules')
  List<InitContainerRestartPolicyRule?>? restartPolicyRules;

  ///SecurityContext holds security configuration that will be applied to a container. Some
  ///fields are present in both SecurityContext and PodSecurityContext.  When both are set,
  ///the values in SecurityContext take precedence.
  @JsonKey(name: 'securityContext')
  InitContainerSecurityContext? securityContext;

  ///Probe describes a health check to be performed against a container to determine whether
  ///it is alive or ready to receive traffic.
  @JsonKey(name: 'startupProbe')
  InitContainerStartupProbe? startupProbe;

  ///Whether this container should allocate a buffer for stdin in the container runtime. If
  ///this is not set, reads from stdin in the container will always result in EOF. Default is
  ///false.
  @JsonKey(name: 'stdin')
  bool? stdin;

  ///Whether the container runtime should close the stdin channel after it has been opened by
  ///a single attach. When stdin is true the stdin stream will remain open across multiple
  ///attach sessions. If stdinOnce is set to true, stdin is opened on container start, is
  ///empty until the first client attaches to stdin, and then remains open and accepts data
  ///until the client disconnects, at which time stdin is closed and remains closed until the
  ///container is restarted. If this flag is false, a container processes that reads from
  ///stdin will never receive an EOF. Default is false
  @JsonKey(name: 'stdinOnce')
  bool? stdinOnce;

  ///Optional: Path at which the file to which the container's termination message will be
  ///written is mounted into the container's filesystem. Message written is intended to be
  ///brief final status, such as an assertion failure message. Will be truncated by the node
  ///if greater than 4096 bytes. The total message length across all containers will be
  ///limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
  @JsonKey(name: 'terminationMessagePath')
  String? terminationMessagePath;

  ///Indicate how the termination message should be populated. File will use the contents of
  ///terminationMessagePath to populate the container status message on both success and
  ///failure. FallbackToLogsOnError will use the last chunk of container log output if the
  ///termination message file is empty and the container exited with an error. The log output
  ///is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be
  ///updated.
  ///
  ///Possible enum values:
  ///- `"FallbackToLogsOnError"` will read the most recent contents of the container logs for
  ///the container status message when the container exits with an error and the
  ///terminationMessagePath has no contents.
  ///- `"File"` is the default behavior and will set the container status message to the
  ///contents of the container's terminationMessagePath when the container exits.
  @JsonKey(name: 'terminationMessagePolicy')
  TerminationMessagePolicy? terminationMessagePolicy;

  ///Whether this container should allocate a TTY for itself, also requires 'stdin' to be
  ///true. Default is false.
  @JsonKey(name: 'tty')
  bool? tty;

  ///volumeDevices is the list of block devices to be used by the container.
  @JsonKey(name: 'volumeDevices')
  List<InitContainerVolumeDevice?>? volumeDevices;

  ///Pod volumes to mount into the container's filesystem. Cannot be updated.
  @JsonKey(name: 'volumeMounts')
  List<InitContainerVolumeMount?>? volumeMounts;

  ///Container's working directory. If not specified, the container runtime's default will be
  ///used, which might be configured in the container image. Cannot be updated.
  @JsonKey(name: 'workingDir')
  String? workingDir;

  InitContainer({
    this.args,
    this.command,
    this.env,
    this.envFrom,
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports,
    this.readinessProbe,
    this.resizePolicy,
    this.resources,
    this.restartPolicy,
    this.restartPolicyRules,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices,
    this.volumeMounts,
    this.workingDir,
  });

  factory InitContainer.fromJson(Map<String, dynamic> json) =>
      _$InitContainerFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerToJson(this);
}

@JsonSerializable()
class InitContainerEnv {
  ///Name of the environment variable. May consist of any printable ASCII characters except
  ///'='.
  @JsonKey(name: 'name')
  String name;

  ///Variable references $(VAR_NAME) are expanded using the previously defined environment
  ///variables in the container and any service environment variables. If a variable cannot be
  ///resolved, the reference in the input string will be unchanged. Double $$ are reduced to a
  ///single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will
  ///produce the string literal "$(VAR_NAME)". Escaped references will never be expanded,
  ///regardless of whether the variable exists or not. Defaults to "".
  @JsonKey(name: 'value')
  String? value;

  ///EnvVarSource represents a source for the value of an EnvVar.
  @JsonKey(name: 'valueFrom')
  TentacledValueFrom? valueFrom;

  InitContainerEnv({required this.name, this.value, this.valueFrom});

  factory InitContainerEnv.fromJson(Map<String, dynamic> json) =>
      _$InitContainerEnvFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerEnvToJson(this);
}

@JsonSerializable()
class TentacledValueFrom {
  ///Selects a key from a ConfigMap.
  @JsonKey(name: 'configMapKeyRef')
  TentacledConfigMapKeyRef? configMapKeyRef;

  ///ObjectFieldSelector selects an APIVersioned field of an object.
  @JsonKey(name: 'fieldRef')
  TentacledFieldRef? fieldRef;

  ///FileKeySelector selects a key of the env file.
  @JsonKey(name: 'fileKeyRef')
  TentacledFileKeyRef? fileKeyRef;

  ///ResourceFieldSelector represents container resources (cpu, memory) and their output format
  @JsonKey(name: 'resourceFieldRef')
  TentacledResourceFieldRef? resourceFieldRef;

  ///SecretKeySelector selects a key of a Secret.
  @JsonKey(name: 'secretKeyRef')
  TentacledSecretKeyRef? secretKeyRef;

  TentacledValueFrom({
    this.configMapKeyRef,
    this.fieldRef,
    this.fileKeyRef,
    this.resourceFieldRef,
    this.secretKeyRef,
  });

  factory TentacledValueFrom.fromJson(Map<String, dynamic> json) =>
      _$TentacledValueFromFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledValueFromToJson(this);
}

@JsonSerializable()
class TentacledConfigMapKeyRef {
  ///The key to select.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  TentacledConfigMapKeyRef({required this.key, this.name, this.optional});

  factory TentacledConfigMapKeyRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledConfigMapKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledConfigMapKeyRefToJson(this);
}

@JsonSerializable()
class TentacledFieldRef {
  ///Version of the schema the FieldPath is written in terms of, defaults to "v1".
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Path of the field to select in the specified API version.
  @JsonKey(name: 'fieldPath')
  String fieldPath;

  TentacledFieldRef({this.apiVersion, required this.fieldPath});

  factory TentacledFieldRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFieldRefToJson(this);
}

@JsonSerializable()
class TentacledFileKeyRef {
  ///The key within the env file. An invalid key will prevent the pod from starting. The keys
  ///defined within a source may consist of any printable ASCII characters except '='. During
  ///Alpha stage of the EnvFiles feature gate, the key size is limited to 128 characters.
  @JsonKey(name: 'key')
  String key;

  ///Specify whether the file or its key must be defined. If the file or key does not exist,
  ///then the env var is not published. If optional is set to true and the specified key does
  ///not exist, the environment variable will not be set in the Pod's containers.
  ///
  ///If optional is set to false and the specified key does not exist, an error will be
  ///returned during Pod creation.
  @JsonKey(name: 'optional')
  bool? optional;

  ///The path within the volume from which to select the file. Must be relative and may not
  ///contain the '..' path or start with '..'.
  @JsonKey(name: 'path')
  String path;

  ///The name of the volume mount containing the env file.
  @JsonKey(name: 'volumeName')
  String volumeName;

  TentacledFileKeyRef({
    required this.key,
    this.optional,
    required this.path,
    required this.volumeName,
  });

  factory TentacledFileKeyRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledFileKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFileKeyRefToJson(this);
}

@JsonSerializable()
class TentacledResourceFieldRef {
  ///Container name: required for volumes, optional for env vars
  @JsonKey(name: 'containerName')
  String? containerName;
  @JsonKey(name: 'divisor')
  dynamic divisor;

  ///Required: resource to select
  @JsonKey(name: 'resource')
  String resource;

  TentacledResourceFieldRef({
    this.containerName,
    this.divisor,
    required this.resource,
  });

  factory TentacledResourceFieldRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledResourceFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledResourceFieldRefToJson(this);
}

@JsonSerializable()
class TentacledSecretKeyRef {
  ///The key of the secret to select from.  Must be a valid secret key.
  @JsonKey(name: 'key')
  String key;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  TentacledSecretKeyRef({required this.key, this.name, this.optional});

  factory TentacledSecretKeyRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledSecretKeyRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSecretKeyRefToJson(this);
}

@JsonSerializable()
class InitContainerEnvFrom {
  ///ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
  ///
  ///The contents of the target ConfigMap's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'configMapRef')
  TentacledConfigMapRef? configMapRef;

  ///Optional text to prepend to the name of each environment variable. May consist of any
  ///printable ASCII characters except '='.
  @JsonKey(name: 'prefix')
  String? prefix;

  ///SecretEnvSource selects a Secret to populate the environment variables with.
  ///
  ///The contents of the target Secret's Data field will represent the key-value pairs as
  ///environment variables.
  @JsonKey(name: 'secretRef')
  TentacledSecretRef? secretRef;

  InitContainerEnvFrom({this.configMapRef, this.prefix, this.secretRef});

  factory InitContainerEnvFrom.fromJson(Map<String, dynamic> json) =>
      _$InitContainerEnvFromFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerEnvFromToJson(this);
}

@JsonSerializable()
class TentacledConfigMapRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the ConfigMap must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  TentacledConfigMapRef({this.name, this.optional});

  factory TentacledConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledConfigMapRefToJson(this);
}

@JsonSerializable()
class TentacledSecretRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///Specify whether the Secret must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  TentacledSecretRef({this.name, this.optional});

  factory TentacledSecretRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSecretRefToJson(this);
}

@JsonSerializable()
class InitContainerLifecycle {
  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'postStart')
  TentacledPostStart? postStart;

  ///LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One
  ///and only one of the fields, except TCPSocket must be specified.
  @JsonKey(name: 'preStop')
  TentacledPreStop? preStop;

  ///StopSignal defines which signal will be sent to a container when it is being stopped. If
  ///not specified, the default is defined by the container runtime in use. StopSignal can
  ///only be set for Pods with a non-empty .spec.os.name
  ///
  ///Possible enum values:
  ///- `"SIGABRT"`
  ///- `"SIGALRM"`
  ///- `"SIGBUS"`
  ///- `"SIGCHLD"`
  ///- `"SIGCLD"`
  ///- `"SIGCONT"`
  ///- `"SIGFPE"`
  ///- `"SIGHUP"`
  ///- `"SIGILL"`
  ///- `"SIGINT"`
  ///- `"SIGIO"`
  ///- `"SIGIOT"`
  ///- `"SIGKILL"`
  ///- `"SIGPIPE"`
  ///- `"SIGPOLL"`
  ///- `"SIGPROF"`
  ///- `"SIGPWR"`
  ///- `"SIGQUIT"`
  ///- `"SIGRTMAX"`
  ///- `"SIGRTMAX-1"`
  ///- `"SIGRTMAX-10"`
  ///- `"SIGRTMAX-11"`
  ///- `"SIGRTMAX-12"`
  ///- `"SIGRTMAX-13"`
  ///- `"SIGRTMAX-14"`
  ///- `"SIGRTMAX-2"`
  ///- `"SIGRTMAX-3"`
  ///- `"SIGRTMAX-4"`
  ///- `"SIGRTMAX-5"`
  ///- `"SIGRTMAX-6"`
  ///- `"SIGRTMAX-7"`
  ///- `"SIGRTMAX-8"`
  ///- `"SIGRTMAX-9"`
  ///- `"SIGRTMIN"`
  ///- `"SIGRTMIN+1"`
  ///- `"SIGRTMIN+10"`
  ///- `"SIGRTMIN+11"`
  ///- `"SIGRTMIN+12"`
  ///- `"SIGRTMIN+13"`
  ///- `"SIGRTMIN+14"`
  ///- `"SIGRTMIN+15"`
  ///- `"SIGRTMIN+2"`
  ///- `"SIGRTMIN+3"`
  ///- `"SIGRTMIN+4"`
  ///- `"SIGRTMIN+5"`
  ///- `"SIGRTMIN+6"`
  ///- `"SIGRTMIN+7"`
  ///- `"SIGRTMIN+8"`
  ///- `"SIGRTMIN+9"`
  ///- `"SIGSEGV"`
  ///- `"SIGSTKFLT"`
  ///- `"SIGSTOP"`
  ///- `"SIGSYS"`
  ///- `"SIGTERM"`
  ///- `"SIGTRAP"`
  ///- `"SIGTSTP"`
  ///- `"SIGTTIN"`
  ///- `"SIGTTOU"`
  ///- `"SIGURG"`
  ///- `"SIGUSR1"`
  ///- `"SIGUSR2"`
  ///- `"SIGVTALRM"`
  ///- `"SIGWINCH"`
  ///- `"SIGXCPU"`
  ///- `"SIGXFSZ"`
  @JsonKey(name: 'stopSignal')
  StopSignal? stopSignal;

  InitContainerLifecycle({this.postStart, this.preStop, this.stopSignal});

  factory InitContainerLifecycle.fromJson(Map<String, dynamic> json) =>
      _$InitContainerLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerLifecycleToJson(this);
}

@JsonSerializable()
class TentacledPostStart {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  FriskyExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  FriskyHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  IndigoSleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  FriskyTcpSocket? tcpSocket;

  TentacledPostStart({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory TentacledPostStart.fromJson(Map<String, dynamic> json) =>
      _$TentacledPostStartFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPostStartToJson(this);
}

@JsonSerializable()
class FriskyExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  FriskyExec({this.command});

  factory FriskyExec.fromJson(Map<String, dynamic> json) =>
      _$FriskyExecFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyExecToJson(this);
}

@JsonSerializable()
class FriskyHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<FriskyHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  FriskyHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory FriskyHttpGet.fromJson(Map<String, dynamic> json) =>
      _$FriskyHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyHttpGetToJson(this);
}

@JsonSerializable()
class FriskyHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  FriskyHttpHeader({required this.name, required this.value});

  factory FriskyHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$FriskyHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyHttpHeaderToJson(this);
}

@JsonSerializable()
class IndigoSleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  IndigoSleep({required this.seconds});

  factory IndigoSleep.fromJson(Map<String, dynamic> json) =>
      _$IndigoSleepFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSleepToJson(this);
}

@JsonSerializable()
class FriskyTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  FriskyTcpSocket({this.host, required this.port});

  factory FriskyTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$FriskyTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyTcpSocketToJson(this);
}

@JsonSerializable()
class TentacledPreStop {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  MischievousExec? exec;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  MischievousHttpGet? httpGet;

  ///SleepAction describes a "sleep" action.
  @JsonKey(name: 'sleep')
  IndecentSleep? sleep;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  MischievousTcpSocket? tcpSocket;

  TentacledPreStop({this.exec, this.httpGet, this.sleep, this.tcpSocket});

  factory TentacledPreStop.fromJson(Map<String, dynamic> json) =>
      _$TentacledPreStopFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPreStopToJson(this);
}

@JsonSerializable()
class MischievousExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  MischievousExec({this.command});

  factory MischievousExec.fromJson(Map<String, dynamic> json) =>
      _$MischievousExecFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousExecToJson(this);
}

@JsonSerializable()
class MischievousHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<MischievousHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  MischievousHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory MischievousHttpGet.fromJson(Map<String, dynamic> json) =>
      _$MischievousHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousHttpGetToJson(this);
}

@JsonSerializable()
class MischievousHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  MischievousHttpHeader({required this.name, required this.value});

  factory MischievousHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$MischievousHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousHttpHeaderToJson(this);
}

@JsonSerializable()
class IndecentSleep {
  ///Seconds is the number of seconds to sleep.
  @JsonKey(name: 'seconds')
  int seconds;

  IndecentSleep({required this.seconds});

  factory IndecentSleep.fromJson(Map<String, dynamic> json) =>
      _$IndecentSleepFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSleepToJson(this);
}

@JsonSerializable()
class MischievousTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  MischievousTcpSocket({this.host, required this.port});

  factory MischievousTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$MischievousTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousTcpSocketToJson(this);
}

@JsonSerializable()
class InitContainerLivenessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  BraggadociousExec? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  HilariousGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  BraggadociousHttpGet? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  BraggadociousTcpSocket? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  InitContainerLivenessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory InitContainerLivenessProbe.fromJson(Map<String, dynamic> json) =>
      _$InitContainerLivenessProbeFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerLivenessProbeToJson(this);
}

@JsonSerializable()
class BraggadociousExec {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  BraggadociousExec({this.command});

  factory BraggadociousExec.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousExecFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousExecToJson(this);
}

@JsonSerializable()
class HilariousGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  HilariousGrpc({required this.port, this.service});

  factory HilariousGrpc.fromJson(Map<String, dynamic> json) =>
      _$HilariousGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousGrpcToJson(this);
}

@JsonSerializable()
class BraggadociousHttpGet {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<BraggadociousHttpHeader?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  BraggadociousHttpGet({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory BraggadociousHttpGet.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousHttpGetFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousHttpGetToJson(this);
}

@JsonSerializable()
class BraggadociousHttpHeader {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  BraggadociousHttpHeader({required this.name, required this.value});

  factory BraggadociousHttpHeader.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousHttpHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousHttpHeaderToJson(this);
}

@JsonSerializable()
class BraggadociousTcpSocket {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  BraggadociousTcpSocket({this.host, required this.port});

  factory BraggadociousTcpSocket.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousTcpSocketFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousTcpSocketToJson(this);
}

@JsonSerializable()
class InitContainerPort {
  ///Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x
  ///< 65536.
  @JsonKey(name: 'containerPort')
  int containerPort;

  ///What host IP to bind the external port to.
  @JsonKey(name: 'hostIP')
  String? hostIp;

  ///Number of port to expose on the host. If specified, this must be a valid port number, 0 <
  ///x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do
  ///not need this.
  @JsonKey(name: 'hostPort')
  int? hostPort;

  ///If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in
  ///a pod must have a unique name. Name for the port that can be referred to by services.
  @JsonKey(name: 'name')
  String? name;

  ///Protocol for port. Must be UDP, TCP, or SCTP. Defaults to "TCP".
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  InitContainerPort({
    required this.containerPort,
    this.hostIp,
    this.hostPort,
    this.name,
    this.protocol,
  });

  factory InitContainerPort.fromJson(Map<String, dynamic> json) =>
      _$InitContainerPortFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerPortToJson(this);
}

@JsonSerializable()
class InitContainerReadinessProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  Exec1? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  AmbitiousGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  HttpGet1? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  TcpSocket1? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  InitContainerReadinessProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory InitContainerReadinessProbe.fromJson(Map<String, dynamic> json) =>
      _$InitContainerReadinessProbeFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerReadinessProbeToJson(this);
}

@JsonSerializable()
class Exec1 {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  Exec1({this.command});

  factory Exec1.fromJson(Map<String, dynamic> json) => _$Exec1FromJson(json);

  Map<String, dynamic> toJson() => _$Exec1ToJson(this);
}

@JsonSerializable()
class AmbitiousGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  AmbitiousGrpc({required this.port, this.service});

  factory AmbitiousGrpc.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousGrpcToJson(this);
}

@JsonSerializable()
class HttpGet1 {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<HttpHeader1?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  HttpGet1({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory HttpGet1.fromJson(Map<String, dynamic> json) =>
      _$HttpGet1FromJson(json);

  Map<String, dynamic> toJson() => _$HttpGet1ToJson(this);
}

@JsonSerializable()
class HttpHeader1 {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  HttpHeader1({required this.name, required this.value});

  factory HttpHeader1.fromJson(Map<String, dynamic> json) =>
      _$HttpHeader1FromJson(json);

  Map<String, dynamic> toJson() => _$HttpHeader1ToJson(this);
}

@JsonSerializable()
class TcpSocket1 {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  TcpSocket1({this.host, required this.port});

  factory TcpSocket1.fromJson(Map<String, dynamic> json) =>
      _$TcpSocket1FromJson(json);

  Map<String, dynamic> toJson() => _$TcpSocket1ToJson(this);
}

@JsonSerializable()
class InitContainerResizePolicy {
  ///Name of the resource to which this resource resize policy applies. Supported values: cpu,
  ///memory.
  @JsonKey(name: 'resourceName')
  String resourceName;

  ///Restart policy to apply when specified resource is resized. If not specified, it defaults
  ///to NotRequired.
  @JsonKey(name: 'restartPolicy')
  String restartPolicy;

  InitContainerResizePolicy({
    required this.resourceName,
    required this.restartPolicy,
  });

  factory InitContainerResizePolicy.fromJson(Map<String, dynamic> json) =>
      _$InitContainerResizePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerResizePolicyToJson(this);
}

@JsonSerializable()
class InitContainerResources {
  ///Claims lists the names of resources, defined in spec.resourceClaims, that are used by
  ///this container.
  ///
  ///This field depends on the DynamicResourceAllocation feature gate.
  ///
  ///This field is immutable. It can only be set for containers.
  @JsonKey(name: 'claims')
  List<TentacledClaim?>? claims;

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

  InitContainerResources({this.claims, this.limits, this.requests});

  factory InitContainerResources.fromJson(Map<String, dynamic> json) =>
      _$InitContainerResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerResourcesToJson(this);
}

@JsonSerializable()
class TentacledClaim {
  ///Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this
  ///field is used. It makes that resource available inside a container.
  @JsonKey(name: 'name')
  String name;

  ///Request is the name chosen for a request in the referenced claim. If empty, everything
  ///from the claim is made available, otherwise only the result of this request.
  @JsonKey(name: 'request')
  String? request;

  TentacledClaim({required this.name, this.request});

  factory TentacledClaim.fromJson(Map<String, dynamic> json) =>
      _$TentacledClaimFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledClaimToJson(this);
}

@JsonSerializable()
class InitContainerRestartPolicyRule {
  ///Specifies the action taken on a container exit if the requirements are satisfied. The
  ///only possible value is "Restart" to restart the container.
  @JsonKey(name: 'action')
  String action;

  ///ContainerRestartRuleOnExitCodes describes the condition for handling an exited container
  ///based on its exit codes.
  @JsonKey(name: 'exitCodes')
  TentacledExitCodes? exitCodes;

  InitContainerRestartPolicyRule({required this.action, this.exitCodes});

  factory InitContainerRestartPolicyRule.fromJson(Map<String, dynamic> json) =>
      _$InitContainerRestartPolicyRuleFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerRestartPolicyRuleToJson(this);
}

@JsonSerializable()
class TentacledExitCodes {
  ///Represents the relationship between the container exit code(s) and the specified values.
  ///Possible values are: - In: the requirement is satisfied if the container exit code is in
  ///the
  ///set of specified values.
  ///- NotIn: the requirement is satisfied if the container exit code is
  ///not in the set of specified values.
  @JsonKey(name: 'operator')
  String exitCodesOperator;

  ///Specifies the set of values to check for container exit codes. At most 255 elements are
  ///allowed.
  @JsonKey(name: 'values')
  List<int?>? values;

  TentacledExitCodes({required this.exitCodesOperator, this.values});

  factory TentacledExitCodes.fromJson(Map<String, dynamic> json) =>
      _$TentacledExitCodesFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledExitCodesToJson(this);
}

@JsonSerializable()
class InitContainerSecurityContext {
  ///AllowPrivilegeEscalation controls whether a process can gain more privileges than its
  ///parent process. This bool directly controls if the no_new_privs flag will be set on the
  ///container process. AllowPrivilegeEscalation is true always when the container is: 1) run
  ///as Privileged 2) has CAP_SYS_ADMIN Note that this field cannot be set when spec.os.name
  ///is windows.
  @JsonKey(name: 'allowPrivilegeEscalation')
  bool? allowPrivilegeEscalation;

  ///AppArmorProfile defines a pod or container's AppArmor settings.
  @JsonKey(name: 'appArmorProfile')
  TentacledAppArmorProfile? appArmorProfile;

  ///Adds and removes POSIX capabilities from running containers.
  @JsonKey(name: 'capabilities')
  TentacledCapabilities? capabilities;

  ///Run container in privileged mode. Processes in privileged containers are essentially
  ///equivalent to root on the host. Defaults to false. Note that this field cannot be set
  ///when spec.os.name is windows.
  @JsonKey(name: 'privileged')
  bool? privileged;

  ///procMount denotes the type of proc mount to use for the containers. The default value is
  ///Default which uses the container runtime defaults for readonly paths and masked paths.
  ///This requires the ProcMountType feature flag to be enabled. Note that this field cannot
  ///be set when spec.os.name is windows.
  ///
  ///Possible enum values:
  ///- `"Default"` uses the container runtime defaults for readonly and masked paths for
  ////proc. Most container runtimes mask certain paths in /proc to avoid accidental security
  ///exposure of special devices or information.
  ///- `"Unmasked"` bypasses the default masking behavior of the container runtime and ensures
  ///the newly created /proc the container stays in tact with no modifications.
  @JsonKey(name: 'procMount')
  ProcMount? procMount;

  ///Whether this container has a read-only root filesystem. Default is false. Note that this
  ///field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'readOnlyRootFilesystem')
  bool? readOnlyRootFilesystem;

  ///The GID to run the entrypoint of the container process. Uses runtime default if unset.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence. Note that
  ///this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user. If true, the Kubelet will
  ///validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to
  ///start the container if it does. If unset or false, no such validation will be performed.
  ///May also be set in PodSecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process. Defaults to user specified in
  ///image metadata if unspecified. May also be set in PodSecurityContext.  If set in both
  ///SecurityContext and PodSecurityContext, the value specified in SecurityContext takes
  ///precedence. Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///SeccompProfile defines a pod/container's seccomp profile settings. Only one profile
  ///source may be set.
  @JsonKey(name: 'seccompProfile')
  TentacledSeccompProfile? seccompProfile;

  ///SELinuxOptions are the labels to be applied to the container
  @JsonKey(name: 'seLinuxOptions')
  TentacledSeLinuxOptions? seLinuxOptions;

  ///WindowsSecurityContextOptions contain Windows-specific options and credentials.
  @JsonKey(name: 'windowsOptions')
  TentacledWindowsOptions? windowsOptions;

  InitContainerSecurityContext({
    this.allowPrivilegeEscalation,
    this.appArmorProfile,
    this.capabilities,
    this.privileged,
    this.procMount,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxOptions,
    this.windowsOptions,
  });

  factory InitContainerSecurityContext.fromJson(Map<String, dynamic> json) =>
      _$InitContainerSecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerSecurityContextToJson(this);
}

@JsonSerializable()
class TentacledAppArmorProfile {
  ///localhostProfile indicates a profile loaded on the node that should be used. The profile
  ///must be preconfigured on the node to work. Must match the loaded name of the profile.
  ///Must be set if and only if type is "Localhost".
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of AppArmor profile will be applied. Valid options are:
  ///Localhost - a profile pre-loaded on the node.
  ///RuntimeDefault - the container runtime's default profile.
  ///Unconfined - no AppArmor enforcement.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates that a profile pre-loaded on the node should be used.
  ///- `"RuntimeDefault"` indicates that the container runtime's default AppArmor profile
  ///should be used.
  ///- `"Unconfined"` indicates that no AppArmor profile should be enforced.
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  TentacledAppArmorProfile({this.localhostProfile, required this.type});

  factory TentacledAppArmorProfile.fromJson(Map<String, dynamic> json) =>
      _$TentacledAppArmorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAppArmorProfileToJson(this);
}

@JsonSerializable()
class TentacledCapabilities {
  ///Added capabilities
  @JsonKey(name: 'add')
  List<String?>? add;

  ///Removed capabilities
  @JsonKey(name: 'drop')
  List<String?>? drop;

  TentacledCapabilities({this.add, this.drop});

  factory TentacledCapabilities.fromJson(Map<String, dynamic> json) =>
      _$TentacledCapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledCapabilitiesToJson(this);
}

@JsonSerializable()
class TentacledSeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  TentacledSeLinuxOptions({this.level, this.role, this.type, this.user});

  factory TentacledSeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$TentacledSeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSeLinuxOptionsToJson(this);
}

@JsonSerializable()
class TentacledSeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used. The
  ///profile must be preconfigured on the node to work. Must be a descending path, relative to
  ///the kubelet's configured seccomp profile location. Must be set if type is "Localhost".
  ///Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied. Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the
  ///container runtime default profile should be used. Unconfined - no profile should be
  ///applied.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates a profile defined in a file on the node should be used. The
  ///file's location relative to <kubelet-root-dir>/seccomp.
  ///- `"RuntimeDefault"` represents the default container runtime seccomp profile.
  ///- `"Unconfined"` indicates no seccomp profile is applied (A.K.A. unconfined).
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  TentacledSeccompProfile({this.localhostProfile, required this.type});

  factory TentacledSeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$TentacledSeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSeccompProfileToJson(this);
}

@JsonSerializable()
class TentacledWindowsOptions {
  ///GMSACredentialSpec is where the GMSA admission webhook
  ///(https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA
  ///credential spec named by the GMSACredentialSpecName field.
  @JsonKey(name: 'gmsaCredentialSpec')
  String? gmsaCredentialSpec;

  ///GMSACredentialSpecName is the name of the GMSA credential spec to use.
  @JsonKey(name: 'gmsaCredentialSpecName')
  String? gmsaCredentialSpecName;

  ///HostProcess determines if a container should be run as a 'Host Process' container. All of
  ///a Pod's containers must have the same effective HostProcess value (it is not allowed to
  ///have a mix of HostProcess containers and non-HostProcess containers). In addition, if
  ///HostProcess is true then HostNetwork must also be set to true.
  @JsonKey(name: 'hostProcess')
  bool? hostProcess;

  ///The UserName in Windows to run the entrypoint of the container process. Defaults to the
  ///user specified in image metadata if unspecified. May also be set in PodSecurityContext.
  ///If set in both SecurityContext and PodSecurityContext, the value specified in
  ///SecurityContext takes precedence.
  @JsonKey(name: 'runAsUserName')
  String? runAsUserName;

  TentacledWindowsOptions({
    this.gmsaCredentialSpec,
    this.gmsaCredentialSpecName,
    this.hostProcess,
    this.runAsUserName,
  });

  factory TentacledWindowsOptions.fromJson(Map<String, dynamic> json) =>
      _$TentacledWindowsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledWindowsOptionsToJson(this);
}

@JsonSerializable()
class InitContainerStartupProbe {
  ///ExecAction describes a "run in container" action.
  @JsonKey(name: 'exec')
  Exec2? exec;

  ///Minimum consecutive failures for the probe to be considered failed after having
  ///succeeded. Defaults to 3. Minimum value is 1.
  @JsonKey(name: 'failureThreshold')
  int? failureThreshold;

  ///GRPCAction specifies an action involving a GRPC service.
  @JsonKey(name: 'grpc')
  CunningGrpc? grpc;

  ///HTTPGetAction describes an action based on HTTP Get requests.
  @JsonKey(name: 'httpGet')
  HttpGet2? httpGet;

  ///Number of seconds after the container has started before liveness probes are initiated.
  ///More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'initialDelaySeconds')
  int? initialDelaySeconds;

  ///How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  @JsonKey(name: 'periodSeconds')
  int? periodSeconds;

  ///Minimum consecutive successes for the probe to be considered successful after having
  ///failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  @JsonKey(name: 'successThreshold')
  int? successThreshold;

  ///TCPSocketAction describes an action based on opening a socket
  @JsonKey(name: 'tcpSocket')
  TcpSocket2? tcpSocket;

  ///Optional duration in seconds the pod needs to terminate gracefully upon probe failure.
  ///The grace period is the duration in seconds after the processes running in the pod are
  ///sent a termination signal and the time when the processes are forcibly halted with a kill
  ///signal. Set this value longer than the expected cleanup time for your process. If this
  ///value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value
  ///overrides the value provided by the pod spec. Value must be non-negative integer. The
  ///value zero indicates stop immediately via the kill signal (no opportunity to shut down).
  ///This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate.
  ///Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  @JsonKey(name: 'terminationGracePeriodSeconds')
  int? terminationGracePeriodSeconds;

  ///Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is
  ///1. More info:
  ///https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  InitContainerStartupProbe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  factory InitContainerStartupProbe.fromJson(Map<String, dynamic> json) =>
      _$InitContainerStartupProbeFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerStartupProbeToJson(this);
}

@JsonSerializable()
class Exec2 {
  ///Command is the command line to execute inside the container, the working directory for
  ///the command  is root ('/') in the container's filesystem. The command is simply exec'd,
  ///it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To
  ///use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated
  ///as live/healthy and non-zero is unhealthy.
  @JsonKey(name: 'command')
  List<String?>? command;

  Exec2({this.command});

  factory Exec2.fromJson(Map<String, dynamic> json) => _$Exec2FromJson(json);

  Map<String, dynamic> toJson() => _$Exec2ToJson(this);
}

@JsonSerializable()
class CunningGrpc {
  ///Port number of the gRPC service. Number must be in the range 1 to 65535.
  @JsonKey(name: 'port')
  int port;

  ///Service is the name of the service to place in the gRPC HealthCheckRequest (see
  ///https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
  ///
  ///If this is not specified, the default behavior is defined by gRPC.
  @JsonKey(name: 'service')
  String? service;

  CunningGrpc({required this.port, this.service});

  factory CunningGrpc.fromJson(Map<String, dynamic> json) =>
      _$CunningGrpcFromJson(json);

  Map<String, dynamic> toJson() => _$CunningGrpcToJson(this);
}

@JsonSerializable()
class HttpGet2 {
  ///Host name to connect to, defaults to the pod IP. You probably want to set "Host" in
  ///httpHeaders instead.
  @JsonKey(name: 'host')
  String? host;

  ///Custom headers to set in the request. HTTP allows repeated headers.
  @JsonKey(name: 'httpHeaders')
  List<HttpHeader2?>? httpHeaders;

  ///Path to access on the HTTP server.
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'port')
  dynamic port;

  ///Scheme to use for connecting to the host. Defaults to HTTP.
  ///
  ///Possible enum values:
  ///- `"HTTP"` means that the scheme used will be http://
  ///- `"HTTPS"` means that the scheme used will be https://
  @JsonKey(name: 'scheme')
  Scheme? scheme;

  HttpGet2({
    this.host,
    this.httpHeaders,
    this.path,
    required this.port,
    this.scheme,
  });

  factory HttpGet2.fromJson(Map<String, dynamic> json) =>
      _$HttpGet2FromJson(json);

  Map<String, dynamic> toJson() => _$HttpGet2ToJson(this);
}

@JsonSerializable()
class HttpHeader2 {
  ///The header field name. This will be canonicalized upon output, so case-variant names will
  ///be understood as the same header.
  @JsonKey(name: 'name')
  String name;

  ///The header field value
  @JsonKey(name: 'value')
  String value;

  HttpHeader2({required this.name, required this.value});

  factory HttpHeader2.fromJson(Map<String, dynamic> json) =>
      _$HttpHeader2FromJson(json);

  Map<String, dynamic> toJson() => _$HttpHeader2ToJson(this);
}

@JsonSerializable()
class TcpSocket2 {
  ///Optional: Host name to connect to, defaults to the pod IP.
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'port')
  dynamic port;

  TcpSocket2({this.host, required this.port});

  factory TcpSocket2.fromJson(Map<String, dynamic> json) =>
      _$TcpSocket2FromJson(json);

  Map<String, dynamic> toJson() => _$TcpSocket2ToJson(this);
}

@JsonSerializable()
class InitContainerVolumeDevice {
  ///devicePath is the path inside of the container that the device will be mapped to.
  @JsonKey(name: 'devicePath')
  String devicePath;

  ///name must match the name of a persistentVolumeClaim in the pod
  @JsonKey(name: 'name')
  String name;

  InitContainerVolumeDevice({required this.devicePath, required this.name});

  factory InitContainerVolumeDevice.fromJson(Map<String, dynamic> json) =>
      _$InitContainerVolumeDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerVolumeDeviceToJson(this);
}

@JsonSerializable()
class InitContainerVolumeMount {
  ///Path within the container at which the volume should be mounted.  Must not contain ':'.
  @JsonKey(name: 'mountPath')
  String mountPath;

  ///mountPropagation determines how mounts are propagated from the host to container and the
  ///other way around. When not set, MountPropagationNone is used. This field is beta in 1.10.
  ///When RecursiveReadOnly is set to IfPossible or to Enabled, MountPropagation must be None
  ///or unspecified (which defaults to None).
  ///
  ///Possible enum values:
  ///- `"Bidirectional"` means that the volume in a container will receive new mounts from the
  ///host or other containers, and its own mounts will be propagated from the container to the
  ///host or other containers. Note that this mode is recursively applied to all mounts in the
  ///volume ("rshared" in Linux terminology).
  ///- `"HostToContainer"` means that the volume in a container will receive new mounts from
  ///the host or other containers, but filesystems mounted inside the container won't be
  ///propagated to the host or other containers. Note that this mode is recursively applied to
  ///all mounts in the volume ("rslave" in Linux terminology).
  ///- `"None"` means that the volume in a container will not receive new mounts from the host
  ///or other containers, and filesystems mounted inside the container won't be propagated to
  ///the host or other containers. Note that this mode corresponds to "private" in Linux
  ///terminology.
  @JsonKey(name: 'mountPropagation')
  MountPropagation? mountPropagation;

  ///This must match the Name of a Volume.
  @JsonKey(name: 'name')
  String name;

  ///Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///RecursiveReadOnly specifies whether read-only mounts should be handled recursively.
  ///
  ///If ReadOnly is false, this field has no meaning and must be unspecified.
  ///
  ///If ReadOnly is true, and this field is set to Disabled, the mount is not made recursively
  ///read-only.  If this field is set to IfPossible, the mount is made recursively read-only,
  ///if it is supported by the container runtime.  If this field is set to Enabled, the mount
  ///is made recursively read-only if it is supported by the container runtime, otherwise the
  ///pod will not be started and an error will be generated to indicate the reason.
  ///
  ///If this field is set to IfPossible or Enabled, MountPropagation must be set to None (or
  ///be unspecified, which defaults to None).
  ///
  ///If this field is not specified, it is treated as an equivalent of Disabled.
  @JsonKey(name: 'recursiveReadOnly')
  String? recursiveReadOnly;

  ///Path within the volume from which the container's volume should be mounted. Defaults to
  ///"" (volume's root).
  @JsonKey(name: 'subPath')
  String? subPath;

  ///Expanded path within the volume from which the container's volume should be mounted.
  ///Behaves similarly to SubPath but environment variable references $(VAR_NAME) are expanded
  ///using the container's environment. Defaults to "" (volume's root). SubPathExpr and
  ///SubPath are mutually exclusive.
  @JsonKey(name: 'subPathExpr')
  String? subPathExpr;

  InitContainerVolumeMount({
    required this.mountPath,
    this.mountPropagation,
    required this.name,
    this.readOnly,
    this.recursiveReadOnly,
    this.subPath,
    this.subPathExpr,
  });

  factory InitContainerVolumeMount.fromJson(Map<String, dynamic> json) =>
      _$InitContainerVolumeMountFromJson(json);

  Map<String, dynamic> toJson() => _$InitContainerVolumeMountToJson(this);
}

@JsonSerializable()
class Os {
  ///Name is the name of the operating system. The currently supported values are linux and
  ///windows. Additional value may be defined in future and can be one of:
  ///https://github.com/opencontainers/runtime-spec/blob/master/config.md#platform-specific-configuration
  ///Clients should expect to handle additional values and treat unrecognized values in this
  ///field as os: null
  @JsonKey(name: 'name')
  String name;

  Os({required this.name});

  factory Os.fromJson(Map<String, dynamic> json) => _$OsFromJson(json);

  Map<String, dynamic> toJson() => _$OsToJson(this);
}

///PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never,
///PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
///
///Possible enum values:
///- `"Never"` means that pod never preempts other pods with lower priority.
///- `"PreemptLowerPriority"` means that pod can preempt other pods with lower priority.
enum PreemptionPolicy {
  @JsonValue('Never')
  NEVER,
  @JsonValue('PreemptLowerPriority')
  PREEMPT_LOWER_PRIORITY,
}

final preemptionPolicyValues = EnumValues({
  'Never': PreemptionPolicy.NEVER,
  'PreemptLowerPriority': PreemptionPolicy.PREEMPT_LOWER_PRIORITY,
});

@JsonSerializable()
class ReadinessGate {
  ///ConditionType refers to a condition in the pod's condition list with matching type.
  @JsonKey(name: 'conditionType')
  String conditionType;

  ReadinessGate({required this.conditionType});

  factory ReadinessGate.fromJson(Map<String, dynamic> json) =>
      _$ReadinessGateFromJson(json);

  Map<String, dynamic> toJson() => _$ReadinessGateToJson(this);
}

@JsonSerializable()
class ResourceClaim {
  ///Name uniquely identifies this resource claim inside the pod. This must be a DNS_LABEL.
  @JsonKey(name: 'name')
  String name;

  ///ResourceClaimName is the name of a ResourceClaim object in the same namespace as this
  ///pod.
  ///
  ///Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
  @JsonKey(name: 'resourceClaimName')
  String? resourceClaimName;

  ///ResourceClaimTemplateName is the name of a ResourceClaimTemplate object in the same
  ///namespace as this pod.
  ///
  ///The template will be used to create a new ResourceClaim, which will be bound to this pod.
  ///When this pod is deleted, the ResourceClaim will also be deleted. The pod name and
  ///resource name, along with a generated component, will be used to form a unique name for
  ///the ResourceClaim, which will be recorded in pod.status.resourceClaimStatuses.
  ///
  ///This field is immutable and no changes will be made to the corresponding ResourceClaim by
  ///the control plane after creating the ResourceClaim.
  ///
  ///Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
  @JsonKey(name: 'resourceClaimTemplateName')
  String? resourceClaimTemplateName;

  ResourceClaim({
    required this.name,
    this.resourceClaimName,
    this.resourceClaimTemplateName,
  });

  factory ResourceClaim.fromJson(Map<String, dynamic> json) =>
      _$ResourceClaimFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceClaimToJson(this);
}

@JsonSerializable()
class PurpleResources {
  ///Claims lists the names of resources, defined in spec.resourceClaims, that are used by
  ///this container.
  ///
  ///This field depends on the DynamicResourceAllocation feature gate.
  ///
  ///This field is immutable. It can only be set for containers.
  @JsonKey(name: 'claims')
  List<StickyClaim?>? claims;

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

  PurpleResources({this.claims, this.limits, this.requests});

  factory PurpleResources.fromJson(Map<String, dynamic> json) =>
      _$PurpleResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleResourcesToJson(this);
}

@JsonSerializable()
class StickyClaim {
  ///Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this
  ///field is used. It makes that resource available inside a container.
  @JsonKey(name: 'name')
  String name;

  ///Request is the name chosen for a request in the referenced claim. If empty, everything
  ///from the claim is made available, otherwise only the result of this request.
  @JsonKey(name: 'request')
  String? request;

  StickyClaim({required this.name, this.request});

  factory StickyClaim.fromJson(Map<String, dynamic> json) =>
      _$StickyClaimFromJson(json);

  Map<String, dynamic> toJson() => _$StickyClaimToJson(this);
}

///Restart policy for all containers within the pod. One of Always, OnFailure, Never. In
///some contexts, only a subset of those values may be permitted. Default to Always. More
///info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
///
///Possible enum values:
///- `"Always"`
///- `"Never"`
///- `"OnFailure"`
enum RestartPolicy {
  @JsonValue('Always')
  ALWAYS,
  @JsonValue('Never')
  NEVER,
  @JsonValue('OnFailure')
  ON_FAILURE,
}

final restartPolicyValues = EnumValues({
  'Always': RestartPolicy.ALWAYS,
  'Never': RestartPolicy.NEVER,
  'OnFailure': RestartPolicy.ON_FAILURE,
});

@JsonSerializable()
class SchedulingGate {
  ///Name of the scheduling gate. Each scheduling gate must have a unique name field.
  @JsonKey(name: 'name')
  String name;

  SchedulingGate({required this.name});

  factory SchedulingGate.fromJson(Map<String, dynamic> json) =>
      _$SchedulingGateFromJson(json);

  Map<String, dynamic> toJson() => _$SchedulingGateToJson(this);
}

@JsonSerializable()
class SpecSecurityContext {
  ///AppArmorProfile defines a pod or container's AppArmor settings.
  @JsonKey(name: 'appArmorProfile')
  StickyAppArmorProfile? appArmorProfile;

  ///A special supplemental group that applies to all containers in a pod. Some volume types
  ///allow the Kubelet to change the ownership of that volume to be owned by the pod:
  ///
  ///1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the
  ///volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw----
  ///
  ///If unset, the Kubelet will not modify the ownership and permissions of any volume. Note
  ///that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'fsGroup')
  int? fsGroup;

  ///fsGroupChangePolicy defines behavior of changing ownership and permission of the volume
  ///before being exposed inside Pod. This field will only apply to volume types which support
  ///fsGroup based ownership(and permissions). It will have no effect on ephemeral volume
  ///types such as: secret, configmaps and emptydir. Valid values are "OnRootMismatch" and
  ///"Always". If not specified, "Always" is used. Note that this field cannot be set when
  ///spec.os.name is windows.
  ///
  ///Possible enum values:
  ///- `"Always"` indicates that volume's ownership and permissions should always be changed
  ///whenever volume is mounted inside a Pod. This the default behavior.
  ///- `"OnRootMismatch"` indicates that volume's ownership and permissions will be changed
  ///only when permission and ownership of root directory does not match with expected
  ///permissions on the volume. This can help shorten the time it takes to change ownership
  ///and permissions of a volume.
  @JsonKey(name: 'fsGroupChangePolicy')
  FsGroupChangePolicy? fsGroupChangePolicy;

  ///The GID to run the entrypoint of the container process. Uses runtime default if unset.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence for that
  ///container. Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user. If true, the Kubelet will
  ///validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to
  ///start the container if it does. If unset or false, no such validation will be performed.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process. Defaults to user specified in
  ///image metadata if unspecified. May also be set in SecurityContext.  If set in both
  ///SecurityContext and PodSecurityContext, the value specified in SecurityContext takes
  ///precedence for that container. Note that this field cannot be set when spec.os.name is
  ///windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///SeccompProfile defines a pod/container's seccomp profile settings. Only one profile
  ///source may be set.
  @JsonKey(name: 'seccompProfile')
  StickySeccompProfile? seccompProfile;

  ///seLinuxChangePolicy defines how the container's SELinux label is applied to all volumes
  ///used by the Pod. It has no effect on nodes that do not support SELinux or to volumes does
  ///not support SELinux. Valid values are "MountOption" and "Recursive".
  ///
  ///"Recursive" means relabeling of all files on all Pod volumes by the container runtime.
  ///This may be slow for large volumes, but allows mixing privileged and unprivileged Pods
  ///sharing the same volume on the same node.
  ///
  ///"MountOption" mounts all eligible Pod volumes with `-o context` mount option. This
  ///requires all Pods that share the same volume to use the same SELinux label. It is not
  ///possible to share the same volume among privileged and unprivileged Pods. Eligible
  ///volumes are in-tree FibreChannel and iSCSI volumes, and all CSI volumes whose CSI driver
  ///announces SELinux support by setting spec.seLinuxMount: true in their CSIDriver instance.
  ///Other volumes are always re-labelled recursively. "MountOption" value is allowed only
  ///when SELinuxMount feature gate is enabled.
  ///
  ///If not specified and SELinuxMount feature gate is enabled, "MountOption" is used. If not
  ///specified and SELinuxMount feature gate is disabled, "MountOption" is used for
  ///ReadWriteOncePod volumes and "Recursive" for all other volumes.
  ///
  ///This field affects only Pods that have SELinux label set, either in PodSecurityContext or
  ///in SecurityContext of all containers.
  ///
  ///All Pods that use the same volume should use the same seLinuxChangePolicy, otherwise some
  ///pods can get stuck in ContainerCreating state. Note that this field cannot be set when
  ///spec.os.name is windows.
  @JsonKey(name: 'seLinuxChangePolicy')
  String? seLinuxChangePolicy;

  ///SELinuxOptions are the labels to be applied to the container
  @JsonKey(name: 'seLinuxOptions')
  StickySeLinuxOptions? seLinuxOptions;

  ///A list of groups applied to the first process run in each container, in addition to the
  ///container's primary GID and fsGroup (if specified).  If the SupplementalGroupsPolicy
  ///feature is enabled, the supplementalGroupsPolicy field determines whether these are in
  ///addition to or instead of any group memberships defined in the container image. If
  ///unspecified, no additional groups are added, though group memberships defined in the
  ///container image may still be used, depending on the supplementalGroupsPolicy field. Note
  ///that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'supplementalGroups')
  List<int?>? supplementalGroups;

  ///Defines how supplemental groups of the first container processes are calculated. Valid
  ///values are "Merge" and "Strict". If not specified, "Merge" is used. (Alpha) Using the
  ///field requires the SupplementalGroupsPolicy feature gate to be enabled and the container
  ///runtime must implement support for this feature. Note that this field cannot be set when
  ///spec.os.name is windows.
  ///
  ///Possible enum values:
  ///- `"Merge"` means that the container's provided SupplementalGroups and FsGroup (specified
  ///in SecurityContext) will be merged with the primary user's groups as defined in the
  ///container image (in /etc/group).
  ///- `"Strict"` means that the container's provided SupplementalGroups and FsGroup
  ///(specified in SecurityContext) will be used instead of any groups defined in the
  ///container image.
  @JsonKey(name: 'supplementalGroupsPolicy')
  SupplementalGroupsPolicy? supplementalGroupsPolicy;

  ///Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls
  ///(by the container runtime) might fail to launch. Note that this field cannot be set when
  ///spec.os.name is windows.
  @JsonKey(name: 'sysctls')
  List<Sysctl?>? sysctls;

  ///WindowsSecurityContextOptions contain Windows-specific options and credentials.
  @JsonKey(name: 'windowsOptions')
  StickyWindowsOptions? windowsOptions;

  SpecSecurityContext({
    this.appArmorProfile,
    this.fsGroup,
    this.fsGroupChangePolicy,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxChangePolicy,
    this.seLinuxOptions,
    this.supplementalGroups,
    this.supplementalGroupsPolicy,
    this.sysctls,
    this.windowsOptions,
  });

  factory SpecSecurityContext.fromJson(Map<String, dynamic> json) =>
      _$SpecSecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$SpecSecurityContextToJson(this);
}

@JsonSerializable()
class StickyAppArmorProfile {
  ///localhostProfile indicates a profile loaded on the node that should be used. The profile
  ///must be preconfigured on the node to work. Must match the loaded name of the profile.
  ///Must be set if and only if type is "Localhost".
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of AppArmor profile will be applied. Valid options are:
  ///Localhost - a profile pre-loaded on the node.
  ///RuntimeDefault - the container runtime's default profile.
  ///Unconfined - no AppArmor enforcement.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates that a profile pre-loaded on the node should be used.
  ///- `"RuntimeDefault"` indicates that the container runtime's default AppArmor profile
  ///should be used.
  ///- `"Unconfined"` indicates that no AppArmor profile should be enforced.
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  StickyAppArmorProfile({this.localhostProfile, required this.type});

  factory StickyAppArmorProfile.fromJson(Map<String, dynamic> json) =>
      _$StickyAppArmorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$StickyAppArmorProfileToJson(this);
}

///fsGroupChangePolicy defines behavior of changing ownership and permission of the volume
///before being exposed inside Pod. This field will only apply to volume types which support
///fsGroup based ownership(and permissions). It will have no effect on ephemeral volume
///types such as: secret, configmaps and emptydir. Valid values are "OnRootMismatch" and
///"Always". If not specified, "Always" is used. Note that this field cannot be set when
///spec.os.name is windows.
///
///Possible enum values:
///- `"Always"` indicates that volume's ownership and permissions should always be changed
///whenever volume is mounted inside a Pod. This the default behavior.
///- `"OnRootMismatch"` indicates that volume's ownership and permissions will be changed
///only when permission and ownership of root directory does not match with expected
///permissions on the volume. This can help shorten the time it takes to change ownership
///and permissions of a volume.
enum FsGroupChangePolicy {
  @JsonValue('Always')
  ALWAYS,
  @JsonValue('OnRootMismatch')
  ON_ROOT_MISMATCH,
}

final fsGroupChangePolicyValues = EnumValues({
  'Always': FsGroupChangePolicy.ALWAYS,
  'OnRootMismatch': FsGroupChangePolicy.ON_ROOT_MISMATCH,
});

@JsonSerializable()
class StickySeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  StickySeLinuxOptions({this.level, this.role, this.type, this.user});

  factory StickySeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$StickySeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$StickySeLinuxOptionsToJson(this);
}

@JsonSerializable()
class StickySeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used. The
  ///profile must be preconfigured on the node to work. Must be a descending path, relative to
  ///the kubelet's configured seccomp profile location. Must be set if type is "Localhost".
  ///Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied. Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the
  ///container runtime default profile should be used. Unconfined - no profile should be
  ///applied.
  ///
  ///Possible enum values:
  ///- `"Localhost"` indicates a profile defined in a file on the node should be used. The
  ///file's location relative to <kubelet-root-dir>/seccomp.
  ///- `"RuntimeDefault"` represents the default container runtime seccomp profile.
  ///- `"Unconfined"` indicates no seccomp profile is applied (A.K.A. unconfined).
  @JsonKey(name: 'type')
  AppArmorProfileType type;

  StickySeccompProfile({this.localhostProfile, required this.type});

  factory StickySeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$StickySeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$StickySeccompProfileToJson(this);
}

///Defines how supplemental groups of the first container processes are calculated. Valid
///values are "Merge" and "Strict". If not specified, "Merge" is used. (Alpha) Using the
///field requires the SupplementalGroupsPolicy feature gate to be enabled and the container
///runtime must implement support for this feature. Note that this field cannot be set when
///spec.os.name is windows.
///
///Possible enum values:
///- `"Merge"` means that the container's provided SupplementalGroups and FsGroup (specified
///in SecurityContext) will be merged with the primary user's groups as defined in the
///container image (in /etc/group).
///- `"Strict"` means that the container's provided SupplementalGroups and FsGroup
///(specified in SecurityContext) will be used instead of any groups defined in the
///container image.
enum SupplementalGroupsPolicy {
  @JsonValue('Merge')
  MERGE,
  @JsonValue('Strict')
  STRICT,
}

final supplementalGroupsPolicyValues = EnumValues({
  'Merge': SupplementalGroupsPolicy.MERGE,
  'Strict': SupplementalGroupsPolicy.STRICT,
});

@JsonSerializable()
class Sysctl {
  ///Name of a property to set
  @JsonKey(name: 'name')
  String name;

  ///Value of a property to set
  @JsonKey(name: 'value')
  String value;

  Sysctl({required this.name, required this.value});

  factory Sysctl.fromJson(Map<String, dynamic> json) => _$SysctlFromJson(json);

  Map<String, dynamic> toJson() => _$SysctlToJson(this);
}

@JsonSerializable()
class StickyWindowsOptions {
  ///GMSACredentialSpec is where the GMSA admission webhook
  ///(https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA
  ///credential spec named by the GMSACredentialSpecName field.
  @JsonKey(name: 'gmsaCredentialSpec')
  String? gmsaCredentialSpec;

  ///GMSACredentialSpecName is the name of the GMSA credential spec to use.
  @JsonKey(name: 'gmsaCredentialSpecName')
  String? gmsaCredentialSpecName;

  ///HostProcess determines if a container should be run as a 'Host Process' container. All of
  ///a Pod's containers must have the same effective HostProcess value (it is not allowed to
  ///have a mix of HostProcess containers and non-HostProcess containers). In addition, if
  ///HostProcess is true then HostNetwork must also be set to true.
  @JsonKey(name: 'hostProcess')
  bool? hostProcess;

  ///The UserName in Windows to run the entrypoint of the container process. Defaults to the
  ///user specified in image metadata if unspecified. May also be set in PodSecurityContext.
  ///If set in both SecurityContext and PodSecurityContext, the value specified in
  ///SecurityContext takes precedence.
  @JsonKey(name: 'runAsUserName')
  String? runAsUserName;

  StickyWindowsOptions({
    this.gmsaCredentialSpec,
    this.gmsaCredentialSpecName,
    this.hostProcess,
    this.runAsUserName,
  });

  factory StickyWindowsOptions.fromJson(Map<String, dynamic> json) =>
      _$StickyWindowsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$StickyWindowsOptionsToJson(this);
}

@JsonSerializable()
class Toleration {
  ///Effect indicates the taint effect to match. Empty means match all taint effects. When
  ///specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
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
  Effect? effect;

  ///Key is the taint key that the toleration applies to. Empty means match all taint keys. If
  ///the key is empty, operator must be Exists; this combination means to match all values and
  ///all keys.
  @JsonKey(name: 'key')
  String? key;

  ///Operator represents a key's relationship to the value. Valid operators are Exists, Equal,
  ///Lt, and Gt. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod
  ///can tolerate all taints of a particular category. Lt and Gt perform numeric comparisons
  ///(requires feature gate TaintTolerationComparisonOperators).
  ///
  ///Possible enum values:
  ///- `"Equal"`
  ///- `"Exists"`
  ///- `"Gt"`
  ///- `"Lt"`
  @JsonKey(name: 'operator')
  TolerationOperator? tolerationOperator;

  ///TolerationSeconds represents the period of time the toleration (which must be of effect
  ///NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not
  ///set, which means tolerate the taint forever (do not evict). Zero and negative values will
  ///be treated as 0 (evict immediately) by the system.
  @JsonKey(name: 'tolerationSeconds')
  int? tolerationSeconds;

  ///Value is the taint value the toleration matches to. If the operator is Exists, the value
  ///should be empty, otherwise just a regular string.
  @JsonKey(name: 'value')
  String? value;

  Toleration({
    this.effect,
    this.key,
    this.tolerationOperator,
    this.tolerationSeconds,
    this.value,
  });

  factory Toleration.fromJson(Map<String, dynamic> json) =>
      _$TolerationFromJson(json);

  Map<String, dynamic> toJson() => _$TolerationToJson(this);
}

///Effect indicates the taint effect to match. Empty means match all taint effects. When
///specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
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

///Operator represents a key's relationship to the value. Valid operators are Exists, Equal,
///Lt, and Gt. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod
///can tolerate all taints of a particular category. Lt and Gt perform numeric comparisons
///(requires feature gate TaintTolerationComparisonOperators).
///
///Possible enum values:
///- `"Equal"`
///- `"Exists"`
///- `"Gt"`
///- `"Lt"`
enum TolerationOperator {
  @JsonValue('Equal')
  EQUAL,
  @JsonValue('Exists')
  EXISTS,
  @JsonValue('Gt')
  GT,
  @JsonValue('Lt')
  LT,
}

final tolerationOperatorValues = EnumValues({
  'Equal': TolerationOperator.EQUAL,
  'Exists': TolerationOperator.EXISTS,
  'Gt': TolerationOperator.GT,
  'Lt': TolerationOperator.LT,
});

@JsonSerializable()
class TopologySpreadConstraint {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  TopologySpreadConstraintLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be
  ///calculated. The keys are used to lookup values from the incoming pod labels, those
  ///key-value labels are ANDed with labelSelector to select the group of existing pods over
  ///which spreading will be calculated for the incoming pod. The same key is forbidden to
  ///exist in both MatchLabelKeys and LabelSelector. MatchLabelKeys cannot be set when
  ///LabelSelector isn't set. Keys that don't exist in the incoming pod labels will be
  ///ignored. A null or empty list means only match against labelSelector.
  ///
  ///This is a beta field and requires the MatchLabelKeysInPodTopologySpread feature gate to
  ///be enabled (enabled by default).
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MaxSkew describes the degree to which pods may be unevenly distributed. When
  ///`whenUnsatisfiable=DoNotSchedule`, it is the maximum permitted difference between the
  ///number of matching pods in the target topology and the global minimum. The global minimum
  ///is the minimum number of matching pods in an eligible domain or zero if the number of
  ///eligible domains is less than MinDomains. For example, in a 3-zone cluster, MaxSkew is
  ///set to 1, and pods with the same labelSelector spread as 2/2/1: In this case, the global
  ///minimum is 1. | zone1 | zone2 | zone3 | |  P P  |  P P  |   P   | - if MaxSkew is 1,
  ///incoming pod can only be scheduled to zone3 to become 2/2/2; scheduling it onto
  ///zone1(zone2) would make the ActualSkew(3-1) on zone1(zone2) violate MaxSkew(1). - if
  ///MaxSkew is 2, incoming pod can be scheduled onto any zone. When
  ///`whenUnsatisfiable=ScheduleAnyway`, it is used to give higher precedence to topologies
  ///that satisfy it. It's a required field. Default value is 1 and 0 is not allowed.
  @JsonKey(name: 'maxSkew')
  int maxSkew;

  ///MinDomains indicates a minimum number of eligible domains. When the number of eligible
  ///domains with matching topology keys is less than minDomains, Pod Topology Spread treats
  ///"global minimum" as 0, and then the calculation of Skew is performed. And when the number
  ///of eligible domains with matching topology keys equals or greater than minDomains, this
  ///value has no effect on scheduling. As a result, when the number of eligible domains is
  ///less than minDomains, scheduler won't schedule more than maxSkew Pods to those domains.
  ///If value is nil, the constraint behaves as if MinDomains is equal to 1. Valid values are
  ///integers greater than 0. When value is not nil, WhenUnsatisfiable must be DoNotSchedule.
  ///
  ///For example, in a 3-zone cluster, MaxSkew is set to 2, MinDomains is set to 5 and pods
  ///with the same labelSelector spread as 2/2/2: | zone1 | zone2 | zone3 | |  P P  |  P P  |
  ///P P  | The number of domains is less than 5(MinDomains), so "global minimum" is treated
  ///as 0. In this situation, new pod with the same labelSelector cannot be scheduled, because
  ///computed skew will be 3(3 - 0) if new Pod is scheduled to any of the three zones, it will
  ///violate MaxSkew.
  @JsonKey(name: 'minDomains')
  int? minDomains;

  ///NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when
  ///calculating pod topology spread skew. Options are: - Honor: only nodes matching
  ///nodeAffinity/nodeSelector are included in the calculations. - Ignore:
  ///nodeAffinity/nodeSelector are ignored. All nodes are included in the calculations.
  ///
  ///If this value is nil, the behavior is equivalent to the Honor policy.
  ///
  ///Possible enum values:
  ///- `"Honor"` means use this scheduling directive when calculating pod topology spread
  ///skew.
  ///- `"Ignore"` means ignore this scheduling directive when calculating pod topology spread
  ///skew.
  @JsonKey(name: 'nodeAffinityPolicy')
  NodePolicy? nodeAffinityPolicy;

  ///NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology
  ///spread skew. Options are: - Honor: nodes without taints, along with tainted nodes for
  ///which the incoming pod has a toleration, are included. - Ignore: node taints are ignored.
  ///All nodes are included.
  ///
  ///If this value is nil, the behavior is equivalent to the Ignore policy.
  ///
  ///Possible enum values:
  ///- `"Honor"` means use this scheduling directive when calculating pod topology spread
  ///skew.
  ///- `"Ignore"` means ignore this scheduling directive when calculating pod topology spread
  ///skew.
  @JsonKey(name: 'nodeTaintsPolicy')
  NodePolicy? nodeTaintsPolicy;

  ///TopologyKey is the key of node labels. Nodes that have a label with this key and
  ///identical values are considered to be in the same topology. We consider each <key, value>
  ///as a "bucket", and try to put balanced number of pods into each bucket. We define a
  ///domain as a particular instance of a topology. Also, we define an eligible domain as a
  ///domain whose nodes meet the requirements of nodeAffinityPolicy and nodeTaintsPolicy. e.g.
  ///If TopologyKey is "kubernetes.io/hostname", each Node is a domain of that topology. And,
  ///if TopologyKey is "topology.kubernetes.io/zone", each zone is a domain of that topology.
  ///It's a required field.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  ///WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread
  ///constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. -
  ///ScheduleAnyway tells the scheduler to schedule the pod in any location,
  ///but giving higher precedence to topologies that would help reduce the
  ///skew.
  ///A constraint is considered "Unsatisfiable" for an incoming pod if and only if every
  ///possible node assignment for that pod would violate "MaxSkew" on some topology. For
  ///example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector
  ///spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable
  ///is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become
  ///3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the
  ///cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a
  ///required field.
  ///
  ///Possible enum values:
  ///- `"DoNotSchedule"` instructs the scheduler not to schedule the pod when constraints are
  ///not satisfied.
  ///- `"ScheduleAnyway"` instructs the scheduler to schedule the pod even if constraints are
  ///not satisfied.
  @JsonKey(name: 'whenUnsatisfiable')
  WhenUnsatisfiable whenUnsatisfiable;

  TopologySpreadConstraint({
    this.labelSelector,
    this.matchLabelKeys,
    required this.maxSkew,
    this.minDomains,
    this.nodeAffinityPolicy,
    this.nodeTaintsPolicy,
    required this.topologyKey,
    required this.whenUnsatisfiable,
  });

  factory TopologySpreadConstraint.fromJson(Map<String, dynamic> json) =>
      _$TopologySpreadConstraintFromJson(json);

  Map<String, dynamic> toJson() => _$TopologySpreadConstraintToJson(this);
}

@JsonSerializable()
class TopologySpreadConstraintLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<CunningMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TopologySpreadConstraintLabelSelector({
    this.matchExpressions,
    this.matchLabels,
  });

  factory TopologySpreadConstraintLabelSelector.fromJson(
    Map<String, dynamic> json,
  ) => _$TopologySpreadConstraintLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TopologySpreadConstraintLabelSelectorToJson(this);
}

@JsonSerializable()
class CunningMatchExpression {
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

  CunningMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory CunningMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$CunningMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$CunningMatchExpressionToJson(this);
}

///NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when
///calculating pod topology spread skew. Options are: - Honor: only nodes matching
///nodeAffinity/nodeSelector are included in the calculations. - Ignore:
///nodeAffinity/nodeSelector are ignored. All nodes are included in the calculations.
///
///If this value is nil, the behavior is equivalent to the Honor policy.
///
///Possible enum values:
///- `"Honor"` means use this scheduling directive when calculating pod topology spread
///skew.
///- `"Ignore"` means ignore this scheduling directive when calculating pod topology spread
///skew.
///
///NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology
///spread skew. Options are: - Honor: nodes without taints, along with tainted nodes for
///which the incoming pod has a toleration, are included. - Ignore: node taints are ignored.
///All nodes are included.
///
///If this value is nil, the behavior is equivalent to the Ignore policy.
///
///Possible enum values:
///- `"Honor"` means use this scheduling directive when calculating pod topology spread
///skew.
///- `"Ignore"` means ignore this scheduling directive when calculating pod topology spread
///skew.
enum NodePolicy {
  @JsonValue('Honor')
  HONOR,
  @JsonValue('Ignore')
  IGNORE,
}

final nodePolicyValues = EnumValues({
  'Honor': NodePolicy.HONOR,
  'Ignore': NodePolicy.IGNORE,
});

///WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread
///constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. -
///ScheduleAnyway tells the scheduler to schedule the pod in any location,
///but giving higher precedence to topologies that would help reduce the
///skew.
///A constraint is considered "Unsatisfiable" for an incoming pod if and only if every
///possible node assignment for that pod would violate "MaxSkew" on some topology. For
///example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector
///spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable
///is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become
///3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the
///cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a
///required field.
///
///Possible enum values:
///- `"DoNotSchedule"` instructs the scheduler not to schedule the pod when constraints are
///not satisfied.
///- `"ScheduleAnyway"` instructs the scheduler to schedule the pod even if constraints are
///not satisfied.
enum WhenUnsatisfiable {
  @JsonValue('DoNotSchedule')
  DO_NOT_SCHEDULE,
  @JsonValue('ScheduleAnyway')
  SCHEDULE_ANYWAY,
}

final whenUnsatisfiableValues = EnumValues({
  'DoNotSchedule': WhenUnsatisfiable.DO_NOT_SCHEDULE,
  'ScheduleAnyway': WhenUnsatisfiable.SCHEDULE_ANYWAY,
});

@JsonSerializable()
class Volume {
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

  ///Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'cephfs')
  Cephfs? cephfs;

  ///Represents a cinder volume resource in Openstack. A Cinder volume must exist before
  ///mounting to a container. The volume must also be in the same region as the kubelet.
  ///Cinder volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'cinder')
  Cinder? cinder;

  ///Adapts a ConfigMap into a volume.
  ///
  ///The contents of the target ConfigMap's Data field will be presented in a volume as files
  ///using the keys in the Data field as the file names, unless the items element is populated
  ///with specific mappings of keys to paths. ConfigMap volumes support ownership management
  ///and SELinux relabeling.
  @JsonKey(name: 'configMap')
  VolumeConfigMap? configMap;

  ///Represents a source location of a volume to mount, managed by an external CSI driver
  @JsonKey(name: 'csi')
  Csi? csi;

  ///DownwardAPIVolumeSource represents a volume containing downward API info. Downward API
  ///volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'downwardAPI')
  VolumeDownwardApi? downwardApi;

  ///Represents an empty directory for a pod. Empty directory volumes support ownership
  ///management and SELinux relabeling.
  @JsonKey(name: 'emptyDir')
  EmptyDir? emptyDir;

  ///Represents an ephemeral volume that is handled by a normal storage driver.
  @JsonKey(name: 'ephemeral')
  Ephemeral? ephemeral;

  ///Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as
  ///read/write once. Fibre Channel volumes support ownership management and SELinux
  ///relabeling.
  @JsonKey(name: 'fc')
  Fc? fc;

  ///FlexVolume represents a generic volume resource that is provisioned/attached using an
  ///exec based plugin.
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

  ///Represents a volume that is populated with the contents of a git repository. Git repo
  ///volumes do not support ownership management. Git repo volumes support SELinux
  ///relabeling.
  ///
  ///DEPRECATED: GitRepo is deprecated. To provision a container with a git repo, mount an
  ///EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir
  ///into the Pod's container.
  @JsonKey(name: 'gitRepo')
  GitRepo? gitRepo;

  ///Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'glusterfs')
  Glusterfs? glusterfs;

  ///Represents a host path mapped into a pod. Host path volumes do not support ownership
  ///management or SELinux relabeling.
  @JsonKey(name: 'hostPath')
  HostPath? hostPath;

  ///ImageVolumeSource represents a image volume resource.
  @JsonKey(name: 'image')
  Image? image;

  ///Represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI
  ///volumes support ownership management and SELinux relabeling.
  @JsonKey(name: 'iscsi')
  Iscsi? iscsi;

  ///name of the volume. Must be a DNS_LABEL and unique within the pod. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ///Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support
  ///ownership management or SELinux relabeling.
  @JsonKey(name: 'nfs')
  Nfs? nfs;

  ///PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This
  ///volume finds the bound PV and mounts that volume for the pod. A
  ///PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of
  ///volume that is owned by someone else (the system).
  @JsonKey(name: 'persistentVolumeClaim')
  PersistentVolumeClaim? persistentVolumeClaim;

  ///Represents a Photon Controller persistent disk resource.
  @JsonKey(name: 'photonPersistentDisk')
  PhotonPersistentDisk? photonPersistentDisk;

  ///PortworxVolumeSource represents a Portworx volume resource.
  @JsonKey(name: 'portworxVolume')
  PortworxVolume? portworxVolume;

  ///Represents a projected volume source
  @JsonKey(name: 'projected')
  Projected? projected;

  ///Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not
  ///support ownership management or SELinux relabeling.
  @JsonKey(name: 'quobyte')
  Quobyte? quobyte;

  ///Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes
  ///support ownership management and SELinux relabeling.
  @JsonKey(name: 'rbd')
  Rbd? rbd;

  ///ScaleIOVolumeSource represents a persistent ScaleIO volume
  @JsonKey(name: 'scaleIO')
  ScaleIo? scaleIo;

  ///Adapts a Secret into a volume.
  ///
  ///The contents of the target Secret's Data field will be presented in a volume as files
  ///using the keys in the Data field as the file names. Secret volumes support ownership
  ///management and SELinux relabeling.
  @JsonKey(name: 'secret')
  VolumeSecret? secret;

  ///Represents a StorageOS persistent volume resource.
  @JsonKey(name: 'storageos')
  Storageos? storageos;

  ///Represents a vSphere volume resource.
  @JsonKey(name: 'vsphereVolume')
  VsphereVolume? vsphereVolume;

  Volume({
    this.awsElasticBlockStore,
    this.azureDisk,
    this.azureFile,
    this.cephfs,
    this.cinder,
    this.configMap,
    this.csi,
    this.downwardApi,
    this.emptyDir,
    this.ephemeral,
    this.fc,
    this.flexVolume,
    this.flocker,
    this.gcePersistentDisk,
    this.gitRepo,
    this.glusterfs,
    this.hostPath,
    this.image,
    this.iscsi,
    required this.name,
    this.nfs,
    this.persistentVolumeClaim,
    this.photonPersistentDisk,
    this.portworxVolume,
    this.projected,
    this.quobyte,
    this.rbd,
    this.scaleIo,
    this.secret,
    this.storageos,
    this.vsphereVolume,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

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

  ///secretName is the  name of secret that contains Azure Storage Account Name and Key
  @JsonKey(name: 'secretName')
  String secretName;

  ///shareName is the azure share Name
  @JsonKey(name: 'shareName')
  String shareName;

  AzureFile({this.readOnly, required this.secretName, required this.shareName});

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

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
  @JsonKey(name: 'secretRef')
  CephfsSecretRef? secretRef;

  ///user is optional: User is the rados user name, default is admin More info:
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  CephfsSecretRef({this.name});

  factory CephfsSecretRef.fromJson(Map<String, dynamic> json) =>
      _$CephfsSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$CephfsSecretRefToJson(this);
}

@JsonSerializable()
class Cinder {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if
  ///unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
  @JsonKey(name: 'fsType')
  String? fsType;

  ///readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  CinderSecretRef({this.name});

  factory CinderSecretRef.fromJson(Map<String, dynamic> json) =>
      _$CinderSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$CinderSecretRefToJson(this);
}

@JsonSerializable()
class VolumeConfigMap {
  ///defaultMode is optional: mode bits used to set permissions on created files by default.
  ///Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML
  ///accepts both octal and decimal values, JSON requires decimal values for mode bits.
  ///Defaults to 0644. Directories within the path are not affected by this setting. This
  ///might be in conflict with other options that affect the file mode, like fsGroup, and the
  ///result can be other mode bits set.
  @JsonKey(name: 'defaultMode')
  int? defaultMode;

  ///items if unspecified, each key-value pair in the Data field of the referenced ConfigMap
  ///will be projected into the volume as a file whose name is the key and content is the
  ///value. If specified, the listed keys will be projected into the specified paths, and
  ///unlisted keys will not be present. If a key is specified which is not present in the
  ///ConfigMap, the volume setup will error unless it is marked optional. Paths must be
  ///relative and may not contain the '..' path or start with '..'.
  @JsonKey(name: 'items')
  List<PurpleItem?>? items;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///optional specify whether the ConfigMap or its keys must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  VolumeConfigMap({this.defaultMode, this.items, this.name, this.optional});

  factory VolumeConfigMap.fromJson(Map<String, dynamic> json) =>
      _$VolumeConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeConfigMapToJson(this);
}

@JsonSerializable()
class PurpleItem {
  ///key is the key to project.
  @JsonKey(name: 'key')
  String key;

  ///mode is Optional: mode bits used to set permissions on this file. Must be an octal value
  ///between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and
  ///decimal values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///path is the relative path of the file to map the key to. May not be an absolute path. May
  ///not contain the path element '..'. May not start with the string '..'.
  @JsonKey(name: 'path')
  String path;

  PurpleItem({required this.key, this.mode, required this.path});

  factory PurpleItem.fromJson(Map<String, dynamic> json) =>
      _$PurpleItemFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleItemToJson(this);
}

@JsonSerializable()
class Csi {
  ///driver is the name of the CSI driver that handles this volume. Consult with your admin
  ///for the correct name as registered in the cluster.
  @JsonKey(name: 'driver')
  String driver;

  ///fsType to mount. Ex. "ext4", "xfs", "ntfs". If not provided, the empty value is passed to
  ///the associated CSI driver which will determine the default filesystem to apply.
  @JsonKey(name: 'fsType')
  String? fsType;

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
  @JsonKey(name: 'nodePublishSecretRef')
  NodePublishSecretRef? nodePublishSecretRef;

  ///readOnly specifies a read-only configuration for the volume. Defaults to false
  ///(read/write).
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///volumeAttributes stores driver-specific properties that are passed to the CSI driver.
  ///Consult your driver's documentation for supported values.
  @JsonKey(name: 'volumeAttributes')
  Map<String, String?>? volumeAttributes;

  Csi({
    required this.driver,
    this.fsType,
    this.nodePublishSecretRef,
    this.readOnly,
    this.volumeAttributes,
  });

  factory Csi.fromJson(Map<String, dynamic> json) => _$CsiFromJson(json);

  Map<String, dynamic> toJson() => _$CsiToJson(this);
}

@JsonSerializable()
class NodePublishSecretRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  NodePublishSecretRef({this.name});

  factory NodePublishSecretRef.fromJson(Map<String, dynamic> json) =>
      _$NodePublishSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$NodePublishSecretRefToJson(this);
}

@JsonSerializable()
class VolumeDownwardApi {
  ///Optional: mode bits to use on created files by default. Must be a Optional: mode bits
  ///used to set permissions on created files by default. Must be an octal value between 0000
  ///and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal
  ///values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within
  ///the path are not affected by this setting. This might be in conflict with other options
  ///that affect the file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'defaultMode')
  int? defaultMode;

  ///Items is a list of downward API volume file
  @JsonKey(name: 'items')
  List<FluffyItem?>? items;

  VolumeDownwardApi({this.defaultMode, this.items});

  factory VolumeDownwardApi.fromJson(Map<String, dynamic> json) =>
      _$VolumeDownwardApiFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeDownwardApiToJson(this);
}

@JsonSerializable()
class FluffyItem {
  ///ObjectFieldSelector selects an APIVersioned field of an object.
  @JsonKey(name: 'fieldRef')
  StickyFieldRef? fieldRef;

  ///Optional: mode bits used to set permissions on this file, must be an octal value between
  ///0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal
  ///values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///Required: Path is  the relative path name of the file to be created. Must not be absolute
  ///or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must
  ///not start with '..'
  @JsonKey(name: 'path')
  String path;

  ///ResourceFieldSelector represents container resources (cpu, memory) and their output format
  @JsonKey(name: 'resourceFieldRef')
  StickyResourceFieldRef? resourceFieldRef;

  FluffyItem({
    this.fieldRef,
    this.mode,
    required this.path,
    this.resourceFieldRef,
  });

  factory FluffyItem.fromJson(Map<String, dynamic> json) =>
      _$FluffyItemFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyItemToJson(this);
}

@JsonSerializable()
class StickyFieldRef {
  ///Version of the schema the FieldPath is written in terms of, defaults to "v1".
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Path of the field to select in the specified API version.
  @JsonKey(name: 'fieldPath')
  String fieldPath;

  StickyFieldRef({this.apiVersion, required this.fieldPath});

  factory StickyFieldRef.fromJson(Map<String, dynamic> json) =>
      _$StickyFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$StickyFieldRefToJson(this);
}

@JsonSerializable()
class StickyResourceFieldRef {
  ///Container name: required for volumes, optional for env vars
  @JsonKey(name: 'containerName')
  String? containerName;
  @JsonKey(name: 'divisor')
  dynamic divisor;

  ///Required: resource to select
  @JsonKey(name: 'resource')
  String resource;

  StickyResourceFieldRef({
    this.containerName,
    this.divisor,
    required this.resource,
  });

  factory StickyResourceFieldRef.fromJson(Map<String, dynamic> json) =>
      _$StickyResourceFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$StickyResourceFieldRefToJson(this);
}

@JsonSerializable()
class EmptyDir {
  ///medium represents what type of storage medium should back this directory. The default is
  ///"" which means to use the node's default medium. Must be an empty string (default) or
  ///Memory. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
  @JsonKey(name: 'medium')
  String? medium;
  @JsonKey(name: 'sizeLimit')
  dynamic sizeLimit;

  EmptyDir({this.medium, this.sizeLimit});

  factory EmptyDir.fromJson(Map<String, dynamic> json) =>
      _$EmptyDirFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyDirToJson(this);
}

@JsonSerializable()
class Ephemeral {
  ///PersistentVolumeClaimTemplate is used to produce PersistentVolumeClaim objects as part of
  ///an EphemeralVolumeSource.
  @JsonKey(name: 'volumeClaimTemplate')
  VolumeClaimTemplate? volumeClaimTemplate;

  Ephemeral({this.volumeClaimTemplate});

  factory Ephemeral.fromJson(Map<String, dynamic> json) =>
      _$EphemeralFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralToJson(this);
}

@JsonSerializable()
class VolumeClaimTemplate {
  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  VolumeClaimTemplateMetadata? metadata;

  ///PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a
  ///Source for provider-specific attributes
  @JsonKey(name: 'spec')
  VolumeClaimTemplateSpec spec;

  VolumeClaimTemplate({this.metadata, required this.spec});

  factory VolumeClaimTemplate.fromJson(Map<String, dynamic> json) =>
      _$VolumeClaimTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeClaimTemplateToJson(this);
}

@JsonSerializable()
class VolumeClaimTemplateMetadata {
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
  List<TentacledManagedField?>? managedFields;

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
  List<TentacledOwnerReference?>? ownerReferences;

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

  VolumeClaimTemplateMetadata({
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

  factory VolumeClaimTemplateMetadata.fromJson(Map<String, dynamic> json) =>
      _$VolumeClaimTemplateMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeClaimTemplateMetadataToJson(this);
}

@JsonSerializable()
class TentacledManagedField {
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

  TentacledManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory TentacledManagedField.fromJson(Map<String, dynamic> json) =>
      _$TentacledManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledManagedFieldToJson(this);
}

@JsonSerializable()
class TentacledOwnerReference {
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

  TentacledOwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory TentacledOwnerReference.fromJson(Map<String, dynamic> json) =>
      _$TentacledOwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledOwnerReferenceToJson(this);
}

///PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a
///Source for provider-specific attributes
@JsonSerializable()
class VolumeClaimTemplateSpec {
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
  FluffyResources? resources;

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

  VolumeClaimTemplateSpec({
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

  factory VolumeClaimTemplateSpec.fromJson(Map<String, dynamic> json) =>
      _$VolumeClaimTemplateSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeClaimTemplateSpecToJson(this);
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
class FluffyResources {
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

  FluffyResources({this.limits, this.requests});

  factory FluffyResources.fromJson(Map<String, dynamic> json) =>
      _$FluffyResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyResourcesToJson(this);
}

@JsonSerializable()
class Selector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<SelectorMatchExpression?>? matchExpressions;

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
class SelectorMatchExpression {
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

  SelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory SelectorMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$SelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorMatchExpressionToJson(this);
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

  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
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

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  FlexVolumeSecretRef({this.name});

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
class GitRepo {
  ///directory is the target directory name. Must not contain or start with '..'.  If '.' is
  ///supplied, the volume directory will be the git repository.  Otherwise, if specified, the
  ///volume will contain the git repository in the subdirectory with the given name.
  @JsonKey(name: 'directory')
  String? directory;

  ///repository is the URL
  @JsonKey(name: 'repository')
  String repository;

  ///revision is the commit hash for the specified revision.
  @JsonKey(name: 'revision')
  String? revision;

  GitRepo({this.directory, required this.repository, this.revision});

  factory GitRepo.fromJson(Map<String, dynamic> json) =>
      _$GitRepoFromJson(json);

  Map<String, dynamic> toJson() => _$GitRepoToJson(this);
}

@JsonSerializable()
class Glusterfs {
  ///endpoints is the endpoint name that details Glusterfs topology.
  @JsonKey(name: 'endpoints')
  String endpoints;

  ///path is the Glusterfs volume path. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'path')
  String path;

  ///readOnly here will force the Glusterfs volume to be mounted with read-only permissions.
  ///Defaults to false. More info:
  ///https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  Glusterfs({required this.endpoints, required this.path, this.readOnly});

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
  HostPathType? type;

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
enum HostPathType {
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

final hostPathTypeValues = EnumValues({
  'BlockDevice': HostPathType.BLOCK_DEVICE,
  'CharDevice': HostPathType.CHAR_DEVICE,
  'Directory': HostPathType.DIRECTORY,
  'DirectoryOrCreate': HostPathType.DIRECTORY_OR_CREATE,
  '': HostPathType.EMPTY,
  'File': HostPathType.FILE,
  'FileOrCreate': HostPathType.FILE_OR_CREATE,
  'Socket': HostPathType.SOCKET,
});

@JsonSerializable()
class Image {
  ///Policy for pulling OCI objects. Possible values are: Always: the kubelet always attempts
  ///to pull the reference. Container creation will fail If the pull fails. Never: the kubelet
  ///never pulls the reference and only uses a local image or artifact. Container creation
  ///will fail if the reference isn't present. IfNotPresent: the kubelet pulls if the
  ///reference isn't already present on disk. Container creation will fail if the reference
  ///isn't present and the pull fails. Defaults to Always if :latest tag is specified, or
  ///IfNotPresent otherwise.
  ///
  ///Possible enum values:
  ///- `"Always"` means that kubelet always attempts to pull the latest image. Container will
  ///fail If the pull fails.
  ///- `"IfNotPresent"` means that kubelet pulls if the image isn't present on disk. Container
  ///will fail if the image isn't present and the pull fails.
  ///- `"Never"` means that kubelet never pulls an image, but only uses a local image.
  ///Container will fail if the image isn't present
  @JsonKey(name: 'pullPolicy')
  PullPolicy? pullPolicy;

  ///Required: Image or artifact reference to be used. Behaves in the same way as
  ///pod.spec.containers[*].image. Pull secrets will be assembled in the same way as for the
  ///container image by looking up node credentials, SA image pull secrets, and pod spec image
  ///pull secrets. More info: https://kubernetes.io/docs/concepts/containers/images This field
  ///is optional to allow higher level config management to default or override container
  ///images in workload controllers like Deployments and StatefulSets.
  @JsonKey(name: 'reference')
  String? reference;

  Image({this.pullPolicy, this.reference});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

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

  ///iqn is the target iSCSI Qualified Name.
  @JsonKey(name: 'iqn')
  String iqn;

  ///iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default'
  ///(tcp).
  @JsonKey(name: 'iscsiInterface')
  String? iscsiInterface;

  ///lun represents iSCSI Target Lun number.
  @JsonKey(name: 'lun')
  int lun;

  ///portals is the iSCSI Target Portal List. The portal is either an IP or ip_addr:port if
  ///the port is other than default (typically TCP ports 860 and 3260).
  @JsonKey(name: 'portals')
  List<String?>? portals;

  ///readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  IscsiSecretRef({this.name});

  factory IscsiSecretRef.fromJson(Map<String, dynamic> json) =>
      _$IscsiSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$IscsiSecretRefToJson(this);
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
class PersistentVolumeClaim {
  ///claimName is the name of a PersistentVolumeClaim in the same namespace as the pod using
  ///this volume. More info:
  ///https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
  @JsonKey(name: 'claimName')
  String claimName;

  ///readOnly Will force the ReadOnly setting in VolumeMounts. Default false.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  PersistentVolumeClaim({required this.claimName, this.readOnly});

  factory PersistentVolumeClaim.fromJson(Map<String, dynamic> json) =>
      _$PersistentVolumeClaimFromJson(json);

  Map<String, dynamic> toJson() => _$PersistentVolumeClaimToJson(this);
}

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
class Projected {
  ///defaultMode are the mode bits used to set permissions on created files by default. Must
  ///be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML
  ///accepts both octal and decimal values, JSON requires decimal values for mode bits.
  ///Directories within the path are not affected by this setting. This might be in conflict
  ///with other options that affect the file mode, like fsGroup, and the result can be other
  ///mode bits set.
  @JsonKey(name: 'defaultMode')
  int? defaultMode;

  ///sources is the list of volume projections. Each entry in this list handles one source.
  @JsonKey(name: 'sources')
  List<Source?>? sources;

  Projected({this.defaultMode, this.sources});

  factory Projected.fromJson(Map<String, dynamic> json) =>
      _$ProjectedFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectedToJson(this);
}

@JsonSerializable()
class Source {
  ///ClusterTrustBundleProjection describes how to select a set of ClusterTrustBundle objects
  ///and project their contents into the pod filesystem.
  @JsonKey(name: 'clusterTrustBundle')
  ClusterTrustBundle? clusterTrustBundle;

  ///Adapts a ConfigMap into a projected volume.
  ///
  ///The contents of the target ConfigMap's Data field will be presented in a projected volume
  ///as files using the keys in the Data field as the file names, unless the items element is
  ///populated with specific mappings of keys to paths. Note that this is identical to a
  ///configmap volume source without the default mode.
  @JsonKey(name: 'configMap')
  SourceConfigMap? configMap;

  ///Represents downward API info for projecting into a projected volume. Note that this is
  ///identical to a downwardAPI volume source without the default mode.
  @JsonKey(name: 'downwardAPI')
  SourceDownwardApi? downwardApi;

  ///PodCertificateProjection provides a private key and X.509 certificate in the pod
  ///filesystem.
  @JsonKey(name: 'podCertificate')
  PodCertificate? podCertificate;

  ///Adapts a secret into a projected volume.
  ///
  ///The contents of the target Secret's Data field will be presented in a projected volume as
  ///files using the keys in the Data field as the file names. Note that this is identical to
  ///a secret volume source without the default mode.
  @JsonKey(name: 'secret')
  SourceSecret? secret;

  ///ServiceAccountTokenProjection represents a projected service account token volume. This
  ///projection can be used to insert a service account token into the pods runtime filesystem
  ///for use against APIs (Kubernetes API Server or otherwise).
  @JsonKey(name: 'serviceAccountToken')
  ServiceAccountToken? serviceAccountToken;

  Source({
    this.clusterTrustBundle,
    this.configMap,
    this.downwardApi,
    this.podCertificate,
    this.secret,
    this.serviceAccountToken,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class ClusterTrustBundle {
  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'labelSelector')
  ClusterTrustBundleLabelSelector? labelSelector;

  ///Select a single ClusterTrustBundle by object name.  Mutually-exclusive with signerName
  ///and labelSelector.
  @JsonKey(name: 'name')
  String? name;

  ///If true, don't block pod startup if the referenced ClusterTrustBundle(s) aren't
  ///available.  If using name, then the named ClusterTrustBundle is allowed not to exist.  If
  ///using signerName, then the combination of signerName and labelSelector is allowed to
  ///match zero ClusterTrustBundles.
  @JsonKey(name: 'optional')
  bool? optional;

  ///Relative path from the volume root to write the bundle.
  @JsonKey(name: 'path')
  String path;

  ///Select all ClusterTrustBundles that match this signer name. Mutually-exclusive with
  ///name.  The contents of all selected ClusterTrustBundles will be unified and deduplicated.
  @JsonKey(name: 'signerName')
  String? signerName;

  ClusterTrustBundle({
    this.labelSelector,
    this.name,
    this.optional,
    required this.path,
    this.signerName,
  });

  factory ClusterTrustBundle.fromJson(Map<String, dynamic> json) =>
      _$ClusterTrustBundleFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterTrustBundleToJson(this);
}

@JsonSerializable()
class ClusterTrustBundleLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MagentaMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  ClusterTrustBundleLabelSelector({this.matchExpressions, this.matchLabels});

  factory ClusterTrustBundleLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$ClusterTrustBundleLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ClusterTrustBundleLabelSelectorToJson(this);
}

@JsonSerializable()
class MagentaMatchExpression {
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

  MagentaMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MagentaMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$MagentaMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaMatchExpressionToJson(this);
}

@JsonSerializable()
class SourceConfigMap {
  ///items if unspecified, each key-value pair in the Data field of the referenced ConfigMap
  ///will be projected into the volume as a file whose name is the key and content is the
  ///value. If specified, the listed keys will be projected into the specified paths, and
  ///unlisted keys will not be present. If a key is specified which is not present in the
  ///ConfigMap, the volume setup will error unless it is marked optional. Paths must be
  ///relative and may not contain the '..' path or start with '..'.
  @JsonKey(name: 'items')
  List<TentacledItem?>? items;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///optional specify whether the ConfigMap or its keys must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  SourceConfigMap({this.items, this.name, this.optional});

  factory SourceConfigMap.fromJson(Map<String, dynamic> json) =>
      _$SourceConfigMapFromJson(json);

  Map<String, dynamic> toJson() => _$SourceConfigMapToJson(this);
}

@JsonSerializable()
class TentacledItem {
  ///key is the key to project.
  @JsonKey(name: 'key')
  String key;

  ///mode is Optional: mode bits used to set permissions on this file. Must be an octal value
  ///between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and
  ///decimal values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///path is the relative path of the file to map the key to. May not be an absolute path. May
  ///not contain the path element '..'. May not start with the string '..'.
  @JsonKey(name: 'path')
  String path;

  TentacledItem({required this.key, this.mode, required this.path});

  factory TentacledItem.fromJson(Map<String, dynamic> json) =>
      _$TentacledItemFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledItemToJson(this);
}

@JsonSerializable()
class SourceDownwardApi {
  ///Items is a list of DownwardAPIVolume file
  @JsonKey(name: 'items')
  List<StickyItem?>? items;

  SourceDownwardApi({this.items});

  factory SourceDownwardApi.fromJson(Map<String, dynamic> json) =>
      _$SourceDownwardApiFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDownwardApiToJson(this);
}

@JsonSerializable()
class StickyItem {
  ///ObjectFieldSelector selects an APIVersioned field of an object.
  @JsonKey(name: 'fieldRef')
  IndigoFieldRef? fieldRef;

  ///Optional: mode bits used to set permissions on this file, must be an octal value between
  ///0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal
  ///values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///Required: Path is  the relative path name of the file to be created. Must not be absolute
  ///or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must
  ///not start with '..'
  @JsonKey(name: 'path')
  String path;

  ///ResourceFieldSelector represents container resources (cpu, memory) and their output format
  @JsonKey(name: 'resourceFieldRef')
  IndigoResourceFieldRef? resourceFieldRef;

  StickyItem({
    this.fieldRef,
    this.mode,
    required this.path,
    this.resourceFieldRef,
  });

  factory StickyItem.fromJson(Map<String, dynamic> json) =>
      _$StickyItemFromJson(json);

  Map<String, dynamic> toJson() => _$StickyItemToJson(this);
}

@JsonSerializable()
class IndigoFieldRef {
  ///Version of the schema the FieldPath is written in terms of, defaults to "v1".
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Path of the field to select in the specified API version.
  @JsonKey(name: 'fieldPath')
  String fieldPath;

  IndigoFieldRef({this.apiVersion, required this.fieldPath});

  factory IndigoFieldRef.fromJson(Map<String, dynamic> json) =>
      _$IndigoFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoFieldRefToJson(this);
}

@JsonSerializable()
class IndigoResourceFieldRef {
  ///Container name: required for volumes, optional for env vars
  @JsonKey(name: 'containerName')
  String? containerName;
  @JsonKey(name: 'divisor')
  dynamic divisor;

  ///Required: resource to select
  @JsonKey(name: 'resource')
  String resource;

  IndigoResourceFieldRef({
    this.containerName,
    this.divisor,
    required this.resource,
  });

  factory IndigoResourceFieldRef.fromJson(Map<String, dynamic> json) =>
      _$IndigoResourceFieldRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoResourceFieldRefToJson(this);
}

@JsonSerializable()
class PodCertificate {
  ///Write the certificate chain at this path in the projected volume.
  ///
  ///Most applications should use credentialBundlePath.  When using keyPath and
  ///certificateChainPath, your application needs to check that the key and leaf certificate
  ///are consistent, because it is possible to read the files mid-rotation.
  @JsonKey(name: 'certificateChainPath')
  String? certificateChainPath;

  ///Write the credential bundle at this path in the projected volume.
  ///
  ///The credential bundle is a single file that contains multiple PEM blocks. The first PEM
  ///block is a PRIVATE KEY block, containing a PKCS#8 private key.
  ///
  ///The remaining blocks are CERTIFICATE blocks, containing the issued certificate chain from
  ///the signer (leaf and any intermediates).
  ///
  ///Using credentialBundlePath lets your Pod's application code make a single atomic read
  ///that retrieves a consistent key and certificate chain.  If you project them to separate
  ///files, your application code will need to additionally check that the leaf certificate
  ///was issued to the key.
  @JsonKey(name: 'credentialBundlePath')
  String? credentialBundlePath;

  ///Write the key at this path in the projected volume.
  ///
  ///Most applications should use credentialBundlePath.  When using keyPath and
  ///certificateChainPath, your application needs to check that the key and leaf certificate
  ///are consistent, because it is possible to read the files mid-rotation.
  @JsonKey(name: 'keyPath')
  String? keyPath;

  ///The type of keypair Kubelet will generate for the pod.
  ///
  ///Valid values are "RSA3072", "RSA4096", "ECDSAP256", "ECDSAP384", "ECDSAP521", and
  ///"ED25519".
  @JsonKey(name: 'keyType')
  String keyType;

  ///maxExpirationSeconds is the maximum lifetime permitted for the certificate.
  ///
  ///Kubelet copies this value verbatim into the PodCertificateRequests it generates for this
  ///projection.
  ///
  ///If omitted, kube-apiserver will set it to 86400(24 hours). kube-apiserver will reject
  ///values shorter than 3600 (1 hour).  The maximum allowable value is 7862400 (91 days).
  ///
  ///The signer implementation is then free to issue a certificate with any lifetime *shorter*
  ///than MaxExpirationSeconds, but no shorter than 3600 seconds (1 hour).  This constraint is
  ///enforced by kube-apiserver. `kubernetes.io` signers will never issue certificates with a
  ///lifetime longer than 24 hours.
  @JsonKey(name: 'maxExpirationSeconds')
  int? maxExpirationSeconds;

  ///Kubelet's generated CSRs will be addressed to this signer.
  @JsonKey(name: 'signerName')
  String signerName;

  ///userAnnotations allow pod authors to pass additional information to the signer
  ///implementation.  Kubernetes does not restrict or validate this metadata in any way.
  ///
  ///These values are copied verbatim into the `spec.unverifiedUserAnnotations` field of the
  ///PodCertificateRequest objects that Kubelet creates.
  ///
  ///Entries are subject to the same validation as object metadata annotations, with the
  ///addition that all keys must be domain-prefixed. No restrictions are placed on values,
  ///except an overall size limitation on the entire field.
  ///
  ///Signers should document the keys and values they support. Signers should deny requests
  ///that contain keys they do not recognize.
  @JsonKey(name: 'userAnnotations')
  Map<String, String?>? userAnnotations;

  PodCertificate({
    this.certificateChainPath,
    this.credentialBundlePath,
    this.keyPath,
    required this.keyType,
    this.maxExpirationSeconds,
    required this.signerName,
    this.userAnnotations,
  });

  factory PodCertificate.fromJson(Map<String, dynamic> json) =>
      _$PodCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$PodCertificateToJson(this);
}

@JsonSerializable()
class SourceSecret {
  ///items if unspecified, each key-value pair in the Data field of the referenced Secret will
  ///be projected into the volume as a file whose name is the key and content is the value. If
  ///specified, the listed keys will be projected into the specified paths, and unlisted keys
  ///will not be present. If a key is specified which is not present in the Secret, the volume
  ///setup will error unless it is marked optional. Paths must be relative and may not contain
  ///the '..' path or start with '..'.
  @JsonKey(name: 'items')
  List<IndigoItem?>? items;

  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ///optional field specify whether the Secret or its key must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  SourceSecret({this.items, this.name, this.optional});

  factory SourceSecret.fromJson(Map<String, dynamic> json) =>
      _$SourceSecretFromJson(json);

  Map<String, dynamic> toJson() => _$SourceSecretToJson(this);
}

@JsonSerializable()
class IndigoItem {
  ///key is the key to project.
  @JsonKey(name: 'key')
  String key;

  ///mode is Optional: mode bits used to set permissions on this file. Must be an octal value
  ///between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and
  ///decimal values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///path is the relative path of the file to map the key to. May not be an absolute path. May
  ///not contain the path element '..'. May not start with the string '..'.
  @JsonKey(name: 'path')
  String path;

  IndigoItem({required this.key, this.mode, required this.path});

  factory IndigoItem.fromJson(Map<String, dynamic> json) =>
      _$IndigoItemFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoItemToJson(this);
}

@JsonSerializable()
class ServiceAccountToken {
  ///audience is the intended audience of the token. A recipient of a token must identify
  ///itself with an identifier specified in the audience of the token, and otherwise should
  ///reject the token. The audience defaults to the identifier of the apiserver.
  @JsonKey(name: 'audience')
  String? audience;

  ///expirationSeconds is the requested duration of validity of the service account token. As
  ///the token approaches expiration, the kubelet volume plugin will proactively rotate the
  ///service account token. The kubelet will start trying to rotate the token if the token is
  ///older than 80 percent of its time to live or if the token is older than 24 hours.Defaults
  ///to 1 hour and must be at least 10 minutes.
  @JsonKey(name: 'expirationSeconds')
  int? expirationSeconds;

  ///path is the path relative to the mount point of the file to project the token into.
  @JsonKey(name: 'path')
  String path;

  ServiceAccountToken({
    this.audience,
    this.expirationSeconds,
    required this.path,
  });

  factory ServiceAccountToken.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountTokenFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountTokenToJson(this);
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

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  RbdSecretRef({this.name});

  factory RbdSecretRef.fromJson(Map<String, dynamic> json) =>
      _$RbdSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$RbdSecretRefToJson(this);
}

@JsonSerializable()
class ScaleIo {
  ///fsType is the filesystem type to mount. Must be a filesystem type supported by the host
  ///operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs".
  @JsonKey(name: 'fsType')
  String? fsType;

  ///gateway is the host address of the ScaleIO API Gateway.
  @JsonKey(name: 'gateway')
  String gateway;

  ///protectionDomain is the name of the ScaleIO Protection Domain for the configured storage.
  @JsonKey(name: 'protectionDomain')
  String? protectionDomain;

  ///readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in
  ///VolumeMounts.
  @JsonKey(name: 'readOnly')
  bool? readOnly;

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
  @JsonKey(name: 'secretRef')
  ScaleIoSecretRef secretRef;

  ///sslEnabled Flag enable/disable SSL communication with Gateway, default false
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

///LocalObjectReference contains enough information to let you locate the referenced object
///inside the same namespace.
@JsonSerializable()
class ScaleIoSecretRef {
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  ScaleIoSecretRef({this.name});

  factory ScaleIoSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ScaleIoSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleIoSecretRefToJson(this);
}

@JsonSerializable()
class VolumeSecret {
  ///defaultMode is Optional: mode bits used to set permissions on created files by default.
  ///Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML
  ///accepts both octal and decimal values, JSON requires decimal values for mode bits.
  ///Defaults to 0644. Directories within the path are not affected by this setting. This
  ///might be in conflict with other options that affect the file mode, like fsGroup, and the
  ///result can be other mode bits set.
  @JsonKey(name: 'defaultMode')
  int? defaultMode;

  ///items If unspecified, each key-value pair in the Data field of the referenced Secret will
  ///be projected into the volume as a file whose name is the key and content is the value. If
  ///specified, the listed keys will be projected into the specified paths, and unlisted keys
  ///will not be present. If a key is specified which is not present in the Secret, the volume
  ///setup will error unless it is marked optional. Paths must be relative and may not contain
  ///the '..' path or start with '..'.
  @JsonKey(name: 'items')
  List<IndecentItem?>? items;

  ///optional field specify whether the Secret or its keys must be defined
  @JsonKey(name: 'optional')
  bool? optional;

  ///secretName is the name of the secret in the pod's namespace to use. More info:
  ///https://kubernetes.io/docs/concepts/storage/volumes#secret
  @JsonKey(name: 'secretName')
  String? secretName;

  VolumeSecret({this.defaultMode, this.items, this.optional, this.secretName});

  factory VolumeSecret.fromJson(Map<String, dynamic> json) =>
      _$VolumeSecretFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeSecretToJson(this);
}

@JsonSerializable()
class IndecentItem {
  ///key is the key to project.
  @JsonKey(name: 'key')
  String key;

  ///mode is Optional: mode bits used to set permissions on this file. Must be an octal value
  ///between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and
  ///decimal values, JSON requires decimal values for mode bits. If not specified, the volume
  ///defaultMode will be used. This might be in conflict with other options that affect the
  ///file mode, like fsGroup, and the result can be other mode bits set.
  @JsonKey(name: 'mode')
  int? mode;

  ///path is the relative path of the file to map the key to. May not be an absolute path. May
  ///not contain the path element '..'. May not start with the string '..'.
  @JsonKey(name: 'path')
  String path;

  IndecentItem({required this.key, this.mode, required this.path});

  factory IndecentItem.fromJson(Map<String, dynamic> json) =>
      _$IndecentItemFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentItemToJson(this);
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

  ///LocalObjectReference contains enough information to let you locate the referenced object
  ///inside the same namespace.
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
  ///Name of the referent. This field is effectively required, but due to backwards
  ///compatibility is allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  StorageosSecretRef({this.name});

  factory StorageosSecretRef.fromJson(Map<String, dynamic> json) =>
      _$StorageosSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$StorageosSecretRefToJson(this);
}

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
class WorkloadRef {
  ///Name defines the name of the Workload object this Pod belongs to. Workload must be in the
  ///same namespace as the Pod. If it doesn't match any existing Workload, the Pod will remain
  ///unschedulable until a Workload object is created and observed by the kube-scheduler. It
  ///must be a DNS subdomain.
  @JsonKey(name: 'name')
  String name;

  ///PodGroup is the name of the PodGroup within the Workload that this Pod belongs to. If it
  ///doesn't match any existing PodGroup within the Workload, the Pod will remain
  ///unschedulable until the Workload object is recreated and observed by the kube-scheduler.
  ///It must be a DNS label.
  @JsonKey(name: 'podGroup')
  String podGroup;

  ///PodGroupReplicaKey specifies the replica key of the PodGroup to which this Pod belongs.
  ///It is used to distinguish pods belonging to different replicas of the same pod group. The
  ///pod group policy is applied separately to each replica. When set, it must be a DNS label.
  @JsonKey(name: 'podGroupReplicaKey')
  String? podGroupReplicaKey;

  WorkloadRef({
    required this.name,
    required this.podGroup,
    this.podGroupReplicaKey,
  });

  factory WorkloadRef.fromJson(Map<String, dynamic> json) =>
      _$WorkloadRefFromJson(json);

  Map<String, dynamic> toJson() => _$WorkloadRefToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum PodtemplatelistV1Kind {
  @JsonValue('PodTemplateList')
  POD_TEMPLATE_LIST,
}

final podtemplatelistV1KindValues = EnumValues({
  'PodTemplateList': PodtemplatelistV1Kind.POD_TEMPLATE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class PodtemplatelistV1Metadata {
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

  PodtemplatelistV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory PodtemplatelistV1Metadata.fromJson(Map<String, dynamic> json) =>
      _$PodtemplatelistV1MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PodtemplatelistV1MetadataToJson(this);
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
