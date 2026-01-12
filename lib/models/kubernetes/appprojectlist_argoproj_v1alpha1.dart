import 'package:json_annotation/json_annotation.dart';

part 'appprojectlist_argoproj_v1alpha1.g.dart';

///AppProjectList is a list of AppProject
@JsonSerializable()
class AppprojectlistArgoprojV1Alpha1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of appprojects. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<AppprojectlistArgoprojV1Alpha1Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  AppprojectlistArgoprojV1Alpha1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  AppprojectlistArgoprojV1Alpha1Metadata? metadata;

  AppprojectlistArgoprojV1Alpha1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory AppprojectlistArgoprojV1Alpha1.fromJson(Map<String, dynamic> json) =>
      _$AppprojectlistArgoprojV1Alpha1FromJson(json);

  Map<String, dynamic> toJson() => _$AppprojectlistArgoprojV1Alpha1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('argoproj.io/v1alpha1')
  ARGOPROJ_IO_V1_ALPHA1,
}

final apiVersionValues = EnumValues({
  'argoproj.io/v1alpha1': ApiVersion.ARGOPROJ_IO_V1_ALPHA1,
});

@JsonSerializable()
class AppprojectlistArgoprojV1Alpha1Item {
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
  ItemMetadata metadata;

  ///AppProjectSpec is the specification of an AppProject
  @JsonKey(name: 'spec')
  Spec spec;

  ///AppProjectStatus contains status information for AppProject CRs
  @JsonKey(name: 'status')
  Status? status;

  AppprojectlistArgoprojV1Alpha1Item({
    this.apiVersion,
    this.kind,
    required this.metadata,
    required this.spec,
    this.status,
  });

  factory AppprojectlistArgoprojV1Alpha1Item.fromJson(
    Map<String, dynamic> json,
  ) => _$AppprojectlistArgoprojV1Alpha1ItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppprojectlistArgoprojV1Alpha1ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('AppProject')
  APP_PROJECT,
}

final itemKindValues = EnumValues({'AppProject': ItemKind.APP_PROJECT});

///ObjectMeta is metadata that all persisted resources must have, which includes all objects
///users must create.
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

///AppProjectSpec is the specification of an AppProject
@JsonSerializable()
class Spec {
  ///ClusterResourceBlacklist contains list of blacklisted cluster level resources
  @JsonKey(name: 'clusterResourceBlacklist')
  List<ClusterResourceBlacklist?>? clusterResourceBlacklist;

  ///ClusterResourceWhitelist contains list of whitelisted cluster level resources
  @JsonKey(name: 'clusterResourceWhitelist')
  List<ClusterResourceWhitelist?>? clusterResourceWhitelist;

  ///Description contains optional project description
  @JsonKey(name: 'description')
  String? description;

  ///Destinations contains list of destinations available for deployment
  @JsonKey(name: 'destinations')
  List<Destination?>? destinations;

  ///DestinationServiceAccounts holds information about the service accounts to be
  ///impersonated for the application sync operation for each destination.
  @JsonKey(name: 'destinationServiceAccounts')
  List<DestinationServiceAccount?>? destinationServiceAccounts;

  ///NamespaceResourceBlacklist contains list of blacklisted namespace level resources
  @JsonKey(name: 'namespaceResourceBlacklist')
  List<NamespaceResourceBlacklist?>? namespaceResourceBlacklist;

  ///NamespaceResourceWhitelist contains list of whitelisted namespace level resources
  @JsonKey(name: 'namespaceResourceWhitelist')
  List<NamespaceResourceWhitelist?>? namespaceResourceWhitelist;

  ///OrphanedResources specifies if controller should monitor orphaned resources of apps in
  ///this project
  @JsonKey(name: 'orphanedResources')
  OrphanedResources? orphanedResources;

  ///PermitOnlyProjectScopedClusters determines whether destinations can only reference
  ///clusters which are project-scoped
  @JsonKey(name: 'permitOnlyProjectScopedClusters')
  bool? permitOnlyProjectScopedClusters;

  ///Roles are user defined RBAC roles associated with this project
  @JsonKey(name: 'roles')
  List<Role?>? roles;

  ///SignatureKeys contains a list of PGP key IDs that commits in Git must be signed with in
  ///order to be allowed for sync
  @JsonKey(name: 'signatureKeys')
  List<SignatureKey?>? signatureKeys;

  ///SourceNamespaces defines the namespaces application resources are allowed to be created in
  @JsonKey(name: 'sourceNamespaces')
  List<String?>? sourceNamespaces;

  ///SourceRepos contains list of repository URLs which can be used for deployment
  @JsonKey(name: 'sourceRepos')
  List<String?>? sourceRepos;

  ///SyncWindows controls when syncs can be run for apps in this project
  @JsonKey(name: 'syncWindows')
  List<SyncWindow?>? syncWindows;

  Spec({
    this.clusterResourceBlacklist,
    this.clusterResourceWhitelist,
    this.description,
    this.destinations,
    this.destinationServiceAccounts,
    this.namespaceResourceBlacklist,
    this.namespaceResourceWhitelist,
    this.orphanedResources,
    this.permitOnlyProjectScopedClusters,
    this.roles,
    this.signatureKeys,
    this.sourceNamespaces,
    this.sourceRepos,
    this.syncWindows,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class ClusterResourceBlacklist {
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'kind')
  String kind;

  ClusterResourceBlacklist({required this.group, required this.kind});

  factory ClusterResourceBlacklist.fromJson(Map<String, dynamic> json) =>
      _$ClusterResourceBlacklistFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterResourceBlacklistToJson(this);
}

@JsonSerializable()
class ClusterResourceWhitelist {
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'kind')
  String kind;

  ClusterResourceWhitelist({required this.group, required this.kind});

  factory ClusterResourceWhitelist.fromJson(Map<String, dynamic> json) =>
      _$ClusterResourceWhitelistFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterResourceWhitelistToJson(this);
}

@JsonSerializable()
class DestinationServiceAccount {
  ///DefaultServiceAccount to be used for impersonation during the sync operation
  @JsonKey(name: 'defaultServiceAccount')
  String defaultServiceAccount;

  ///Namespace specifies the target namespace for the application's resources.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Server specifies the URL of the target cluster's Kubernetes control plane API.
  @JsonKey(name: 'server')
  String server;

  DestinationServiceAccount({
    required this.defaultServiceAccount,
    this.namespace,
    required this.server,
  });

  factory DestinationServiceAccount.fromJson(Map<String, dynamic> json) =>
      _$DestinationServiceAccountFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationServiceAccountToJson(this);
}

@JsonSerializable()
class Destination {
  ///Name is an alternate way of specifying the target cluster by its symbolic name. This must
  ///be set if Server is not set.
  @JsonKey(name: 'name')
  String? name;

  ///Namespace specifies the target namespace for the application's resources.
  ///The namespace will only be set for namespace-scoped resources that have not set a value
  ///for .metadata.namespace
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Server specifies the URL of the target cluster's Kubernetes control plane API. This must
  ///be set if Name is not set.
  @JsonKey(name: 'server')
  String? server;

  Destination({this.name, this.namespace, this.server});

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable()
class NamespaceResourceBlacklist {
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'kind')
  String kind;

  NamespaceResourceBlacklist({required this.group, required this.kind});

  factory NamespaceResourceBlacklist.fromJson(Map<String, dynamic> json) =>
      _$NamespaceResourceBlacklistFromJson(json);

  Map<String, dynamic> toJson() => _$NamespaceResourceBlacklistToJson(this);
}

@JsonSerializable()
class NamespaceResourceWhitelist {
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'kind')
  String kind;

  NamespaceResourceWhitelist({required this.group, required this.kind});

  factory NamespaceResourceWhitelist.fromJson(Map<String, dynamic> json) =>
      _$NamespaceResourceWhitelistFromJson(json);

  Map<String, dynamic> toJson() => _$NamespaceResourceWhitelistToJson(this);
}

@JsonSerializable()
class OrphanedResources {
  ///Ignore contains a list of resources that are to be excluded from orphaned resources
  ///monitoring
  @JsonKey(name: 'ignore')
  List<Ignore?>? ignore;

  ///Warn indicates if warning condition should be created for apps which have orphaned
  ///resources
  @JsonKey(name: 'warn')
  bool? warn;

  OrphanedResources({this.ignore, this.warn});

  factory OrphanedResources.fromJson(Map<String, dynamic> json) =>
      _$OrphanedResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$OrphanedResourcesToJson(this);
}

@JsonSerializable()
class Ignore {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'name')
  String? name;

  Ignore({this.group, this.kind, this.name});

  factory Ignore.fromJson(Map<String, dynamic> json) => _$IgnoreFromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreToJson(this);
}

@JsonSerializable()
class Role {
  ///Description is a description of the role
  @JsonKey(name: 'description')
  String? description;

  ///Groups are a list of OIDC group claims bound to this role
  @JsonKey(name: 'groups')
  List<String?>? groups;

  ///JWTTokens are a list of generated JWT tokens bound to this role
  @JsonKey(name: 'jwtTokens')
  List<JwtToken?>? jwtTokens;

  ///Name is a name for this role
  @JsonKey(name: 'name')
  String name;

  ///Policies Stores a list of casbin formatted strings that define access policies for the
  ///role in the project
  @JsonKey(name: 'policies')
  List<String?>? policies;

  Role({
    this.description,
    this.groups,
    this.jwtTokens,
    required this.name,
    this.policies,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class JwtToken {
  @JsonKey(name: 'exp')
  int? exp;
  @JsonKey(name: 'iat')
  int iat;
  @JsonKey(name: 'id')
  String? id;

  JwtToken({this.exp, required this.iat, this.id});

  factory JwtToken.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenFromJson(json);

  Map<String, dynamic> toJson() => _$JwtTokenToJson(this);
}

@JsonSerializable()
class SignatureKey {
  ///The ID of the key in hexadecimal notation
  @JsonKey(name: 'keyID')
  String keyId;

  SignatureKey({required this.keyId});

  factory SignatureKey.fromJson(Map<String, dynamic> json) =>
      _$SignatureKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureKeyToJson(this);
}

@JsonSerializable()
class SyncWindow {
  ///UseAndOperator use AND operator for matching applications, namespaces and clusters
  ///instead of the default OR operator
  @JsonKey(name: 'andOperator')
  bool? andOperator;

  ///Applications contains a list of applications that the window will apply to
  @JsonKey(name: 'applications')
  List<String?>? applications;

  ///Clusters contains a list of clusters that the window will apply to
  @JsonKey(name: 'clusters')
  List<String?>? clusters;

  ///Description of the sync that will be applied to the schedule, can be used to add any
  ///information such as a ticket number for example
  @JsonKey(name: 'description')
  String? description;

  ///Duration is the amount of time the sync window will be open
  @JsonKey(name: 'duration')
  String? duration;

  ///Kind defines if the window allows or blocks syncs
  @JsonKey(name: 'kind')
  String? kind;

  ///ManualSync enables manual syncs when they would otherwise be blocked
  @JsonKey(name: 'manualSync')
  bool? manualSync;

  ///Namespaces contains a list of namespaces that the window will apply to
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///Schedule is the time the window will begin, specified in cron format
  @JsonKey(name: 'schedule')
  String? schedule;

  ///TimeZone of the sync that will be applied to the schedule
  @JsonKey(name: 'timeZone')
  String? timeZone;

  SyncWindow({
    this.andOperator,
    this.applications,
    this.clusters,
    this.description,
    this.duration,
    this.kind,
    this.manualSync,
    this.namespaces,
    this.schedule,
    this.timeZone,
  });

  factory SyncWindow.fromJson(Map<String, dynamic> json) =>
      _$SyncWindowFromJson(json);

  Map<String, dynamic> toJson() => _$SyncWindowToJson(this);
}

@JsonSerializable()
class Status {
  ///JWTTokensByRole contains a list of JWT tokens issued for a given role
  @JsonKey(name: 'jwtTokensByRole')
  Map<String, JwtTokensByRole?>? jwtTokensByRole;

  Status({this.jwtTokensByRole});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class JwtTokensByRole {
  @JsonKey(name: 'items')
  List<JwtTokensByRoleItem?>? items;

  JwtTokensByRole({this.items});

  factory JwtTokensByRole.fromJson(Map<String, dynamic> json) =>
      _$JwtTokensByRoleFromJson(json);

  Map<String, dynamic> toJson() => _$JwtTokensByRoleToJson(this);
}

@JsonSerializable()
class JwtTokensByRoleItem {
  @JsonKey(name: 'exp')
  int? exp;
  @JsonKey(name: 'iat')
  int iat;
  @JsonKey(name: 'id')
  String? id;

  JwtTokensByRoleItem({this.exp, required this.iat, this.id});

  factory JwtTokensByRoleItem.fromJson(Map<String, dynamic> json) =>
      _$JwtTokensByRoleItemFromJson(json);

  Map<String, dynamic> toJson() => _$JwtTokensByRoleItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum AppprojectlistArgoprojV1Alpha1Kind {
  @JsonValue('AppProjectList')
  APP_PROJECT_LIST,
}

final appprojectlistArgoprojV1Alpha1KindValues = EnumValues({
  'AppProjectList': AppprojectlistArgoprojV1Alpha1Kind.APP_PROJECT_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class AppprojectlistArgoprojV1Alpha1Metadata {
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

  AppprojectlistArgoprojV1Alpha1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory AppprojectlistArgoprojV1Alpha1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$AppprojectlistArgoprojV1Alpha1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppprojectlistArgoprojV1Alpha1MetadataToJson(this);
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
