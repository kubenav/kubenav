import 'package:json_annotation/json_annotation.dart';

part 'prioritylevelconfigurationlist_flowcontrol_v1.g.dart';

///PriorityLevelConfigurationList is a list of PriorityLevelConfiguration objects.
@JsonSerializable()
class PrioritylevelconfigurationlistFlowcontrolV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///`items` is a list of request-priorities.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  PrioritylevelconfigurationlistFlowcontrolV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  PrioritylevelconfigurationlistFlowcontrolV1Metadata? metadata;

  PrioritylevelconfigurationlistFlowcontrolV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory PrioritylevelconfigurationlistFlowcontrolV1.fromJson(
    Map<String, dynamic> json,
  ) => _$PrioritylevelconfigurationlistFlowcontrolV1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$PrioritylevelconfigurationlistFlowcontrolV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('flowcontrol.apiserver.k8s.io/v1')
  FLOWCONTROL_APISERVER_K8_S_IO_V1,
}

final apiVersionValues = EnumValues({
  'flowcontrol.apiserver.k8s.io/v1':
      ApiVersion.FLOWCONTROL_APISERVER_K8_S_IO_V1,
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

  ///PriorityLevelConfigurationSpec specifies the configuration of a priority level.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///PriorityLevelConfigurationStatus represents the current state of a "request-priority".
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
  @JsonValue('PriorityLevelConfiguration')
  PRIORITY_LEVEL_CONFIGURATION,
}

final itemKindValues = EnumValues({
  'PriorityLevelConfiguration': ItemKind.PRIORITY_LEVEL_CONFIGURATION,
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
  ///ExemptPriorityLevelConfiguration describes the configurable aspects of the handling of
  ///exempt requests. In the mandatory exempt configuration object the values in the fields
  ///here can be modified by authorized users, unlike the rest of the `spec`.
  @JsonKey(name: 'exempt')
  Exempt? exempt;

  ///LimitedPriorityLevelConfiguration specifies how to handle requests that are subject to
  ///limits. It addresses two issues:
  ///- How are requests for this priority level limited?
  ///- What should be done with requests that exceed the limit?
  @JsonKey(name: 'limited')
  Limited? limited;

  ///`type` indicates whether this priority level is subject to limitation on request
  ///execution.  A value of `"Exempt"` means that requests of this priority level are not
  ///subject to a limit (and thus are never queued) and do not detract from the capacity made
  ///available to other priority levels.  A value of `"Limited"` means that (a) requests of
  ///this priority level _are_ subject to limits and (b) some of the server's limited capacity
  ///is made available exclusively to this priority level. Required.
  @JsonKey(name: 'type')
  String type;

  Spec({this.exempt, this.limited, required this.type});

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Exempt {
  ///`lendablePercent` prescribes the fraction of the level's NominalCL that can be borrowed
  ///by other priority levels.  This value of this field must be between 0 and 100, inclusive,
  ///and it defaults to 0. The number of seats that other levels can borrow from this level,
  ///known as this level's LendableConcurrencyLimit (LendableCL), is defined as follows.
  ///
  ///LendableCL(i) = round( NominalCL(i) * lendablePercent(i)/100.0 )
  @JsonKey(name: 'lendablePercent')
  int? lendablePercent;

  ///`nominalConcurrencyShares` (NCS) contributes to the computation of the
  ///NominalConcurrencyLimit (NominalCL) of this level. This is the number of execution seats
  ///nominally reserved for this priority level. This DOES NOT limit the dispatching from this
  ///priority level but affects the other priority levels through the borrowing mechanism. The
  ///server's concurrency limit (ServerCL) is divided among all the priority levels in
  ///proportion to their NCS values:
  ///
  ///NominalCL(i)  = ceil( ServerCL * NCS(i) / sum_ncs ) sum_ncs = sum[priority level k]
  ///NCS(k)
  ///
  ///Bigger numbers mean a larger nominal concurrency limit, at the expense of every other
  ///priority level. This field has a default value of zero.
  @JsonKey(name: 'nominalConcurrencyShares')
  int? nominalConcurrencyShares;

  Exempt({this.lendablePercent, this.nominalConcurrencyShares});

  factory Exempt.fromJson(Map<String, dynamic> json) => _$ExemptFromJson(json);

  Map<String, dynamic> toJson() => _$ExemptToJson(this);
}

@JsonSerializable()
class Limited {
  ///`borrowingLimitPercent`, if present, configures a limit on how many seats this priority
  ///level can borrow from other priority levels. The limit is known as this level's
  ///BorrowingConcurrencyLimit (BorrowingCL) and is a limit on the total number of seats that
  ///this level may borrow at any one time. This field holds the ratio of that limit to the
  ///level's nominal concurrency limit. When this field is non-nil, it must hold a
  ///non-negative integer and the limit is calculated as follows.
  ///
  ///BorrowingCL(i) = round( NominalCL(i) * borrowingLimitPercent(i)/100.0 )
  ///
  ///The value of this field can be more than 100, implying that this priority level can
  ///borrow a number of seats that is greater than its own nominal concurrency limit
  ///(NominalCL). When this field is left `nil`, the limit is effectively infinite.
  @JsonKey(name: 'borrowingLimitPercent')
  int? borrowingLimitPercent;

  ///`lendablePercent` prescribes the fraction of the level's NominalCL that can be borrowed
  ///by other priority levels. The value of this field must be between 0 and 100, inclusive,
  ///and it defaults to 0. The number of seats that other levels can borrow from this level,
  ///known as this level's LendableConcurrencyLimit (LendableCL), is defined as follows.
  ///
  ///LendableCL(i) = round( NominalCL(i) * lendablePercent(i)/100.0 )
  @JsonKey(name: 'lendablePercent')
  int? lendablePercent;

  ///LimitResponse defines how to handle requests that can not be executed right now.
  @JsonKey(name: 'limitResponse')
  LimitResponse? limitResponse;

  ///`nominalConcurrencyShares` (NCS) contributes to the computation of the
  ///NominalConcurrencyLimit (NominalCL) of this level. This is the number of execution seats
  ///available at this priority level. This is used both for requests dispatched from this
  ///priority level as well as requests dispatched from other priority levels borrowing seats
  ///from this level. The server's concurrency limit (ServerCL) is divided among the Limited
  ///priority levels in proportion to their NCS values:
  ///
  ///NominalCL(i)  = ceil( ServerCL * NCS(i) / sum_ncs ) sum_ncs = sum[priority level k]
  ///NCS(k)
  ///
  ///Bigger numbers mean a larger nominal concurrency limit, at the expense of every other
  ///priority level.
  ///
  ///If not specified, this field defaults to a value of 30.
  ///
  ///Setting this field to zero supports the construction of a "jail" for this priority level
  ///that is used to hold some request(s)
  @JsonKey(name: 'nominalConcurrencyShares')
  int? nominalConcurrencyShares;

  Limited({
    this.borrowingLimitPercent,
    this.lendablePercent,
    this.limitResponse,
    this.nominalConcurrencyShares,
  });

  factory Limited.fromJson(Map<String, dynamic> json) =>
      _$LimitedFromJson(json);

  Map<String, dynamic> toJson() => _$LimitedToJson(this);
}

@JsonSerializable()
class LimitResponse {
  ///QueuingConfiguration holds the configuration parameters for queuing
  @JsonKey(name: 'queuing')
  Queuing? queuing;

  ///`type` is "Queue" or "Reject". "Queue" means that requests that can not be executed upon
  ///arrival are held in a queue until they can be executed or a queuing limit is reached.
  ///"Reject" means that requests that can not be executed upon arrival are rejected. Required.
  @JsonKey(name: 'type')
  String type;

  LimitResponse({this.queuing, required this.type});

  factory LimitResponse.fromJson(Map<String, dynamic> json) =>
      _$LimitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LimitResponseToJson(this);
}

@JsonSerializable()
class Queuing {
  ///`handSize` is a small positive number that configures the shuffle sharding of requests
  ///into queues.  When enqueuing a request at this priority level the request's flow
  ///identifier (a string pair) is hashed and the hash value is used to shuffle the list of
  ///queues and deal a hand of the size specified here.  The request is put into one of the
  ///shortest queues in that hand. `handSize` must be no larger than `queues`, and should be
  ///significantly smaller (so that a few heavy flows do not saturate most of the queues).
  ///See the user-facing documentation for more extensive guidance on setting this field.
  ///This field has a default value of 8.
  @JsonKey(name: 'handSize')
  int? handSize;

  ///`queueLengthLimit` is the maximum number of requests allowed to be waiting in a given
  ///queue of this priority level at a time; excess requests are rejected.  This value must be
  ///positive.  If not specified, it will be defaulted to 50.
  @JsonKey(name: 'queueLengthLimit')
  int? queueLengthLimit;

  ///`queues` is the number of queues for this priority level. The queues exist independently
  ///at each apiserver. The value must be positive.  Setting it to 1 effectively precludes
  ///shufflesharding and thus makes the distinguisher method of associated flow schemas
  ///irrelevant.  This field has a default value of 64.
  @JsonKey(name: 'queues')
  int? queues;

  Queuing({this.handSize, this.queueLengthLimit, this.queues});

  factory Queuing.fromJson(Map<String, dynamic> json) =>
      _$QueuingFromJson(json);

  Map<String, dynamic> toJson() => _$QueuingToJson(this);
}

@JsonSerializable()
class Status {
  ///`conditions` is the current state of "request-priority".
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  Status({this.conditions});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///`message` is a human-readable message indicating details about last transition.
  @JsonKey(name: 'message')
  String? message;

  ///`reason` is a unique, one-word, CamelCase reason for the condition's last transition.
  @JsonKey(name: 'reason')
  String? reason;

  ///`status` is the status of the condition. Can be True, False, Unknown. Required.
  @JsonKey(name: 'status')
  String? status;

  ///`type` is the type of the condition. Required.
  @JsonKey(name: 'type')
  String? type;

  Condition({
    this.lastTransitionTime,
    this.message,
    this.reason,
    this.status,
    this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum PrioritylevelconfigurationlistFlowcontrolV1Kind {
  @JsonValue('PriorityLevelConfigurationList')
  PRIORITY_LEVEL_CONFIGURATION_LIST,
}

final prioritylevelconfigurationlistFlowcontrolV1KindValues = EnumValues({
  'PriorityLevelConfigurationList':
      PrioritylevelconfigurationlistFlowcontrolV1Kind
          .PRIORITY_LEVEL_CONFIGURATION_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class PrioritylevelconfigurationlistFlowcontrolV1Metadata {
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

  PrioritylevelconfigurationlistFlowcontrolV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory PrioritylevelconfigurationlistFlowcontrolV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$PrioritylevelconfigurationlistFlowcontrolV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PrioritylevelconfigurationlistFlowcontrolV1MetadataToJson(this);
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
