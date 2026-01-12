import 'package:json_annotation/json_annotation.dart';

part 'gitrepositorylist_source_v1.g.dart';

///GitRepositoryList is a list of GitRepository
@JsonSerializable()
class GitrepositorylistSourceV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of gitrepositories. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  GitrepositorylistSourceV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  GitrepositorylistSourceV1Metadata? metadata;

  GitrepositorylistSourceV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory GitrepositorylistSourceV1.fromJson(Map<String, dynamic> json) =>
      _$GitrepositorylistSourceV1FromJson(json);

  Map<String, dynamic> toJson() => _$GitrepositorylistSourceV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('source.toolkit.fluxcd.io/v1')
  SOURCE_TOOLKIT_FLUXCD_IO_V1,
}

final apiVersionValues = EnumValues({
  'source.toolkit.fluxcd.io/v1': ApiVersion.SOURCE_TOOLKIT_FLUXCD_IO_V1,
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

  ///GitRepositorySpec specifies the required configuration to produce an
  ///Artifact for a Git repository.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///GitRepositoryStatus records the observed state of a Git repository.
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
  @JsonValue('GitRepository')
  GIT_REPOSITORY,
}

final itemKindValues = EnumValues({'GitRepository': ItemKind.GIT_REPOSITORY});

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
  ///Ignore overrides the set of excluded patterns in the .sourceignore format
  ///(which is the same as .gitignore). If not provided, a default will be used,
  ///consult the documentation for your version to find out what those are.
  @JsonKey(name: 'ignore')
  String? ignore;

  ///Include specifies a list of GitRepository resources which Artifacts
  ///should be included in the Artifact produced for this GitRepository.
  @JsonKey(name: 'include')
  List<Include?>? include;

  ///Interval at which the GitRepository URL is checked for updates.
  ///This interval is approximate and may be subject to jitter to ensure
  ///efficient use of resources.
  @JsonKey(name: 'interval')
  String interval;

  ///Provider used for authentication, can be 'azure', 'github', 'generic'.
  ///When not specified, defaults to 'generic'.
  @JsonKey(name: 'provider')
  Provider? provider;

  ///ProxySecretRef specifies the Secret containing the proxy configuration
  ///to use while communicating with the Git server.
  @JsonKey(name: 'proxySecretRef')
  ProxySecretRef? proxySecretRef;

  ///RecurseSubmodules enables the initialization of all submodules within
  ///the GitRepository as cloned from the URL, using their default settings.
  @JsonKey(name: 'recurseSubmodules')
  bool? recurseSubmodules;

  ///Reference specifies the Git reference to resolve and monitor for
  ///changes, defaults to the 'master' branch.
  @JsonKey(name: 'ref')
  Ref? ref;

  ///SecretRef specifies the Secret containing authentication credentials for
  ///the GitRepository.
  ///For HTTPS repositories the Secret must contain 'username' and 'password'
  ///fields for basic auth or 'bearerToken' field for token auth.
  ///For SSH repositories the Secret must contain 'identity'
  ///and 'known_hosts' fields.
  @JsonKey(name: 'secretRef')
  SpecSecretRef? secretRef;

  ///ServiceAccountName is the name of the Kubernetes ServiceAccount used to
  ///authenticate to the GitRepository. This field is only supported for 'azure' provider.
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///SparseCheckout specifies a list of directories to checkout when cloning
  ///the repository. If specified, only these directories are included in the
  ///Artifact produced for this GitRepository.
  @JsonKey(name: 'sparseCheckout')
  List<String?>? sparseCheckout;

  ///Suspend tells the controller to suspend the reconciliation of this
  ///GitRepository.
  @JsonKey(name: 'suspend')
  bool? suspend;

  ///Timeout for Git operations like cloning, defaults to 60s.
  @JsonKey(name: 'timeout')
  String? timeout;

  ///URL specifies the Git repository URL, it can be an HTTP/S or SSH address.
  @JsonKey(name: 'url')
  String url;

  ///Verification specifies the configuration to verify the Git commit
  ///signature(s).
  @JsonKey(name: 'verify')
  Verify? verify;

  Spec({
    this.ignore,
    this.include,
    required this.interval,
    this.provider,
    this.proxySecretRef,
    this.recurseSubmodules,
    this.ref,
    this.secretRef,
    this.serviceAccountName,
    this.sparseCheckout,
    this.suspend,
    this.timeout,
    required this.url,
    this.verify,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Include {
  ///FromPath specifies the path to copy contents from, defaults to the root
  ///of the Artifact.
  @JsonKey(name: 'fromPath')
  String? fromPath;

  ///GitRepositoryRef specifies the GitRepository which Artifact contents
  ///must be included.
  @JsonKey(name: 'repository')
  IncludeRepository repository;

  ///ToPath specifies the path to copy contents to, defaults to the name of
  ///the GitRepositoryRef.
  @JsonKey(name: 'toPath')
  String? toPath;

  Include({this.fromPath, required this.repository, this.toPath});

  factory Include.fromJson(Map<String, dynamic> json) =>
      _$IncludeFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeToJson(this);
}

///GitRepositoryRef specifies the GitRepository which Artifact contents
///must be included.
@JsonSerializable()
class IncludeRepository {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  IncludeRepository({required this.name});

  factory IncludeRepository.fromJson(Map<String, dynamic> json) =>
      _$IncludeRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeRepositoryToJson(this);
}

///Provider used for authentication, can be 'azure', 'github', 'generic'.
///When not specified, defaults to 'generic'.
enum Provider {
  @JsonValue('azure')
  AZURE,
  @JsonValue('generic')
  GENERIC,
  @JsonValue('github')
  GITHUB,
}

final providerValues = EnumValues({
  'azure': Provider.AZURE,
  'generic': Provider.GENERIC,
  'github': Provider.GITHUB,
});

@JsonSerializable()
class ProxySecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ProxySecretRef({required this.name});

  factory ProxySecretRef.fromJson(Map<String, dynamic> json) =>
      _$ProxySecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ProxySecretRefToJson(this);
}

@JsonSerializable()
class Ref {
  ///Branch to check out, defaults to 'master' if no other field is defined.
  @JsonKey(name: 'branch')
  String? branch;

  ///Commit SHA to check out, takes precedence over all reference fields.
  ///
  ///This can be combined with Branch to shallow clone the branch, in which
  ///the commit is expected to exist.
  @JsonKey(name: 'commit')
  String? commit;

  ///Name of the reference to check out; takes precedence over Branch, Tag and SemVer.
  ///
  ///It must be a valid Git reference:
  ///https://git-scm.com/docs/git-check-ref-format#_description
  ///Examples: "refs/heads/main", "refs/tags/v0.1.0", "refs/pull/420/head",
  ///"refs/merge-requests/1/head"
  @JsonKey(name: 'name')
  String? name;

  ///SemVer tag expression to check out, takes precedence over Tag.
  @JsonKey(name: 'semver')
  String? semver;

  ///Tag to check out, takes precedence over Branch.
  @JsonKey(name: 'tag')
  String? tag;

  Ref({this.branch, this.commit, this.name, this.semver, this.tag});

  factory Ref.fromJson(Map<String, dynamic> json) => _$RefFromJson(json);

  Map<String, dynamic> toJson() => _$RefToJson(this);
}

@JsonSerializable()
class SpecSecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  SpecSecretRef({required this.name});

  factory SpecSecretRef.fromJson(Map<String, dynamic> json) =>
      _$SpecSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$SpecSecretRefToJson(this);
}

@JsonSerializable()
class Verify {
  ///Mode specifies which Git object(s) should be verified.
  ///
  ///The variants "head" and "HEAD" both imply the same thing, i.e. verify
  ///the commit that the HEAD of the Git repository points to. The variant
  ///"head" solely exists to ensure backwards compatibility.
  @JsonKey(name: 'mode')
  Mode? mode;

  ///SecretRef specifies the Secret containing the public keys of trusted Git
  ///authors.
  @JsonKey(name: 'secretRef')
  VerifySecretRef secretRef;

  Verify({this.mode, required this.secretRef});

  factory Verify.fromJson(Map<String, dynamic> json) => _$VerifyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyToJson(this);
}

///Mode specifies which Git object(s) should be verified.
///
///The variants "head" and "HEAD" both imply the same thing, i.e. verify
///the commit that the HEAD of the Git repository points to. The variant
///"head" solely exists to ensure backwards compatibility.
enum Mode {
  @JsonValue('head')
  HEAD,
  @JsonValue('HEAD')
  MODE_HEAD,
  @JsonValue('Tag')
  TAG,
  @JsonValue('TagAndHEAD')
  TAG_AND_HEAD,
}

final modeValues = EnumValues({
  'head': Mode.HEAD,
  'HEAD': Mode.MODE_HEAD,
  'Tag': Mode.TAG,
  'TagAndHEAD': Mode.TAG_AND_HEAD,
});

///SecretRef specifies the Secret containing the public keys of trusted Git
///authors.
@JsonSerializable()
class VerifySecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  VerifySecretRef({required this.name});

  factory VerifySecretRef.fromJson(Map<String, dynamic> json) =>
      _$VerifySecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySecretRefToJson(this);
}

@JsonSerializable()
class StatusClass {
  ///Artifact represents the last successful GitRepository reconciliation.
  @JsonKey(name: 'artifact')
  Artifact? artifact;

  ///Conditions holds the conditions for the GitRepository.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///IncludedArtifacts contains a list of the last successfully included
  ///Artifacts as instructed by GitRepositorySpec.Include.
  @JsonKey(name: 'includedArtifacts')
  List<IncludedArtifact?>? includedArtifacts;

  ///LastHandledReconcileAt holds the value of the most recent
  ///reconcile request value, so a change of the annotation value
  ///can be detected.
  @JsonKey(name: 'lastHandledReconcileAt')
  String? lastHandledReconcileAt;

  ///ObservedGeneration is the last observed generation of the GitRepository
  ///object.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///ObservedIgnore is the observed exclusion patterns used for constructing
  ///the source artifact.
  @JsonKey(name: 'observedIgnore')
  String? observedIgnore;

  ///ObservedInclude is the observed list of GitRepository resources used to
  ///produce the current Artifact.
  @JsonKey(name: 'observedInclude')
  List<ObservedInclude?>? observedInclude;

  ///ObservedRecurseSubmodules is the observed resource submodules
  ///configuration used to produce the current Artifact.
  @JsonKey(name: 'observedRecurseSubmodules')
  bool? observedRecurseSubmodules;

  ///ObservedSparseCheckout is the observed list of directories used to
  ///produce the current Artifact.
  @JsonKey(name: 'observedSparseCheckout')
  List<String?>? observedSparseCheckout;

  ///SourceVerificationMode is the last used verification mode indicating
  ///which Git object(s) have been verified.
  @JsonKey(name: 'sourceVerificationMode')
  String? sourceVerificationMode;

  StatusClass({
    this.artifact,
    this.conditions,
    this.includedArtifacts,
    this.lastHandledReconcileAt,
    this.observedGeneration,
    this.observedIgnore,
    this.observedInclude,
    this.observedRecurseSubmodules,
    this.observedSparseCheckout,
    this.sourceVerificationMode,
  });

  factory StatusClass.fromJson(Map<String, dynamic> json) =>
      _$StatusClassFromJson(json);

  Map<String, dynamic> toJson() => _$StatusClassToJson(this);
}

@JsonSerializable()
class Artifact {
  ///Digest is the digest of the file in the form of '<algorithm>:<checksum>'.
  @JsonKey(name: 'digest')
  String digest;

  ///LastUpdateTime is the timestamp corresponding to the last update of the
  ///Artifact.
  @JsonKey(name: 'lastUpdateTime')
  DateTime lastUpdateTime;

  ///Metadata holds upstream information such as OCI annotations.
  @JsonKey(name: 'metadata')
  Map<String, String?>? metadata;

  ///Path is the relative file path of the Artifact. It can be used to locate
  ///the file in the root of the Artifact storage on the local file system of
  ///the controller managing the Source.
  @JsonKey(name: 'path')
  String path;

  ///Revision is a human-readable identifier traceable in the origin source
  ///system. It can be a Git commit SHA, Git tag, a Helm chart version, etc.
  @JsonKey(name: 'revision')
  String revision;

  ///Size is the number of bytes in the file.
  @JsonKey(name: 'size')
  int? size;

  ///URL is the HTTP address of the Artifact as exposed by the controller
  ///managing the Source. It can be used to retrieve the Artifact for
  ///consumption, e.g. by another controller applying the Artifact contents.
  @JsonKey(name: 'url')
  String url;

  Artifact({
    required this.digest,
    required this.lastUpdateTime,
    this.metadata,
    required this.path,
    required this.revision,
    this.size,
    required this.url,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);

  Map<String, dynamic> toJson() => _$ArtifactToJson(this);
}

@JsonSerializable()
class Condition {
  ///lastTransitionTime is the last time the condition transitioned from one status to
  ///another.
  ///This should be when the underlying condition changed.  If that is not known, then using
  ///the time when the API field changed is acceptable.
  @JsonKey(name: 'lastTransitionTime')
  DateTime lastTransitionTime;

  ///message is a human readable message indicating details about the transition.
  ///This may be an empty string.
  @JsonKey(name: 'message')
  String message;

  ///observedGeneration represents the .metadata.generation that the condition was set based
  ///upon.
  ///For instance, if .metadata.generation is currently 12, but the
  ///.status.conditions[x].observedGeneration is 9, the condition is out of date
  ///with respect to the current state of the instance.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///reason contains a programmatic identifier indicating the reason for the condition's last
  ///transition.
  ///Producers of specific condition types may define expected values and meanings for this
  ///field,
  ///and whether the values are considered a guaranteed API.
  ///The value should be a CamelCase string.
  ///This field may not be empty.
  @JsonKey(name: 'reason')
  String reason;

  ///status of the condition, one of True, False, Unknown.
  @JsonKey(name: 'status')
  StatusEnum status;

  ///type of condition in CamelCase or in foo.example.com/CamelCase.
  @JsonKey(name: 'type')
  String type;

  Condition({
    required this.lastTransitionTime,
    required this.message,
    this.observedGeneration,
    required this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

///status of the condition, one of True, False, Unknown.
enum StatusEnum {
  @JsonValue('False')
  FALSE,
  @JsonValue('True')
  TRUE,
  @JsonValue('Unknown')
  UNKNOWN,
}

final statusEnumValues = EnumValues({
  'False': StatusEnum.FALSE,
  'True': StatusEnum.TRUE,
  'Unknown': StatusEnum.UNKNOWN,
});

@JsonSerializable()
class IncludedArtifact {
  ///Digest is the digest of the file in the form of '<algorithm>:<checksum>'.
  @JsonKey(name: 'digest')
  String digest;

  ///LastUpdateTime is the timestamp corresponding to the last update of the
  ///Artifact.
  @JsonKey(name: 'lastUpdateTime')
  DateTime lastUpdateTime;

  ///Metadata holds upstream information such as OCI annotations.
  @JsonKey(name: 'metadata')
  Map<String, String?>? metadata;

  ///Path is the relative file path of the Artifact. It can be used to locate
  ///the file in the root of the Artifact storage on the local file system of
  ///the controller managing the Source.
  @JsonKey(name: 'path')
  String path;

  ///Revision is a human-readable identifier traceable in the origin source
  ///system. It can be a Git commit SHA, Git tag, a Helm chart version, etc.
  @JsonKey(name: 'revision')
  String revision;

  ///Size is the number of bytes in the file.
  @JsonKey(name: 'size')
  int? size;

  ///URL is the HTTP address of the Artifact as exposed by the controller
  ///managing the Source. It can be used to retrieve the Artifact for
  ///consumption, e.g. by another controller applying the Artifact contents.
  @JsonKey(name: 'url')
  String url;

  IncludedArtifact({
    required this.digest,
    required this.lastUpdateTime,
    this.metadata,
    required this.path,
    required this.revision,
    this.size,
    required this.url,
  });

  factory IncludedArtifact.fromJson(Map<String, dynamic> json) =>
      _$IncludedArtifactFromJson(json);

  Map<String, dynamic> toJson() => _$IncludedArtifactToJson(this);
}

@JsonSerializable()
class ObservedInclude {
  ///FromPath specifies the path to copy contents from, defaults to the root
  ///of the Artifact.
  @JsonKey(name: 'fromPath')
  String? fromPath;

  ///GitRepositoryRef specifies the GitRepository which Artifact contents
  ///must be included.
  @JsonKey(name: 'repository')
  ObservedIncludeRepository repository;

  ///ToPath specifies the path to copy contents to, defaults to the name of
  ///the GitRepositoryRef.
  @JsonKey(name: 'toPath')
  String? toPath;

  ObservedInclude({this.fromPath, required this.repository, this.toPath});

  factory ObservedInclude.fromJson(Map<String, dynamic> json) =>
      _$ObservedIncludeFromJson(json);

  Map<String, dynamic> toJson() => _$ObservedIncludeToJson(this);
}

///GitRepositoryRef specifies the GitRepository which Artifact contents
///must be included.
@JsonSerializable()
class ObservedIncludeRepository {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ObservedIncludeRepository({required this.name});

  factory ObservedIncludeRepository.fromJson(Map<String, dynamic> json) =>
      _$ObservedIncludeRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$ObservedIncludeRepositoryToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum GitrepositorylistSourceV1Kind {
  @JsonValue('GitRepositoryList')
  GIT_REPOSITORY_LIST,
}

final gitrepositorylistSourceV1KindValues = EnumValues({
  'GitRepositoryList': GitrepositorylistSourceV1Kind.GIT_REPOSITORY_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class GitrepositorylistSourceV1Metadata {
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

  GitrepositorylistSourceV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory GitrepositorylistSourceV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$GitrepositorylistSourceV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GitrepositorylistSourceV1MetadataToJson(this);
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
