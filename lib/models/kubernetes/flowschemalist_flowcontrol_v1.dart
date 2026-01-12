import 'package:json_annotation/json_annotation.dart';

part 'flowschemalist_flowcontrol_v1.g.dart';

///FlowSchemaList is a list of FlowSchema objects.
@JsonSerializable()
class FlowschemalistFlowcontrolV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///`items` is a list of FlowSchemas.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  FlowschemalistFlowcontrolV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  FlowschemalistFlowcontrolV1Metadata? metadata;

  FlowschemalistFlowcontrolV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory FlowschemalistFlowcontrolV1.fromJson(Map<String, dynamic> json) =>
      _$FlowschemalistFlowcontrolV1FromJson(json);

  Map<String, dynamic> toJson() => _$FlowschemalistFlowcontrolV1ToJson(this);
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

  ///FlowSchemaSpec describes how the FlowSchema's specification looks like.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///FlowSchemaStatus represents the current state of a FlowSchema.
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
  @JsonValue('FlowSchema')
  FLOW_SCHEMA,
}

final itemKindValues = EnumValues({'FlowSchema': ItemKind.FLOW_SCHEMA});

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
  ///FlowDistinguisherMethod specifies the method of a flow distinguisher.
  @JsonKey(name: 'distinguisherMethod')
  DistinguisherMethod? distinguisherMethod;

  ///`matchingPrecedence` is used to choose among the FlowSchemas that match a given request.
  ///The chosen FlowSchema is among those with the numerically lowest (which we take to be
  ///logically highest) MatchingPrecedence.  Each MatchingPrecedence value must be ranged in
  ///[1,10000]. Note that if the precedence is not specified, it will be set to 1000 as
  ///default.
  @JsonKey(name: 'matchingPrecedence')
  int? matchingPrecedence;

  ///PriorityLevelConfigurationReference contains information that points to the
  ///"request-priority" being used.
  @JsonKey(name: 'priorityLevelConfiguration')
  PriorityLevelConfiguration priorityLevelConfiguration;

  ///`rules` describes which requests will match this flow schema. This FlowSchema matches a
  ///request if and only if at least one member of rules matches the request. if it is an
  ///empty slice, there will be no requests matching the FlowSchema.
  @JsonKey(name: 'rules')
  List<Rule?>? rules;

  Spec({
    this.distinguisherMethod,
    this.matchingPrecedence,
    required this.priorityLevelConfiguration,
    this.rules,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class DistinguisherMethod {
  ///`type` is the type of flow distinguisher method The supported types are "ByUser" and
  ///"ByNamespace". Required.
  @JsonKey(name: 'type')
  String type;

  DistinguisherMethod({required this.type});

  factory DistinguisherMethod.fromJson(Map<String, dynamic> json) =>
      _$DistinguisherMethodFromJson(json);

  Map<String, dynamic> toJson() => _$DistinguisherMethodToJson(this);
}

///PriorityLevelConfigurationReference contains information that points to the
///"request-priority" being used.
@JsonSerializable()
class PriorityLevelConfiguration {
  ///`name` is the name of the priority level configuration being referenced Required.
  @JsonKey(name: 'name')
  String name;

  PriorityLevelConfiguration({required this.name});

  factory PriorityLevelConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PriorityLevelConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$PriorityLevelConfigurationToJson(this);
}

@JsonSerializable()
class Rule {
  ///`nonResourceRules` is a list of NonResourcePolicyRules that identify matching requests
  ///according to their verb and the target non-resource URL.
  @JsonKey(name: 'nonResourceRules')
  List<NonResourceRule?>? nonResourceRules;

  ///`resourceRules` is a slice of ResourcePolicyRules that identify matching requests
  ///according to their verb and the target resource. At least one of `resourceRules` and
  ///`nonResourceRules` has to be non-empty.
  @JsonKey(name: 'resourceRules')
  List<ResourceRule?>? resourceRules;

  ///subjects is the list of normal user, serviceaccount, or group that this rule cares about.
  ///There must be at least one member in this slice. A slice that includes both the
  ///system:authenticated and system:unauthenticated user groups matches every request.
  ///Required.
  @JsonKey(name: 'subjects')
  List<Subject?> subjects;

  Rule({this.nonResourceRules, this.resourceRules, required this.subjects});

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}

@JsonSerializable()
class NonResourceRule {
  ///`nonResourceURLs` is a set of url prefixes that a user should have access to and may not
  ///be empty. For example:
  ///- "/healthz" is legal
  ///- "/hea*" is illegal
  ///- "/hea" is legal but matches nothing
  ///- "/hea/*" also matches nothing
  ///- "/healthz/*" matches all per-component health checks.
  ///"*" matches all non-resource urls. if it is present, it must be the only entry. Required.
  @JsonKey(name: 'nonResourceURLs')
  List<String?> nonResourceUrLs;

  ///`verbs` is a list of matching verbs and may not be empty. "*" matches all verbs. If it is
  ///present, it must be the only entry. Required.
  @JsonKey(name: 'verbs')
  List<String?> verbs;

  NonResourceRule({required this.nonResourceUrLs, required this.verbs});

  factory NonResourceRule.fromJson(Map<String, dynamic> json) =>
      _$NonResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$NonResourceRuleToJson(this);
}

@JsonSerializable()
class ResourceRule {
  ///`apiGroups` is a list of matching API groups and may not be empty. "*" matches all API
  ///groups and, if present, must be the only entry. Required.
  @JsonKey(name: 'apiGroups')
  List<String?> apiGroups;

  ///`clusterScope` indicates whether to match requests that do not specify a namespace (which
  ///happens either because the resource is not namespaced or the request targets all
  ///namespaces). If this field is omitted or false then the `namespaces` field must contain a
  ///non-empty list.
  @JsonKey(name: 'clusterScope')
  bool? clusterScope;

  ///`namespaces` is a list of target namespaces that restricts matches.  A request that
  ///specifies a target namespace matches only if either (a) this list contains that target
  ///namespace or (b) this list contains "*".  Note that "*" matches any specified namespace
  ///but does not match a request that _does not specify_ a namespace (see the `clusterScope`
  ///field for that). This list may be empty, but only if `clusterScope` is true.
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///`resources` is a list of matching resources (i.e., lowercase and plural) with, if
  ///desired, subresource.  For example, [ "services", "nodes/status" ].  This list may not be
  ///empty. "*" matches all resources and, if present, must be the only entry. Required.
  @JsonKey(name: 'resources')
  List<String?> resources;

  ///`verbs` is a list of matching verbs and may not be empty. "*" matches all verbs and, if
  ///present, must be the only entry. Required.
  @JsonKey(name: 'verbs')
  List<String?> verbs;

  ResourceRule({
    required this.apiGroups,
    this.clusterScope,
    this.namespaces,
    required this.resources,
    required this.verbs,
  });

  factory ResourceRule.fromJson(Map<String, dynamic> json) =>
      _$ResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceRuleToJson(this);
}

@JsonSerializable()
class Subject {
  ///GroupSubject holds detailed information for group-kind subject.
  @JsonKey(name: 'group')
  Group? group;

  ///`kind` indicates which one of the other fields is non-empty. Required
  @JsonKey(name: 'kind')
  String kind;

  ///ServiceAccountSubject holds detailed information for service-account-kind subject.
  @JsonKey(name: 'serviceAccount')
  ServiceAccount? serviceAccount;

  ///UserSubject holds detailed information for user-kind subject.
  @JsonKey(name: 'user')
  User? user;

  Subject({this.group, required this.kind, this.serviceAccount, this.user});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Group {
  ///name is the user group that matches, or "*" to match all user groups. See
  ///https://github.com/kubernetes/apiserver/blob/master/pkg/authentication/user/user.go for
  ///some well-known group names. Required.
  @JsonKey(name: 'name')
  String name;

  Group({required this.name});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

@JsonSerializable()
class ServiceAccount {
  ///`name` is the name of matching ServiceAccount objects, or "*" to match regardless of
  ///name. Required.
  @JsonKey(name: 'name')
  String name;

  ///`namespace` is the namespace of matching ServiceAccount objects. Required.
  @JsonKey(name: 'namespace')
  String namespace;

  ServiceAccount({required this.name, required this.namespace});

  factory ServiceAccount.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountToJson(this);
}

@JsonSerializable()
class User {
  ///`name` is the username that matches, or "*" to match all usernames. Required.
  @JsonKey(name: 'name')
  String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Status {
  ///`conditions` is a list of the current states of FlowSchema.
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
enum FlowschemalistFlowcontrolV1Kind {
  @JsonValue('FlowSchemaList')
  FLOW_SCHEMA_LIST,
}

final flowschemalistFlowcontrolV1KindValues = EnumValues({
  'FlowSchemaList': FlowschemalistFlowcontrolV1Kind.FLOW_SCHEMA_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class FlowschemalistFlowcontrolV1Metadata {
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

  FlowschemalistFlowcontrolV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory FlowschemalistFlowcontrolV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$FlowschemalistFlowcontrolV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FlowschemalistFlowcontrolV1MetadataToJson(this);
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
