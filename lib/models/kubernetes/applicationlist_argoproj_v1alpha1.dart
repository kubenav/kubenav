import 'package:json_annotation/json_annotation.dart';

part 'applicationlist_argoproj_v1alpha1.g.dart';

///ApplicationList is a list of Application
@JsonSerializable()
class ApplicationlistArgoprojV1Alpha1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of applications. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ApplicationlistArgoprojV1Alpha1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ApplicationlistArgoprojV1Alpha1Metadata? metadata;

  ApplicationlistArgoprojV1Alpha1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ApplicationlistArgoprojV1Alpha1.fromJson(Map<String, dynamic> json) =>
      _$ApplicationlistArgoprojV1Alpha1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApplicationlistArgoprojV1Alpha1ToJson(this);
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
  ItemMetadata metadata;

  ///Operation contains information about a requested or running operation
  @JsonKey(name: 'operation')
  ItemOperation? operation;

  ///ApplicationSpec represents desired application state. Contains link to repository with
  ///application definition and additional parameters link definition revision.
  @JsonKey(name: 'spec')
  Spec spec;

  ///ApplicationStatus contains status information for the application
  @JsonKey(name: 'status')
  Status? status;

  Item({
    this.apiVersion,
    this.kind,
    required this.metadata,
    this.operation,
    required this.spec,
    this.status,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('Application')
  APPLICATION,
}

final itemKindValues = EnumValues({'Application': ItemKind.APPLICATION});

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

@JsonSerializable()
class ItemOperation {
  ///Info is a list of informational items for this operation
  @JsonKey(name: 'info')
  List<PurpleInfo?>? info;

  ///InitiatedBy contains information about who initiated the operations
  @JsonKey(name: 'initiatedBy')
  PurpleInitiatedBy? initiatedBy;

  ///Retry controls the strategy to apply if a sync fails
  @JsonKey(name: 'retry')
  PurpleRetry? retry;

  ///Sync contains parameters for the operation
  @JsonKey(name: 'sync')
  PurpleSync? sync;

  ItemOperation({this.info, this.initiatedBy, this.retry, this.sync});

  factory ItemOperation.fromJson(Map<String, dynamic> json) =>
      _$ItemOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOperationToJson(this);
}

@JsonSerializable()
class PurpleInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  PurpleInfo({required this.name, required this.value});

  factory PurpleInfo.fromJson(Map<String, dynamic> json) =>
      _$PurpleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleInfoToJson(this);
}

@JsonSerializable()
class PurpleInitiatedBy {
  ///Automated is set to true if operation was initiated automatically by the application
  ///controller.
  @JsonKey(name: 'automated')
  bool? automated;

  ///Username contains the name of a user who started operation
  @JsonKey(name: 'username')
  String? username;

  PurpleInitiatedBy({this.automated, this.username});

  factory PurpleInitiatedBy.fromJson(Map<String, dynamic> json) =>
      _$PurpleInitiatedByFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleInitiatedByToJson(this);
}

@JsonSerializable()
class PurpleRetry {
  ///Backoff controls how to backoff on subsequent retries of failed syncs
  @JsonKey(name: 'backoff')
  PurpleBackoff? backoff;

  ///Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no
  ///retries will be performed.
  @JsonKey(name: 'limit')
  int? limit;

  ///Refresh indicates if the latest revision should be used on retry instead of the initial
  ///one (default: false)
  @JsonKey(name: 'refresh')
  bool? refresh;

  PurpleRetry({this.backoff, this.limit, this.refresh});

  factory PurpleRetry.fromJson(Map<String, dynamic> json) =>
      _$PurpleRetryFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleRetryToJson(this);
}

@JsonSerializable()
class PurpleBackoff {
  ///Duration is the amount to back off. Default unit is seconds, but could also be a duration
  ///(e.g. "2m", "1h")
  @JsonKey(name: 'duration')
  String? duration;

  ///Factor is a factor to multiply the base duration after each failed retry
  @JsonKey(name: 'factor')
  int? factor;

  ///MaxDuration is the maximum amount of time allowed for the backoff strategy
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  PurpleBackoff({this.duration, this.factor, this.maxDuration});

  factory PurpleBackoff.fromJson(Map<String, dynamic> json) =>
      _$PurpleBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBackoffToJson(this);
}

@JsonSerializable()
class PurpleSync {
  ///SelfHealAttemptsCount contains the number of auto-heal attempts
  @JsonKey(name: 'autoHealAttemptsCount')
  int? autoHealAttemptsCount;

  ///DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the
  ///sync
  @JsonKey(name: 'dryRun')
  bool? dryRun;

  ///Manifests is an optional field that overrides sync source with a local directory for
  ///development
  @JsonKey(name: 'manifests')
  List<String?>? manifests;

  ///Prune specifies to delete resources from the cluster that are no longer tracked in git
  @JsonKey(name: 'prune')
  bool? prune;

  ///Resources describes which resources shall be part of the sync
  @JsonKey(name: 'resources')
  List<PurpleResource?>? resources;

  ///Revision is the revision (Git) or chart version (Helm) which to sync the application to
  ///If omitted, will use the revision specified in app spec.
  @JsonKey(name: 'revision')
  String? revision;

  ///Revisions is the list of revision (Git) or chart version (Helm) which to sync each source
  ///in sources field for the application to
  ///If omitted, will use the revision specified in app spec.
  @JsonKey(name: 'revisions')
  List<String?>? revisions;

  ///Source overrides the source definition set in the application.
  ///This is typically set in a Rollback operation and is nil during a Sync operation
  @JsonKey(name: 'source')
  PurpleSource? source;

  ///Sources overrides the source definition set in the application.
  ///This is typically set in a Rollback operation and is nil during a Sync operation
  @JsonKey(name: 'sources')
  List<FluffySource?>? sources;

  ///SyncOptions provide per-sync sync-options, e.g. Validate=false
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  ///SyncStrategy describes how to perform the sync
  @JsonKey(name: 'syncStrategy')
  PurpleSyncStrategy? syncStrategy;

  PurpleSync({
    this.autoHealAttemptsCount,
    this.dryRun,
    this.manifests,
    this.prune,
    this.resources,
    this.revision,
    this.revisions,
    this.source,
    this.sources,
    this.syncOptions,
    this.syncStrategy,
  });

  factory PurpleSync.fromJson(Map<String, dynamic> json) =>
      _$PurpleSyncFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSyncToJson(this);
}

@JsonSerializable()
class PurpleResource {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'namespace')
  String? namespace;

  PurpleResource({
    this.group,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory PurpleResource.fromJson(Map<String, dynamic> json) =>
      _$PurpleResourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleResourceToJson(this);
}

@JsonSerializable()
class PurpleSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  PurpleDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  PurpleHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  PurpleKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  PurplePlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  PurpleSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory PurpleSource.fromJson(Map<String, dynamic> json) =>
      _$PurpleSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSourceToJson(this);
}

@JsonSerializable()
class PurpleDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  PurpleJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  PurpleDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory PurpleDirectory.fromJson(Map<String, dynamic> json) =>
      _$PurpleDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleDirectoryToJson(this);
}

@JsonSerializable()
class PurpleJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<PurpleExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<PurpleTlas?>? tlas;

  PurpleJsonnet({this.extVars, this.libs, this.tlas});

  factory PurpleJsonnet.fromJson(Map<String, dynamic> json) =>
      _$PurpleJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleJsonnetToJson(this);
}

@JsonSerializable()
class PurpleExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  PurpleExtVar({this.code, required this.name, required this.value});

  factory PurpleExtVar.fromJson(Map<String, dynamic> json) =>
      _$PurpleExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleExtVarToJson(this);
}

@JsonSerializable()
class PurpleTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  PurpleTlas({this.code, required this.name, required this.value});

  factory PurpleTlas.fromJson(Map<String, dynamic> json) =>
      _$PurpleTlasFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTlasToJson(this);
}

@JsonSerializable()
class PurpleHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<PurpleFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<PurpleParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  PurpleHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory PurpleHelm.fromJson(Map<String, dynamic> json) =>
      _$PurpleHelmFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHelmToJson(this);
}

@JsonSerializable()
class PurpleFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  PurpleFileParameter({this.name, this.path});

  factory PurpleFileParameter.fromJson(Map<String, dynamic> json) =>
      _$PurpleFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFileParameterToJson(this);
}

@JsonSerializable()
class PurpleParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  PurpleParameter({this.forceString, this.name, this.value});

  factory PurpleParameter.fromJson(Map<String, dynamic> json) =>
      _$PurpleParameterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleParameterToJson(this);
}

@JsonSerializable()
class PurpleKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<PurplePatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<PurpleReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  PurpleKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory PurpleKustomize.fromJson(Map<String, dynamic> json) =>
      _$PurpleKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleKustomizeToJson(this);
}

@JsonSerializable()
class PurplePatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  PurpleTarget? target;

  PurplePatch({this.options, this.patch, this.path, this.target});

  factory PurplePatch.fromJson(Map<String, dynamic> json) =>
      _$PurplePatchFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePatchToJson(this);
}

@JsonSerializable()
class PurpleTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  PurpleTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory PurpleTarget.fromJson(Map<String, dynamic> json) =>
      _$PurpleTargetFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTargetToJson(this);
}

@JsonSerializable()
class PurpleReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  PurpleReplica({required this.count, required this.name});

  factory PurpleReplica.fromJson(Map<String, dynamic> json) =>
      _$PurpleReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleReplicaToJson(this);
}

@JsonSerializable()
class PurplePlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<PurpleEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<FluffyParameter?>? parameters;

  PurplePlugin({this.env, this.name, this.parameters});

  factory PurplePlugin.fromJson(Map<String, dynamic> json) =>
      _$PurplePluginFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePluginToJson(this);
}

@JsonSerializable()
class PurpleEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  PurpleEnv({required this.name, required this.value});

  factory PurpleEnv.fromJson(Map<String, dynamic> json) =>
      _$PurpleEnvFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleEnvToJson(this);
}

@JsonSerializable()
class FluffyParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  FluffyParameter({this.array, this.map, this.name, this.string});

  factory FluffyParameter.fromJson(Map<String, dynamic> json) =>
      _$FluffyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyParameterToJson(this);
}

@JsonSerializable()
class FluffySource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  FluffyDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  FluffyHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  FluffyKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  FluffyPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  FluffySource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory FluffySource.fromJson(Map<String, dynamic> json) =>
      _$FluffySourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySourceToJson(this);
}

@JsonSerializable()
class FluffyDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  FluffyJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  FluffyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory FluffyDirectory.fromJson(Map<String, dynamic> json) =>
      _$FluffyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyDirectoryToJson(this);
}

@JsonSerializable()
class FluffyJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<FluffyExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<FluffyTlas?>? tlas;

  FluffyJsonnet({this.extVars, this.libs, this.tlas});

  factory FluffyJsonnet.fromJson(Map<String, dynamic> json) =>
      _$FluffyJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyJsonnetToJson(this);
}

@JsonSerializable()
class FluffyExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FluffyExtVar({this.code, required this.name, required this.value});

  factory FluffyExtVar.fromJson(Map<String, dynamic> json) =>
      _$FluffyExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyExtVarToJson(this);
}

@JsonSerializable()
class FluffyTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FluffyTlas({this.code, required this.name, required this.value});

  factory FluffyTlas.fromJson(Map<String, dynamic> json) =>
      _$FluffyTlasFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTlasToJson(this);
}

@JsonSerializable()
class FluffyHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<FluffyFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<TentacledParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  FluffyHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory FluffyHelm.fromJson(Map<String, dynamic> json) =>
      _$FluffyHelmFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHelmToJson(this);
}

@JsonSerializable()
class FluffyFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  FluffyFileParameter({this.name, this.path});

  factory FluffyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$FluffyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFileParameterToJson(this);
}

@JsonSerializable()
class TentacledParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  TentacledParameter({this.forceString, this.name, this.value});

  factory TentacledParameter.fromJson(Map<String, dynamic> json) =>
      _$TentacledParameterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledParameterToJson(this);
}

@JsonSerializable()
class FluffyKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<FluffyPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<FluffyReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  FluffyKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory FluffyKustomize.fromJson(Map<String, dynamic> json) =>
      _$FluffyKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyKustomizeToJson(this);
}

@JsonSerializable()
class FluffyPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  FluffyTarget? target;

  FluffyPatch({this.options, this.patch, this.path, this.target});

  factory FluffyPatch.fromJson(Map<String, dynamic> json) =>
      _$FluffyPatchFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPatchToJson(this);
}

@JsonSerializable()
class FluffyTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  FluffyTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory FluffyTarget.fromJson(Map<String, dynamic> json) =>
      _$FluffyTargetFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTargetToJson(this);
}

@JsonSerializable()
class FluffyReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  FluffyReplica({required this.count, required this.name});

  factory FluffyReplica.fromJson(Map<String, dynamic> json) =>
      _$FluffyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyReplicaToJson(this);
}

@JsonSerializable()
class FluffyPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<FluffyEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<StickyParameter?>? parameters;

  FluffyPlugin({this.env, this.name, this.parameters});

  factory FluffyPlugin.fromJson(Map<String, dynamic> json) =>
      _$FluffyPluginFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPluginToJson(this);
}

@JsonSerializable()
class FluffyEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  FluffyEnv({required this.name, required this.value});

  factory FluffyEnv.fromJson(Map<String, dynamic> json) =>
      _$FluffyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyEnvToJson(this);
}

@JsonSerializable()
class StickyParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  StickyParameter({this.array, this.map, this.name, this.string});

  factory StickyParameter.fromJson(Map<String, dynamic> json) =>
      _$StickyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$StickyParameterToJson(this);
}

@JsonSerializable()
class PurpleSyncStrategy {
  ///Apply will perform a `kubectl apply` to perform the sync.
  @JsonKey(name: 'apply')
  PurpleApply? apply;

  ///Hook will submit any referenced resources to perform the sync. This is the default
  ///strategy
  @JsonKey(name: 'hook')
  PurpleHook? hook;

  PurpleSyncStrategy({this.apply, this.hook});

  factory PurpleSyncStrategy.fromJson(Map<String, dynamic> json) =>
      _$PurpleSyncStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSyncStrategyToJson(this);
}

@JsonSerializable()
class PurpleApply {
  ///Force indicates whether or not to supply the --force flag to `kubectl apply`.
  ///The --force flag deletes and re-create the resource, when PATCH encounters conflict and
  ///has
  ///retried for 5 times.
  @JsonKey(name: 'force')
  bool? force;

  PurpleApply({this.force});

  factory PurpleApply.fromJson(Map<String, dynamic> json) =>
      _$PurpleApplyFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleApplyToJson(this);
}

@JsonSerializable()
class PurpleHook {
  ///Force indicates whether or not to supply the --force flag to `kubectl apply`.
  ///The --force flag deletes and re-create the resource, when PATCH encounters conflict and
  ///has
  ///retried for 5 times.
  @JsonKey(name: 'force')
  bool? force;

  PurpleHook({this.force});

  factory PurpleHook.fromJson(Map<String, dynamic> json) =>
      _$PurpleHookFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHookToJson(this);
}

///ApplicationSpec represents desired application state. Contains link to repository with
///application definition and additional parameters link definition revision.
@JsonSerializable()
class Spec {
  ///Destination is a reference to the target Kubernetes server and namespace
  @JsonKey(name: 'destination')
  SpecDestination destination;

  ///IgnoreDifferences is a list of resources and their fields which should be ignored during
  ///comparison
  @JsonKey(name: 'ignoreDifferences')
  List<SpecIgnoreDifference?>? ignoreDifferences;

  ///Info contains a list of information (URLs, email addresses, and plain text) that relates
  ///to the application
  @JsonKey(name: 'info')
  List<SpecInfo?>? info;

  ///Project is a reference to the project this application belongs to.
  ///The empty string means that application belongs to the 'default' project.
  @JsonKey(name: 'project')
  String project;

  ///RevisionHistoryLimit limits the number of items kept in the application's revision
  ///history, which is used for informational purposes as well as for rollbacks to previous
  ///versions.
  ///This should only be changed in exceptional circumstances.
  ///Setting to zero will store no history. This will reduce storage used.
  ///Increasing will increase the space used to store the history, so we do not recommend
  ///increasing it.
  ///Default is 10.
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;

  ///Source is a reference to the location of the application's manifests or chart
  @JsonKey(name: 'source')
  TentacledSource? source;

  ///SourceHydrator provides a way to push hydrated manifests back to git before syncing them
  ///to the cluster.
  @JsonKey(name: 'sourceHydrator')
  SpecSourceHydrator? sourceHydrator;

  ///Sources is a reference to the location of the application's manifests or chart
  @JsonKey(name: 'sources')
  List<StickySource?>? sources;

  ///SyncPolicy controls when and how a sync will be performed
  @JsonKey(name: 'syncPolicy')
  SyncPolicy? syncPolicy;

  Spec({
    required this.destination,
    this.ignoreDifferences,
    this.info,
    required this.project,
    this.revisionHistoryLimit,
    this.source,
    this.sourceHydrator,
    this.sources,
    this.syncPolicy,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

///Destination is a reference to the target Kubernetes server and namespace
@JsonSerializable()
class SpecDestination {
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

  SpecDestination({this.name, this.namespace, this.server});

  factory SpecDestination.fromJson(Map<String, dynamic> json) =>
      _$SpecDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecDestinationToJson(this);
}

@JsonSerializable()
class SpecIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;

  ///ManagedFieldsManagers is a list of trusted managers. Fields mutated by those managers
  ///will take precedence over the
  ///desired state defined in the SCM and won't be displayed in diffs
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  SpecIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory SpecIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$SpecIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$SpecIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class SpecInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  SpecInfo({required this.name, required this.value});

  factory SpecInfo.fromJson(Map<String, dynamic> json) =>
      _$SpecInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SpecInfoToJson(this);
}

@JsonSerializable()
class TentacledSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  TentacledDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  TentacledHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  TentacledKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  TentacledPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  TentacledSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory TentacledSource.fromJson(Map<String, dynamic> json) =>
      _$TentacledSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSourceToJson(this);
}

@JsonSerializable()
class TentacledDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  TentacledJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  TentacledDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory TentacledDirectory.fromJson(Map<String, dynamic> json) =>
      _$TentacledDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledDirectoryToJson(this);
}

@JsonSerializable()
class TentacledJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<TentacledExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<TentacledTlas?>? tlas;

  TentacledJsonnet({this.extVars, this.libs, this.tlas});

  factory TentacledJsonnet.fromJson(Map<String, dynamic> json) =>
      _$TentacledJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledJsonnetToJson(this);
}

@JsonSerializable()
class TentacledExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  TentacledExtVar({this.code, required this.name, required this.value});

  factory TentacledExtVar.fromJson(Map<String, dynamic> json) =>
      _$TentacledExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledExtVarToJson(this);
}

@JsonSerializable()
class TentacledTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  TentacledTlas({this.code, required this.name, required this.value});

  factory TentacledTlas.fromJson(Map<String, dynamic> json) =>
      _$TentacledTlasFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTlasToJson(this);
}

@JsonSerializable()
class TentacledHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<TentacledFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<IndigoParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  TentacledHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory TentacledHelm.fromJson(Map<String, dynamic> json) =>
      _$TentacledHelmFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledHelmToJson(this);
}

@JsonSerializable()
class TentacledFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  TentacledFileParameter({this.name, this.path});

  factory TentacledFileParameter.fromJson(Map<String, dynamic> json) =>
      _$TentacledFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFileParameterToJson(this);
}

@JsonSerializable()
class IndigoParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  IndigoParameter({this.forceString, this.name, this.value});

  factory IndigoParameter.fromJson(Map<String, dynamic> json) =>
      _$IndigoParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoParameterToJson(this);
}

@JsonSerializable()
class TentacledKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<TentacledPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<TentacledReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  TentacledKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory TentacledKustomize.fromJson(Map<String, dynamic> json) =>
      _$TentacledKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledKustomizeToJson(this);
}

@JsonSerializable()
class TentacledPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  TentacledTarget? target;

  TentacledPatch({this.options, this.patch, this.path, this.target});

  factory TentacledPatch.fromJson(Map<String, dynamic> json) =>
      _$TentacledPatchFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPatchToJson(this);
}

@JsonSerializable()
class TentacledTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  TentacledTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory TentacledTarget.fromJson(Map<String, dynamic> json) =>
      _$TentacledTargetFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTargetToJson(this);
}

@JsonSerializable()
class TentacledReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  TentacledReplica({required this.count, required this.name});

  factory TentacledReplica.fromJson(Map<String, dynamic> json) =>
      _$TentacledReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledReplicaToJson(this);
}

@JsonSerializable()
class TentacledPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<TentacledEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<IndecentParameter?>? parameters;

  TentacledPlugin({this.env, this.name, this.parameters});

  factory TentacledPlugin.fromJson(Map<String, dynamic> json) =>
      _$TentacledPluginFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPluginToJson(this);
}

@JsonSerializable()
class TentacledEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  TentacledEnv({required this.name, required this.value});

  factory TentacledEnv.fromJson(Map<String, dynamic> json) =>
      _$TentacledEnvFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledEnvToJson(this);
}

@JsonSerializable()
class IndecentParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  IndecentParameter({this.array, this.map, this.name, this.string});

  factory IndecentParameter.fromJson(Map<String, dynamic> json) =>
      _$IndecentParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentParameterToJson(this);
}

@JsonSerializable()
class SpecSourceHydrator {
  ///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
  @JsonKey(name: 'drySource')
  PurpleDrySource drySource;

  ///HydrateTo specifies an optional "staging" location to push hydrated manifests to. An
  ///external system would then
  ///have to move manifests to the SyncSource, e.g. by pull request.
  @JsonKey(name: 'hydrateTo')
  PurpleHydrateTo? hydrateTo;

  ///SyncSource specifies where to sync hydrated manifests from.
  @JsonKey(name: 'syncSource')
  PurpleSyncSource syncSource;

  SpecSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SpecSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$SpecSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$SpecSourceHydratorToJson(this);
}

///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
@JsonSerializable()
class PurpleDrySource {
  ///Path is a directory path within the Git repository where the manifests are located
  @JsonKey(name: 'path')
  String path;

  ///RepoURL is the URL to the git repository that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to hydrate
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  PurpleDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory PurpleDrySource.fromJson(Map<String, dynamic> json) =>
      _$PurpleDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleDrySourceToJson(this);
}

@JsonSerializable()
class PurpleHydrateTo {
  ///TargetBranch is the branch to which hydrated manifests should be committed
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  PurpleHydrateTo({required this.targetBranch});

  factory PurpleHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$PurpleHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHydrateToToJson(this);
}

///SyncSource specifies where to sync hydrated manifests from.
@JsonSerializable()
class PurpleSyncSource {
  ///Path is a directory path within the git repository where hydrated manifests should be
  ///committed to and synced
  ///from. The Path should never point to the root of the repo. If hydrateTo is set, this is
  ///just the path from which
  ///hydrated manifests will be synced.
  @JsonKey(name: 'path')
  String path;

  ///TargetBranch is the branch from which hydrated manifests will be synced.
  ///If HydrateTo is not set, this is also the branch to which hydrated manifests are
  ///committed.
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  PurpleSyncSource({required this.path, required this.targetBranch});

  factory PurpleSyncSource.fromJson(Map<String, dynamic> json) =>
      _$PurpleSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSyncSourceToJson(this);
}

@JsonSerializable()
class StickySource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  StickyDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  StickyHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  StickyKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  StickyPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  StickySource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory StickySource.fromJson(Map<String, dynamic> json) =>
      _$StickySourceFromJson(json);

  Map<String, dynamic> toJson() => _$StickySourceToJson(this);
}

@JsonSerializable()
class StickyDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  StickyJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  StickyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory StickyDirectory.fromJson(Map<String, dynamic> json) =>
      _$StickyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$StickyDirectoryToJson(this);
}

@JsonSerializable()
class StickyJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<StickyExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<StickyTlas?>? tlas;

  StickyJsonnet({this.extVars, this.libs, this.tlas});

  factory StickyJsonnet.fromJson(Map<String, dynamic> json) =>
      _$StickyJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$StickyJsonnetToJson(this);
}

@JsonSerializable()
class StickyExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  StickyExtVar({this.code, required this.name, required this.value});

  factory StickyExtVar.fromJson(Map<String, dynamic> json) =>
      _$StickyExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$StickyExtVarToJson(this);
}

@JsonSerializable()
class StickyTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  StickyTlas({this.code, required this.name, required this.value});

  factory StickyTlas.fromJson(Map<String, dynamic> json) =>
      _$StickyTlasFromJson(json);

  Map<String, dynamic> toJson() => _$StickyTlasToJson(this);
}

@JsonSerializable()
class StickyHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<StickyFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<HilariousParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  StickyHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory StickyHelm.fromJson(Map<String, dynamic> json) =>
      _$StickyHelmFromJson(json);

  Map<String, dynamic> toJson() => _$StickyHelmToJson(this);
}

@JsonSerializable()
class StickyFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  StickyFileParameter({this.name, this.path});

  factory StickyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$StickyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$StickyFileParameterToJson(this);
}

@JsonSerializable()
class HilariousParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  HilariousParameter({this.forceString, this.name, this.value});

  factory HilariousParameter.fromJson(Map<String, dynamic> json) =>
      _$HilariousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousParameterToJson(this);
}

@JsonSerializable()
class StickyKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<StickyPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<StickyReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  StickyKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory StickyKustomize.fromJson(Map<String, dynamic> json) =>
      _$StickyKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$StickyKustomizeToJson(this);
}

@JsonSerializable()
class StickyPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  StickyTarget? target;

  StickyPatch({this.options, this.patch, this.path, this.target});

  factory StickyPatch.fromJson(Map<String, dynamic> json) =>
      _$StickyPatchFromJson(json);

  Map<String, dynamic> toJson() => _$StickyPatchToJson(this);
}

@JsonSerializable()
class StickyTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  StickyTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory StickyTarget.fromJson(Map<String, dynamic> json) =>
      _$StickyTargetFromJson(json);

  Map<String, dynamic> toJson() => _$StickyTargetToJson(this);
}

@JsonSerializable()
class StickyReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  StickyReplica({required this.count, required this.name});

  factory StickyReplica.fromJson(Map<String, dynamic> json) =>
      _$StickyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$StickyReplicaToJson(this);
}

@JsonSerializable()
class StickyPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<StickyEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<AmbitiousParameter?>? parameters;

  StickyPlugin({this.env, this.name, this.parameters});

  factory StickyPlugin.fromJson(Map<String, dynamic> json) =>
      _$StickyPluginFromJson(json);

  Map<String, dynamic> toJson() => _$StickyPluginToJson(this);
}

@JsonSerializable()
class StickyEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  StickyEnv({required this.name, required this.value});

  factory StickyEnv.fromJson(Map<String, dynamic> json) =>
      _$StickyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$StickyEnvToJson(this);
}

@JsonSerializable()
class AmbitiousParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  AmbitiousParameter({this.array, this.map, this.name, this.string});

  factory AmbitiousParameter.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousParameterToJson(this);
}

@JsonSerializable()
class SyncPolicy {
  ///Automated will keep an application synced to the target revision
  @JsonKey(name: 'automated')
  Automated? automated;

  ///ManagedNamespaceMetadata controls metadata in the given namespace (if
  ///CreateNamespace=true)
  @JsonKey(name: 'managedNamespaceMetadata')
  SyncPolicyManagedNamespaceMetadata? managedNamespaceMetadata;

  ///Retry controls failed sync retry behavior
  @JsonKey(name: 'retry')
  SyncPolicyRetry? retry;

  ///Options allow you to specify whole app sync-options
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicyToJson(this);
}

@JsonSerializable()
class Automated {
  ///AllowEmpty allows apps have zero live resources (default: false)
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;

  ///Enable allows apps to explicitly control automated sync
  @JsonKey(name: 'enabled')
  bool? enabled;

  ///Prune specifies whether to delete resources from the cluster that are not found in the
  ///sources anymore as part of automated sync (default: false)
  @JsonKey(name: 'prune')
  bool? prune;

  ///SelfHeal specifies whether to revert resources back to their desired state upon
  ///modification in the cluster (default: false)
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated.fromJson(Map<String, dynamic> json) =>
      _$AutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$AutomatedToJson(this);
}

@JsonSerializable()
class SyncPolicyManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  SyncPolicyManagedNamespaceMetadata({this.annotations, this.labels});

  factory SyncPolicyManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncPolicyManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SyncPolicyManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class SyncPolicyRetry {
  ///Backoff controls how to backoff on subsequent retries of failed syncs
  @JsonKey(name: 'backoff')
  FluffyBackoff? backoff;

  ///Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no
  ///retries will be performed.
  @JsonKey(name: 'limit')
  int? limit;

  ///Refresh indicates if the latest revision should be used on retry instead of the initial
  ///one (default: false)
  @JsonKey(name: 'refresh')
  bool? refresh;

  SyncPolicyRetry({this.backoff, this.limit, this.refresh});

  factory SyncPolicyRetry.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicyRetryFromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicyRetryToJson(this);
}

@JsonSerializable()
class FluffyBackoff {
  ///Duration is the amount to back off. Default unit is seconds, but could also be a duration
  ///(e.g. "2m", "1h")
  @JsonKey(name: 'duration')
  String? duration;

  ///Factor is a factor to multiply the base duration after each failed retry
  @JsonKey(name: 'factor')
  int? factor;

  ///MaxDuration is the maximum amount of time allowed for the backoff strategy
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  FluffyBackoff({this.duration, this.factor, this.maxDuration});

  factory FluffyBackoff.fromJson(Map<String, dynamic> json) =>
      _$FluffyBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBackoffToJson(this);
}

@JsonSerializable()
class Status {
  ///Conditions is a list of currently observed application conditions
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///ControllerNamespace indicates the namespace in which the application controller is located
  @JsonKey(name: 'controllerNamespace')
  String? controllerNamespace;

  ///Health contains information about the application's current health status
  @JsonKey(name: 'health')
  StatusHealth? health;

  ///History contains information about the application's sync history
  @JsonKey(name: 'history')
  List<History?>? history;

  ///ObservedAt indicates when the application state was updated without querying latest git
  ///state
  ///Deprecated: controller no longer updates ObservedAt field
  @JsonKey(name: 'observedAt')
  DateTime? observedAt;

  ///OperationState contains information about any ongoing operations, such as a sync
  @JsonKey(name: 'operationState')
  OperationState? operationState;

  ///ReconciledAt indicates when the application state was reconciled using the latest git
  ///version
  @JsonKey(name: 'reconciledAt')
  DateTime? reconciledAt;

  ///ResourceHealthSource indicates where the resource health status is stored: inline if not
  ///set or appTree
  @JsonKey(name: 'resourceHealthSource')
  String? resourceHealthSource;

  ///Resources is a list of Kubernetes resources managed by this application
  @JsonKey(name: 'resources')
  List<StatusResource?>? resources;

  ///SourceHydrator stores information about the current state of source hydration
  @JsonKey(name: 'sourceHydrator')
  StatusSourceHydrator? sourceHydrator;

  ///SourceType specifies the type of this application
  @JsonKey(name: 'sourceType')
  String? sourceType;

  ///SourceTypes specifies the type of the sources included in the application
  @JsonKey(name: 'sourceTypes')
  List<String?>? sourceTypes;

  ///Summary contains a list of URLs and container images used by this application
  @JsonKey(name: 'summary')
  Summary? summary;

  ///Sync contains information about the application's current sync status
  @JsonKey(name: 'sync')
  StatusSync? sync;

  Status({
    this.conditions,
    this.controllerNamespace,
    this.health,
    this.history,
    this.observedAt,
    this.operationState,
    this.reconciledAt,
    this.resourceHealthSource,
    this.resources,
    this.sourceHydrator,
    this.sourceType,
    this.sourceTypes,
    this.summary,
    this.sync,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Condition {
  ///LastTransitionTime is the time the condition was last observed
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///Message contains human-readable message indicating details about condition
  @JsonKey(name: 'message')
  String message;

  ///Type is an application condition type
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastTransitionTime,
    required this.message,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class StatusHealth {
  ///LastTransitionTime is the time the HealthStatus was set or updated
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///Message is a human-readable informational message describing the health status
  ///
  ///Deprecated: this field is not used and will be removed in a future release.
  @JsonKey(name: 'message')
  String? message;

  ///Status holds the status code of the application
  @JsonKey(name: 'status')
  String? status;

  StatusHealth({this.lastTransitionTime, this.message, this.status});

  factory StatusHealth.fromJson(Map<String, dynamic> json) =>
      _$StatusHealthFromJson(json);

  Map<String, dynamic> toJson() => _$StatusHealthToJson(this);
}

@JsonSerializable()
class History {
  ///DeployedAt holds the time the sync operation completed
  @JsonKey(name: 'deployedAt')
  DateTime deployedAt;

  ///DeployStartedAt holds the time the sync operation started
  @JsonKey(name: 'deployStartedAt')
  DateTime? deployStartedAt;

  ///ID is an auto incrementing identifier of the RevisionHistory
  @JsonKey(name: 'id')
  int id;

  ///InitiatedBy contains information about who initiated the operations
  @JsonKey(name: 'initiatedBy')
  HistoryInitiatedBy? initiatedBy;

  ///Revision holds the revision the sync was performed against
  @JsonKey(name: 'revision')
  String? revision;

  ///Revisions holds the revision of each source in sources field the sync was performed
  ///against
  @JsonKey(name: 'revisions')
  List<String?>? revisions;

  ///Source is a reference to the application source used for the sync operation
  @JsonKey(name: 'source')
  IndigoSource? source;

  ///Sources is a reference to the application sources used for the sync operation
  @JsonKey(name: 'sources')
  List<IndecentSource?>? sources;

  History({
    required this.deployedAt,
    this.deployStartedAt,
    required this.id,
    this.initiatedBy,
    this.revision,
    this.revisions,
    this.source,
    this.sources,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class HistoryInitiatedBy {
  ///Automated is set to true if operation was initiated automatically by the application
  ///controller.
  @JsonKey(name: 'automated')
  bool? automated;

  ///Username contains the name of a user who started operation
  @JsonKey(name: 'username')
  String? username;

  HistoryInitiatedBy({this.automated, this.username});

  factory HistoryInitiatedBy.fromJson(Map<String, dynamic> json) =>
      _$HistoryInitiatedByFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryInitiatedByToJson(this);
}

@JsonSerializable()
class IndigoSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  IndigoDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  IndigoHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  IndigoKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  IndigoPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  IndigoSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory IndigoSource.fromJson(Map<String, dynamic> json) =>
      _$IndigoSourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSourceToJson(this);
}

@JsonSerializable()
class IndigoDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  IndigoJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  IndigoDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory IndigoDirectory.fromJson(Map<String, dynamic> json) =>
      _$IndigoDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoDirectoryToJson(this);
}

@JsonSerializable()
class IndigoJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<IndigoExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<IndigoTlas?>? tlas;

  IndigoJsonnet({this.extVars, this.libs, this.tlas});

  factory IndigoJsonnet.fromJson(Map<String, dynamic> json) =>
      _$IndigoJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoJsonnetToJson(this);
}

@JsonSerializable()
class IndigoExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndigoExtVar({this.code, required this.name, required this.value});

  factory IndigoExtVar.fromJson(Map<String, dynamic> json) =>
      _$IndigoExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoExtVarToJson(this);
}

@JsonSerializable()
class IndigoTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndigoTlas({this.code, required this.name, required this.value});

  factory IndigoTlas.fromJson(Map<String, dynamic> json) =>
      _$IndigoTlasFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoTlasToJson(this);
}

@JsonSerializable()
class IndigoHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<IndigoFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<CunningParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  IndigoHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory IndigoHelm.fromJson(Map<String, dynamic> json) =>
      _$IndigoHelmFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoHelmToJson(this);
}

@JsonSerializable()
class IndigoFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  IndigoFileParameter({this.name, this.path});

  factory IndigoFileParameter.fromJson(Map<String, dynamic> json) =>
      _$IndigoFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoFileParameterToJson(this);
}

@JsonSerializable()
class CunningParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  CunningParameter({this.forceString, this.name, this.value});

  factory CunningParameter.fromJson(Map<String, dynamic> json) =>
      _$CunningParameterFromJson(json);

  Map<String, dynamic> toJson() => _$CunningParameterToJson(this);
}

@JsonSerializable()
class IndigoKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<IndigoPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<IndigoReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  IndigoKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory IndigoKustomize.fromJson(Map<String, dynamic> json) =>
      _$IndigoKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoKustomizeToJson(this);
}

@JsonSerializable()
class IndigoPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  IndigoTarget? target;

  IndigoPatch({this.options, this.patch, this.path, this.target});

  factory IndigoPatch.fromJson(Map<String, dynamic> json) =>
      _$IndigoPatchFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoPatchToJson(this);
}

@JsonSerializable()
class IndigoTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  IndigoTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory IndigoTarget.fromJson(Map<String, dynamic> json) =>
      _$IndigoTargetFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoTargetToJson(this);
}

@JsonSerializable()
class IndigoReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  IndigoReplica({required this.count, required this.name});

  factory IndigoReplica.fromJson(Map<String, dynamic> json) =>
      _$IndigoReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoReplicaToJson(this);
}

@JsonSerializable()
class IndigoPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<IndigoEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<MagentaParameter?>? parameters;

  IndigoPlugin({this.env, this.name, this.parameters});

  factory IndigoPlugin.fromJson(Map<String, dynamic> json) =>
      _$IndigoPluginFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoPluginToJson(this);
}

@JsonSerializable()
class IndigoEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  IndigoEnv({required this.name, required this.value});

  factory IndigoEnv.fromJson(Map<String, dynamic> json) =>
      _$IndigoEnvFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoEnvToJson(this);
}

@JsonSerializable()
class MagentaParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  MagentaParameter({this.array, this.map, this.name, this.string});

  factory MagentaParameter.fromJson(Map<String, dynamic> json) =>
      _$MagentaParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaParameterToJson(this);
}

@JsonSerializable()
class IndecentSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  IndecentDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  IndecentHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  IndecentKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  IndecentPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  IndecentSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory IndecentSource.fromJson(Map<String, dynamic> json) =>
      _$IndecentSourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSourceToJson(this);
}

@JsonSerializable()
class IndecentDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  IndecentJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  IndecentDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory IndecentDirectory.fromJson(Map<String, dynamic> json) =>
      _$IndecentDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentDirectoryToJson(this);
}

@JsonSerializable()
class IndecentJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<IndecentExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<IndecentTlas?>? tlas;

  IndecentJsonnet({this.extVars, this.libs, this.tlas});

  factory IndecentJsonnet.fromJson(Map<String, dynamic> json) =>
      _$IndecentJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentJsonnetToJson(this);
}

@JsonSerializable()
class IndecentExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndecentExtVar({this.code, required this.name, required this.value});

  factory IndecentExtVar.fromJson(Map<String, dynamic> json) =>
      _$IndecentExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentExtVarToJson(this);
}

@JsonSerializable()
class IndecentTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndecentTlas({this.code, required this.name, required this.value});

  factory IndecentTlas.fromJson(Map<String, dynamic> json) =>
      _$IndecentTlasFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentTlasToJson(this);
}

@JsonSerializable()
class IndecentHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<IndecentFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<FriskyParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  IndecentHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory IndecentHelm.fromJson(Map<String, dynamic> json) =>
      _$IndecentHelmFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentHelmToJson(this);
}

@JsonSerializable()
class IndecentFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  IndecentFileParameter({this.name, this.path});

  factory IndecentFileParameter.fromJson(Map<String, dynamic> json) =>
      _$IndecentFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentFileParameterToJson(this);
}

@JsonSerializable()
class FriskyParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  FriskyParameter({this.forceString, this.name, this.value});

  factory FriskyParameter.fromJson(Map<String, dynamic> json) =>
      _$FriskyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyParameterToJson(this);
}

@JsonSerializable()
class IndecentKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<IndecentPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<IndecentReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  IndecentKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory IndecentKustomize.fromJson(Map<String, dynamic> json) =>
      _$IndecentKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentKustomizeToJson(this);
}

@JsonSerializable()
class IndecentPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  IndecentTarget? target;

  IndecentPatch({this.options, this.patch, this.path, this.target});

  factory IndecentPatch.fromJson(Map<String, dynamic> json) =>
      _$IndecentPatchFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentPatchToJson(this);
}

@JsonSerializable()
class IndecentTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  IndecentTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory IndecentTarget.fromJson(Map<String, dynamic> json) =>
      _$IndecentTargetFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentTargetToJson(this);
}

@JsonSerializable()
class IndecentReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  IndecentReplica({required this.count, required this.name});

  factory IndecentReplica.fromJson(Map<String, dynamic> json) =>
      _$IndecentReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentReplicaToJson(this);
}

@JsonSerializable()
class IndecentPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<IndecentEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<MischievousParameter?>? parameters;

  IndecentPlugin({this.env, this.name, this.parameters});

  factory IndecentPlugin.fromJson(Map<String, dynamic> json) =>
      _$IndecentPluginFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentPluginToJson(this);
}

@JsonSerializable()
class IndecentEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  IndecentEnv({required this.name, required this.value});

  factory IndecentEnv.fromJson(Map<String, dynamic> json) =>
      _$IndecentEnvFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentEnvToJson(this);
}

@JsonSerializable()
class MischievousParameter {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  MischievousParameter({this.array, this.map, this.name, this.string});

  factory MischievousParameter.fromJson(Map<String, dynamic> json) =>
      _$MischievousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousParameterToJson(this);
}

@JsonSerializable()
class OperationState {
  ///FinishedAt contains time of operation completion
  @JsonKey(name: 'finishedAt')
  DateTime? finishedAt;

  ///Message holds any pertinent messages when attempting to perform operation (typically
  ///errors).
  @JsonKey(name: 'message')
  String? message;

  ///Operation is the original requested operation
  @JsonKey(name: 'operation')
  OperationStateOperation operation;

  ///Phase is the current phase of the operation
  @JsonKey(name: 'phase')
  String phase;

  ///RetryCount contains time of operation retries
  @JsonKey(name: 'retryCount')
  int? retryCount;

  ///StartedAt contains time of operation start
  @JsonKey(name: 'startedAt')
  DateTime startedAt;

  ///SyncResult is the result of a Sync operation
  @JsonKey(name: 'syncResult')
  SyncResult? syncResult;

  OperationState({
    this.finishedAt,
    this.message,
    required this.operation,
    required this.phase,
    this.retryCount,
    required this.startedAt,
    this.syncResult,
  });

  factory OperationState.fromJson(Map<String, dynamic> json) =>
      _$OperationStateFromJson(json);

  Map<String, dynamic> toJson() => _$OperationStateToJson(this);
}

///Operation is the original requested operation
@JsonSerializable()
class OperationStateOperation {
  ///Info is a list of informational items for this operation
  @JsonKey(name: 'info')
  List<FluffyInfo?>? info;

  ///InitiatedBy contains information about who initiated the operations
  @JsonKey(name: 'initiatedBy')
  FluffyInitiatedBy? initiatedBy;

  ///Retry controls the strategy to apply if a sync fails
  @JsonKey(name: 'retry')
  FluffyRetry? retry;

  ///Sync contains parameters for the operation
  @JsonKey(name: 'sync')
  FluffySync? sync;

  OperationStateOperation({this.info, this.initiatedBy, this.retry, this.sync});

  factory OperationStateOperation.fromJson(Map<String, dynamic> json) =>
      _$OperationStateOperationFromJson(json);

  Map<String, dynamic> toJson() => _$OperationStateOperationToJson(this);
}

@JsonSerializable()
class FluffyInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FluffyInfo({required this.name, required this.value});

  factory FluffyInfo.fromJson(Map<String, dynamic> json) =>
      _$FluffyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyInfoToJson(this);
}

@JsonSerializable()
class FluffyInitiatedBy {
  ///Automated is set to true if operation was initiated automatically by the application
  ///controller.
  @JsonKey(name: 'automated')
  bool? automated;

  ///Username contains the name of a user who started operation
  @JsonKey(name: 'username')
  String? username;

  FluffyInitiatedBy({this.automated, this.username});

  factory FluffyInitiatedBy.fromJson(Map<String, dynamic> json) =>
      _$FluffyInitiatedByFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyInitiatedByToJson(this);
}

@JsonSerializable()
class FluffyRetry {
  ///Backoff controls how to backoff on subsequent retries of failed syncs
  @JsonKey(name: 'backoff')
  TentacledBackoff? backoff;

  ///Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no
  ///retries will be performed.
  @JsonKey(name: 'limit')
  int? limit;

  ///Refresh indicates if the latest revision should be used on retry instead of the initial
  ///one (default: false)
  @JsonKey(name: 'refresh')
  bool? refresh;

  FluffyRetry({this.backoff, this.limit, this.refresh});

  factory FluffyRetry.fromJson(Map<String, dynamic> json) =>
      _$FluffyRetryFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyRetryToJson(this);
}

@JsonSerializable()
class TentacledBackoff {
  ///Duration is the amount to back off. Default unit is seconds, but could also be a duration
  ///(e.g. "2m", "1h")
  @JsonKey(name: 'duration')
  String? duration;

  ///Factor is a factor to multiply the base duration after each failed retry
  @JsonKey(name: 'factor')
  int? factor;

  ///MaxDuration is the maximum amount of time allowed for the backoff strategy
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  TentacledBackoff({this.duration, this.factor, this.maxDuration});

  factory TentacledBackoff.fromJson(Map<String, dynamic> json) =>
      _$TentacledBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBackoffToJson(this);
}

@JsonSerializable()
class FluffySync {
  ///SelfHealAttemptsCount contains the number of auto-heal attempts
  @JsonKey(name: 'autoHealAttemptsCount')
  int? autoHealAttemptsCount;

  ///DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the
  ///sync
  @JsonKey(name: 'dryRun')
  bool? dryRun;

  ///Manifests is an optional field that overrides sync source with a local directory for
  ///development
  @JsonKey(name: 'manifests')
  List<String?>? manifests;

  ///Prune specifies to delete resources from the cluster that are no longer tracked in git
  @JsonKey(name: 'prune')
  bool? prune;

  ///Resources describes which resources shall be part of the sync
  @JsonKey(name: 'resources')
  List<FluffyResource?>? resources;

  ///Revision is the revision (Git) or chart version (Helm) which to sync the application to
  ///If omitted, will use the revision specified in app spec.
  @JsonKey(name: 'revision')
  String? revision;

  ///Revisions is the list of revision (Git) or chart version (Helm) which to sync each source
  ///in sources field for the application to
  ///If omitted, will use the revision specified in app spec.
  @JsonKey(name: 'revisions')
  List<String?>? revisions;

  ///Source overrides the source definition set in the application.
  ///This is typically set in a Rollback operation and is nil during a Sync operation
  @JsonKey(name: 'source')
  HilariousSource? source;

  ///Sources overrides the source definition set in the application.
  ///This is typically set in a Rollback operation and is nil during a Sync operation
  @JsonKey(name: 'sources')
  List<AmbitiousSource?>? sources;

  ///SyncOptions provide per-sync sync-options, e.g. Validate=false
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  ///SyncStrategy describes how to perform the sync
  @JsonKey(name: 'syncStrategy')
  FluffySyncStrategy? syncStrategy;

  FluffySync({
    this.autoHealAttemptsCount,
    this.dryRun,
    this.manifests,
    this.prune,
    this.resources,
    this.revision,
    this.revisions,
    this.source,
    this.sources,
    this.syncOptions,
    this.syncStrategy,
  });

  factory FluffySync.fromJson(Map<String, dynamic> json) =>
      _$FluffySyncFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySyncToJson(this);
}

@JsonSerializable()
class FluffyResource {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'namespace')
  String? namespace;

  FluffyResource({
    this.group,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory FluffyResource.fromJson(Map<String, dynamic> json) =>
      _$FluffyResourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyResourceToJson(this);
}

@JsonSerializable()
class HilariousSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  HilariousDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  HilariousHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  HilariousKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  HilariousPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  HilariousSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory HilariousSource.fromJson(Map<String, dynamic> json) =>
      _$HilariousSourceFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousSourceToJson(this);
}

@JsonSerializable()
class HilariousDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  HilariousJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  HilariousDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory HilariousDirectory.fromJson(Map<String, dynamic> json) =>
      _$HilariousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousDirectoryToJson(this);
}

@JsonSerializable()
class HilariousJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<HilariousExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<HilariousTlas?>? tlas;

  HilariousJsonnet({this.extVars, this.libs, this.tlas});

  factory HilariousJsonnet.fromJson(Map<String, dynamic> json) =>
      _$HilariousJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousJsonnetToJson(this);
}

@JsonSerializable()
class HilariousExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  HilariousExtVar({this.code, required this.name, required this.value});

  factory HilariousExtVar.fromJson(Map<String, dynamic> json) =>
      _$HilariousExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousExtVarToJson(this);
}

@JsonSerializable()
class HilariousTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  HilariousTlas({this.code, required this.name, required this.value});

  factory HilariousTlas.fromJson(Map<String, dynamic> json) =>
      _$HilariousTlasFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousTlasToJson(this);
}

@JsonSerializable()
class HilariousHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<HilariousFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<BraggadociousParameter?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  HilariousHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory HilariousHelm.fromJson(Map<String, dynamic> json) =>
      _$HilariousHelmFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousHelmToJson(this);
}

@JsonSerializable()
class HilariousFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  HilariousFileParameter({this.name, this.path});

  factory HilariousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$HilariousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousFileParameterToJson(this);
}

@JsonSerializable()
class BraggadociousParameter {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  BraggadociousParameter({this.forceString, this.name, this.value});

  factory BraggadociousParameter.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousParameterToJson(this);
}

@JsonSerializable()
class HilariousKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<HilariousPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<HilariousReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  HilariousKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory HilariousKustomize.fromJson(Map<String, dynamic> json) =>
      _$HilariousKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousKustomizeToJson(this);
}

@JsonSerializable()
class HilariousPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  HilariousTarget? target;

  HilariousPatch({this.options, this.patch, this.path, this.target});

  factory HilariousPatch.fromJson(Map<String, dynamic> json) =>
      _$HilariousPatchFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousPatchToJson(this);
}

@JsonSerializable()
class HilariousTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  HilariousTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory HilariousTarget.fromJson(Map<String, dynamic> json) =>
      _$HilariousTargetFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousTargetToJson(this);
}

@JsonSerializable()
class HilariousReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  HilariousReplica({required this.count, required this.name});

  factory HilariousReplica.fromJson(Map<String, dynamic> json) =>
      _$HilariousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousReplicaToJson(this);
}

@JsonSerializable()
class HilariousPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<HilariousEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter1?>? parameters;

  HilariousPlugin({this.env, this.name, this.parameters});

  factory HilariousPlugin.fromJson(Map<String, dynamic> json) =>
      _$HilariousPluginFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousPluginToJson(this);
}

@JsonSerializable()
class HilariousEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  HilariousEnv({required this.name, required this.value});

  factory HilariousEnv.fromJson(Map<String, dynamic> json) =>
      _$HilariousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousEnvToJson(this);
}

@JsonSerializable()
class Parameter1 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter1({this.array, this.map, this.name, this.string});

  factory Parameter1.fromJson(Map<String, dynamic> json) =>
      _$Parameter1FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter1ToJson(this);
}

@JsonSerializable()
class AmbitiousSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  AmbitiousDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  AmbitiousHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  AmbitiousKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  AmbitiousPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  AmbitiousSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory AmbitiousSource.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousSourceToJson(this);
}

@JsonSerializable()
class AmbitiousDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  AmbitiousJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  AmbitiousDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory AmbitiousDirectory.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousDirectoryToJson(this);
}

@JsonSerializable()
class AmbitiousJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<AmbitiousExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<AmbitiousTlas?>? tlas;

  AmbitiousJsonnet({this.extVars, this.libs, this.tlas});

  factory AmbitiousJsonnet.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousJsonnetToJson(this);
}

@JsonSerializable()
class AmbitiousExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  AmbitiousExtVar({this.code, required this.name, required this.value});

  factory AmbitiousExtVar.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousExtVarToJson(this);
}

@JsonSerializable()
class AmbitiousTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  AmbitiousTlas({this.code, required this.name, required this.value});

  factory AmbitiousTlas.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousTlasFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousTlasToJson(this);
}

@JsonSerializable()
class AmbitiousHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<AmbitiousFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<Parameter2?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  AmbitiousHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory AmbitiousHelm.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousHelmFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousHelmToJson(this);
}

@JsonSerializable()
class AmbitiousFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  AmbitiousFileParameter({this.name, this.path});

  factory AmbitiousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousFileParameterToJson(this);
}

@JsonSerializable()
class Parameter2 {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  Parameter2({this.forceString, this.name, this.value});

  factory Parameter2.fromJson(Map<String, dynamic> json) =>
      _$Parameter2FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter2ToJson(this);
}

@JsonSerializable()
class AmbitiousKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<AmbitiousPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<AmbitiousReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  AmbitiousKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory AmbitiousKustomize.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousKustomizeToJson(this);
}

@JsonSerializable()
class AmbitiousPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  AmbitiousTarget? target;

  AmbitiousPatch({this.options, this.patch, this.path, this.target});

  factory AmbitiousPatch.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousPatchFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousPatchToJson(this);
}

@JsonSerializable()
class AmbitiousTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  AmbitiousTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory AmbitiousTarget.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousTargetFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousTargetToJson(this);
}

@JsonSerializable()
class AmbitiousReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  AmbitiousReplica({required this.count, required this.name});

  factory AmbitiousReplica.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousReplicaToJson(this);
}

@JsonSerializable()
class AmbitiousPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<AmbitiousEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter3?>? parameters;

  AmbitiousPlugin({this.env, this.name, this.parameters});

  factory AmbitiousPlugin.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousPluginFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousPluginToJson(this);
}

@JsonSerializable()
class AmbitiousEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  AmbitiousEnv({required this.name, required this.value});

  factory AmbitiousEnv.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousEnvToJson(this);
}

@JsonSerializable()
class Parameter3 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter3({this.array, this.map, this.name, this.string});

  factory Parameter3.fromJson(Map<String, dynamic> json) =>
      _$Parameter3FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter3ToJson(this);
}

@JsonSerializable()
class FluffySyncStrategy {
  ///Apply will perform a `kubectl apply` to perform the sync.
  @JsonKey(name: 'apply')
  FluffyApply? apply;

  ///Hook will submit any referenced resources to perform the sync. This is the default
  ///strategy
  @JsonKey(name: 'hook')
  FluffyHook? hook;

  FluffySyncStrategy({this.apply, this.hook});

  factory FluffySyncStrategy.fromJson(Map<String, dynamic> json) =>
      _$FluffySyncStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySyncStrategyToJson(this);
}

@JsonSerializable()
class FluffyApply {
  ///Force indicates whether or not to supply the --force flag to `kubectl apply`.
  ///The --force flag deletes and re-create the resource, when PATCH encounters conflict and
  ///has
  ///retried for 5 times.
  @JsonKey(name: 'force')
  bool? force;

  FluffyApply({this.force});

  factory FluffyApply.fromJson(Map<String, dynamic> json) =>
      _$FluffyApplyFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyApplyToJson(this);
}

@JsonSerializable()
class FluffyHook {
  ///Force indicates whether or not to supply the --force flag to `kubectl apply`.
  ///The --force flag deletes and re-create the resource, when PATCH encounters conflict and
  ///has
  ///retried for 5 times.
  @JsonKey(name: 'force')
  bool? force;

  FluffyHook({this.force});

  factory FluffyHook.fromJson(Map<String, dynamic> json) =>
      _$FluffyHookFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHookToJson(this);
}

@JsonSerializable()
class SyncResult {
  ///ManagedNamespaceMetadata contains the current sync state of managed namespace metadata
  @JsonKey(name: 'managedNamespaceMetadata')
  SyncResultManagedNamespaceMetadata? managedNamespaceMetadata;

  ///Resources contains a list of sync result items for each individual resource in a sync
  ///operation
  @JsonKey(name: 'resources')
  List<SyncResultResource?>? resources;

  ///Revision holds the revision this sync operation was performed to
  @JsonKey(name: 'revision')
  String revision;

  ///Revisions holds the revision this sync operation was performed for respective indexed
  ///source in sources field
  @JsonKey(name: 'revisions')
  List<String?>? revisions;

  ///Source records the application source information of the sync, used for comparing
  ///auto-sync
  @JsonKey(name: 'source')
  CunningSource? source;

  ///Source records the application source information of the sync, used for comparing
  ///auto-sync
  @JsonKey(name: 'sources')
  List<MagentaSource?>? sources;

  SyncResult({
    this.managedNamespaceMetadata,
    this.resources,
    required this.revision,
    this.revisions,
    this.source,
    this.sources,
  });

  factory SyncResult.fromJson(Map<String, dynamic> json) =>
      _$SyncResultFromJson(json);

  Map<String, dynamic> toJson() => _$SyncResultToJson(this);
}

@JsonSerializable()
class SyncResultManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  SyncResultManagedNamespaceMetadata({this.annotations, this.labels});

  factory SyncResultManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncResultManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SyncResultManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class SyncResultResource {
  ///Group specifies the API group of the resource
  @JsonKey(name: 'group')
  String group;

  ///HookPhase contains the state of any operation associated with this resource OR hook
  ///This can also contain values for non-hook resources.
  @JsonKey(name: 'hookPhase')
  String? hookPhase;

  ///HookType specifies the type of the hook. Empty for non-hook resources
  @JsonKey(name: 'hookType')
  String? hookType;

  ///Images contains the images related to the ResourceResult
  @JsonKey(name: 'images')
  List<String?>? images;

  ///Kind specifies the API kind of the resource
  @JsonKey(name: 'kind')
  String kind;

  ///Message contains an informational or error message for the last sync OR operation
  @JsonKey(name: 'message')
  String? message;

  ///Name specifies the name of the resource
  @JsonKey(name: 'name')
  String name;

  ///Namespace specifies the target namespace of the resource
  @JsonKey(name: 'namespace')
  String namespace;

  ///Status holds the final result of the sync. Will be empty if the resources is yet to be
  ///applied/pruned and is always zero-value for hooks
  @JsonKey(name: 'status')
  String? status;

  ///SyncPhase indicates the particular phase of the sync that this result was acquired in
  @JsonKey(name: 'syncPhase')
  String? syncPhase;

  ///Version specifies the API version of the resource
  @JsonKey(name: 'version')
  String version;

  SyncResultResource({
    required this.group,
    this.hookPhase,
    this.hookType,
    this.images,
    required this.kind,
    this.message,
    required this.name,
    required this.namespace,
    this.status,
    this.syncPhase,
    required this.version,
  });

  factory SyncResultResource.fromJson(Map<String, dynamic> json) =>
      _$SyncResultResourceFromJson(json);

  Map<String, dynamic> toJson() => _$SyncResultResourceToJson(this);
}

@JsonSerializable()
class CunningSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  CunningDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  CunningHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  CunningKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  CunningPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  CunningSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory CunningSource.fromJson(Map<String, dynamic> json) =>
      _$CunningSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CunningSourceToJson(this);
}

@JsonSerializable()
class CunningDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  CunningJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  CunningDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory CunningDirectory.fromJson(Map<String, dynamic> json) =>
      _$CunningDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$CunningDirectoryToJson(this);
}

@JsonSerializable()
class CunningJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<CunningExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<CunningTlas?>? tlas;

  CunningJsonnet({this.extVars, this.libs, this.tlas});

  factory CunningJsonnet.fromJson(Map<String, dynamic> json) =>
      _$CunningJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$CunningJsonnetToJson(this);
}

@JsonSerializable()
class CunningExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  CunningExtVar({this.code, required this.name, required this.value});

  factory CunningExtVar.fromJson(Map<String, dynamic> json) =>
      _$CunningExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$CunningExtVarToJson(this);
}

@JsonSerializable()
class CunningTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  CunningTlas({this.code, required this.name, required this.value});

  factory CunningTlas.fromJson(Map<String, dynamic> json) =>
      _$CunningTlasFromJson(json);

  Map<String, dynamic> toJson() => _$CunningTlasToJson(this);
}

@JsonSerializable()
class CunningHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<CunningFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<Parameter4?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  CunningHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory CunningHelm.fromJson(Map<String, dynamic> json) =>
      _$CunningHelmFromJson(json);

  Map<String, dynamic> toJson() => _$CunningHelmToJson(this);
}

@JsonSerializable()
class CunningFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  CunningFileParameter({this.name, this.path});

  factory CunningFileParameter.fromJson(Map<String, dynamic> json) =>
      _$CunningFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$CunningFileParameterToJson(this);
}

@JsonSerializable()
class Parameter4 {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  Parameter4({this.forceString, this.name, this.value});

  factory Parameter4.fromJson(Map<String, dynamic> json) =>
      _$Parameter4FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter4ToJson(this);
}

@JsonSerializable()
class CunningKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<CunningPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<CunningReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  CunningKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory CunningKustomize.fromJson(Map<String, dynamic> json) =>
      _$CunningKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$CunningKustomizeToJson(this);
}

@JsonSerializable()
class CunningPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  CunningTarget? target;

  CunningPatch({this.options, this.patch, this.path, this.target});

  factory CunningPatch.fromJson(Map<String, dynamic> json) =>
      _$CunningPatchFromJson(json);

  Map<String, dynamic> toJson() => _$CunningPatchToJson(this);
}

@JsonSerializable()
class CunningTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  CunningTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory CunningTarget.fromJson(Map<String, dynamic> json) =>
      _$CunningTargetFromJson(json);

  Map<String, dynamic> toJson() => _$CunningTargetToJson(this);
}

@JsonSerializable()
class CunningReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  CunningReplica({required this.count, required this.name});

  factory CunningReplica.fromJson(Map<String, dynamic> json) =>
      _$CunningReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$CunningReplicaToJson(this);
}

@JsonSerializable()
class CunningPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<CunningEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter5?>? parameters;

  CunningPlugin({this.env, this.name, this.parameters});

  factory CunningPlugin.fromJson(Map<String, dynamic> json) =>
      _$CunningPluginFromJson(json);

  Map<String, dynamic> toJson() => _$CunningPluginToJson(this);
}

@JsonSerializable()
class CunningEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  CunningEnv({required this.name, required this.value});

  factory CunningEnv.fromJson(Map<String, dynamic> json) =>
      _$CunningEnvFromJson(json);

  Map<String, dynamic> toJson() => _$CunningEnvToJson(this);
}

@JsonSerializable()
class Parameter5 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter5({this.array, this.map, this.name, this.string});

  factory Parameter5.fromJson(Map<String, dynamic> json) =>
      _$Parameter5FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter5ToJson(this);
}

@JsonSerializable()
class MagentaSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  MagentaDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  MagentaHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  MagentaKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  MagentaPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  MagentaSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory MagentaSource.fromJson(Map<String, dynamic> json) =>
      _$MagentaSourceFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaSourceToJson(this);
}

@JsonSerializable()
class MagentaDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  MagentaJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  MagentaDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory MagentaDirectory.fromJson(Map<String, dynamic> json) =>
      _$MagentaDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaDirectoryToJson(this);
}

@JsonSerializable()
class MagentaJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<MagentaExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<MagentaTlas?>? tlas;

  MagentaJsonnet({this.extVars, this.libs, this.tlas});

  factory MagentaJsonnet.fromJson(Map<String, dynamic> json) =>
      _$MagentaJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaJsonnetToJson(this);
}

@JsonSerializable()
class MagentaExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MagentaExtVar({this.code, required this.name, required this.value});

  factory MagentaExtVar.fromJson(Map<String, dynamic> json) =>
      _$MagentaExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaExtVarToJson(this);
}

@JsonSerializable()
class MagentaTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MagentaTlas({this.code, required this.name, required this.value});

  factory MagentaTlas.fromJson(Map<String, dynamic> json) =>
      _$MagentaTlasFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaTlasToJson(this);
}

@JsonSerializable()
class MagentaHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<MagentaFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<Parameter6?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  MagentaHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory MagentaHelm.fromJson(Map<String, dynamic> json) =>
      _$MagentaHelmFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaHelmToJson(this);
}

@JsonSerializable()
class MagentaFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  MagentaFileParameter({this.name, this.path});

  factory MagentaFileParameter.fromJson(Map<String, dynamic> json) =>
      _$MagentaFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaFileParameterToJson(this);
}

@JsonSerializable()
class Parameter6 {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  Parameter6({this.forceString, this.name, this.value});

  factory Parameter6.fromJson(Map<String, dynamic> json) =>
      _$Parameter6FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter6ToJson(this);
}

@JsonSerializable()
class MagentaKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<MagentaPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<MagentaReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  MagentaKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory MagentaKustomize.fromJson(Map<String, dynamic> json) =>
      _$MagentaKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaKustomizeToJson(this);
}

@JsonSerializable()
class MagentaPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  MagentaTarget? target;

  MagentaPatch({this.options, this.patch, this.path, this.target});

  factory MagentaPatch.fromJson(Map<String, dynamic> json) =>
      _$MagentaPatchFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaPatchToJson(this);
}

@JsonSerializable()
class MagentaTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  MagentaTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory MagentaTarget.fromJson(Map<String, dynamic> json) =>
      _$MagentaTargetFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaTargetToJson(this);
}

@JsonSerializable()
class MagentaReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  MagentaReplica({required this.count, required this.name});

  factory MagentaReplica.fromJson(Map<String, dynamic> json) =>
      _$MagentaReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaReplicaToJson(this);
}

@JsonSerializable()
class MagentaPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<MagentaEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter7?>? parameters;

  MagentaPlugin({this.env, this.name, this.parameters});

  factory MagentaPlugin.fromJson(Map<String, dynamic> json) =>
      _$MagentaPluginFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaPluginToJson(this);
}

@JsonSerializable()
class MagentaEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  MagentaEnv({required this.name, required this.value});

  factory MagentaEnv.fromJson(Map<String, dynamic> json) =>
      _$MagentaEnvFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaEnvToJson(this);
}

@JsonSerializable()
class Parameter7 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter7({this.array, this.map, this.name, this.string});

  factory Parameter7.fromJson(Map<String, dynamic> json) =>
      _$Parameter7FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter7ToJson(this);
}

@JsonSerializable()
class StatusResource {
  ///Group represents the API group of the resource (e.g., "apps" for Deployments).
  @JsonKey(name: 'group')
  String? group;

  ///Health indicates the health status of the resource (e.g., Healthy, Degraded, Progressing).
  @JsonKey(name: 'health')
  ResourceHealth? health;

  ///Hook is true if the resource is used as a lifecycle hook in an Argo CD application.
  @JsonKey(name: 'hook')
  bool? hook;

  ///Kind specifies the type of the resource (e.g., "Deployment", "Service").
  @JsonKey(name: 'kind')
  String? kind;

  ///Name is the unique name of the resource within the namespace.
  @JsonKey(name: 'name')
  String? name;

  ///Namespace defines the Kubernetes namespace where the resource is located.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///RequiresDeletionConfirmation is true if the resource requires explicit user confirmation
  ///before deletion.
  @JsonKey(name: 'requiresDeletionConfirmation')
  bool? requiresDeletionConfirmation;

  ///RequiresPruning is true if the resource needs to be pruned (deleted) as part of
  ///synchronization.
  @JsonKey(name: 'requiresPruning')
  bool? requiresPruning;

  ///Status represents the synchronization state of the resource (e.g., Synced, OutOfSync).
  @JsonKey(name: 'status')
  String? status;

  ///SyncWave determines the order in which resources are applied during a sync operation.
  ///Lower values are applied first.
  @JsonKey(name: 'syncWave')
  int? syncWave;

  ///Version indicates the API version of the resource (e.g., "v1", "v1beta1").
  @JsonKey(name: 'version')
  String? version;

  StatusResource({
    this.group,
    this.health,
    this.hook,
    this.kind,
    this.name,
    this.namespace,
    this.requiresDeletionConfirmation,
    this.requiresPruning,
    this.status,
    this.syncWave,
    this.version,
  });

  factory StatusResource.fromJson(Map<String, dynamic> json) =>
      _$StatusResourceFromJson(json);

  Map<String, dynamic> toJson() => _$StatusResourceToJson(this);
}

@JsonSerializable()
class ResourceHealth {
  ///LastTransitionTime is the time the HealthStatus was set or updated
  ///
  ///Deprecated: this field is not used and will be removed in a future release.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///Message is a human-readable informational message describing the health status
  @JsonKey(name: 'message')
  String? message;

  ///Status holds the status code of the resource
  @JsonKey(name: 'status')
  String? status;

  ResourceHealth({this.lastTransitionTime, this.message, this.status});

  factory ResourceHealth.fromJson(Map<String, dynamic> json) =>
      _$ResourceHealthFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceHealthToJson(this);
}

@JsonSerializable()
class StatusSourceHydrator {
  ///CurrentOperation holds the status of the hydrate operation
  @JsonKey(name: 'currentOperation')
  CurrentOperation? currentOperation;

  ///LastSuccessfulOperation holds info about the most recent successful hydration
  @JsonKey(name: 'lastSuccessfulOperation')
  LastSuccessfulOperation? lastSuccessfulOperation;

  StatusSourceHydrator({this.currentOperation, this.lastSuccessfulOperation});

  factory StatusSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$StatusSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$StatusSourceHydratorToJson(this);
}

@JsonSerializable()
class CurrentOperation {
  ///DrySHA holds the resolved revision (sha) of the dry source as of the most recent
  ///reconciliation
  @JsonKey(name: 'drySHA')
  String? drySha;

  ///FinishedAt indicates when the hydrate operation finished
  @JsonKey(name: 'finishedAt')
  DateTime? finishedAt;

  ///HydratedSHA holds the resolved revision (sha) of the hydrated source as of the most
  ///recent reconciliation
  @JsonKey(name: 'hydratedSHA')
  String? hydratedSha;

  ///Message contains a message describing the current status of the hydrate operation
  @JsonKey(name: 'message')
  String message;

  ///Phase indicates the status of the hydrate operation
  @JsonKey(name: 'phase')
  Phase phase;

  ///SourceHydrator holds the hydrator config used for the hydrate operation
  @JsonKey(name: 'sourceHydrator')
  CurrentOperationSourceHydrator? sourceHydrator;

  ///StartedAt indicates when the hydrate operation started
  @JsonKey(name: 'startedAt')
  DateTime? startedAt;

  CurrentOperation({
    this.drySha,
    this.finishedAt,
    this.hydratedSha,
    required this.message,
    required this.phase,
    this.sourceHydrator,
    this.startedAt,
  });

  factory CurrentOperation.fromJson(Map<String, dynamic> json) =>
      _$CurrentOperationFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentOperationToJson(this);
}

///Phase indicates the status of the hydrate operation
enum Phase {
  @JsonValue('Failed')
  FAILED,
  @JsonValue('Hydrated')
  HYDRATED,
  @JsonValue('Hydrating')
  HYDRATING,
}

final phaseValues = EnumValues({
  'Failed': Phase.FAILED,
  'Hydrated': Phase.HYDRATED,
  'Hydrating': Phase.HYDRATING,
});

@JsonSerializable()
class CurrentOperationSourceHydrator {
  ///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
  @JsonKey(name: 'drySource')
  FluffyDrySource drySource;

  ///HydrateTo specifies an optional "staging" location to push hydrated manifests to. An
  ///external system would then
  ///have to move manifests to the SyncSource, e.g. by pull request.
  @JsonKey(name: 'hydrateTo')
  FluffyHydrateTo? hydrateTo;

  ///SyncSource specifies where to sync hydrated manifests from.
  @JsonKey(name: 'syncSource')
  FluffySyncSource syncSource;

  CurrentOperationSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory CurrentOperationSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$CurrentOperationSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentOperationSourceHydratorToJson(this);
}

///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
@JsonSerializable()
class FluffyDrySource {
  ///Path is a directory path within the Git repository where the manifests are located
  @JsonKey(name: 'path')
  String path;

  ///RepoURL is the URL to the git repository that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to hydrate
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  FluffyDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory FluffyDrySource.fromJson(Map<String, dynamic> json) =>
      _$FluffyDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyDrySourceToJson(this);
}

@JsonSerializable()
class FluffyHydrateTo {
  ///TargetBranch is the branch to which hydrated manifests should be committed
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FluffyHydrateTo({required this.targetBranch});

  factory FluffyHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$FluffyHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHydrateToToJson(this);
}

///SyncSource specifies where to sync hydrated manifests from.
@JsonSerializable()
class FluffySyncSource {
  ///Path is a directory path within the git repository where hydrated manifests should be
  ///committed to and synced
  ///from. The Path should never point to the root of the repo. If hydrateTo is set, this is
  ///just the path from which
  ///hydrated manifests will be synced.
  @JsonKey(name: 'path')
  String path;

  ///TargetBranch is the branch from which hydrated manifests will be synced.
  ///If HydrateTo is not set, this is also the branch to which hydrated manifests are
  ///committed.
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FluffySyncSource({required this.path, required this.targetBranch});

  factory FluffySyncSource.fromJson(Map<String, dynamic> json) =>
      _$FluffySyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySyncSourceToJson(this);
}

@JsonSerializable()
class LastSuccessfulOperation {
  ///DrySHA holds the resolved revision (sha) of the dry source as of the most recent
  ///reconciliation
  @JsonKey(name: 'drySHA')
  String? drySha;

  ///HydratedSHA holds the resolved revision (sha) of the hydrated source as of the most
  ///recent reconciliation
  @JsonKey(name: 'hydratedSHA')
  String? hydratedSha;

  ///SourceHydrator holds the hydrator config used for the hydrate operation
  @JsonKey(name: 'sourceHydrator')
  LastSuccessfulOperationSourceHydrator? sourceHydrator;

  LastSuccessfulOperation({this.drySha, this.hydratedSha, this.sourceHydrator});

  factory LastSuccessfulOperation.fromJson(Map<String, dynamic> json) =>
      _$LastSuccessfulOperationFromJson(json);

  Map<String, dynamic> toJson() => _$LastSuccessfulOperationToJson(this);
}

@JsonSerializable()
class LastSuccessfulOperationSourceHydrator {
  ///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
  @JsonKey(name: 'drySource')
  TentacledDrySource drySource;

  ///HydrateTo specifies an optional "staging" location to push hydrated manifests to. An
  ///external system would then
  ///have to move manifests to the SyncSource, e.g. by pull request.
  @JsonKey(name: 'hydrateTo')
  TentacledHydrateTo? hydrateTo;

  ///SyncSource specifies where to sync hydrated manifests from.
  @JsonKey(name: 'syncSource')
  TentacledSyncSource syncSource;

  LastSuccessfulOperationSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory LastSuccessfulOperationSourceHydrator.fromJson(
    Map<String, dynamic> json,
  ) => _$LastSuccessfulOperationSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LastSuccessfulOperationSourceHydratorToJson(this);
}

///DrySource specifies where the dry "don't repeat yourself" manifest source lives.
@JsonSerializable()
class TentacledDrySource {
  ///Path is a directory path within the Git repository where the manifests are located
  @JsonKey(name: 'path')
  String path;

  ///RepoURL is the URL to the git repository that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to hydrate
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  TentacledDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory TentacledDrySource.fromJson(Map<String, dynamic> json) =>
      _$TentacledDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledDrySourceToJson(this);
}

@JsonSerializable()
class TentacledHydrateTo {
  ///TargetBranch is the branch to which hydrated manifests should be committed
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  TentacledHydrateTo({required this.targetBranch});

  factory TentacledHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$TentacledHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledHydrateToToJson(this);
}

///SyncSource specifies where to sync hydrated manifests from.
@JsonSerializable()
class TentacledSyncSource {
  ///Path is a directory path within the git repository where hydrated manifests should be
  ///committed to and synced
  ///from. The Path should never point to the root of the repo. If hydrateTo is set, this is
  ///just the path from which
  ///hydrated manifests will be synced.
  @JsonKey(name: 'path')
  String path;

  ///TargetBranch is the branch from which hydrated manifests will be synced.
  ///If HydrateTo is not set, this is also the branch to which hydrated manifests are
  ///committed.
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  TentacledSyncSource({required this.path, required this.targetBranch});

  factory TentacledSyncSource.fromJson(Map<String, dynamic> json) =>
      _$TentacledSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSyncSourceToJson(this);
}

@JsonSerializable()
class Summary {
  ///ExternalURLs holds all external URLs of application child resources.
  @JsonKey(name: 'externalURLs')
  List<String?>? externalUrLs;

  ///Images holds all images of application child resources.
  @JsonKey(name: 'images')
  List<String?>? images;

  Summary({this.externalUrLs, this.images});

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}

@JsonSerializable()
class StatusSync {
  ///ComparedTo contains information about what has been compared
  @JsonKey(name: 'comparedTo')
  ComparedTo? comparedTo;

  ///Revision contains information about the revision the comparison has been performed to
  @JsonKey(name: 'revision')
  String? revision;

  ///Revisions contains information about the revisions of multiple sources the comparison has
  ///been performed to
  @JsonKey(name: 'revisions')
  List<String?>? revisions;

  ///Status is the sync state of the comparison
  @JsonKey(name: 'status')
  String status;

  StatusSync({
    this.comparedTo,
    this.revision,
    this.revisions,
    required this.status,
  });

  factory StatusSync.fromJson(Map<String, dynamic> json) =>
      _$StatusSyncFromJson(json);

  Map<String, dynamic> toJson() => _$StatusSyncToJson(this);
}

@JsonSerializable()
class ComparedTo {
  ///Destination is a reference to the application's destination used for comparison
  @JsonKey(name: 'destination')
  ComparedToDestination destination;

  ///IgnoreDifferences is a reference to the application's ignored differences used for
  ///comparison
  @JsonKey(name: 'ignoreDifferences')
  List<ComparedToIgnoreDifference?>? ignoreDifferences;

  ///Source is a reference to the application's source used for comparison
  @JsonKey(name: 'source')
  FriskySource? source;

  ///Sources is a reference to the application's multiple sources used for comparison
  @JsonKey(name: 'sources')
  List<MischievousSource?>? sources;

  ComparedTo({
    required this.destination,
    this.ignoreDifferences,
    this.source,
    this.sources,
  });

  factory ComparedTo.fromJson(Map<String, dynamic> json) =>
      _$ComparedToFromJson(json);

  Map<String, dynamic> toJson() => _$ComparedToToJson(this);
}

///Destination is a reference to the application's destination used for comparison
@JsonSerializable()
class ComparedToDestination {
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

  ComparedToDestination({this.name, this.namespace, this.server});

  factory ComparedToDestination.fromJson(Map<String, dynamic> json) =>
      _$ComparedToDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$ComparedToDestinationToJson(this);
}

@JsonSerializable()
class ComparedToIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;

  ///ManagedFieldsManagers is a list of trusted managers. Fields mutated by those managers
  ///will take precedence over the
  ///desired state defined in the SCM and won't be displayed in diffs
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  ComparedToIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory ComparedToIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$ComparedToIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ComparedToIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class FriskySource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  FriskyDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  FriskyHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  FriskyKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  FriskyPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  FriskySource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory FriskySource.fromJson(Map<String, dynamic> json) =>
      _$FriskySourceFromJson(json);

  Map<String, dynamic> toJson() => _$FriskySourceToJson(this);
}

@JsonSerializable()
class FriskyDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  FriskyJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  FriskyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory FriskyDirectory.fromJson(Map<String, dynamic> json) =>
      _$FriskyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyDirectoryToJson(this);
}

@JsonSerializable()
class FriskyJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<FriskyExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<FriskyTlas?>? tlas;

  FriskyJsonnet({this.extVars, this.libs, this.tlas});

  factory FriskyJsonnet.fromJson(Map<String, dynamic> json) =>
      _$FriskyJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyJsonnetToJson(this);
}

@JsonSerializable()
class FriskyExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FriskyExtVar({this.code, required this.name, required this.value});

  factory FriskyExtVar.fromJson(Map<String, dynamic> json) =>
      _$FriskyExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyExtVarToJson(this);
}

@JsonSerializable()
class FriskyTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FriskyTlas({this.code, required this.name, required this.value});

  factory FriskyTlas.fromJson(Map<String, dynamic> json) =>
      _$FriskyTlasFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyTlasToJson(this);
}

@JsonSerializable()
class FriskyHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<FriskyFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<Parameter8?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  FriskyHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory FriskyHelm.fromJson(Map<String, dynamic> json) =>
      _$FriskyHelmFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyHelmToJson(this);
}

@JsonSerializable()
class FriskyFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  FriskyFileParameter({this.name, this.path});

  factory FriskyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$FriskyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyFileParameterToJson(this);
}

@JsonSerializable()
class Parameter8 {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  Parameter8({this.forceString, this.name, this.value});

  factory Parameter8.fromJson(Map<String, dynamic> json) =>
      _$Parameter8FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter8ToJson(this);
}

@JsonSerializable()
class FriskyKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<FriskyPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<FriskyReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  FriskyKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory FriskyKustomize.fromJson(Map<String, dynamic> json) =>
      _$FriskyKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyKustomizeToJson(this);
}

@JsonSerializable()
class FriskyPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  FriskyTarget? target;

  FriskyPatch({this.options, this.patch, this.path, this.target});

  factory FriskyPatch.fromJson(Map<String, dynamic> json) =>
      _$FriskyPatchFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyPatchToJson(this);
}

@JsonSerializable()
class FriskyTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  FriskyTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory FriskyTarget.fromJson(Map<String, dynamic> json) =>
      _$FriskyTargetFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyTargetToJson(this);
}

@JsonSerializable()
class FriskyReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  FriskyReplica({required this.count, required this.name});

  factory FriskyReplica.fromJson(Map<String, dynamic> json) =>
      _$FriskyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyReplicaToJson(this);
}

@JsonSerializable()
class FriskyPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<FriskyEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter9?>? parameters;

  FriskyPlugin({this.env, this.name, this.parameters});

  factory FriskyPlugin.fromJson(Map<String, dynamic> json) =>
      _$FriskyPluginFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyPluginToJson(this);
}

@JsonSerializable()
class FriskyEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  FriskyEnv({required this.name, required this.value});

  factory FriskyEnv.fromJson(Map<String, dynamic> json) =>
      _$FriskyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyEnvToJson(this);
}

@JsonSerializable()
class Parameter9 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter9({this.array, this.map, this.name, this.string});

  factory Parameter9.fromJson(Map<String, dynamic> json) =>
      _$Parameter9FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter9ToJson(this);
}

@JsonSerializable()
class MischievousSource {
  ///Chart is a Helm chart name, and must be specified for applications sourced from a Helm
  ///repo.
  @JsonKey(name: 'chart')
  String? chart;

  ///Directory holds path/directory specific options
  @JsonKey(name: 'directory')
  MischievousDirectory? directory;

  ///Helm holds helm specific options
  @JsonKey(name: 'helm')
  MischievousHelm? helm;

  ///Kustomize holds kustomize specific options
  @JsonKey(name: 'kustomize')
  MischievousKustomize? kustomize;

  ///Name is used to refer to a source and is displayed in the UI. It is used in multi-source
  ///Applications.
  @JsonKey(name: 'name')
  String? name;

  ///Path is a directory path within the Git repository, and is only valid for applications
  ///sourced from Git.
  @JsonKey(name: 'path')
  String? path;

  ///Plugin holds config management plugin specific options
  @JsonKey(name: 'plugin')
  MischievousPlugin? plugin;

  ///Ref is reference to another source within sources field. This field will not be used if
  ///used with a `source` tag.
  @JsonKey(name: 'ref')
  String? ref;

  ///RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
  @JsonKey(name: 'repoURL')
  String repoUrl;

  ///TargetRevision defines the revision of the source to sync the application to.
  ///In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
  ///In case of Helm, this is a semver tag for the Chart's version.
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  MischievousSource({
    this.chart,
    this.directory,
    this.helm,
    this.kustomize,
    this.name,
    this.path,
    this.plugin,
    this.ref,
    required this.repoUrl,
    this.targetRevision,
  });

  factory MischievousSource.fromJson(Map<String, dynamic> json) =>
      _$MischievousSourceFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousSourceToJson(this);
}

@JsonSerializable()
class MischievousDirectory {
  ///Exclude contains a glob pattern to match paths against that should be explicitly excluded
  ///from being used during manifest generation
  @JsonKey(name: 'exclude')
  String? exclude;

  ///Include contains a glob pattern to match paths against that should be explicitly included
  ///during manifest generation
  @JsonKey(name: 'include')
  String? include;

  ///Jsonnet holds options specific to Jsonnet
  @JsonKey(name: 'jsonnet')
  MischievousJsonnet? jsonnet;

  ///Recurse specifies whether to scan a directory recursively for manifests
  @JsonKey(name: 'recurse')
  bool? recurse;

  MischievousDirectory({
    this.exclude,
    this.include,
    this.jsonnet,
    this.recurse,
  });

  factory MischievousDirectory.fromJson(Map<String, dynamic> json) =>
      _$MischievousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousDirectoryToJson(this);
}

@JsonSerializable()
class MischievousJsonnet {
  ///ExtVars is a list of Jsonnet External Variables
  @JsonKey(name: 'extVars')
  List<MischievousExtVar?>? extVars;

  ///Additional library search dirs
  @JsonKey(name: 'libs')
  List<String?>? libs;

  ///TLAS is a list of Jsonnet Top-level Arguments
  @JsonKey(name: 'tlas')
  List<MischievousTlas?>? tlas;

  MischievousJsonnet({this.extVars, this.libs, this.tlas});

  factory MischievousJsonnet.fromJson(Map<String, dynamic> json) =>
      _$MischievousJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousJsonnetToJson(this);
}

@JsonSerializable()
class MischievousExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MischievousExtVar({this.code, required this.name, required this.value});

  factory MischievousExtVar.fromJson(Map<String, dynamic> json) =>
      _$MischievousExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousExtVarToJson(this);
}

@JsonSerializable()
class MischievousTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MischievousTlas({this.code, required this.name, required this.value});

  factory MischievousTlas.fromJson(Map<String, dynamic> json) =>
      _$MischievousTlasFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousTlasToJson(this);
}

@JsonSerializable()
class MischievousHelm {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///FileParameters are file parameters to the helm template
  @JsonKey(name: 'fileParameters')
  List<MischievousFileParameter?>? fileParameters;

  ///IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist
  ///locally by not appending them to helm template --values
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///Namespace is an optional namespace to template with. If left empty, defaults to the app's
  ///destination namespace.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Parameters is a list of Helm parameters which are passed to the helm template command
  ///upon manifest generation
  @JsonKey(name: 'parameters')
  List<Parameter10?>? parameters;

  ///PassCredentials pass credentials to all domains (Helm's --pass-credentials)
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;

  ///ReleaseName is the Helm release name to use. If omitted it will use the application name
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;

  ///SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;

  ///SkipTests skips test manifest installation step (Helm's --skip-tests).
  @JsonKey(name: 'skipTests')
  bool? skipTests;

  ///ValuesFiles is a list of Helm value files to use when generating a template
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;

  ///Values specifies Helm values to be passed to helm template, typically defined as a block.
  ///ValuesObject takes precedence over Values, so use one or the other.
  @JsonKey(name: 'values')
  String? values;

  ///ValuesObject specifies Helm values to be passed to helm template, defined as a map. This
  ///takes precedence over Values.
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;

  ///Version is the Helm version to use for templating ("3")
  @JsonKey(name: 'version')
  String? version;

  MischievousHelm({
    this.apiVersions,
    this.fileParameters,
    this.ignoreMissingValueFiles,
    this.kubeVersion,
    this.namespace,
    this.parameters,
    this.passCredentials,
    this.releaseName,
    this.skipCrds,
    this.skipSchemaValidation,
    this.skipTests,
    this.valueFiles,
    this.values,
    this.valuesObject,
    this.version,
  });

  factory MischievousHelm.fromJson(Map<String, dynamic> json) =>
      _$MischievousHelmFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousHelmToJson(this);
}

@JsonSerializable()
class MischievousFileParameter {
  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Path is the path to the file containing the values for the Helm parameter
  @JsonKey(name: 'path')
  String? path;

  MischievousFileParameter({this.name, this.path});

  factory MischievousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$MischievousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousFileParameterToJson(this);
}

@JsonSerializable()
class Parameter10 {
  ///ForceString determines whether to tell Helm to interpret booleans and numbers as strings
  @JsonKey(name: 'forceString')
  bool? forceString;

  ///Name is the name of the Helm parameter
  @JsonKey(name: 'name')
  String? name;

  ///Value is the value for the Helm parameter
  @JsonKey(name: 'value')
  String? value;

  Parameter10({this.forceString, this.name, this.value});

  factory Parameter10.fromJson(Map<String, dynamic> json) =>
      _$Parameter10FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter10ToJson(this);
}

@JsonSerializable()
class MischievousKustomize {
  ///APIVersions specifies the Kubernetes resource API versions to pass to Helm when
  ///templating manifests. By default,
  ///Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///CommonAnnotations is a list of additional annotations to add to rendered manifests
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;

  ///CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for
  ///annotation values
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;

  ///CommonLabels is a list of additional labels to add to rendered manifests
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;

  ///Components specifies a list of kustomize components to add to the kustomization before
  ///building
  @JsonKey(name: 'components')
  List<String?>? components;

  ///ForceCommonAnnotations specifies whether to force applying common annotations to
  ///resources for Kustomize apps
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;

  ///ForceCommonLabels specifies whether to force applying common labels to resources for
  ///Kustomize apps
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;

  ///IgnoreMissingComponents prevents kustomize from failing when components do not exist
  ///locally by not appending them to kustomization file
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;

  ///Images is a list of Kustomize image override specifications
  @JsonKey(name: 'images')
  List<String?>? images;

  ///KubeVersion specifies the Kubernetes API version to pass to Helm when templating
  ///manifests. By default, Argo CD
  ///uses the Kubernetes version of the target cluster.
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;

  ///LabelIncludeTemplates specifies whether to apply common labels to resource templates or
  ///not
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;

  ///LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;

  ///NamePrefix is a prefix appended to resources for Kustomize apps
  @JsonKey(name: 'namePrefix')
  String? namePrefix;

  ///Namespace sets the namespace that Kustomize adds to all resources
  @JsonKey(name: 'namespace')
  String? namespace;

  ///NameSuffix is a suffix appended to resources for Kustomize apps
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;

  ///Patches is a list of Kustomize patches
  @JsonKey(name: 'patches')
  List<MischievousPatch?>? patches;

  ///Replicas is a list of Kustomize Replicas override specifications
  @JsonKey(name: 'replicas')
  List<MischievousReplica?>? replicas;

  ///Version controls which version of Kustomize to use for rendering manifests
  @JsonKey(name: 'version')
  String? version;

  MischievousKustomize({
    this.apiVersions,
    this.commonAnnotations,
    this.commonAnnotationsEnvsubst,
    this.commonLabels,
    this.components,
    this.forceCommonAnnotations,
    this.forceCommonLabels,
    this.ignoreMissingComponents,
    this.images,
    this.kubeVersion,
    this.labelIncludeTemplates,
    this.labelWithoutSelector,
    this.namePrefix,
    this.namespace,
    this.nameSuffix,
    this.patches,
    this.replicas,
    this.version,
  });

  factory MischievousKustomize.fromJson(Map<String, dynamic> json) =>
      _$MischievousKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousKustomizeToJson(this);
}

@JsonSerializable()
class MischievousPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  MischievousTarget? target;

  MischievousPatch({this.options, this.patch, this.path, this.target});

  factory MischievousPatch.fromJson(Map<String, dynamic> json) =>
      _$MischievousPatchFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousPatchToJson(this);
}

@JsonSerializable()
class MischievousTarget {
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'labelSelector')
  String? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'version')
  String? version;

  MischievousTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory MischievousTarget.fromJson(Map<String, dynamic> json) =>
      _$MischievousTargetFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousTargetToJson(this);
}

@JsonSerializable()
class MischievousReplica {
  ///Number of replicas
  @JsonKey(name: 'count')
  dynamic count;

  ///Name of Deployment or StatefulSet
  @JsonKey(name: 'name')
  String name;

  MischievousReplica({required this.count, required this.name});

  factory MischievousReplica.fromJson(Map<String, dynamic> json) =>
      _$MischievousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousReplicaToJson(this);
}

@JsonSerializable()
class MischievousPlugin {
  ///Env is a list of environment variable entries
  @JsonKey(name: 'env')
  List<MischievousEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter11?>? parameters;

  MischievousPlugin({this.env, this.name, this.parameters});

  factory MischievousPlugin.fromJson(Map<String, dynamic> json) =>
      _$MischievousPluginFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousPluginToJson(this);
}

@JsonSerializable()
class MischievousEnv {
  ///Name is the name of the variable, usually expressed in uppercase
  @JsonKey(name: 'name')
  String name;

  ///Value is the value of the variable
  @JsonKey(name: 'value')
  String value;

  MischievousEnv({required this.name, required this.value});

  factory MischievousEnv.fromJson(Map<String, dynamic> json) =>
      _$MischievousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousEnvToJson(this);
}

@JsonSerializable()
class Parameter11 {
  ///Array is the value of an array type parameter.
  @JsonKey(name: 'array')
  List<String?>? array;

  ///Map is the value of a map type parameter.
  @JsonKey(name: 'map')
  Map<String, String?>? map;

  ///Name is the name identifying a parameter.
  @JsonKey(name: 'name')
  String? name;

  ///String_ is the value of a string type parameter.
  @JsonKey(name: 'string')
  String? string;

  Parameter11({this.array, this.map, this.name, this.string});

  factory Parameter11.fromJson(Map<String, dynamic> json) =>
      _$Parameter11FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter11ToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ApplicationlistArgoprojV1Alpha1Kind {
  @JsonValue('ApplicationList')
  APPLICATION_LIST,
}

final applicationlistArgoprojV1Alpha1KindValues = EnumValues({
  'ApplicationList': ApplicationlistArgoprojV1Alpha1Kind.APPLICATION_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ApplicationlistArgoprojV1Alpha1Metadata {
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

  ApplicationlistArgoprojV1Alpha1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ApplicationlistArgoprojV1Alpha1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ApplicationlistArgoprojV1Alpha1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApplicationlistArgoprojV1Alpha1MetadataToJson(this);
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
