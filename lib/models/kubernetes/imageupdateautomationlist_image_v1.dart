import 'package:json_annotation/json_annotation.dart';

part 'imageupdateautomationlist_image_v1.g.dart';

///ImageUpdateAutomationList is a list of ImageUpdateAutomation
@JsonSerializable()
class ImageupdateautomationlistImageV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of imageupdateautomations. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ImageupdateautomationlistImageV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ImageupdateautomationlistImageV1Metadata? metadata;

  ImageupdateautomationlistImageV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ImageupdateautomationlistImageV1.fromJson(
    Map<String, dynamic> json,
  ) => _$ImageupdateautomationlistImageV1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ImageupdateautomationlistImageV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('image.toolkit.fluxcd.io/v1')
  IMAGE_TOOLKIT_FLUXCD_IO_V1,
}

final apiVersionValues = EnumValues({
  'image.toolkit.fluxcd.io/v1': ApiVersion.IMAGE_TOOLKIT_FLUXCD_IO_V1,
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

  ///ImageUpdateAutomationSpec defines the desired state of ImageUpdateAutomation
  @JsonKey(name: 'spec')
  Spec? spec;

  ///ImageUpdateAutomationStatus defines the observed state of ImageUpdateAutomation
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
  @JsonValue('ImageUpdateAutomation')
  IMAGE_UPDATE_AUTOMATION,
}

final itemKindValues = EnumValues({
  'ImageUpdateAutomation': ItemKind.IMAGE_UPDATE_AUTOMATION,
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
  ///GitSpec contains all the git-specific definitions. This is
  ///technically optional, but in practice mandatory until there are
  ///other kinds of source allowed.
  @JsonKey(name: 'git')
  Git? git;

  ///Interval gives an lower bound for how often the automation
  ///run should be attempted.
  @JsonKey(name: 'interval')
  String interval;

  ///PolicySelector allows to filter applied policies based on labels.
  ///By default includes all policies in namespace.
  @JsonKey(name: 'policySelector')
  PolicySelector? policySelector;

  ///SourceRef refers to the resource giving access details
  ///to a git repository.
  @JsonKey(name: 'sourceRef')
  SourceRef sourceRef;

  ///Suspend tells the controller to not run this automation, until
  ///it is unset (or set to false). Defaults to false.
  @JsonKey(name: 'suspend')
  bool? suspend;

  ///Update gives the specification for how to update the files in
  ///the repository. This can be left empty, to use the default
  ///value.
  @JsonKey(name: 'update')
  Update? update;

  Spec({
    this.git,
    required this.interval,
    this.policySelector,
    required this.sourceRef,
    this.suspend,
    this.update,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Git {
  ///Checkout gives the parameters for cloning the git repository,
  ///ready to make changes. If not present, the `spec.ref` field from the
  ///referenced `GitRepository` or its default will be used.
  @JsonKey(name: 'checkout')
  Checkout? checkout;

  ///Commit specifies how to commit to the git repository.
  @JsonKey(name: 'commit')
  Commit commit;

  ///Push specifies how and where to push commits made by the
  ///automation. If missing, commits are pushed (back) to
  ///`.spec.checkout.branch` or its default.
  @JsonKey(name: 'push')
  Push? push;

  Git({this.checkout, required this.commit, this.push});

  factory Git.fromJson(Map<String, dynamic> json) => _$GitFromJson(json);

  Map<String, dynamic> toJson() => _$GitToJson(this);
}

@JsonSerializable()
class Checkout {
  ///Reference gives a branch, tag or commit to clone from the Git
  ///repository.
  @JsonKey(name: 'ref')
  Ref ref;

  Checkout({required this.ref});

  factory Checkout.fromJson(Map<String, dynamic> json) =>
      _$CheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutToJson(this);
}

///Reference gives a branch, tag or commit to clone from the Git
///repository.
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

///Commit specifies how to commit to the git repository.
@JsonSerializable()
class Commit {
  ///Author gives the email and optionally the name to use as the
  ///author of commits.
  @JsonKey(name: 'author')
  Author author;

  ///MessageTemplate provides a template for the commit message,
  ///into which will be interpolated the details of the change made.
  ///Note: The `Updated` template field has been removed. Use `Changed` instead.
  @JsonKey(name: 'messageTemplate')
  String? messageTemplate;

  ///MessageTemplateValues provides additional values to be available to the
  ///templating rendering.
  @JsonKey(name: 'messageTemplateValues')
  Map<String, String?>? messageTemplateValues;

  ///SigningKey provides the option to sign commits with a GPG key
  @JsonKey(name: 'signingKey')
  SigningKey? signingKey;

  Commit({
    required this.author,
    this.messageTemplate,
    this.messageTemplateValues,
    this.signingKey,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);

  Map<String, dynamic> toJson() => _$CommitToJson(this);
}

///Author gives the email and optionally the name to use as the
///author of commits.
@JsonSerializable()
class Author {
  ///Email gives the email to provide when making a commit.
  @JsonKey(name: 'email')
  String email;

  ///Name gives the name to provide when making a commit.
  @JsonKey(name: 'name')
  String? name;

  Author({required this.email, this.name});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class SigningKey {
  ///SecretRef holds the name to a secret that contains a 'git.asc' key
  ///corresponding to the ASCII Armored file containing the GPG signing
  ///keypair as the value. It must be in the same namespace as the
  ///ImageUpdateAutomation.
  @JsonKey(name: 'secretRef')
  SecretRef secretRef;

  SigningKey({required this.secretRef});

  factory SigningKey.fromJson(Map<String, dynamic> json) =>
      _$SigningKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SigningKeyToJson(this);
}

///SecretRef holds the name to a secret that contains a 'git.asc' key
///corresponding to the ASCII Armored file containing the GPG signing
///keypair as the value. It must be in the same namespace as the
///ImageUpdateAutomation.
@JsonSerializable()
class SecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  SecretRef({required this.name});

  factory SecretRef.fromJson(Map<String, dynamic> json) =>
      _$SecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$SecretRefToJson(this);
}

@JsonSerializable()
class Push {
  ///Branch specifies that commits should be pushed to the branch
  ///named. The branch is created using `.spec.checkout.branch` as the
  ///starting point, if it doesn't already exist.
  @JsonKey(name: 'branch')
  String? branch;

  ///Options specifies the push options that are sent to the Git
  ///server when performing a push operation. For details, see:
  ///https://git-scm.com/docs/git-push#Documentation/git-push.txt---push-optionltoptiongt
  @JsonKey(name: 'options')
  Map<String, String?>? options;

  ///Refspec specifies the Git Refspec to use for a push operation.
  ///If both Branch and Refspec are provided, then the commit is pushed
  ///to the branch and also using the specified refspec.
  ///For more details about Git Refspecs, see:
  ///https://git-scm.com/book/en/v2/Git-Internals-The-Refspec
  @JsonKey(name: 'refspec')
  String? refspec;

  Push({this.branch, this.options, this.refspec});

  factory Push.fromJson(Map<String, dynamic> json) => _$PushFromJson(json);

  Map<String, dynamic> toJson() => _$PushToJson(this);
}

@JsonSerializable()
class PolicySelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PolicySelector({this.matchExpressions, this.matchLabels});

  factory PolicySelector.fromJson(Map<String, dynamic> json) =>
      _$PolicySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PolicySelectorToJson(this);
}

@JsonSerializable()
class MatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. This array is replaced during a strategic
  ///merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  MatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression.fromJson(Map<String, dynamic> json) =>
      _$MatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpressionToJson(this);
}

///SourceRef refers to the resource giving access details
///to a git repository.
@JsonSerializable()
class SourceRef {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Kind of the referent.
  @JsonKey(name: 'kind')
  SourceRefKind kind;

  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ///Namespace of the referent, defaults to the namespace of the Kubernetes resource object
  ///that contains the reference.
  @JsonKey(name: 'namespace')
  String? namespace;

  SourceRef({
    this.apiVersion,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory SourceRef.fromJson(Map<String, dynamic> json) =>
      _$SourceRefFromJson(json);

  Map<String, dynamic> toJson() => _$SourceRefToJson(this);
}

///Kind of the referent.
enum SourceRefKind {
  @JsonValue('GitRepository')
  GIT_REPOSITORY,
}

final sourceRefKindValues = EnumValues({
  'GitRepository': SourceRefKind.GIT_REPOSITORY,
});

@JsonSerializable()
class Update {
  ///Path to the directory containing the manifests to be updated.
  ///Defaults to 'None', which translates to the root path
  ///of the GitRepositoryRef.
  @JsonKey(name: 'path')
  String? path;

  ///Strategy names the strategy to be used.
  @JsonKey(name: 'strategy')
  Strategy? strategy;

  Update({this.path, this.strategy});

  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

///Strategy names the strategy to be used.
enum Strategy {
  @JsonValue('Setters')
  SETTERS,
}

final strategyValues = EnumValues({'Setters': Strategy.SETTERS});

@JsonSerializable()
class StatusClass {
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///LastAutomationRunTime records the last time the controller ran
  ///this automation through to completion (even if no updates were
  ///made).
  @JsonKey(name: 'lastAutomationRunTime')
  DateTime? lastAutomationRunTime;

  ///LastHandledReconcileAt holds the value of the most recent
  ///reconcile request value, so a change of the annotation value
  ///can be detected.
  @JsonKey(name: 'lastHandledReconcileAt')
  String? lastHandledReconcileAt;

  ///LastPushCommit records the SHA1 of the last commit made by the
  ///controller, for this automation object
  @JsonKey(name: 'lastPushCommit')
  String? lastPushCommit;

  ///LastPushTime records the time of the last pushed change.
  @JsonKey(name: 'lastPushTime')
  DateTime? lastPushTime;
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///ObservedPolicies is the list of observed ImagePolicies that were
  ///considered by the ImageUpdateAutomation update process.
  @JsonKey(name: 'observedPolicies')
  Map<String, ObservedPolicy?>? observedPolicies;

  ///ObservedPolicies []ObservedPolicy `json:"observedPolicies,omitempty"`
  ///ObservedSourceRevision is the last observed source revision. This can be
  ///used to determine if the source has been updated since last observation.
  @JsonKey(name: 'observedSourceRevision')
  String? observedSourceRevision;

  StatusClass({
    this.conditions,
    this.lastAutomationRunTime,
    this.lastHandledReconcileAt,
    this.lastPushCommit,
    this.lastPushTime,
    this.observedGeneration,
    this.observedPolicies,
    this.observedSourceRevision,
  });

  factory StatusClass.fromJson(Map<String, dynamic> json) =>
      _$StatusClassFromJson(json);

  Map<String, dynamic> toJson() => _$StatusClassToJson(this);
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
class ObservedPolicy {
  ///Digest is the image's digest.
  @JsonKey(name: 'digest')
  String? digest;

  ///Name is the bare image's name.
  @JsonKey(name: 'name')
  String name;

  ///Tag is the image's tag.
  @JsonKey(name: 'tag')
  String tag;

  ObservedPolicy({this.digest, required this.name, required this.tag});

  factory ObservedPolicy.fromJson(Map<String, dynamic> json) =>
      _$ObservedPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ObservedPolicyToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ImageupdateautomationlistImageV1Kind {
  @JsonValue('ImageUpdateAutomationList')
  IMAGE_UPDATE_AUTOMATION_LIST,
}

final imageupdateautomationlistImageV1KindValues = EnumValues({
  'ImageUpdateAutomationList':
      ImageupdateautomationlistImageV1Kind.IMAGE_UPDATE_AUTOMATION_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ImageupdateautomationlistImageV1Metadata {
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

  ImageupdateautomationlistImageV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ImageupdateautomationlistImageV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ImageupdateautomationlistImageV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ImageupdateautomationlistImageV1MetadataToJson(this);
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
