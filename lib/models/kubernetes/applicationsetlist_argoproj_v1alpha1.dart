import 'package:json_annotation/json_annotation.dart';

part 'applicationsetlist_argoproj_v1alpha1.g.dart';

///ApplicationSetList is a list of ApplicationSet
@JsonSerializable()
class ApplicationsetlistArgoprojV1Alpha1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of applicationsets. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ApplicationsetlistArgoprojV1Alpha1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ApplicationsetlistArgoprojV1Alpha1Metadata? metadata;

  ApplicationsetlistArgoprojV1Alpha1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ApplicationsetlistArgoprojV1Alpha1.fromJson(
    Map<String, dynamic> json,
  ) => _$ApplicationsetlistArgoprojV1Alpha1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApplicationsetlistArgoprojV1Alpha1ToJson(this);
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
  @JsonKey(name: 'spec')
  ItemSpec spec;
  @JsonKey(name: 'status')
  Status? status;

  Item({
    this.apiVersion,
    this.kind,
    required this.metadata,
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
  @JsonValue('ApplicationSet')
  APPLICATION_SET,
}

final itemKindValues = EnumValues({'ApplicationSet': ItemKind.APPLICATION_SET});

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
class ItemSpec {
  @JsonKey(name: 'applyNestedSelectors')
  bool? applyNestedSelectors;
  @JsonKey(name: 'generators')
  List<SpecGenerator?> generators;
  @JsonKey(name: 'goTemplate')
  bool? goTemplate;
  @JsonKey(name: 'goTemplateOptions')
  List<String?>? goTemplateOptions;
  @JsonKey(name: 'ignoreApplicationDifferences')
  List<IgnoreApplicationDifference?>? ignoreApplicationDifferences;
  @JsonKey(name: 'preservedFields')
  PreservedFields? preservedFields;
  @JsonKey(name: 'strategy')
  Strategy? strategy;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy11? syncPolicy;
  @JsonKey(name: 'template')
  SpecTemplate template;
  @JsonKey(name: 'templatePatch')
  String? templatePatch;

  ItemSpec({
    this.applyNestedSelectors,
    required this.generators,
    this.goTemplate,
    this.goTemplateOptions,
    this.ignoreApplicationDifferences,
    this.preservedFields,
    this.strategy,
    this.syncPolicy,
    required this.template,
    this.templatePatch,
  });

  factory ItemSpec.fromJson(Map<String, dynamic> json) =>
      _$ItemSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSpecToJson(this);
}

@JsonSerializable()
class SpecGenerator {
  @JsonKey(name: 'clusterDecisionResource')
  PurpleClusterDecisionResource? clusterDecisionResource;
  @JsonKey(name: 'clusters')
  PurpleClusters? clusters;
  @JsonKey(name: 'git')
  PurpleGit? git;
  @JsonKey(name: 'list')
  PurpleList? list;
  @JsonKey(name: 'matrix')
  Matrix? matrix;
  @JsonKey(name: 'merge')
  Merge? merge;
  @JsonKey(name: 'plugin')
  Plugin30? plugin;
  @JsonKey(name: 'pullRequest')
  TentacledPullRequest? pullRequest;
  @JsonKey(name: 'scmProvider')
  TentacledScmProvider? scmProvider;
  @JsonKey(name: 'selector')
  IndecentSelector? selector;

  SpecGenerator({
    this.clusterDecisionResource,
    this.clusters,
    this.git,
    this.list,
    this.matrix,
    this.merge,
    this.plugin,
    this.pullRequest,
    this.scmProvider,
    this.selector,
  });

  factory SpecGenerator.fromJson(Map<String, dynamic> json) =>
      _$SpecGeneratorFromJson(json);

  Map<String, dynamic> toJson() => _$SpecGeneratorToJson(this);
}

@JsonSerializable()
class PurpleClusterDecisionResource {
  @JsonKey(name: 'configMapRef')
  String configMapRef;
  @JsonKey(name: 'labelSelector')
  PurpleLabelSelector? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  PurpleTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  PurpleClusterDecisionResource({
    required this.configMapRef,
    this.labelSelector,
    this.name,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory PurpleClusterDecisionResource.fromJson(Map<String, dynamic> json) =>
      _$PurpleClusterDecisionResourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleClusterDecisionResourceToJson(this);
}

@JsonSerializable()
class PurpleLabelSelector {
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleLabelSelector({this.matchExpressions, this.matchLabels});

  factory PurpleLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleLabelSelectorToJson(this);
}

@JsonSerializable()
class PurpleMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class PurpleTemplate {
  @JsonKey(name: 'metadata')
  PurpleMetadata metadata;
  @JsonKey(name: 'spec')
  PurpleSpec spec;

  PurpleTemplate({required this.metadata, required this.spec});

  factory PurpleTemplate.fromJson(Map<String, dynamic> json) =>
      _$PurpleTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTemplateToJson(this);
}

@JsonSerializable()
class PurpleMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  PurpleMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory PurpleMetadata.fromJson(Map<String, dynamic> json) =>
      _$PurpleMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMetadataToJson(this);
}

@JsonSerializable()
class PurpleSpec {
  @JsonKey(name: 'destination')
  PurpleDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<PurpleIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<PurpleInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  PurpleSource? source;
  @JsonKey(name: 'sourceHydrator')
  PurpleSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<FluffySource?>? sources;
  @JsonKey(name: 'syncPolicy')
  PurpleSyncPolicy? syncPolicy;

  PurpleSpec({
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

  factory PurpleSpec.fromJson(Map<String, dynamic> json) =>
      _$PurpleSpecFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSpecToJson(this);
}

@JsonSerializable()
class PurpleDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  PurpleDestination({this.name, this.namespace, this.server});

  factory PurpleDestination.fromJson(Map<String, dynamic> json) =>
      _$PurpleDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleDestinationToJson(this);
}

@JsonSerializable()
class PurpleIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  PurpleIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory PurpleIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$PurpleIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleIgnoreDifferenceToJson(this);
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
class PurpleSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  PurpleDirectory? directory;
  @JsonKey(name: 'helm')
  PurpleHelm? helm;
  @JsonKey(name: 'kustomize')
  PurpleKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  PurplePlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  PurpleJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  PurpleDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory PurpleDirectory.fromJson(Map<String, dynamic> json) =>
      _$PurpleDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleDirectoryToJson(this);
}

@JsonSerializable()
class PurpleJsonnet {
  @JsonKey(name: 'extVars')
  List<PurpleExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<PurpleFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<PurpleParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  PurpleFileParameter({this.name, this.path});

  factory PurpleFileParameter.fromJson(Map<String, dynamic> json) =>
      _$PurpleFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFileParameterToJson(this);
}

@JsonSerializable()
class PurpleParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  PurpleParameter({this.forceString, this.name, this.value});

  factory PurpleParameter.fromJson(Map<String, dynamic> json) =>
      _$PurpleParameterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleParameterToJson(this);
}

@JsonSerializable()
class PurpleKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<PurplePatch?>? patches;
  @JsonKey(name: 'replicas')
  List<PurpleReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  PurpleReplica({required this.count, required this.name});

  factory PurpleReplica.fromJson(Map<String, dynamic> json) =>
      _$PurpleReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleReplicaToJson(this);
}

@JsonSerializable()
class PurplePlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  PurpleEnv({required this.name, required this.value});

  factory PurpleEnv.fromJson(Map<String, dynamic> json) =>
      _$PurpleEnvFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleEnvToJson(this);
}

@JsonSerializable()
class FluffyParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  FluffyParameter({this.array, this.map, this.name, this.string});

  factory FluffyParameter.fromJson(Map<String, dynamic> json) =>
      _$FluffyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyParameterToJson(this);
}

@JsonSerializable()
class PurpleSourceHydrator {
  @JsonKey(name: 'drySource')
  PurpleDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  PurpleHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  PurpleSyncSource syncSource;

  PurpleSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory PurpleSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$PurpleSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSourceHydratorToJson(this);
}

@JsonSerializable()
class PurpleDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  PurpleHydrateTo({required this.targetBranch});

  factory PurpleHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$PurpleHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleHydrateToToJson(this);
}

@JsonSerializable()
class PurpleSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  PurpleSyncSource({required this.path, required this.targetBranch});

  factory PurpleSyncSource.fromJson(Map<String, dynamic> json) =>
      _$PurpleSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSyncSourceToJson(this);
}

@JsonSerializable()
class FluffySource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  FluffyDirectory? directory;
  @JsonKey(name: 'helm')
  FluffyHelm? helm;
  @JsonKey(name: 'kustomize')
  FluffyKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  FluffyPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  FluffyJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  FluffyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory FluffyDirectory.fromJson(Map<String, dynamic> json) =>
      _$FluffyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyDirectoryToJson(this);
}

@JsonSerializable()
class FluffyJsonnet {
  @JsonKey(name: 'extVars')
  List<FluffyExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FluffyFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<TentacledParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FluffyFileParameter({this.name, this.path});

  factory FluffyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$FluffyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFileParameterToJson(this);
}

@JsonSerializable()
class TentacledParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  TentacledParameter({this.forceString, this.name, this.value});

  factory TentacledParameter.fromJson(Map<String, dynamic> json) =>
      _$TentacledParameterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledParameterToJson(this);
}

@JsonSerializable()
class FluffyKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<FluffyPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<FluffyReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  FluffyReplica({required this.count, required this.name});

  factory FluffyReplica.fromJson(Map<String, dynamic> json) =>
      _$FluffyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyReplicaToJson(this);
}

@JsonSerializable()
class FluffyPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FluffyEnv({required this.name, required this.value});

  factory FluffyEnv.fromJson(Map<String, dynamic> json) =>
      _$FluffyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyEnvToJson(this);
}

@JsonSerializable()
class StickyParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  StickyParameter({this.array, this.map, this.name, this.string});

  factory StickyParameter.fromJson(Map<String, dynamic> json) =>
      _$StickyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$StickyParameterToJson(this);
}

@JsonSerializable()
class PurpleSyncPolicy {
  @JsonKey(name: 'automated')
  PurpleAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  PurpleManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  PurpleRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  PurpleSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory PurpleSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$PurpleSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSyncPolicyToJson(this);
}

@JsonSerializable()
class PurpleAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  PurpleAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory PurpleAutomated.fromJson(Map<String, dynamic> json) =>
      _$PurpleAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAutomatedToJson(this);
}

@JsonSerializable()
class PurpleManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  PurpleManagedNamespaceMetadata({this.annotations, this.labels});

  factory PurpleManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$PurpleManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class PurpleRetry {
  @JsonKey(name: 'backoff')
  PurpleBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  PurpleRetry({this.backoff, this.limit, this.refresh});

  factory PurpleRetry.fromJson(Map<String, dynamic> json) =>
      _$PurpleRetryFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleRetryToJson(this);
}

@JsonSerializable()
class PurpleBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  PurpleBackoff({this.duration, this.factor, this.maxDuration});

  factory PurpleBackoff.fromJson(Map<String, dynamic> json) =>
      _$PurpleBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBackoffToJson(this);
}

@JsonSerializable()
class PurpleClusters {
  @JsonKey(name: 'flatList')
  bool? flatList;
  @JsonKey(name: 'selector')
  PurpleSelector? selector;
  @JsonKey(name: 'template')
  FluffyTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  PurpleClusters({this.flatList, this.selector, this.template, this.values});

  factory PurpleClusters.fromJson(Map<String, dynamic> json) =>
      _$PurpleClustersFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleClustersToJson(this);
}

@JsonSerializable()
class PurpleSelector {
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleSelector({this.matchExpressions, this.matchLabels});

  factory PurpleSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSelectorToJson(this);
}

@JsonSerializable()
class FluffyMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class FluffyTemplate {
  @JsonKey(name: 'metadata')
  FluffyMetadata metadata;
  @JsonKey(name: 'spec')
  FluffySpec spec;

  FluffyTemplate({required this.metadata, required this.spec});

  factory FluffyTemplate.fromJson(Map<String, dynamic> json) =>
      _$FluffyTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTemplateToJson(this);
}

@JsonSerializable()
class FluffyMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  FluffyMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory FluffyMetadata.fromJson(Map<String, dynamic> json) =>
      _$FluffyMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMetadataToJson(this);
}

@JsonSerializable()
class FluffySpec {
  @JsonKey(name: 'destination')
  FluffyDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<FluffyIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<FluffyInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  TentacledSource? source;
  @JsonKey(name: 'sourceHydrator')
  FluffySourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<StickySource?>? sources;
  @JsonKey(name: 'syncPolicy')
  FluffySyncPolicy? syncPolicy;

  FluffySpec({
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

  factory FluffySpec.fromJson(Map<String, dynamic> json) =>
      _$FluffySpecFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySpecToJson(this);
}

@JsonSerializable()
class FluffyDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  FluffyDestination({this.name, this.namespace, this.server});

  factory FluffyDestination.fromJson(Map<String, dynamic> json) =>
      _$FluffyDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyDestinationToJson(this);
}

@JsonSerializable()
class FluffyIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  FluffyIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory FluffyIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$FluffyIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyIgnoreDifferenceToJson(this);
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
class TentacledSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  TentacledDirectory? directory;
  @JsonKey(name: 'helm')
  TentacledHelm? helm;
  @JsonKey(name: 'kustomize')
  TentacledKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  TentacledPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  TentacledJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  TentacledDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory TentacledDirectory.fromJson(Map<String, dynamic> json) =>
      _$TentacledDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledDirectoryToJson(this);
}

@JsonSerializable()
class TentacledJsonnet {
  @JsonKey(name: 'extVars')
  List<TentacledExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<TentacledFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<IndigoParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  TentacledFileParameter({this.name, this.path});

  factory TentacledFileParameter.fromJson(Map<String, dynamic> json) =>
      _$TentacledFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFileParameterToJson(this);
}

@JsonSerializable()
class IndigoParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  IndigoParameter({this.forceString, this.name, this.value});

  factory IndigoParameter.fromJson(Map<String, dynamic> json) =>
      _$IndigoParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoParameterToJson(this);
}

@JsonSerializable()
class TentacledKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<TentacledPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<TentacledReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  TentacledReplica({required this.count, required this.name});

  factory TentacledReplica.fromJson(Map<String, dynamic> json) =>
      _$TentacledReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledReplicaToJson(this);
}

@JsonSerializable()
class TentacledPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  TentacledEnv({required this.name, required this.value});

  factory TentacledEnv.fromJson(Map<String, dynamic> json) =>
      _$TentacledEnvFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledEnvToJson(this);
}

@JsonSerializable()
class IndecentParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  IndecentParameter({this.array, this.map, this.name, this.string});

  factory IndecentParameter.fromJson(Map<String, dynamic> json) =>
      _$IndecentParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentParameterToJson(this);
}

@JsonSerializable()
class FluffySourceHydrator {
  @JsonKey(name: 'drySource')
  FluffyDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  FluffyHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  FluffySyncSource syncSource;

  FluffySourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory FluffySourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$FluffySourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySourceHydratorToJson(this);
}

@JsonSerializable()
class FluffyDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FluffyHydrateTo({required this.targetBranch});

  factory FluffyHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$FluffyHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyHydrateToToJson(this);
}

@JsonSerializable()
class FluffySyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FluffySyncSource({required this.path, required this.targetBranch});

  factory FluffySyncSource.fromJson(Map<String, dynamic> json) =>
      _$FluffySyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySyncSourceToJson(this);
}

@JsonSerializable()
class StickySource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  StickyDirectory? directory;
  @JsonKey(name: 'helm')
  StickyHelm? helm;
  @JsonKey(name: 'kustomize')
  StickyKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  StickyPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  StickyJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  StickyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory StickyDirectory.fromJson(Map<String, dynamic> json) =>
      _$StickyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$StickyDirectoryToJson(this);
}

@JsonSerializable()
class StickyJsonnet {
  @JsonKey(name: 'extVars')
  List<StickyExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<StickyFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<HilariousParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  StickyFileParameter({this.name, this.path});

  factory StickyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$StickyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$StickyFileParameterToJson(this);
}

@JsonSerializable()
class HilariousParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  HilariousParameter({this.forceString, this.name, this.value});

  factory HilariousParameter.fromJson(Map<String, dynamic> json) =>
      _$HilariousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousParameterToJson(this);
}

@JsonSerializable()
class StickyKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<StickyPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<StickyReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  StickyReplica({required this.count, required this.name});

  factory StickyReplica.fromJson(Map<String, dynamic> json) =>
      _$StickyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$StickyReplicaToJson(this);
}

@JsonSerializable()
class StickyPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  StickyEnv({required this.name, required this.value});

  factory StickyEnv.fromJson(Map<String, dynamic> json) =>
      _$StickyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$StickyEnvToJson(this);
}

@JsonSerializable()
class AmbitiousParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  AmbitiousParameter({this.array, this.map, this.name, this.string});

  factory AmbitiousParameter.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousParameterToJson(this);
}

@JsonSerializable()
class FluffySyncPolicy {
  @JsonKey(name: 'automated')
  FluffyAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  FluffyManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  FluffyRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  FluffySyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory FluffySyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$FluffySyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySyncPolicyToJson(this);
}

@JsonSerializable()
class FluffyAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  FluffyAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory FluffyAutomated.fromJson(Map<String, dynamic> json) =>
      _$FluffyAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAutomatedToJson(this);
}

@JsonSerializable()
class FluffyManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  FluffyManagedNamespaceMetadata({this.annotations, this.labels});

  factory FluffyManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$FluffyManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class FluffyRetry {
  @JsonKey(name: 'backoff')
  FluffyBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  FluffyRetry({this.backoff, this.limit, this.refresh});

  factory FluffyRetry.fromJson(Map<String, dynamic> json) =>
      _$FluffyRetryFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyRetryToJson(this);
}

@JsonSerializable()
class FluffyBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  FluffyBackoff({this.duration, this.factor, this.maxDuration});

  factory FluffyBackoff.fromJson(Map<String, dynamic> json) =>
      _$FluffyBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBackoffToJson(this);
}

@JsonSerializable()
class PurpleGit {
  @JsonKey(name: 'directories')
  List<IndigoDirectory?>? directories;
  @JsonKey(name: 'files')
  List<PurpleFile?>? files;
  @JsonKey(name: 'pathParamPrefix')
  String? pathParamPrefix;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'revision')
  String revision;
  @JsonKey(name: 'template')
  TentacledTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  PurpleGit({
    this.directories,
    this.files,
    this.pathParamPrefix,
    required this.repoUrl,
    this.requeueAfterSeconds,
    required this.revision,
    this.template,
    this.values,
  });

  factory PurpleGit.fromJson(Map<String, dynamic> json) =>
      _$PurpleGitFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleGitToJson(this);
}

@JsonSerializable()
class IndigoDirectory {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  IndigoDirectory({this.exclude, required this.path});

  factory IndigoDirectory.fromJson(Map<String, dynamic> json) =>
      _$IndigoDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoDirectoryToJson(this);
}

@JsonSerializable()
class PurpleFile {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  PurpleFile({this.exclude, required this.path});

  factory PurpleFile.fromJson(Map<String, dynamic> json) =>
      _$PurpleFileFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFileToJson(this);
}

@JsonSerializable()
class TentacledTemplate {
  @JsonKey(name: 'metadata')
  TentacledMetadata metadata;
  @JsonKey(name: 'spec')
  TentacledSpec spec;

  TentacledTemplate({required this.metadata, required this.spec});

  factory TentacledTemplate.fromJson(Map<String, dynamic> json) =>
      _$TentacledTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTemplateToJson(this);
}

@JsonSerializable()
class TentacledMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  TentacledMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory TentacledMetadata.fromJson(Map<String, dynamic> json) =>
      _$TentacledMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledMetadataToJson(this);
}

@JsonSerializable()
class TentacledSpec {
  @JsonKey(name: 'destination')
  TentacledDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<TentacledIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<TentacledInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  IndigoSource? source;
  @JsonKey(name: 'sourceHydrator')
  TentacledSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<IndecentSource?>? sources;
  @JsonKey(name: 'syncPolicy')
  TentacledSyncPolicy? syncPolicy;

  TentacledSpec({
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

  factory TentacledSpec.fromJson(Map<String, dynamic> json) =>
      _$TentacledSpecFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSpecToJson(this);
}

@JsonSerializable()
class TentacledDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  TentacledDestination({this.name, this.namespace, this.server});

  factory TentacledDestination.fromJson(Map<String, dynamic> json) =>
      _$TentacledDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledDestinationToJson(this);
}

@JsonSerializable()
class TentacledIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  TentacledIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory TentacledIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$TentacledIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class TentacledInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  TentacledInfo({required this.name, required this.value});

  factory TentacledInfo.fromJson(Map<String, dynamic> json) =>
      _$TentacledInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledInfoToJson(this);
}

@JsonSerializable()
class IndigoSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  IndecentDirectory? directory;
  @JsonKey(name: 'helm')
  IndigoHelm? helm;
  @JsonKey(name: 'kustomize')
  IndigoKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  IndigoPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class IndecentDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  IndigoJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  IndecentDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory IndecentDirectory.fromJson(Map<String, dynamic> json) =>
      _$IndecentDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentDirectoryToJson(this);
}

@JsonSerializable()
class IndigoJsonnet {
  @JsonKey(name: 'extVars')
  List<IndigoExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<IndigoFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<CunningParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  IndigoFileParameter({this.name, this.path});

  factory IndigoFileParameter.fromJson(Map<String, dynamic> json) =>
      _$IndigoFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoFileParameterToJson(this);
}

@JsonSerializable()
class CunningParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  CunningParameter({this.forceString, this.name, this.value});

  factory CunningParameter.fromJson(Map<String, dynamic> json) =>
      _$CunningParameterFromJson(json);

  Map<String, dynamic> toJson() => _$CunningParameterToJson(this);
}

@JsonSerializable()
class IndigoKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<IndigoPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<IndigoReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  IndigoReplica({required this.count, required this.name});

  factory IndigoReplica.fromJson(Map<String, dynamic> json) =>
      _$IndigoReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoReplicaToJson(this);
}

@JsonSerializable()
class IndigoPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndigoEnv({required this.name, required this.value});

  factory IndigoEnv.fromJson(Map<String, dynamic> json) =>
      _$IndigoEnvFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoEnvToJson(this);
}

@JsonSerializable()
class MagentaParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  MagentaParameter({this.array, this.map, this.name, this.string});

  factory MagentaParameter.fromJson(Map<String, dynamic> json) =>
      _$MagentaParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaParameterToJson(this);
}

@JsonSerializable()
class TentacledSourceHydrator {
  @JsonKey(name: 'drySource')
  TentacledDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  TentacledHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  TentacledSyncSource syncSource;

  TentacledSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory TentacledSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$TentacledSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSourceHydratorToJson(this);
}

@JsonSerializable()
class TentacledDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  TentacledHydrateTo({required this.targetBranch});

  factory TentacledHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$TentacledHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledHydrateToToJson(this);
}

@JsonSerializable()
class TentacledSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  TentacledSyncSource({required this.path, required this.targetBranch});

  factory TentacledSyncSource.fromJson(Map<String, dynamic> json) =>
      _$TentacledSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSyncSourceToJson(this);
}

@JsonSerializable()
class IndecentSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  HilariousDirectory? directory;
  @JsonKey(name: 'helm')
  IndecentHelm? helm;
  @JsonKey(name: 'kustomize')
  IndecentKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  IndecentPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class HilariousDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  IndecentJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  HilariousDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory HilariousDirectory.fromJson(Map<String, dynamic> json) =>
      _$HilariousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousDirectoryToJson(this);
}

@JsonSerializable()
class IndecentJsonnet {
  @JsonKey(name: 'extVars')
  List<IndecentExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<IndecentFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<FriskyParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  IndecentFileParameter({this.name, this.path});

  factory IndecentFileParameter.fromJson(Map<String, dynamic> json) =>
      _$IndecentFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentFileParameterToJson(this);
}

@JsonSerializable()
class FriskyParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  FriskyParameter({this.forceString, this.name, this.value});

  factory FriskyParameter.fromJson(Map<String, dynamic> json) =>
      _$FriskyParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyParameterToJson(this);
}

@JsonSerializable()
class IndecentKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<IndecentPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<IndecentReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  IndecentReplica({required this.count, required this.name});

  factory IndecentReplica.fromJson(Map<String, dynamic> json) =>
      _$IndecentReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentReplicaToJson(this);
}

@JsonSerializable()
class IndecentPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndecentEnv({required this.name, required this.value});

  factory IndecentEnv.fromJson(Map<String, dynamic> json) =>
      _$IndecentEnvFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentEnvToJson(this);
}

@JsonSerializable()
class MischievousParameter {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  MischievousParameter({this.array, this.map, this.name, this.string});

  factory MischievousParameter.fromJson(Map<String, dynamic> json) =>
      _$MischievousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousParameterToJson(this);
}

@JsonSerializable()
class TentacledSyncPolicy {
  @JsonKey(name: 'automated')
  TentacledAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  TentacledManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  TentacledRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  TentacledSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory TentacledSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$TentacledSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSyncPolicyToJson(this);
}

@JsonSerializable()
class TentacledAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  TentacledAutomated({
    this.allowEmpty,
    this.enabled,
    this.prune,
    this.selfHeal,
  });

  factory TentacledAutomated.fromJson(Map<String, dynamic> json) =>
      _$TentacledAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAutomatedToJson(this);
}

@JsonSerializable()
class TentacledManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  TentacledManagedNamespaceMetadata({this.annotations, this.labels});

  factory TentacledManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$TentacledManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TentacledManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class TentacledRetry {
  @JsonKey(name: 'backoff')
  TentacledBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  TentacledRetry({this.backoff, this.limit, this.refresh});

  factory TentacledRetry.fromJson(Map<String, dynamic> json) =>
      _$TentacledRetryFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledRetryToJson(this);
}

@JsonSerializable()
class TentacledBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  TentacledBackoff({this.duration, this.factor, this.maxDuration});

  factory TentacledBackoff.fromJson(Map<String, dynamic> json) =>
      _$TentacledBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBackoffToJson(this);
}

@JsonSerializable()
class PurpleList {
  @JsonKey(name: 'elements')
  List<dynamic>? elements;
  @JsonKey(name: 'elementsYaml')
  String? elementsYaml;
  @JsonKey(name: 'template')
  StickyTemplate? template;

  PurpleList({this.elements, this.elementsYaml, this.template});

  factory PurpleList.fromJson(Map<String, dynamic> json) =>
      _$PurpleListFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleListToJson(this);
}

@JsonSerializable()
class StickyTemplate {
  @JsonKey(name: 'metadata')
  StickyMetadata metadata;
  @JsonKey(name: 'spec')
  StickySpec spec;

  StickyTemplate({required this.metadata, required this.spec});

  factory StickyTemplate.fromJson(Map<String, dynamic> json) =>
      _$StickyTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$StickyTemplateToJson(this);
}

@JsonSerializable()
class StickyMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  StickyMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory StickyMetadata.fromJson(Map<String, dynamic> json) =>
      _$StickyMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$StickyMetadataToJson(this);
}

@JsonSerializable()
class StickySpec {
  @JsonKey(name: 'destination')
  StickyDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<StickyIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<StickyInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  HilariousSource? source;
  @JsonKey(name: 'sourceHydrator')
  StickySourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<AmbitiousSource?>? sources;
  @JsonKey(name: 'syncPolicy')
  StickySyncPolicy? syncPolicy;

  StickySpec({
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

  factory StickySpec.fromJson(Map<String, dynamic> json) =>
      _$StickySpecFromJson(json);

  Map<String, dynamic> toJson() => _$StickySpecToJson(this);
}

@JsonSerializable()
class StickyDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  StickyDestination({this.name, this.namespace, this.server});

  factory StickyDestination.fromJson(Map<String, dynamic> json) =>
      _$StickyDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$StickyDestinationToJson(this);
}

@JsonSerializable()
class StickyIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  StickyIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory StickyIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$StickyIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$StickyIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class StickyInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  StickyInfo({required this.name, required this.value});

  factory StickyInfo.fromJson(Map<String, dynamic> json) =>
      _$StickyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StickyInfoToJson(this);
}

@JsonSerializable()
class HilariousSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  AmbitiousDirectory? directory;
  @JsonKey(name: 'helm')
  HilariousHelm? helm;
  @JsonKey(name: 'kustomize')
  HilariousKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  HilariousPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class AmbitiousDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  HilariousJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  AmbitiousDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory AmbitiousDirectory.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousDirectoryToJson(this);
}

@JsonSerializable()
class HilariousJsonnet {
  @JsonKey(name: 'extVars')
  List<HilariousExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<HilariousFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<BraggadociousParameter?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  HilariousFileParameter({this.name, this.path});

  factory HilariousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$HilariousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousFileParameterToJson(this);
}

@JsonSerializable()
class BraggadociousParameter {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  BraggadociousParameter({this.forceString, this.name, this.value});

  factory BraggadociousParameter.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousParameterToJson(this);
}

@JsonSerializable()
class HilariousKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<HilariousPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<HilariousReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  HilariousReplica({required this.count, required this.name});

  factory HilariousReplica.fromJson(Map<String, dynamic> json) =>
      _$HilariousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousReplicaToJson(this);
}

@JsonSerializable()
class HilariousPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  HilariousEnv({required this.name, required this.value});

  factory HilariousEnv.fromJson(Map<String, dynamic> json) =>
      _$HilariousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousEnvToJson(this);
}

@JsonSerializable()
class Parameter1 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter1({this.array, this.map, this.name, this.string});

  factory Parameter1.fromJson(Map<String, dynamic> json) =>
      _$Parameter1FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter1ToJson(this);
}

@JsonSerializable()
class StickySourceHydrator {
  @JsonKey(name: 'drySource')
  StickyDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  StickyHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  StickySyncSource syncSource;

  StickySourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory StickySourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$StickySourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$StickySourceHydratorToJson(this);
}

@JsonSerializable()
class StickyDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  StickyDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory StickyDrySource.fromJson(Map<String, dynamic> json) =>
      _$StickyDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$StickyDrySourceToJson(this);
}

@JsonSerializable()
class StickyHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  StickyHydrateTo({required this.targetBranch});

  factory StickyHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$StickyHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$StickyHydrateToToJson(this);
}

@JsonSerializable()
class StickySyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  StickySyncSource({required this.path, required this.targetBranch});

  factory StickySyncSource.fromJson(Map<String, dynamic> json) =>
      _$StickySyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$StickySyncSourceToJson(this);
}

@JsonSerializable()
class AmbitiousSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  CunningDirectory? directory;
  @JsonKey(name: 'helm')
  AmbitiousHelm? helm;
  @JsonKey(name: 'kustomize')
  AmbitiousKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  AmbitiousPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class CunningDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  AmbitiousJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  CunningDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory CunningDirectory.fromJson(Map<String, dynamic> json) =>
      _$CunningDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$CunningDirectoryToJson(this);
}

@JsonSerializable()
class AmbitiousJsonnet {
  @JsonKey(name: 'extVars')
  List<AmbitiousExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<AmbitiousFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter2?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  AmbitiousFileParameter({this.name, this.path});

  factory AmbitiousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousFileParameterToJson(this);
}

@JsonSerializable()
class Parameter2 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter2({this.forceString, this.name, this.value});

  factory Parameter2.fromJson(Map<String, dynamic> json) =>
      _$Parameter2FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter2ToJson(this);
}

@JsonSerializable()
class AmbitiousKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<AmbitiousPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<AmbitiousReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  AmbitiousReplica({required this.count, required this.name});

  factory AmbitiousReplica.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousReplicaToJson(this);
}

@JsonSerializable()
class AmbitiousPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  AmbitiousEnv({required this.name, required this.value});

  factory AmbitiousEnv.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousEnvToJson(this);
}

@JsonSerializable()
class Parameter3 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter3({this.array, this.map, this.name, this.string});

  factory Parameter3.fromJson(Map<String, dynamic> json) =>
      _$Parameter3FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter3ToJson(this);
}

@JsonSerializable()
class StickySyncPolicy {
  @JsonKey(name: 'automated')
  StickyAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  StickyManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  StickyRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  StickySyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory StickySyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$StickySyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$StickySyncPolicyToJson(this);
}

@JsonSerializable()
class StickyAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  StickyAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory StickyAutomated.fromJson(Map<String, dynamic> json) =>
      _$StickyAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$StickyAutomatedToJson(this);
}

@JsonSerializable()
class StickyManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  StickyManagedNamespaceMetadata({this.annotations, this.labels});

  factory StickyManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$StickyManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$StickyManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class StickyRetry {
  @JsonKey(name: 'backoff')
  StickyBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  StickyRetry({this.backoff, this.limit, this.refresh});

  factory StickyRetry.fromJson(Map<String, dynamic> json) =>
      _$StickyRetryFromJson(json);

  Map<String, dynamic> toJson() => _$StickyRetryToJson(this);
}

@JsonSerializable()
class StickyBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  StickyBackoff({this.duration, this.factor, this.maxDuration});

  factory StickyBackoff.fromJson(Map<String, dynamic> json) =>
      _$StickyBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$StickyBackoffToJson(this);
}

@JsonSerializable()
class Matrix {
  @JsonKey(name: 'generators')
  List<MatrixGenerator?> generators;
  @JsonKey(name: 'template')
  MatrixTemplate? template;

  Matrix({required this.generators, this.template});

  factory Matrix.fromJson(Map<String, dynamic> json) => _$MatrixFromJson(json);

  Map<String, dynamic> toJson() => _$MatrixToJson(this);
}

@JsonSerializable()
class MatrixGenerator {
  @JsonKey(name: 'clusterDecisionResource')
  FluffyClusterDecisionResource? clusterDecisionResource;
  @JsonKey(name: 'clusters')
  FluffyClusters? clusters;
  @JsonKey(name: 'git')
  FluffyGit? git;
  @JsonKey(name: 'list')
  FluffyList? list;
  @JsonKey(name: 'matrix')
  dynamic matrix;
  @JsonKey(name: 'merge')
  dynamic merge;
  @JsonKey(name: 'plugin')
  Plugin4? plugin;
  @JsonKey(name: 'pullRequest')
  PurplePullRequest? pullRequest;
  @JsonKey(name: 'scmProvider')
  PurpleScmProvider? scmProvider;
  @JsonKey(name: 'selector')
  TentacledSelector? selector;

  MatrixGenerator({
    this.clusterDecisionResource,
    this.clusters,
    this.git,
    this.list,
    this.matrix,
    this.merge,
    this.plugin,
    this.pullRequest,
    this.scmProvider,
    this.selector,
  });

  factory MatrixGenerator.fromJson(Map<String, dynamic> json) =>
      _$MatrixGeneratorFromJson(json);

  Map<String, dynamic> toJson() => _$MatrixGeneratorToJson(this);
}

@JsonSerializable()
class FluffyClusterDecisionResource {
  @JsonKey(name: 'configMapRef')
  String configMapRef;
  @JsonKey(name: 'labelSelector')
  FluffyLabelSelector? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  IndigoTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  FluffyClusterDecisionResource({
    required this.configMapRef,
    this.labelSelector,
    this.name,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory FluffyClusterDecisionResource.fromJson(Map<String, dynamic> json) =>
      _$FluffyClusterDecisionResourceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyClusterDecisionResourceToJson(this);
}

@JsonSerializable()
class FluffyLabelSelector {
  @JsonKey(name: 'matchExpressions')
  List<TentacledMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffyLabelSelector({this.matchExpressions, this.matchLabels});

  factory FluffyLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$FluffyLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyLabelSelectorToJson(this);
}

@JsonSerializable()
class TentacledMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class IndigoTemplate {
  @JsonKey(name: 'metadata')
  IndigoMetadata metadata;
  @JsonKey(name: 'spec')
  IndigoSpec spec;

  IndigoTemplate({required this.metadata, required this.spec});

  factory IndigoTemplate.fromJson(Map<String, dynamic> json) =>
      _$IndigoTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoTemplateToJson(this);
}

@JsonSerializable()
class IndigoMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IndigoMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory IndigoMetadata.fromJson(Map<String, dynamic> json) =>
      _$IndigoMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoMetadataToJson(this);
}

@JsonSerializable()
class IndigoSpec {
  @JsonKey(name: 'destination')
  IndigoDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IndigoIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<IndigoInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  CunningSource? source;
  @JsonKey(name: 'sourceHydrator')
  IndigoSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<MagentaSource?>? sources;
  @JsonKey(name: 'syncPolicy')
  IndigoSyncPolicy? syncPolicy;

  IndigoSpec({
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

  factory IndigoSpec.fromJson(Map<String, dynamic> json) =>
      _$IndigoSpecFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSpecToJson(this);
}

@JsonSerializable()
class IndigoDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  IndigoDestination({this.name, this.namespace, this.server});

  factory IndigoDestination.fromJson(Map<String, dynamic> json) =>
      _$IndigoDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoDestinationToJson(this);
}

@JsonSerializable()
class IndigoIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IndigoIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IndigoIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$IndigoIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class IndigoInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndigoInfo({required this.name, required this.value});

  factory IndigoInfo.fromJson(Map<String, dynamic> json) =>
      _$IndigoInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoInfoToJson(this);
}

@JsonSerializable()
class CunningSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  MagentaDirectory? directory;
  @JsonKey(name: 'helm')
  CunningHelm? helm;
  @JsonKey(name: 'kustomize')
  CunningKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  CunningPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class MagentaDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  CunningJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  MagentaDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory MagentaDirectory.fromJson(Map<String, dynamic> json) =>
      _$MagentaDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaDirectoryToJson(this);
}

@JsonSerializable()
class CunningJsonnet {
  @JsonKey(name: 'extVars')
  List<CunningExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<CunningFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter4?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  CunningFileParameter({this.name, this.path});

  factory CunningFileParameter.fromJson(Map<String, dynamic> json) =>
      _$CunningFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$CunningFileParameterToJson(this);
}

@JsonSerializable()
class Parameter4 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter4({this.forceString, this.name, this.value});

  factory Parameter4.fromJson(Map<String, dynamic> json) =>
      _$Parameter4FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter4ToJson(this);
}

@JsonSerializable()
class CunningKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<CunningPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<CunningReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  CunningReplica({required this.count, required this.name});

  factory CunningReplica.fromJson(Map<String, dynamic> json) =>
      _$CunningReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$CunningReplicaToJson(this);
}

@JsonSerializable()
class CunningPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  CunningEnv({required this.name, required this.value});

  factory CunningEnv.fromJson(Map<String, dynamic> json) =>
      _$CunningEnvFromJson(json);

  Map<String, dynamic> toJson() => _$CunningEnvToJson(this);
}

@JsonSerializable()
class Parameter5 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter5({this.array, this.map, this.name, this.string});

  factory Parameter5.fromJson(Map<String, dynamic> json) =>
      _$Parameter5FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter5ToJson(this);
}

@JsonSerializable()
class IndigoSourceHydrator {
  @JsonKey(name: 'drySource')
  IndigoDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  IndigoHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  IndigoSyncSource syncSource;

  IndigoSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory IndigoSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$IndigoSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSourceHydratorToJson(this);
}

@JsonSerializable()
class IndigoDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  IndigoDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory IndigoDrySource.fromJson(Map<String, dynamic> json) =>
      _$IndigoDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoDrySourceToJson(this);
}

@JsonSerializable()
class IndigoHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  IndigoHydrateTo({required this.targetBranch});

  factory IndigoHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$IndigoHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoHydrateToToJson(this);
}

@JsonSerializable()
class IndigoSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  IndigoSyncSource({required this.path, required this.targetBranch});

  factory IndigoSyncSource.fromJson(Map<String, dynamic> json) =>
      _$IndigoSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSyncSourceToJson(this);
}

@JsonSerializable()
class MagentaSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  FriskyDirectory? directory;
  @JsonKey(name: 'helm')
  MagentaHelm? helm;
  @JsonKey(name: 'kustomize')
  MagentaKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  MagentaPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class FriskyDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  MagentaJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  FriskyDirectory({this.exclude, this.include, this.jsonnet, this.recurse});

  factory FriskyDirectory.fromJson(Map<String, dynamic> json) =>
      _$FriskyDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyDirectoryToJson(this);
}

@JsonSerializable()
class MagentaJsonnet {
  @JsonKey(name: 'extVars')
  List<MagentaExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<MagentaFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter6?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  MagentaFileParameter({this.name, this.path});

  factory MagentaFileParameter.fromJson(Map<String, dynamic> json) =>
      _$MagentaFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaFileParameterToJson(this);
}

@JsonSerializable()
class Parameter6 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter6({this.forceString, this.name, this.value});

  factory Parameter6.fromJson(Map<String, dynamic> json) =>
      _$Parameter6FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter6ToJson(this);
}

@JsonSerializable()
class MagentaKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<MagentaPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<MagentaReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  MagentaReplica({required this.count, required this.name});

  factory MagentaReplica.fromJson(Map<String, dynamic> json) =>
      _$MagentaReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaReplicaToJson(this);
}

@JsonSerializable()
class MagentaPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MagentaEnv({required this.name, required this.value});

  factory MagentaEnv.fromJson(Map<String, dynamic> json) =>
      _$MagentaEnvFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaEnvToJson(this);
}

@JsonSerializable()
class Parameter7 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter7({this.array, this.map, this.name, this.string});

  factory Parameter7.fromJson(Map<String, dynamic> json) =>
      _$Parameter7FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter7ToJson(this);
}

@JsonSerializable()
class IndigoSyncPolicy {
  @JsonKey(name: 'automated')
  IndigoAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  IndigoManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  IndigoRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  IndigoSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory IndigoSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$IndigoSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSyncPolicyToJson(this);
}

@JsonSerializable()
class IndigoAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  IndigoAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory IndigoAutomated.fromJson(Map<String, dynamic> json) =>
      _$IndigoAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoAutomatedToJson(this);
}

@JsonSerializable()
class IndigoManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  IndigoManagedNamespaceMetadata({this.annotations, this.labels});

  factory IndigoManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$IndigoManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class IndigoRetry {
  @JsonKey(name: 'backoff')
  IndigoBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  IndigoRetry({this.backoff, this.limit, this.refresh});

  factory IndigoRetry.fromJson(Map<String, dynamic> json) =>
      _$IndigoRetryFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoRetryToJson(this);
}

@JsonSerializable()
class IndigoBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  IndigoBackoff({this.duration, this.factor, this.maxDuration});

  factory IndigoBackoff.fromJson(Map<String, dynamic> json) =>
      _$IndigoBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoBackoffToJson(this);
}

@JsonSerializable()
class FluffyClusters {
  @JsonKey(name: 'flatList')
  bool? flatList;
  @JsonKey(name: 'selector')
  FluffySelector? selector;
  @JsonKey(name: 'template')
  IndecentTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  FluffyClusters({this.flatList, this.selector, this.template, this.values});

  factory FluffyClusters.fromJson(Map<String, dynamic> json) =>
      _$FluffyClustersFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyClustersToJson(this);
}

@JsonSerializable()
class FluffySelector {
  @JsonKey(name: 'matchExpressions')
  List<StickyMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffySelector({this.matchExpressions, this.matchLabels});

  factory FluffySelector.fromJson(Map<String, dynamic> json) =>
      _$FluffySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySelectorToJson(this);
}

@JsonSerializable()
class StickyMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class IndecentTemplate {
  @JsonKey(name: 'metadata')
  IndecentMetadata metadata;
  @JsonKey(name: 'spec')
  IndecentSpec spec;

  IndecentTemplate({required this.metadata, required this.spec});

  factory IndecentTemplate.fromJson(Map<String, dynamic> json) =>
      _$IndecentTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentTemplateToJson(this);
}

@JsonSerializable()
class IndecentMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IndecentMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory IndecentMetadata.fromJson(Map<String, dynamic> json) =>
      _$IndecentMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentMetadataToJson(this);
}

@JsonSerializable()
class IndecentSpec {
  @JsonKey(name: 'destination')
  IndecentDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IndecentIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<IndecentInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  FriskySource? source;
  @JsonKey(name: 'sourceHydrator')
  IndecentSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<MischievousSource?>? sources;
  @JsonKey(name: 'syncPolicy')
  IndecentSyncPolicy? syncPolicy;

  IndecentSpec({
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

  factory IndecentSpec.fromJson(Map<String, dynamic> json) =>
      _$IndecentSpecFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSpecToJson(this);
}

@JsonSerializable()
class IndecentDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  IndecentDestination({this.name, this.namespace, this.server});

  factory IndecentDestination.fromJson(Map<String, dynamic> json) =>
      _$IndecentDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentDestinationToJson(this);
}

@JsonSerializable()
class IndecentIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IndecentIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IndecentIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$IndecentIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class IndecentInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  IndecentInfo({required this.name, required this.value});

  factory IndecentInfo.fromJson(Map<String, dynamic> json) =>
      _$IndecentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentInfoToJson(this);
}

@JsonSerializable()
class FriskySource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  MischievousDirectory? directory;
  @JsonKey(name: 'helm')
  FriskyHelm? helm;
  @JsonKey(name: 'kustomize')
  FriskyKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  FriskyPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class MischievousDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  FriskyJsonnet? jsonnet;
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
class FriskyJsonnet {
  @JsonKey(name: 'extVars')
  List<FriskyExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FriskyFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter8?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FriskyFileParameter({this.name, this.path});

  factory FriskyFileParameter.fromJson(Map<String, dynamic> json) =>
      _$FriskyFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyFileParameterToJson(this);
}

@JsonSerializable()
class Parameter8 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter8({this.forceString, this.name, this.value});

  factory Parameter8.fromJson(Map<String, dynamic> json) =>
      _$Parameter8FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter8ToJson(this);
}

@JsonSerializable()
class FriskyKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<FriskyPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<FriskyReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  FriskyReplica({required this.count, required this.name});

  factory FriskyReplica.fromJson(Map<String, dynamic> json) =>
      _$FriskyReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyReplicaToJson(this);
}

@JsonSerializable()
class FriskyPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FriskyEnv({required this.name, required this.value});

  factory FriskyEnv.fromJson(Map<String, dynamic> json) =>
      _$FriskyEnvFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyEnvToJson(this);
}

@JsonSerializable()
class Parameter9 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter9({this.array, this.map, this.name, this.string});

  factory Parameter9.fromJson(Map<String, dynamic> json) =>
      _$Parameter9FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter9ToJson(this);
}

@JsonSerializable()
class IndecentSourceHydrator {
  @JsonKey(name: 'drySource')
  IndecentDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  IndecentHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  IndecentSyncSource syncSource;

  IndecentSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory IndecentSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$IndecentSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSourceHydratorToJson(this);
}

@JsonSerializable()
class IndecentDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  IndecentDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory IndecentDrySource.fromJson(Map<String, dynamic> json) =>
      _$IndecentDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentDrySourceToJson(this);
}

@JsonSerializable()
class IndecentHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  IndecentHydrateTo({required this.targetBranch});

  factory IndecentHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$IndecentHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentHydrateToToJson(this);
}

@JsonSerializable()
class IndecentSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  IndecentSyncSource({required this.path, required this.targetBranch});

  factory IndecentSyncSource.fromJson(Map<String, dynamic> json) =>
      _$IndecentSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSyncSourceToJson(this);
}

@JsonSerializable()
class MischievousSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  BraggadociousDirectory? directory;
  @JsonKey(name: 'helm')
  MischievousHelm? helm;
  @JsonKey(name: 'kustomize')
  MischievousKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  MischievousPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
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
class BraggadociousDirectory {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  MischievousJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  BraggadociousDirectory({
    this.exclude,
    this.include,
    this.jsonnet,
    this.recurse,
  });

  factory BraggadociousDirectory.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousDirectoryFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousDirectoryToJson(this);
}

@JsonSerializable()
class MischievousJsonnet {
  @JsonKey(name: 'extVars')
  List<MischievousExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
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
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<MischievousFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter10?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
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
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  MischievousFileParameter({this.name, this.path});

  factory MischievousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$MischievousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousFileParameterToJson(this);
}

@JsonSerializable()
class Parameter10 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter10({this.forceString, this.name, this.value});

  factory Parameter10.fromJson(Map<String, dynamic> json) =>
      _$Parameter10FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter10ToJson(this);
}

@JsonSerializable()
class MischievousKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<MischievousPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<MischievousReplica?>? replicas;
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
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  MischievousReplica({required this.count, required this.name});

  factory MischievousReplica.fromJson(Map<String, dynamic> json) =>
      _$MischievousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousReplicaToJson(this);
}

@JsonSerializable()
class MischievousPlugin {
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
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MischievousEnv({required this.name, required this.value});

  factory MischievousEnv.fromJson(Map<String, dynamic> json) =>
      _$MischievousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousEnvToJson(this);
}

@JsonSerializable()
class Parameter11 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter11({this.array, this.map, this.name, this.string});

  factory Parameter11.fromJson(Map<String, dynamic> json) =>
      _$Parameter11FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter11ToJson(this);
}

@JsonSerializable()
class IndecentSyncPolicy {
  @JsonKey(name: 'automated')
  IndecentAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  IndecentManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  IndecentRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  IndecentSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory IndecentSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$IndecentSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSyncPolicyToJson(this);
}

@JsonSerializable()
class IndecentAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  IndecentAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory IndecentAutomated.fromJson(Map<String, dynamic> json) =>
      _$IndecentAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentAutomatedToJson(this);
}

@JsonSerializable()
class IndecentManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  IndecentManagedNamespaceMetadata({this.annotations, this.labels});

  factory IndecentManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$IndecentManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IndecentManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class IndecentRetry {
  @JsonKey(name: 'backoff')
  IndecentBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  IndecentRetry({this.backoff, this.limit, this.refresh});

  factory IndecentRetry.fromJson(Map<String, dynamic> json) =>
      _$IndecentRetryFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentRetryToJson(this);
}

@JsonSerializable()
class IndecentBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  IndecentBackoff({this.duration, this.factor, this.maxDuration});

  factory IndecentBackoff.fromJson(Map<String, dynamic> json) =>
      _$IndecentBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentBackoffToJson(this);
}

@JsonSerializable()
class FluffyGit {
  @JsonKey(name: 'directories')
  List<Directory1?>? directories;
  @JsonKey(name: 'files')
  List<FluffyFile?>? files;
  @JsonKey(name: 'pathParamPrefix')
  String? pathParamPrefix;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'revision')
  String revision;
  @JsonKey(name: 'template')
  HilariousTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  FluffyGit({
    this.directories,
    this.files,
    this.pathParamPrefix,
    required this.repoUrl,
    this.requeueAfterSeconds,
    required this.revision,
    this.template,
    this.values,
  });

  factory FluffyGit.fromJson(Map<String, dynamic> json) =>
      _$FluffyGitFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyGitToJson(this);
}

@JsonSerializable()
class Directory1 {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  Directory1({this.exclude, required this.path});

  factory Directory1.fromJson(Map<String, dynamic> json) =>
      _$Directory1FromJson(json);

  Map<String, dynamic> toJson() => _$Directory1ToJson(this);
}

@JsonSerializable()
class FluffyFile {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  FluffyFile({this.exclude, required this.path});

  factory FluffyFile.fromJson(Map<String, dynamic> json) =>
      _$FluffyFileFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFileToJson(this);
}

@JsonSerializable()
class HilariousTemplate {
  @JsonKey(name: 'metadata')
  HilariousMetadata metadata;
  @JsonKey(name: 'spec')
  HilariousSpec spec;

  HilariousTemplate({required this.metadata, required this.spec});

  factory HilariousTemplate.fromJson(Map<String, dynamic> json) =>
      _$HilariousTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousTemplateToJson(this);
}

@JsonSerializable()
class HilariousMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  HilariousMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory HilariousMetadata.fromJson(Map<String, dynamic> json) =>
      _$HilariousMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousMetadataToJson(this);
}

@JsonSerializable()
class HilariousSpec {
  @JsonKey(name: 'destination')
  HilariousDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<HilariousIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<HilariousInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  BraggadociousSource? source;
  @JsonKey(name: 'sourceHydrator')
  HilariousSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source1?>? sources;
  @JsonKey(name: 'syncPolicy')
  HilariousSyncPolicy? syncPolicy;

  HilariousSpec({
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

  factory HilariousSpec.fromJson(Map<String, dynamic> json) =>
      _$HilariousSpecFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousSpecToJson(this);
}

@JsonSerializable()
class HilariousDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  HilariousDestination({this.name, this.namespace, this.server});

  factory HilariousDestination.fromJson(Map<String, dynamic> json) =>
      _$HilariousDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousDestinationToJson(this);
}

@JsonSerializable()
class HilariousIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  HilariousIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory HilariousIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$HilariousIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class HilariousInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  HilariousInfo({required this.name, required this.value});

  factory HilariousInfo.fromJson(Map<String, dynamic> json) =>
      _$HilariousInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousInfoToJson(this);
}

@JsonSerializable()
class BraggadociousSource {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory2? directory;
  @JsonKey(name: 'helm')
  BraggadociousHelm? helm;
  @JsonKey(name: 'kustomize')
  BraggadociousKustomize? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  BraggadociousPlugin? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  BraggadociousSource({
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

  factory BraggadociousSource.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousSourceFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousSourceToJson(this);
}

@JsonSerializable()
class Directory2 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  BraggadociousJsonnet? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory2({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory2.fromJson(Map<String, dynamic> json) =>
      _$Directory2FromJson(json);

  Map<String, dynamic> toJson() => _$Directory2ToJson(this);
}

@JsonSerializable()
class BraggadociousJsonnet {
  @JsonKey(name: 'extVars')
  List<BraggadociousExtVar?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<BraggadociousTlas?>? tlas;

  BraggadociousJsonnet({this.extVars, this.libs, this.tlas});

  factory BraggadociousJsonnet.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousJsonnetFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousJsonnetToJson(this);
}

@JsonSerializable()
class BraggadociousExtVar {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  BraggadociousExtVar({this.code, required this.name, required this.value});

  factory BraggadociousExtVar.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousExtVarFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousExtVarToJson(this);
}

@JsonSerializable()
class BraggadociousTlas {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  BraggadociousTlas({this.code, required this.name, required this.value});

  factory BraggadociousTlas.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousTlasFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousTlasToJson(this);
}

@JsonSerializable()
class BraggadociousHelm {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<BraggadociousFileParameter?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter12?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  BraggadociousHelm({
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

  factory BraggadociousHelm.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousHelmFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousHelmToJson(this);
}

@JsonSerializable()
class BraggadociousFileParameter {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  BraggadociousFileParameter({this.name, this.path});

  factory BraggadociousFileParameter.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousFileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousFileParameterToJson(this);
}

@JsonSerializable()
class Parameter12 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter12({this.forceString, this.name, this.value});

  factory Parameter12.fromJson(Map<String, dynamic> json) =>
      _$Parameter12FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter12ToJson(this);
}

@JsonSerializable()
class BraggadociousKustomize {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<BraggadociousPatch?>? patches;
  @JsonKey(name: 'replicas')
  List<BraggadociousReplica?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  BraggadociousKustomize({
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

  factory BraggadociousKustomize.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousKustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousKustomizeToJson(this);
}

@JsonSerializable()
class BraggadociousPatch {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  BraggadociousTarget? target;

  BraggadociousPatch({this.options, this.patch, this.path, this.target});

  factory BraggadociousPatch.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousPatchFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousPatchToJson(this);
}

@JsonSerializable()
class BraggadociousTarget {
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

  BraggadociousTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory BraggadociousTarget.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousTargetFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousTargetToJson(this);
}

@JsonSerializable()
class BraggadociousReplica {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  BraggadociousReplica({required this.count, required this.name});

  factory BraggadociousReplica.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousReplicaToJson(this);
}

@JsonSerializable()
class BraggadociousPlugin {
  @JsonKey(name: 'env')
  List<BraggadociousEnv?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter13?>? parameters;

  BraggadociousPlugin({this.env, this.name, this.parameters});

  factory BraggadociousPlugin.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousPluginFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousPluginToJson(this);
}

@JsonSerializable()
class BraggadociousEnv {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  BraggadociousEnv({required this.name, required this.value});

  factory BraggadociousEnv.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousEnvFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousEnvToJson(this);
}

@JsonSerializable()
class Parameter13 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter13({this.array, this.map, this.name, this.string});

  factory Parameter13.fromJson(Map<String, dynamic> json) =>
      _$Parameter13FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter13ToJson(this);
}

@JsonSerializable()
class HilariousSourceHydrator {
  @JsonKey(name: 'drySource')
  HilariousDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  HilariousHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  HilariousSyncSource syncSource;

  HilariousSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory HilariousSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$HilariousSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousSourceHydratorToJson(this);
}

@JsonSerializable()
class HilariousDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  HilariousDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory HilariousDrySource.fromJson(Map<String, dynamic> json) =>
      _$HilariousDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousDrySourceToJson(this);
}

@JsonSerializable()
class HilariousHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HilariousHydrateTo({required this.targetBranch});

  factory HilariousHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$HilariousHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousHydrateToToJson(this);
}

@JsonSerializable()
class HilariousSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HilariousSyncSource({required this.path, required this.targetBranch});

  factory HilariousSyncSource.fromJson(Map<String, dynamic> json) =>
      _$HilariousSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousSyncSourceToJson(this);
}

@JsonSerializable()
class Source1 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory3? directory;
  @JsonKey(name: 'helm')
  Helm1? helm;
  @JsonKey(name: 'kustomize')
  Kustomize1? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin1? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source1({
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

  factory Source1.fromJson(Map<String, dynamic> json) =>
      _$Source1FromJson(json);

  Map<String, dynamic> toJson() => _$Source1ToJson(this);
}

@JsonSerializable()
class Directory3 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet1? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory3({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory3.fromJson(Map<String, dynamic> json) =>
      _$Directory3FromJson(json);

  Map<String, dynamic> toJson() => _$Directory3ToJson(this);
}

@JsonSerializable()
class Jsonnet1 {
  @JsonKey(name: 'extVars')
  List<ExtVar1?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas1?>? tlas;

  Jsonnet1({this.extVars, this.libs, this.tlas});

  factory Jsonnet1.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet1FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet1ToJson(this);
}

@JsonSerializable()
class ExtVar1 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar1({this.code, required this.name, required this.value});

  factory ExtVar1.fromJson(Map<String, dynamic> json) =>
      _$ExtVar1FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar1ToJson(this);
}

@JsonSerializable()
class Tlas1 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas1({this.code, required this.name, required this.value});

  factory Tlas1.fromJson(Map<String, dynamic> json) => _$Tlas1FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas1ToJson(this);
}

@JsonSerializable()
class Helm1 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter1?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter14?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm1({
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

  factory Helm1.fromJson(Map<String, dynamic> json) => _$Helm1FromJson(json);

  Map<String, dynamic> toJson() => _$Helm1ToJson(this);
}

@JsonSerializable()
class FileParameter1 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter1({this.name, this.path});

  factory FileParameter1.fromJson(Map<String, dynamic> json) =>
      _$FileParameter1FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter1ToJson(this);
}

@JsonSerializable()
class Parameter14 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter14({this.forceString, this.name, this.value});

  factory Parameter14.fromJson(Map<String, dynamic> json) =>
      _$Parameter14FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter14ToJson(this);
}

@JsonSerializable()
class Kustomize1 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch1?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica1?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize1({
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

  factory Kustomize1.fromJson(Map<String, dynamic> json) =>
      _$Kustomize1FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize1ToJson(this);
}

@JsonSerializable()
class Patch1 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target1? target;

  Patch1({this.options, this.patch, this.path, this.target});

  factory Patch1.fromJson(Map<String, dynamic> json) => _$Patch1FromJson(json);

  Map<String, dynamic> toJson() => _$Patch1ToJson(this);
}

@JsonSerializable()
class Target1 {
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

  Target1({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target1.fromJson(Map<String, dynamic> json) =>
      _$Target1FromJson(json);

  Map<String, dynamic> toJson() => _$Target1ToJson(this);
}

@JsonSerializable()
class Replica1 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica1({required this.count, required this.name});

  factory Replica1.fromJson(Map<String, dynamic> json) =>
      _$Replica1FromJson(json);

  Map<String, dynamic> toJson() => _$Replica1ToJson(this);
}

@JsonSerializable()
class Plugin1 {
  @JsonKey(name: 'env')
  List<Env1?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter15?>? parameters;

  Plugin1({this.env, this.name, this.parameters});

  factory Plugin1.fromJson(Map<String, dynamic> json) =>
      _$Plugin1FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin1ToJson(this);
}

@JsonSerializable()
class Env1 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env1({required this.name, required this.value});

  factory Env1.fromJson(Map<String, dynamic> json) => _$Env1FromJson(json);

  Map<String, dynamic> toJson() => _$Env1ToJson(this);
}

@JsonSerializable()
class Parameter15 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter15({this.array, this.map, this.name, this.string});

  factory Parameter15.fromJson(Map<String, dynamic> json) =>
      _$Parameter15FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter15ToJson(this);
}

@JsonSerializable()
class HilariousSyncPolicy {
  @JsonKey(name: 'automated')
  HilariousAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  HilariousManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  HilariousRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  HilariousSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory HilariousSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$HilariousSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousSyncPolicyToJson(this);
}

@JsonSerializable()
class HilariousAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  HilariousAutomated({
    this.allowEmpty,
    this.enabled,
    this.prune,
    this.selfHeal,
  });

  factory HilariousAutomated.fromJson(Map<String, dynamic> json) =>
      _$HilariousAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousAutomatedToJson(this);
}

@JsonSerializable()
class HilariousManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  HilariousManagedNamespaceMetadata({this.annotations, this.labels});

  factory HilariousManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$HilariousManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HilariousManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class HilariousRetry {
  @JsonKey(name: 'backoff')
  HilariousBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  HilariousRetry({this.backoff, this.limit, this.refresh});

  factory HilariousRetry.fromJson(Map<String, dynamic> json) =>
      _$HilariousRetryFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousRetryToJson(this);
}

@JsonSerializable()
class HilariousBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  HilariousBackoff({this.duration, this.factor, this.maxDuration});

  factory HilariousBackoff.fromJson(Map<String, dynamic> json) =>
      _$HilariousBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousBackoffToJson(this);
}

@JsonSerializable()
class FluffyList {
  @JsonKey(name: 'elements')
  List<dynamic>? elements;
  @JsonKey(name: 'elementsYaml')
  String? elementsYaml;
  @JsonKey(name: 'template')
  AmbitiousTemplate? template;

  FluffyList({this.elements, this.elementsYaml, this.template});

  factory FluffyList.fromJson(Map<String, dynamic> json) =>
      _$FluffyListFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyListToJson(this);
}

@JsonSerializable()
class AmbitiousTemplate {
  @JsonKey(name: 'metadata')
  AmbitiousMetadata metadata;
  @JsonKey(name: 'spec')
  AmbitiousSpec spec;

  AmbitiousTemplate({required this.metadata, required this.spec});

  factory AmbitiousTemplate.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousTemplateToJson(this);
}

@JsonSerializable()
class AmbitiousMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  AmbitiousMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory AmbitiousMetadata.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousMetadataToJson(this);
}

@JsonSerializable()
class AmbitiousSpec {
  @JsonKey(name: 'destination')
  AmbitiousDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<AmbitiousIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<AmbitiousInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source2? source;
  @JsonKey(name: 'sourceHydrator')
  AmbitiousSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source3?>? sources;
  @JsonKey(name: 'syncPolicy')
  AmbitiousSyncPolicy? syncPolicy;

  AmbitiousSpec({
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

  factory AmbitiousSpec.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousSpecFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousSpecToJson(this);
}

@JsonSerializable()
class AmbitiousDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  AmbitiousDestination({this.name, this.namespace, this.server});

  factory AmbitiousDestination.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousDestinationToJson(this);
}

@JsonSerializable()
class AmbitiousIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  AmbitiousIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory AmbitiousIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class AmbitiousInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  AmbitiousInfo({required this.name, required this.value});

  factory AmbitiousInfo.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousInfoToJson(this);
}

@JsonSerializable()
class Source2 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory4? directory;
  @JsonKey(name: 'helm')
  Helm2? helm;
  @JsonKey(name: 'kustomize')
  Kustomize2? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin2? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source2({
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

  factory Source2.fromJson(Map<String, dynamic> json) =>
      _$Source2FromJson(json);

  Map<String, dynamic> toJson() => _$Source2ToJson(this);
}

@JsonSerializable()
class Directory4 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet2? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory4({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory4.fromJson(Map<String, dynamic> json) =>
      _$Directory4FromJson(json);

  Map<String, dynamic> toJson() => _$Directory4ToJson(this);
}

@JsonSerializable()
class Jsonnet2 {
  @JsonKey(name: 'extVars')
  List<ExtVar2?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas2?>? tlas;

  Jsonnet2({this.extVars, this.libs, this.tlas});

  factory Jsonnet2.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet2FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet2ToJson(this);
}

@JsonSerializable()
class ExtVar2 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar2({this.code, required this.name, required this.value});

  factory ExtVar2.fromJson(Map<String, dynamic> json) =>
      _$ExtVar2FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar2ToJson(this);
}

@JsonSerializable()
class Tlas2 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas2({this.code, required this.name, required this.value});

  factory Tlas2.fromJson(Map<String, dynamic> json) => _$Tlas2FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas2ToJson(this);
}

@JsonSerializable()
class Helm2 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter2?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter16?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm2({
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

  factory Helm2.fromJson(Map<String, dynamic> json) => _$Helm2FromJson(json);

  Map<String, dynamic> toJson() => _$Helm2ToJson(this);
}

@JsonSerializable()
class FileParameter2 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter2({this.name, this.path});

  factory FileParameter2.fromJson(Map<String, dynamic> json) =>
      _$FileParameter2FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter2ToJson(this);
}

@JsonSerializable()
class Parameter16 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter16({this.forceString, this.name, this.value});

  factory Parameter16.fromJson(Map<String, dynamic> json) =>
      _$Parameter16FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter16ToJson(this);
}

@JsonSerializable()
class Kustomize2 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch2?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica2?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize2({
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

  factory Kustomize2.fromJson(Map<String, dynamic> json) =>
      _$Kustomize2FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize2ToJson(this);
}

@JsonSerializable()
class Patch2 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target2? target;

  Patch2({this.options, this.patch, this.path, this.target});

  factory Patch2.fromJson(Map<String, dynamic> json) => _$Patch2FromJson(json);

  Map<String, dynamic> toJson() => _$Patch2ToJson(this);
}

@JsonSerializable()
class Target2 {
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

  Target2({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target2.fromJson(Map<String, dynamic> json) =>
      _$Target2FromJson(json);

  Map<String, dynamic> toJson() => _$Target2ToJson(this);
}

@JsonSerializable()
class Replica2 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica2({required this.count, required this.name});

  factory Replica2.fromJson(Map<String, dynamic> json) =>
      _$Replica2FromJson(json);

  Map<String, dynamic> toJson() => _$Replica2ToJson(this);
}

@JsonSerializable()
class Plugin2 {
  @JsonKey(name: 'env')
  List<Env2?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter17?>? parameters;

  Plugin2({this.env, this.name, this.parameters});

  factory Plugin2.fromJson(Map<String, dynamic> json) =>
      _$Plugin2FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin2ToJson(this);
}

@JsonSerializable()
class Env2 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env2({required this.name, required this.value});

  factory Env2.fromJson(Map<String, dynamic> json) => _$Env2FromJson(json);

  Map<String, dynamic> toJson() => _$Env2ToJson(this);
}

@JsonSerializable()
class Parameter17 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter17({this.array, this.map, this.name, this.string});

  factory Parameter17.fromJson(Map<String, dynamic> json) =>
      _$Parameter17FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter17ToJson(this);
}

@JsonSerializable()
class AmbitiousSourceHydrator {
  @JsonKey(name: 'drySource')
  AmbitiousDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  AmbitiousHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  AmbitiousSyncSource syncSource;

  AmbitiousSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory AmbitiousSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousSourceHydratorToJson(this);
}

@JsonSerializable()
class AmbitiousDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  AmbitiousDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory AmbitiousDrySource.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousDrySourceToJson(this);
}

@JsonSerializable()
class AmbitiousHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  AmbitiousHydrateTo({required this.targetBranch});

  factory AmbitiousHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousHydrateToToJson(this);
}

@JsonSerializable()
class AmbitiousSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  AmbitiousSyncSource({required this.path, required this.targetBranch});

  factory AmbitiousSyncSource.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousSyncSourceToJson(this);
}

@JsonSerializable()
class Source3 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory5? directory;
  @JsonKey(name: 'helm')
  Helm3? helm;
  @JsonKey(name: 'kustomize')
  Kustomize3? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin3? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source3({
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

  factory Source3.fromJson(Map<String, dynamic> json) =>
      _$Source3FromJson(json);

  Map<String, dynamic> toJson() => _$Source3ToJson(this);
}

@JsonSerializable()
class Directory5 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet3? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory5({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory5.fromJson(Map<String, dynamic> json) =>
      _$Directory5FromJson(json);

  Map<String, dynamic> toJson() => _$Directory5ToJson(this);
}

@JsonSerializable()
class Jsonnet3 {
  @JsonKey(name: 'extVars')
  List<ExtVar3?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas3?>? tlas;

  Jsonnet3({this.extVars, this.libs, this.tlas});

  factory Jsonnet3.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet3FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet3ToJson(this);
}

@JsonSerializable()
class ExtVar3 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar3({this.code, required this.name, required this.value});

  factory ExtVar3.fromJson(Map<String, dynamic> json) =>
      _$ExtVar3FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar3ToJson(this);
}

@JsonSerializable()
class Tlas3 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas3({this.code, required this.name, required this.value});

  factory Tlas3.fromJson(Map<String, dynamic> json) => _$Tlas3FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas3ToJson(this);
}

@JsonSerializable()
class Helm3 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter3?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter18?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm3({
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

  factory Helm3.fromJson(Map<String, dynamic> json) => _$Helm3FromJson(json);

  Map<String, dynamic> toJson() => _$Helm3ToJson(this);
}

@JsonSerializable()
class FileParameter3 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter3({this.name, this.path});

  factory FileParameter3.fromJson(Map<String, dynamic> json) =>
      _$FileParameter3FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter3ToJson(this);
}

@JsonSerializable()
class Parameter18 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter18({this.forceString, this.name, this.value});

  factory Parameter18.fromJson(Map<String, dynamic> json) =>
      _$Parameter18FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter18ToJson(this);
}

@JsonSerializable()
class Kustomize3 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch3?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica3?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize3({
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

  factory Kustomize3.fromJson(Map<String, dynamic> json) =>
      _$Kustomize3FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize3ToJson(this);
}

@JsonSerializable()
class Patch3 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target3? target;

  Patch3({this.options, this.patch, this.path, this.target});

  factory Patch3.fromJson(Map<String, dynamic> json) => _$Patch3FromJson(json);

  Map<String, dynamic> toJson() => _$Patch3ToJson(this);
}

@JsonSerializable()
class Target3 {
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

  Target3({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target3.fromJson(Map<String, dynamic> json) =>
      _$Target3FromJson(json);

  Map<String, dynamic> toJson() => _$Target3ToJson(this);
}

@JsonSerializable()
class Replica3 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica3({required this.count, required this.name});

  factory Replica3.fromJson(Map<String, dynamic> json) =>
      _$Replica3FromJson(json);

  Map<String, dynamic> toJson() => _$Replica3ToJson(this);
}

@JsonSerializable()
class Plugin3 {
  @JsonKey(name: 'env')
  List<Env3?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter19?>? parameters;

  Plugin3({this.env, this.name, this.parameters});

  factory Plugin3.fromJson(Map<String, dynamic> json) =>
      _$Plugin3FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin3ToJson(this);
}

@JsonSerializable()
class Env3 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env3({required this.name, required this.value});

  factory Env3.fromJson(Map<String, dynamic> json) => _$Env3FromJson(json);

  Map<String, dynamic> toJson() => _$Env3ToJson(this);
}

@JsonSerializable()
class Parameter19 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter19({this.array, this.map, this.name, this.string});

  factory Parameter19.fromJson(Map<String, dynamic> json) =>
      _$Parameter19FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter19ToJson(this);
}

@JsonSerializable()
class AmbitiousSyncPolicy {
  @JsonKey(name: 'automated')
  AmbitiousAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  AmbitiousManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  AmbitiousRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  AmbitiousSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory AmbitiousSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousSyncPolicyToJson(this);
}

@JsonSerializable()
class AmbitiousAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  AmbitiousAutomated({
    this.allowEmpty,
    this.enabled,
    this.prune,
    this.selfHeal,
  });

  factory AmbitiousAutomated.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousAutomatedToJson(this);
}

@JsonSerializable()
class AmbitiousManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  AmbitiousManagedNamespaceMetadata({this.annotations, this.labels});

  factory AmbitiousManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$AmbitiousManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AmbitiousManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class AmbitiousRetry {
  @JsonKey(name: 'backoff')
  AmbitiousBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  AmbitiousRetry({this.backoff, this.limit, this.refresh});

  factory AmbitiousRetry.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousRetryFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousRetryToJson(this);
}

@JsonSerializable()
class AmbitiousBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  AmbitiousBackoff({this.duration, this.factor, this.maxDuration});

  factory AmbitiousBackoff.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousBackoffToJson(this);
}

@JsonSerializable()
class Plugin4 {
  @JsonKey(name: 'configMapRef')
  PurpleConfigMapRef configMapRef;
  @JsonKey(name: 'input')
  PurpleInput? input;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  CunningTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  Plugin4({
    required this.configMapRef,
    this.input,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory Plugin4.fromJson(Map<String, dynamic> json) =>
      _$Plugin4FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin4ToJson(this);
}

@JsonSerializable()
class PurpleConfigMapRef {
  @JsonKey(name: 'name')
  String name;

  PurpleConfigMapRef({required this.name});

  factory PurpleConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleConfigMapRefToJson(this);
}

@JsonSerializable()
class PurpleInput {
  @JsonKey(name: 'parameters')
  Map<String, dynamic>? parameters;

  PurpleInput({this.parameters});

  factory PurpleInput.fromJson(Map<String, dynamic> json) =>
      _$PurpleInputFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleInputToJson(this);
}

@JsonSerializable()
class CunningTemplate {
  @JsonKey(name: 'metadata')
  CunningMetadata metadata;
  @JsonKey(name: 'spec')
  CunningSpec spec;

  CunningTemplate({required this.metadata, required this.spec});

  factory CunningTemplate.fromJson(Map<String, dynamic> json) =>
      _$CunningTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$CunningTemplateToJson(this);
}

@JsonSerializable()
class CunningMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  CunningMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory CunningMetadata.fromJson(Map<String, dynamic> json) =>
      _$CunningMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$CunningMetadataToJson(this);
}

@JsonSerializable()
class CunningSpec {
  @JsonKey(name: 'destination')
  CunningDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<CunningIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<CunningInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source4? source;
  @JsonKey(name: 'sourceHydrator')
  CunningSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source5?>? sources;
  @JsonKey(name: 'syncPolicy')
  CunningSyncPolicy? syncPolicy;

  CunningSpec({
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

  factory CunningSpec.fromJson(Map<String, dynamic> json) =>
      _$CunningSpecFromJson(json);

  Map<String, dynamic> toJson() => _$CunningSpecToJson(this);
}

@JsonSerializable()
class CunningDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  CunningDestination({this.name, this.namespace, this.server});

  factory CunningDestination.fromJson(Map<String, dynamic> json) =>
      _$CunningDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$CunningDestinationToJson(this);
}

@JsonSerializable()
class CunningIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  CunningIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory CunningIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$CunningIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$CunningIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class CunningInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  CunningInfo({required this.name, required this.value});

  factory CunningInfo.fromJson(Map<String, dynamic> json) =>
      _$CunningInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CunningInfoToJson(this);
}

@JsonSerializable()
class Source4 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory6? directory;
  @JsonKey(name: 'helm')
  Helm4? helm;
  @JsonKey(name: 'kustomize')
  Kustomize4? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin5? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source4({
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

  factory Source4.fromJson(Map<String, dynamic> json) =>
      _$Source4FromJson(json);

  Map<String, dynamic> toJson() => _$Source4ToJson(this);
}

@JsonSerializable()
class Directory6 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet4? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory6({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory6.fromJson(Map<String, dynamic> json) =>
      _$Directory6FromJson(json);

  Map<String, dynamic> toJson() => _$Directory6ToJson(this);
}

@JsonSerializable()
class Jsonnet4 {
  @JsonKey(name: 'extVars')
  List<ExtVar4?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas4?>? tlas;

  Jsonnet4({this.extVars, this.libs, this.tlas});

  factory Jsonnet4.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet4FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet4ToJson(this);
}

@JsonSerializable()
class ExtVar4 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar4({this.code, required this.name, required this.value});

  factory ExtVar4.fromJson(Map<String, dynamic> json) =>
      _$ExtVar4FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar4ToJson(this);
}

@JsonSerializable()
class Tlas4 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas4({this.code, required this.name, required this.value});

  factory Tlas4.fromJson(Map<String, dynamic> json) => _$Tlas4FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas4ToJson(this);
}

@JsonSerializable()
class Helm4 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter4?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter20?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm4({
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

  factory Helm4.fromJson(Map<String, dynamic> json) => _$Helm4FromJson(json);

  Map<String, dynamic> toJson() => _$Helm4ToJson(this);
}

@JsonSerializable()
class FileParameter4 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter4({this.name, this.path});

  factory FileParameter4.fromJson(Map<String, dynamic> json) =>
      _$FileParameter4FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter4ToJson(this);
}

@JsonSerializable()
class Parameter20 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter20({this.forceString, this.name, this.value});

  factory Parameter20.fromJson(Map<String, dynamic> json) =>
      _$Parameter20FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter20ToJson(this);
}

@JsonSerializable()
class Kustomize4 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch4?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica4?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize4({
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

  factory Kustomize4.fromJson(Map<String, dynamic> json) =>
      _$Kustomize4FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize4ToJson(this);
}

@JsonSerializable()
class Patch4 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target4? target;

  Patch4({this.options, this.patch, this.path, this.target});

  factory Patch4.fromJson(Map<String, dynamic> json) => _$Patch4FromJson(json);

  Map<String, dynamic> toJson() => _$Patch4ToJson(this);
}

@JsonSerializable()
class Target4 {
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

  Target4({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target4.fromJson(Map<String, dynamic> json) =>
      _$Target4FromJson(json);

  Map<String, dynamic> toJson() => _$Target4ToJson(this);
}

@JsonSerializable()
class Replica4 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica4({required this.count, required this.name});

  factory Replica4.fromJson(Map<String, dynamic> json) =>
      _$Replica4FromJson(json);

  Map<String, dynamic> toJson() => _$Replica4ToJson(this);
}

@JsonSerializable()
class Plugin5 {
  @JsonKey(name: 'env')
  List<Env4?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter21?>? parameters;

  Plugin5({this.env, this.name, this.parameters});

  factory Plugin5.fromJson(Map<String, dynamic> json) =>
      _$Plugin5FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin5ToJson(this);
}

@JsonSerializable()
class Env4 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env4({required this.name, required this.value});

  factory Env4.fromJson(Map<String, dynamic> json) => _$Env4FromJson(json);

  Map<String, dynamic> toJson() => _$Env4ToJson(this);
}

@JsonSerializable()
class Parameter21 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter21({this.array, this.map, this.name, this.string});

  factory Parameter21.fromJson(Map<String, dynamic> json) =>
      _$Parameter21FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter21ToJson(this);
}

@JsonSerializable()
class CunningSourceHydrator {
  @JsonKey(name: 'drySource')
  CunningDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  CunningHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  CunningSyncSource syncSource;

  CunningSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory CunningSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$CunningSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$CunningSourceHydratorToJson(this);
}

@JsonSerializable()
class CunningDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  CunningDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory CunningDrySource.fromJson(Map<String, dynamic> json) =>
      _$CunningDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$CunningDrySourceToJson(this);
}

@JsonSerializable()
class CunningHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  CunningHydrateTo({required this.targetBranch});

  factory CunningHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$CunningHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$CunningHydrateToToJson(this);
}

@JsonSerializable()
class CunningSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  CunningSyncSource({required this.path, required this.targetBranch});

  factory CunningSyncSource.fromJson(Map<String, dynamic> json) =>
      _$CunningSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$CunningSyncSourceToJson(this);
}

@JsonSerializable()
class Source5 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory7? directory;
  @JsonKey(name: 'helm')
  Helm5? helm;
  @JsonKey(name: 'kustomize')
  Kustomize5? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin6? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source5({
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

  factory Source5.fromJson(Map<String, dynamic> json) =>
      _$Source5FromJson(json);

  Map<String, dynamic> toJson() => _$Source5ToJson(this);
}

@JsonSerializable()
class Directory7 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet5? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory7({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory7.fromJson(Map<String, dynamic> json) =>
      _$Directory7FromJson(json);

  Map<String, dynamic> toJson() => _$Directory7ToJson(this);
}

@JsonSerializable()
class Jsonnet5 {
  @JsonKey(name: 'extVars')
  List<ExtVar5?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas5?>? tlas;

  Jsonnet5({this.extVars, this.libs, this.tlas});

  factory Jsonnet5.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet5FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet5ToJson(this);
}

@JsonSerializable()
class ExtVar5 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar5({this.code, required this.name, required this.value});

  factory ExtVar5.fromJson(Map<String, dynamic> json) =>
      _$ExtVar5FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar5ToJson(this);
}

@JsonSerializable()
class Tlas5 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas5({this.code, required this.name, required this.value});

  factory Tlas5.fromJson(Map<String, dynamic> json) => _$Tlas5FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas5ToJson(this);
}

@JsonSerializable()
class Helm5 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter5?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter22?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm5({
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

  factory Helm5.fromJson(Map<String, dynamic> json) => _$Helm5FromJson(json);

  Map<String, dynamic> toJson() => _$Helm5ToJson(this);
}

@JsonSerializable()
class FileParameter5 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter5({this.name, this.path});

  factory FileParameter5.fromJson(Map<String, dynamic> json) =>
      _$FileParameter5FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter5ToJson(this);
}

@JsonSerializable()
class Parameter22 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter22({this.forceString, this.name, this.value});

  factory Parameter22.fromJson(Map<String, dynamic> json) =>
      _$Parameter22FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter22ToJson(this);
}

@JsonSerializable()
class Kustomize5 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch5?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica5?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize5({
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

  factory Kustomize5.fromJson(Map<String, dynamic> json) =>
      _$Kustomize5FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize5ToJson(this);
}

@JsonSerializable()
class Patch5 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target5? target;

  Patch5({this.options, this.patch, this.path, this.target});

  factory Patch5.fromJson(Map<String, dynamic> json) => _$Patch5FromJson(json);

  Map<String, dynamic> toJson() => _$Patch5ToJson(this);
}

@JsonSerializable()
class Target5 {
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

  Target5({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target5.fromJson(Map<String, dynamic> json) =>
      _$Target5FromJson(json);

  Map<String, dynamic> toJson() => _$Target5ToJson(this);
}

@JsonSerializable()
class Replica5 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica5({required this.count, required this.name});

  factory Replica5.fromJson(Map<String, dynamic> json) =>
      _$Replica5FromJson(json);

  Map<String, dynamic> toJson() => _$Replica5ToJson(this);
}

@JsonSerializable()
class Plugin6 {
  @JsonKey(name: 'env')
  List<Env5?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter23?>? parameters;

  Plugin6({this.env, this.name, this.parameters});

  factory Plugin6.fromJson(Map<String, dynamic> json) =>
      _$Plugin6FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin6ToJson(this);
}

@JsonSerializable()
class Env5 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env5({required this.name, required this.value});

  factory Env5.fromJson(Map<String, dynamic> json) => _$Env5FromJson(json);

  Map<String, dynamic> toJson() => _$Env5ToJson(this);
}

@JsonSerializable()
class Parameter23 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter23({this.array, this.map, this.name, this.string});

  factory Parameter23.fromJson(Map<String, dynamic> json) =>
      _$Parameter23FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter23ToJson(this);
}

@JsonSerializable()
class CunningSyncPolicy {
  @JsonKey(name: 'automated')
  CunningAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  CunningManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  CunningRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  CunningSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory CunningSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$CunningSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$CunningSyncPolicyToJson(this);
}

@JsonSerializable()
class CunningAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  CunningAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory CunningAutomated.fromJson(Map<String, dynamic> json) =>
      _$CunningAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$CunningAutomatedToJson(this);
}

@JsonSerializable()
class CunningManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  CunningManagedNamespaceMetadata({this.annotations, this.labels});

  factory CunningManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$CunningManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CunningManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class CunningRetry {
  @JsonKey(name: 'backoff')
  CunningBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  CunningRetry({this.backoff, this.limit, this.refresh});

  factory CunningRetry.fromJson(Map<String, dynamic> json) =>
      _$CunningRetryFromJson(json);

  Map<String, dynamic> toJson() => _$CunningRetryToJson(this);
}

@JsonSerializable()
class CunningBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  CunningBackoff({this.duration, this.factor, this.maxDuration});

  factory CunningBackoff.fromJson(Map<String, dynamic> json) =>
      _$CunningBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$CunningBackoffToJson(this);
}

@JsonSerializable()
class PurplePullRequest {
  @JsonKey(name: 'azuredevops')
  PurpleAzuredevops? azuredevops;
  @JsonKey(name: 'bitbucket')
  PurpleBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  PurpleBitbucketServer? bitbucketServer;
  @JsonKey(name: 'continueOnRepoNotFoundError')
  bool? continueOnRepoNotFoundError;
  @JsonKey(name: 'filters')
  List<PurpleFilter?>? filters;
  @JsonKey(name: 'gitea')
  PurpleGitea? gitea;
  @JsonKey(name: 'github')
  PurpleGithub? github;
  @JsonKey(name: 'gitlab')
  PurpleGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  MagentaTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  PurplePullRequest({
    this.azuredevops,
    this.bitbucket,
    this.bitbucketServer,
    this.continueOnRepoNotFoundError,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory PurplePullRequest.fromJson(Map<String, dynamic> json) =>
      _$PurplePullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePullRequestToJson(this);
}

@JsonSerializable()
class PurpleAzuredevops {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  PurpleTokenRef? tokenRef;

  PurpleAzuredevops({
    this.api,
    this.labels,
    required this.organization,
    required this.project,
    required this.repo,
    this.tokenRef,
  });

  factory PurpleAzuredevops.fromJson(Map<String, dynamic> json) =>
      _$PurpleAzuredevopsFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAzuredevopsToJson(this);
}

@JsonSerializable()
class PurpleTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  PurpleTokenRef({required this.key, required this.secretName});

  factory PurpleTokenRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTokenRefToJson(this);
}

@JsonSerializable()
class PurpleBitbucket {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'basicAuth')
  PurpleBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  PurpleBearerToken? bearerToken;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;

  PurpleBitbucket({
    this.api,
    this.basicAuth,
    this.bearerToken,
    required this.owner,
    required this.repo,
  });

  factory PurpleBitbucket.fromJson(Map<String, dynamic> json) =>
      _$PurpleBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBitbucketToJson(this);
}

@JsonSerializable()
class PurpleBasicAuth {
  @JsonKey(name: 'passwordRef')
  PurplePasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  PurpleBasicAuth({required this.passwordRef, required this.username});

  factory PurpleBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$PurpleBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBasicAuthToJson(this);
}

@JsonSerializable()
class PurplePasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  PurplePasswordRef({required this.key, required this.secretName});

  factory PurplePasswordRef.fromJson(Map<String, dynamic> json) =>
      _$PurplePasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePasswordRefToJson(this);
}

@JsonSerializable()
class PurpleBearerToken {
  @JsonKey(name: 'tokenRef')
  FluffyTokenRef tokenRef;

  PurpleBearerToken({required this.tokenRef});

  factory PurpleBearerToken.fromJson(Map<String, dynamic> json) =>
      _$PurpleBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBearerTokenToJson(this);
}

@JsonSerializable()
class FluffyTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  FluffyTokenRef({required this.key, required this.secretName});

  factory FluffyTokenRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTokenRefToJson(this);
}

@JsonSerializable()
class PurpleBitbucketServer {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  FluffyBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  FluffyBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  PurpleCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;

  PurpleBitbucketServer({
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
    required this.repo,
  });

  factory PurpleBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$PurpleBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleBitbucketServerToJson(this);
}

@JsonSerializable()
class FluffyBasicAuth {
  @JsonKey(name: 'passwordRef')
  FluffyPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  FluffyBasicAuth({required this.passwordRef, required this.username});

  factory FluffyBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$FluffyBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBasicAuthToJson(this);
}

@JsonSerializable()
class FluffyPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  FluffyPasswordRef({required this.key, required this.secretName});

  factory FluffyPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPasswordRefToJson(this);
}

@JsonSerializable()
class FluffyBearerToken {
  @JsonKey(name: 'tokenRef')
  TentacledTokenRef tokenRef;

  FluffyBearerToken({required this.tokenRef});

  factory FluffyBearerToken.fromJson(Map<String, dynamic> json) =>
      _$FluffyBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBearerTokenToJson(this);
}

@JsonSerializable()
class TentacledTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TentacledTokenRef({required this.key, required this.secretName});

  factory TentacledTokenRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTokenRefToJson(this);
}

@JsonSerializable()
class PurpleCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  PurpleCaRef({required this.configMapName, required this.key});

  factory PurpleCaRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleCaRefToJson(this);
}

@JsonSerializable()
class PurpleFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'targetBranchMatch')
  String? targetBranchMatch;
  @JsonKey(name: 'titleMatch')
  String? titleMatch;

  PurpleFilter({this.branchMatch, this.targetBranchMatch, this.titleMatch});

  factory PurpleFilter.fromJson(Map<String, dynamic> json) =>
      _$PurpleFilterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleFilterToJson(this);
}

@JsonSerializable()
class PurpleGitea {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  StickyTokenRef? tokenRef;

  PurpleGitea({
    required this.api,
    this.insecure,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory PurpleGitea.fromJson(Map<String, dynamic> json) =>
      _$PurpleGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleGiteaToJson(this);
}

@JsonSerializable()
class StickyTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  StickyTokenRef({required this.key, required this.secretName});

  factory StickyTokenRef.fromJson(Map<String, dynamic> json) =>
      _$StickyTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$StickyTokenRefToJson(this);
}

@JsonSerializable()
class PurpleGithub {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  IndigoTokenRef? tokenRef;

  PurpleGithub({
    this.api,
    this.appSecretName,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory PurpleGithub.fromJson(Map<String, dynamic> json) =>
      _$PurpleGithubFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleGithubToJson(this);
}

@JsonSerializable()
class IndigoTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  IndigoTokenRef({required this.key, required this.secretName});

  factory IndigoTokenRef.fromJson(Map<String, dynamic> json) =>
      _$IndigoTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoTokenRefToJson(this);
}

@JsonSerializable()
class PurpleGitlab {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  FluffyCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'pullRequestState')
  String? pullRequestState;
  @JsonKey(name: 'tokenRef')
  IndecentTokenRef? tokenRef;

  PurpleGitlab({
    this.api,
    this.caRef,
    this.insecure,
    this.labels,
    required this.project,
    this.pullRequestState,
    this.tokenRef,
  });

  factory PurpleGitlab.fromJson(Map<String, dynamic> json) =>
      _$PurpleGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleGitlabToJson(this);
}

@JsonSerializable()
class FluffyCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  FluffyCaRef({required this.configMapName, required this.key});

  factory FluffyCaRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyCaRefToJson(this);
}

@JsonSerializable()
class IndecentTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  IndecentTokenRef({required this.key, required this.secretName});

  factory IndecentTokenRef.fromJson(Map<String, dynamic> json) =>
      _$IndecentTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentTokenRefToJson(this);
}

@JsonSerializable()
class MagentaTemplate {
  @JsonKey(name: 'metadata')
  MagentaMetadata metadata;
  @JsonKey(name: 'spec')
  MagentaSpec spec;

  MagentaTemplate({required this.metadata, required this.spec});

  factory MagentaTemplate.fromJson(Map<String, dynamic> json) =>
      _$MagentaTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaTemplateToJson(this);
}

@JsonSerializable()
class MagentaMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  MagentaMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory MagentaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MagentaMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaMetadataToJson(this);
}

@JsonSerializable()
class MagentaSpec {
  @JsonKey(name: 'destination')
  MagentaDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<MagentaIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<MagentaInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source6? source;
  @JsonKey(name: 'sourceHydrator')
  MagentaSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source7?>? sources;
  @JsonKey(name: 'syncPolicy')
  MagentaSyncPolicy? syncPolicy;

  MagentaSpec({
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

  factory MagentaSpec.fromJson(Map<String, dynamic> json) =>
      _$MagentaSpecFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaSpecToJson(this);
}

@JsonSerializable()
class MagentaDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  MagentaDestination({this.name, this.namespace, this.server});

  factory MagentaDestination.fromJson(Map<String, dynamic> json) =>
      _$MagentaDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaDestinationToJson(this);
}

@JsonSerializable()
class MagentaIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  MagentaIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory MagentaIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$MagentaIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class MagentaInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MagentaInfo({required this.name, required this.value});

  factory MagentaInfo.fromJson(Map<String, dynamic> json) =>
      _$MagentaInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaInfoToJson(this);
}

@JsonSerializable()
class Source6 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory8? directory;
  @JsonKey(name: 'helm')
  Helm6? helm;
  @JsonKey(name: 'kustomize')
  Kustomize6? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin7? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source6({
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

  factory Source6.fromJson(Map<String, dynamic> json) =>
      _$Source6FromJson(json);

  Map<String, dynamic> toJson() => _$Source6ToJson(this);
}

@JsonSerializable()
class Directory8 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet6? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory8({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory8.fromJson(Map<String, dynamic> json) =>
      _$Directory8FromJson(json);

  Map<String, dynamic> toJson() => _$Directory8ToJson(this);
}

@JsonSerializable()
class Jsonnet6 {
  @JsonKey(name: 'extVars')
  List<ExtVar6?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas6?>? tlas;

  Jsonnet6({this.extVars, this.libs, this.tlas});

  factory Jsonnet6.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet6FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet6ToJson(this);
}

@JsonSerializable()
class ExtVar6 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar6({this.code, required this.name, required this.value});

  factory ExtVar6.fromJson(Map<String, dynamic> json) =>
      _$ExtVar6FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar6ToJson(this);
}

@JsonSerializable()
class Tlas6 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas6({this.code, required this.name, required this.value});

  factory Tlas6.fromJson(Map<String, dynamic> json) => _$Tlas6FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas6ToJson(this);
}

@JsonSerializable()
class Helm6 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter6?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter24?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm6({
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

  factory Helm6.fromJson(Map<String, dynamic> json) => _$Helm6FromJson(json);

  Map<String, dynamic> toJson() => _$Helm6ToJson(this);
}

@JsonSerializable()
class FileParameter6 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter6({this.name, this.path});

  factory FileParameter6.fromJson(Map<String, dynamic> json) =>
      _$FileParameter6FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter6ToJson(this);
}

@JsonSerializable()
class Parameter24 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter24({this.forceString, this.name, this.value});

  factory Parameter24.fromJson(Map<String, dynamic> json) =>
      _$Parameter24FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter24ToJson(this);
}

@JsonSerializable()
class Kustomize6 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch6?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica6?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize6({
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

  factory Kustomize6.fromJson(Map<String, dynamic> json) =>
      _$Kustomize6FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize6ToJson(this);
}

@JsonSerializable()
class Patch6 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target6? target;

  Patch6({this.options, this.patch, this.path, this.target});

  factory Patch6.fromJson(Map<String, dynamic> json) => _$Patch6FromJson(json);

  Map<String, dynamic> toJson() => _$Patch6ToJson(this);
}

@JsonSerializable()
class Target6 {
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

  Target6({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target6.fromJson(Map<String, dynamic> json) =>
      _$Target6FromJson(json);

  Map<String, dynamic> toJson() => _$Target6ToJson(this);
}

@JsonSerializable()
class Replica6 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica6({required this.count, required this.name});

  factory Replica6.fromJson(Map<String, dynamic> json) =>
      _$Replica6FromJson(json);

  Map<String, dynamic> toJson() => _$Replica6ToJson(this);
}

@JsonSerializable()
class Plugin7 {
  @JsonKey(name: 'env')
  List<Env6?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter25?>? parameters;

  Plugin7({this.env, this.name, this.parameters});

  factory Plugin7.fromJson(Map<String, dynamic> json) =>
      _$Plugin7FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin7ToJson(this);
}

@JsonSerializable()
class Env6 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env6({required this.name, required this.value});

  factory Env6.fromJson(Map<String, dynamic> json) => _$Env6FromJson(json);

  Map<String, dynamic> toJson() => _$Env6ToJson(this);
}

@JsonSerializable()
class Parameter25 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter25({this.array, this.map, this.name, this.string});

  factory Parameter25.fromJson(Map<String, dynamic> json) =>
      _$Parameter25FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter25ToJson(this);
}

@JsonSerializable()
class MagentaSourceHydrator {
  @JsonKey(name: 'drySource')
  MagentaDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  MagentaHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  MagentaSyncSource syncSource;

  MagentaSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory MagentaSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$MagentaSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaSourceHydratorToJson(this);
}

@JsonSerializable()
class MagentaDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  MagentaDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory MagentaDrySource.fromJson(Map<String, dynamic> json) =>
      _$MagentaDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaDrySourceToJson(this);
}

@JsonSerializable()
class MagentaHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  MagentaHydrateTo({required this.targetBranch});

  factory MagentaHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$MagentaHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaHydrateToToJson(this);
}

@JsonSerializable()
class MagentaSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  MagentaSyncSource({required this.path, required this.targetBranch});

  factory MagentaSyncSource.fromJson(Map<String, dynamic> json) =>
      _$MagentaSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaSyncSourceToJson(this);
}

@JsonSerializable()
class Source7 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory9? directory;
  @JsonKey(name: 'helm')
  Helm7? helm;
  @JsonKey(name: 'kustomize')
  Kustomize7? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin8? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source7({
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

  factory Source7.fromJson(Map<String, dynamic> json) =>
      _$Source7FromJson(json);

  Map<String, dynamic> toJson() => _$Source7ToJson(this);
}

@JsonSerializable()
class Directory9 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet7? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory9({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory9.fromJson(Map<String, dynamic> json) =>
      _$Directory9FromJson(json);

  Map<String, dynamic> toJson() => _$Directory9ToJson(this);
}

@JsonSerializable()
class Jsonnet7 {
  @JsonKey(name: 'extVars')
  List<ExtVar7?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas7?>? tlas;

  Jsonnet7({this.extVars, this.libs, this.tlas});

  factory Jsonnet7.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet7FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet7ToJson(this);
}

@JsonSerializable()
class ExtVar7 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar7({this.code, required this.name, required this.value});

  factory ExtVar7.fromJson(Map<String, dynamic> json) =>
      _$ExtVar7FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar7ToJson(this);
}

@JsonSerializable()
class Tlas7 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas7({this.code, required this.name, required this.value});

  factory Tlas7.fromJson(Map<String, dynamic> json) => _$Tlas7FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas7ToJson(this);
}

@JsonSerializable()
class Helm7 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter7?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter26?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm7({
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

  factory Helm7.fromJson(Map<String, dynamic> json) => _$Helm7FromJson(json);

  Map<String, dynamic> toJson() => _$Helm7ToJson(this);
}

@JsonSerializable()
class FileParameter7 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter7({this.name, this.path});

  factory FileParameter7.fromJson(Map<String, dynamic> json) =>
      _$FileParameter7FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter7ToJson(this);
}

@JsonSerializable()
class Parameter26 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter26({this.forceString, this.name, this.value});

  factory Parameter26.fromJson(Map<String, dynamic> json) =>
      _$Parameter26FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter26ToJson(this);
}

@JsonSerializable()
class Kustomize7 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch7?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica7?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize7({
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

  factory Kustomize7.fromJson(Map<String, dynamic> json) =>
      _$Kustomize7FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize7ToJson(this);
}

@JsonSerializable()
class Patch7 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target7? target;

  Patch7({this.options, this.patch, this.path, this.target});

  factory Patch7.fromJson(Map<String, dynamic> json) => _$Patch7FromJson(json);

  Map<String, dynamic> toJson() => _$Patch7ToJson(this);
}

@JsonSerializable()
class Target7 {
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

  Target7({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target7.fromJson(Map<String, dynamic> json) =>
      _$Target7FromJson(json);

  Map<String, dynamic> toJson() => _$Target7ToJson(this);
}

@JsonSerializable()
class Replica7 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica7({required this.count, required this.name});

  factory Replica7.fromJson(Map<String, dynamic> json) =>
      _$Replica7FromJson(json);

  Map<String, dynamic> toJson() => _$Replica7ToJson(this);
}

@JsonSerializable()
class Plugin8 {
  @JsonKey(name: 'env')
  List<Env7?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter27?>? parameters;

  Plugin8({this.env, this.name, this.parameters});

  factory Plugin8.fromJson(Map<String, dynamic> json) =>
      _$Plugin8FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin8ToJson(this);
}

@JsonSerializable()
class Env7 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env7({required this.name, required this.value});

  factory Env7.fromJson(Map<String, dynamic> json) => _$Env7FromJson(json);

  Map<String, dynamic> toJson() => _$Env7ToJson(this);
}

@JsonSerializable()
class Parameter27 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter27({this.array, this.map, this.name, this.string});

  factory Parameter27.fromJson(Map<String, dynamic> json) =>
      _$Parameter27FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter27ToJson(this);
}

@JsonSerializable()
class MagentaSyncPolicy {
  @JsonKey(name: 'automated')
  MagentaAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  MagentaManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  MagentaRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  MagentaSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory MagentaSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$MagentaSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaSyncPolicyToJson(this);
}

@JsonSerializable()
class MagentaAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  MagentaAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory MagentaAutomated.fromJson(Map<String, dynamic> json) =>
      _$MagentaAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaAutomatedToJson(this);
}

@JsonSerializable()
class MagentaManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  MagentaManagedNamespaceMetadata({this.annotations, this.labels});

  factory MagentaManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$MagentaManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MagentaManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class MagentaRetry {
  @JsonKey(name: 'backoff')
  MagentaBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  MagentaRetry({this.backoff, this.limit, this.refresh});

  factory MagentaRetry.fromJson(Map<String, dynamic> json) =>
      _$MagentaRetryFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaRetryToJson(this);
}

@JsonSerializable()
class MagentaBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  MagentaBackoff({this.duration, this.factor, this.maxDuration});

  factory MagentaBackoff.fromJson(Map<String, dynamic> json) =>
      _$MagentaBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaBackoffToJson(this);
}

@JsonSerializable()
class PurpleScmProvider {
  @JsonKey(name: 'awsCodeCommit')
  PurpleAwsCodeCommit? awsCodeCommit;
  @JsonKey(name: 'azureDevOps')
  PurpleAzureDevOps? azureDevOps;
  @JsonKey(name: 'bitbucket')
  FluffyBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  FluffyBitbucketServer? bitbucketServer;
  @JsonKey(name: 'cloneProtocol')
  String? cloneProtocol;
  @JsonKey(name: 'filters')
  List<FluffyFilter?>? filters;
  @JsonKey(name: 'gitea')
  FluffyGitea? gitea;
  @JsonKey(name: 'github')
  FluffyGithub? github;
  @JsonKey(name: 'gitlab')
  FluffyGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  FriskyTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  PurpleScmProvider({
    this.awsCodeCommit,
    this.azureDevOps,
    this.bitbucket,
    this.bitbucketServer,
    this.cloneProtocol,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory PurpleScmProvider.fromJson(Map<String, dynamic> json) =>
      _$PurpleScmProviderFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleScmProviderToJson(this);
}

@JsonSerializable()
class PurpleAwsCodeCommit {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'tagFilters')
  List<PurpleTagFilter?>? tagFilters;

  PurpleAwsCodeCommit({
    this.allBranches,
    this.region,
    this.role,
    this.tagFilters,
  });

  factory PurpleAwsCodeCommit.fromJson(Map<String, dynamic> json) =>
      _$PurpleAwsCodeCommitFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAwsCodeCommitToJson(this);
}

@JsonSerializable()
class PurpleTagFilter {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'value')
  String? value;

  PurpleTagFilter({required this.key, this.value});

  factory PurpleTagFilter.fromJson(Map<String, dynamic> json) =>
      _$PurpleTagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTagFilterToJson(this);
}

@JsonSerializable()
class PurpleAzureDevOps {
  @JsonKey(name: 'accessTokenRef')
  PurpleAccessTokenRef accessTokenRef;
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'teamProject')
  String teamProject;

  PurpleAzureDevOps({
    required this.accessTokenRef,
    this.allBranches,
    this.api,
    required this.organization,
    required this.teamProject,
  });

  factory PurpleAzureDevOps.fromJson(Map<String, dynamic> json) =>
      _$PurpleAzureDevOpsFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAzureDevOpsToJson(this);
}

@JsonSerializable()
class PurpleAccessTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  PurpleAccessTokenRef({required this.key, required this.secretName});

  factory PurpleAccessTokenRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleAccessTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAccessTokenRefToJson(this);
}

@JsonSerializable()
class FluffyBitbucket {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'appPasswordRef')
  PurpleAppPasswordRef appPasswordRef;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'user')
  String user;

  FluffyBitbucket({
    this.allBranches,
    required this.appPasswordRef,
    required this.owner,
    required this.user,
  });

  factory FluffyBitbucket.fromJson(Map<String, dynamic> json) =>
      _$FluffyBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBitbucketToJson(this);
}

@JsonSerializable()
class PurpleAppPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  PurpleAppPasswordRef({required this.key, required this.secretName});

  factory PurpleAppPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$PurpleAppPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAppPasswordRefToJson(this);
}

@JsonSerializable()
class FluffyBitbucketServer {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  TentacledBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  TentacledBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  TentacledCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;

  FluffyBitbucketServer({
    this.allBranches,
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
  });

  factory FluffyBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$FluffyBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyBitbucketServerToJson(this);
}

@JsonSerializable()
class TentacledBasicAuth {
  @JsonKey(name: 'passwordRef')
  TentacledPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  TentacledBasicAuth({required this.passwordRef, required this.username});

  factory TentacledBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$TentacledBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBasicAuthToJson(this);
}

@JsonSerializable()
class TentacledPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TentacledPasswordRef({required this.key, required this.secretName});

  factory TentacledPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPasswordRefToJson(this);
}

@JsonSerializable()
class TentacledBearerToken {
  @JsonKey(name: 'tokenRef')
  HilariousTokenRef tokenRef;

  TentacledBearerToken({required this.tokenRef});

  factory TentacledBearerToken.fromJson(Map<String, dynamic> json) =>
      _$TentacledBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBearerTokenToJson(this);
}

@JsonSerializable()
class HilariousTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  HilariousTokenRef({required this.key, required this.secretName});

  factory HilariousTokenRef.fromJson(Map<String, dynamic> json) =>
      _$HilariousTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousTokenRefToJson(this);
}

@JsonSerializable()
class TentacledCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  TentacledCaRef({required this.configMapName, required this.key});

  factory TentacledCaRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledCaRefToJson(this);
}

@JsonSerializable()
class FluffyFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'labelMatch')
  String? labelMatch;
  @JsonKey(name: 'pathsDoNotExist')
  List<String?>? pathsDoNotExist;
  @JsonKey(name: 'pathsExist')
  List<String?>? pathsExist;
  @JsonKey(name: 'repositoryMatch')
  String? repositoryMatch;

  FluffyFilter({
    this.branchMatch,
    this.labelMatch,
    this.pathsDoNotExist,
    this.pathsExist,
    this.repositoryMatch,
  });

  factory FluffyFilter.fromJson(Map<String, dynamic> json) =>
      _$FluffyFilterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyFilterToJson(this);
}

@JsonSerializable()
class FluffyGitea {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'tokenRef')
  AmbitiousTokenRef? tokenRef;

  FluffyGitea({
    this.allBranches,
    required this.api,
    this.insecure,
    required this.owner,
    this.tokenRef,
  });

  factory FluffyGitea.fromJson(Map<String, dynamic> json) =>
      _$FluffyGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyGiteaToJson(this);
}

@JsonSerializable()
class AmbitiousTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  AmbitiousTokenRef({required this.key, required this.secretName});

  factory AmbitiousTokenRef.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousTokenRefToJson(this);
}

@JsonSerializable()
class FluffyGithub {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'tokenRef')
  CunningTokenRef? tokenRef;

  FluffyGithub({
    this.allBranches,
    this.api,
    this.appSecretName,
    required this.organization,
    this.tokenRef,
  });

  factory FluffyGithub.fromJson(Map<String, dynamic> json) =>
      _$FluffyGithubFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyGithubToJson(this);
}

@JsonSerializable()
class CunningTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  CunningTokenRef({required this.key, required this.secretName});

  factory CunningTokenRef.fromJson(Map<String, dynamic> json) =>
      _$CunningTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$CunningTokenRefToJson(this);
}

@JsonSerializable()
class FluffyGitlab {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  StickyCaRef? caRef;
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'includeSharedProjects')
  bool? includeSharedProjects;
  @JsonKey(name: 'includeSubgroups')
  bool? includeSubgroups;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'tokenRef')
  MagentaTokenRef? tokenRef;
  @JsonKey(name: 'topic')
  String? topic;

  FluffyGitlab({
    this.allBranches,
    this.api,
    this.caRef,
    required this.group,
    this.includeSharedProjects,
    this.includeSubgroups,
    this.insecure,
    this.tokenRef,
    this.topic,
  });

  factory FluffyGitlab.fromJson(Map<String, dynamic> json) =>
      _$FluffyGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyGitlabToJson(this);
}

@JsonSerializable()
class StickyCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  StickyCaRef({required this.configMapName, required this.key});

  factory StickyCaRef.fromJson(Map<String, dynamic> json) =>
      _$StickyCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$StickyCaRefToJson(this);
}

@JsonSerializable()
class MagentaTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  MagentaTokenRef({required this.key, required this.secretName});

  factory MagentaTokenRef.fromJson(Map<String, dynamic> json) =>
      _$MagentaTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaTokenRefToJson(this);
}

@JsonSerializable()
class FriskyTemplate {
  @JsonKey(name: 'metadata')
  FriskyMetadata metadata;
  @JsonKey(name: 'spec')
  FriskySpec spec;

  FriskyTemplate({required this.metadata, required this.spec});

  factory FriskyTemplate.fromJson(Map<String, dynamic> json) =>
      _$FriskyTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyTemplateToJson(this);
}

@JsonSerializable()
class FriskyMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  FriskyMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory FriskyMetadata.fromJson(Map<String, dynamic> json) =>
      _$FriskyMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyMetadataToJson(this);
}

@JsonSerializable()
class FriskySpec {
  @JsonKey(name: 'destination')
  FriskyDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<FriskyIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<FriskyInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source8? source;
  @JsonKey(name: 'sourceHydrator')
  FriskySourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source9?>? sources;
  @JsonKey(name: 'syncPolicy')
  FriskySyncPolicy? syncPolicy;

  FriskySpec({
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

  factory FriskySpec.fromJson(Map<String, dynamic> json) =>
      _$FriskySpecFromJson(json);

  Map<String, dynamic> toJson() => _$FriskySpecToJson(this);
}

@JsonSerializable()
class FriskyDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  FriskyDestination({this.name, this.namespace, this.server});

  factory FriskyDestination.fromJson(Map<String, dynamic> json) =>
      _$FriskyDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyDestinationToJson(this);
}

@JsonSerializable()
class FriskyIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  FriskyIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory FriskyIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$FriskyIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class FriskyInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  FriskyInfo({required this.name, required this.value});

  factory FriskyInfo.fromJson(Map<String, dynamic> json) =>
      _$FriskyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyInfoToJson(this);
}

@JsonSerializable()
class Source8 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory10? directory;
  @JsonKey(name: 'helm')
  Helm8? helm;
  @JsonKey(name: 'kustomize')
  Kustomize8? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin9? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source8({
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

  factory Source8.fromJson(Map<String, dynamic> json) =>
      _$Source8FromJson(json);

  Map<String, dynamic> toJson() => _$Source8ToJson(this);
}

@JsonSerializable()
class Directory10 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet8? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory10({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory10.fromJson(Map<String, dynamic> json) =>
      _$Directory10FromJson(json);

  Map<String, dynamic> toJson() => _$Directory10ToJson(this);
}

@JsonSerializable()
class Jsonnet8 {
  @JsonKey(name: 'extVars')
  List<ExtVar8?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas8?>? tlas;

  Jsonnet8({this.extVars, this.libs, this.tlas});

  factory Jsonnet8.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet8FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet8ToJson(this);
}

@JsonSerializable()
class ExtVar8 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar8({this.code, required this.name, required this.value});

  factory ExtVar8.fromJson(Map<String, dynamic> json) =>
      _$ExtVar8FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar8ToJson(this);
}

@JsonSerializable()
class Tlas8 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas8({this.code, required this.name, required this.value});

  factory Tlas8.fromJson(Map<String, dynamic> json) => _$Tlas8FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas8ToJson(this);
}

@JsonSerializable()
class Helm8 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter8?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter28?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm8({
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

  factory Helm8.fromJson(Map<String, dynamic> json) => _$Helm8FromJson(json);

  Map<String, dynamic> toJson() => _$Helm8ToJson(this);
}

@JsonSerializable()
class FileParameter8 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter8({this.name, this.path});

  factory FileParameter8.fromJson(Map<String, dynamic> json) =>
      _$FileParameter8FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter8ToJson(this);
}

@JsonSerializable()
class Parameter28 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter28({this.forceString, this.name, this.value});

  factory Parameter28.fromJson(Map<String, dynamic> json) =>
      _$Parameter28FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter28ToJson(this);
}

@JsonSerializable()
class Kustomize8 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch8?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica8?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize8({
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

  factory Kustomize8.fromJson(Map<String, dynamic> json) =>
      _$Kustomize8FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize8ToJson(this);
}

@JsonSerializable()
class Patch8 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target8? target;

  Patch8({this.options, this.patch, this.path, this.target});

  factory Patch8.fromJson(Map<String, dynamic> json) => _$Patch8FromJson(json);

  Map<String, dynamic> toJson() => _$Patch8ToJson(this);
}

@JsonSerializable()
class Target8 {
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

  Target8({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target8.fromJson(Map<String, dynamic> json) =>
      _$Target8FromJson(json);

  Map<String, dynamic> toJson() => _$Target8ToJson(this);
}

@JsonSerializable()
class Replica8 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica8({required this.count, required this.name});

  factory Replica8.fromJson(Map<String, dynamic> json) =>
      _$Replica8FromJson(json);

  Map<String, dynamic> toJson() => _$Replica8ToJson(this);
}

@JsonSerializable()
class Plugin9 {
  @JsonKey(name: 'env')
  List<Env8?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter29?>? parameters;

  Plugin9({this.env, this.name, this.parameters});

  factory Plugin9.fromJson(Map<String, dynamic> json) =>
      _$Plugin9FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin9ToJson(this);
}

@JsonSerializable()
class Env8 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env8({required this.name, required this.value});

  factory Env8.fromJson(Map<String, dynamic> json) => _$Env8FromJson(json);

  Map<String, dynamic> toJson() => _$Env8ToJson(this);
}

@JsonSerializable()
class Parameter29 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter29({this.array, this.map, this.name, this.string});

  factory Parameter29.fromJson(Map<String, dynamic> json) =>
      _$Parameter29FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter29ToJson(this);
}

@JsonSerializable()
class FriskySourceHydrator {
  @JsonKey(name: 'drySource')
  FriskyDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  FriskyHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  FriskySyncSource syncSource;

  FriskySourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory FriskySourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$FriskySourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$FriskySourceHydratorToJson(this);
}

@JsonSerializable()
class FriskyDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  FriskyDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory FriskyDrySource.fromJson(Map<String, dynamic> json) =>
      _$FriskyDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyDrySourceToJson(this);
}

@JsonSerializable()
class FriskyHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FriskyHydrateTo({required this.targetBranch});

  factory FriskyHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$FriskyHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyHydrateToToJson(this);
}

@JsonSerializable()
class FriskySyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  FriskySyncSource({required this.path, required this.targetBranch});

  factory FriskySyncSource.fromJson(Map<String, dynamic> json) =>
      _$FriskySyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FriskySyncSourceToJson(this);
}

@JsonSerializable()
class Source9 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory11? directory;
  @JsonKey(name: 'helm')
  Helm9? helm;
  @JsonKey(name: 'kustomize')
  Kustomize9? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin10? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source9({
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

  factory Source9.fromJson(Map<String, dynamic> json) =>
      _$Source9FromJson(json);

  Map<String, dynamic> toJson() => _$Source9ToJson(this);
}

@JsonSerializable()
class Directory11 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet9? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory11({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory11.fromJson(Map<String, dynamic> json) =>
      _$Directory11FromJson(json);

  Map<String, dynamic> toJson() => _$Directory11ToJson(this);
}

@JsonSerializable()
class Jsonnet9 {
  @JsonKey(name: 'extVars')
  List<ExtVar9?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas9?>? tlas;

  Jsonnet9({this.extVars, this.libs, this.tlas});

  factory Jsonnet9.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet9FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet9ToJson(this);
}

@JsonSerializable()
class ExtVar9 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar9({this.code, required this.name, required this.value});

  factory ExtVar9.fromJson(Map<String, dynamic> json) =>
      _$ExtVar9FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar9ToJson(this);
}

@JsonSerializable()
class Tlas9 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas9({this.code, required this.name, required this.value});

  factory Tlas9.fromJson(Map<String, dynamic> json) => _$Tlas9FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas9ToJson(this);
}

@JsonSerializable()
class Helm9 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter9?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter30?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm9({
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

  factory Helm9.fromJson(Map<String, dynamic> json) => _$Helm9FromJson(json);

  Map<String, dynamic> toJson() => _$Helm9ToJson(this);
}

@JsonSerializable()
class FileParameter9 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter9({this.name, this.path});

  factory FileParameter9.fromJson(Map<String, dynamic> json) =>
      _$FileParameter9FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter9ToJson(this);
}

@JsonSerializable()
class Parameter30 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter30({this.forceString, this.name, this.value});

  factory Parameter30.fromJson(Map<String, dynamic> json) =>
      _$Parameter30FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter30ToJson(this);
}

@JsonSerializable()
class Kustomize9 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch9?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica9?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize9({
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

  factory Kustomize9.fromJson(Map<String, dynamic> json) =>
      _$Kustomize9FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize9ToJson(this);
}

@JsonSerializable()
class Patch9 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target9? target;

  Patch9({this.options, this.patch, this.path, this.target});

  factory Patch9.fromJson(Map<String, dynamic> json) => _$Patch9FromJson(json);

  Map<String, dynamic> toJson() => _$Patch9ToJson(this);
}

@JsonSerializable()
class Target9 {
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

  Target9({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target9.fromJson(Map<String, dynamic> json) =>
      _$Target9FromJson(json);

  Map<String, dynamic> toJson() => _$Target9ToJson(this);
}

@JsonSerializable()
class Replica9 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica9({required this.count, required this.name});

  factory Replica9.fromJson(Map<String, dynamic> json) =>
      _$Replica9FromJson(json);

  Map<String, dynamic> toJson() => _$Replica9ToJson(this);
}

@JsonSerializable()
class Plugin10 {
  @JsonKey(name: 'env')
  List<Env9?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter31?>? parameters;

  Plugin10({this.env, this.name, this.parameters});

  factory Plugin10.fromJson(Map<String, dynamic> json) =>
      _$Plugin10FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin10ToJson(this);
}

@JsonSerializable()
class Env9 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env9({required this.name, required this.value});

  factory Env9.fromJson(Map<String, dynamic> json) => _$Env9FromJson(json);

  Map<String, dynamic> toJson() => _$Env9ToJson(this);
}

@JsonSerializable()
class Parameter31 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter31({this.array, this.map, this.name, this.string});

  factory Parameter31.fromJson(Map<String, dynamic> json) =>
      _$Parameter31FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter31ToJson(this);
}

@JsonSerializable()
class FriskySyncPolicy {
  @JsonKey(name: 'automated')
  FriskyAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  FriskyManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  FriskyRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  FriskySyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory FriskySyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$FriskySyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$FriskySyncPolicyToJson(this);
}

@JsonSerializable()
class FriskyAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  FriskyAutomated({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory FriskyAutomated.fromJson(Map<String, dynamic> json) =>
      _$FriskyAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyAutomatedToJson(this);
}

@JsonSerializable()
class FriskyManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  FriskyManagedNamespaceMetadata({this.annotations, this.labels});

  factory FriskyManagedNamespaceMetadata.fromJson(Map<String, dynamic> json) =>
      _$FriskyManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class FriskyRetry {
  @JsonKey(name: 'backoff')
  FriskyBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  FriskyRetry({this.backoff, this.limit, this.refresh});

  factory FriskyRetry.fromJson(Map<String, dynamic> json) =>
      _$FriskyRetryFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyRetryToJson(this);
}

@JsonSerializable()
class FriskyBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  FriskyBackoff({this.duration, this.factor, this.maxDuration});

  factory FriskyBackoff.fromJson(Map<String, dynamic> json) =>
      _$FriskyBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyBackoffToJson(this);
}

@JsonSerializable()
class TentacledSelector {
  @JsonKey(name: 'matchExpressions')
  List<IndigoMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledSelector({this.matchExpressions, this.matchLabels});

  factory TentacledSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSelectorToJson(this);
}

@JsonSerializable()
class IndigoMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class MatrixTemplate {
  @JsonKey(name: 'metadata')
  MischievousMetadata metadata;
  @JsonKey(name: 'spec')
  MischievousSpec spec;

  MatrixTemplate({required this.metadata, required this.spec});

  factory MatrixTemplate.fromJson(Map<String, dynamic> json) =>
      _$MatrixTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MatrixTemplateToJson(this);
}

@JsonSerializable()
class MischievousMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  MischievousMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory MischievousMetadata.fromJson(Map<String, dynamic> json) =>
      _$MischievousMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousMetadataToJson(this);
}

@JsonSerializable()
class MischievousSpec {
  @JsonKey(name: 'destination')
  MischievousDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<MischievousIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<MischievousInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source10? source;
  @JsonKey(name: 'sourceHydrator')
  MischievousSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source11?>? sources;
  @JsonKey(name: 'syncPolicy')
  MischievousSyncPolicy? syncPolicy;

  MischievousSpec({
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

  factory MischievousSpec.fromJson(Map<String, dynamic> json) =>
      _$MischievousSpecFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousSpecToJson(this);
}

@JsonSerializable()
class MischievousDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  MischievousDestination({this.name, this.namespace, this.server});

  factory MischievousDestination.fromJson(Map<String, dynamic> json) =>
      _$MischievousDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousDestinationToJson(this);
}

@JsonSerializable()
class MischievousIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  MischievousIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory MischievousIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$MischievousIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class MischievousInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  MischievousInfo({required this.name, required this.value});

  factory MischievousInfo.fromJson(Map<String, dynamic> json) =>
      _$MischievousInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousInfoToJson(this);
}

@JsonSerializable()
class Source10 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory12? directory;
  @JsonKey(name: 'helm')
  Helm10? helm;
  @JsonKey(name: 'kustomize')
  Kustomize10? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin11? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source10({
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

  factory Source10.fromJson(Map<String, dynamic> json) =>
      _$Source10FromJson(json);

  Map<String, dynamic> toJson() => _$Source10ToJson(this);
}

@JsonSerializable()
class Directory12 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet10? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory12({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory12.fromJson(Map<String, dynamic> json) =>
      _$Directory12FromJson(json);

  Map<String, dynamic> toJson() => _$Directory12ToJson(this);
}

@JsonSerializable()
class Jsonnet10 {
  @JsonKey(name: 'extVars')
  List<ExtVar10?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas10?>? tlas;

  Jsonnet10({this.extVars, this.libs, this.tlas});

  factory Jsonnet10.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet10FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet10ToJson(this);
}

@JsonSerializable()
class ExtVar10 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar10({this.code, required this.name, required this.value});

  factory ExtVar10.fromJson(Map<String, dynamic> json) =>
      _$ExtVar10FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar10ToJson(this);
}

@JsonSerializable()
class Tlas10 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas10({this.code, required this.name, required this.value});

  factory Tlas10.fromJson(Map<String, dynamic> json) => _$Tlas10FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas10ToJson(this);
}

@JsonSerializable()
class Helm10 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter10?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter32?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm10({
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

  factory Helm10.fromJson(Map<String, dynamic> json) => _$Helm10FromJson(json);

  Map<String, dynamic> toJson() => _$Helm10ToJson(this);
}

@JsonSerializable()
class FileParameter10 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter10({this.name, this.path});

  factory FileParameter10.fromJson(Map<String, dynamic> json) =>
      _$FileParameter10FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter10ToJson(this);
}

@JsonSerializable()
class Parameter32 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter32({this.forceString, this.name, this.value});

  factory Parameter32.fromJson(Map<String, dynamic> json) =>
      _$Parameter32FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter32ToJson(this);
}

@JsonSerializable()
class Kustomize10 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch10?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica10?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize10({
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

  factory Kustomize10.fromJson(Map<String, dynamic> json) =>
      _$Kustomize10FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize10ToJson(this);
}

@JsonSerializable()
class Patch10 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target10? target;

  Patch10({this.options, this.patch, this.path, this.target});

  factory Patch10.fromJson(Map<String, dynamic> json) =>
      _$Patch10FromJson(json);

  Map<String, dynamic> toJson() => _$Patch10ToJson(this);
}

@JsonSerializable()
class Target10 {
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

  Target10({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target10.fromJson(Map<String, dynamic> json) =>
      _$Target10FromJson(json);

  Map<String, dynamic> toJson() => _$Target10ToJson(this);
}

@JsonSerializable()
class Replica10 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica10({required this.count, required this.name});

  factory Replica10.fromJson(Map<String, dynamic> json) =>
      _$Replica10FromJson(json);

  Map<String, dynamic> toJson() => _$Replica10ToJson(this);
}

@JsonSerializable()
class Plugin11 {
  @JsonKey(name: 'env')
  List<Env10?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter33?>? parameters;

  Plugin11({this.env, this.name, this.parameters});

  factory Plugin11.fromJson(Map<String, dynamic> json) =>
      _$Plugin11FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin11ToJson(this);
}

@JsonSerializable()
class Env10 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env10({required this.name, required this.value});

  factory Env10.fromJson(Map<String, dynamic> json) => _$Env10FromJson(json);

  Map<String, dynamic> toJson() => _$Env10ToJson(this);
}

@JsonSerializable()
class Parameter33 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter33({this.array, this.map, this.name, this.string});

  factory Parameter33.fromJson(Map<String, dynamic> json) =>
      _$Parameter33FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter33ToJson(this);
}

@JsonSerializable()
class MischievousSourceHydrator {
  @JsonKey(name: 'drySource')
  MischievousDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  MischievousHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  MischievousSyncSource syncSource;

  MischievousSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory MischievousSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$MischievousSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousSourceHydratorToJson(this);
}

@JsonSerializable()
class MischievousDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  MischievousDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory MischievousDrySource.fromJson(Map<String, dynamic> json) =>
      _$MischievousDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousDrySourceToJson(this);
}

@JsonSerializable()
class MischievousHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  MischievousHydrateTo({required this.targetBranch});

  factory MischievousHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$MischievousHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousHydrateToToJson(this);
}

@JsonSerializable()
class MischievousSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  MischievousSyncSource({required this.path, required this.targetBranch});

  factory MischievousSyncSource.fromJson(Map<String, dynamic> json) =>
      _$MischievousSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousSyncSourceToJson(this);
}

@JsonSerializable()
class Source11 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory13? directory;
  @JsonKey(name: 'helm')
  Helm11? helm;
  @JsonKey(name: 'kustomize')
  Kustomize11? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin12? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source11({
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

  factory Source11.fromJson(Map<String, dynamic> json) =>
      _$Source11FromJson(json);

  Map<String, dynamic> toJson() => _$Source11ToJson(this);
}

@JsonSerializable()
class Directory13 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet11? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory13({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory13.fromJson(Map<String, dynamic> json) =>
      _$Directory13FromJson(json);

  Map<String, dynamic> toJson() => _$Directory13ToJson(this);
}

@JsonSerializable()
class Jsonnet11 {
  @JsonKey(name: 'extVars')
  List<ExtVar11?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas11?>? tlas;

  Jsonnet11({this.extVars, this.libs, this.tlas});

  factory Jsonnet11.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet11FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet11ToJson(this);
}

@JsonSerializable()
class ExtVar11 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar11({this.code, required this.name, required this.value});

  factory ExtVar11.fromJson(Map<String, dynamic> json) =>
      _$ExtVar11FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar11ToJson(this);
}

@JsonSerializable()
class Tlas11 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas11({this.code, required this.name, required this.value});

  factory Tlas11.fromJson(Map<String, dynamic> json) => _$Tlas11FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas11ToJson(this);
}

@JsonSerializable()
class Helm11 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter11?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter34?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm11({
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

  factory Helm11.fromJson(Map<String, dynamic> json) => _$Helm11FromJson(json);

  Map<String, dynamic> toJson() => _$Helm11ToJson(this);
}

@JsonSerializable()
class FileParameter11 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter11({this.name, this.path});

  factory FileParameter11.fromJson(Map<String, dynamic> json) =>
      _$FileParameter11FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter11ToJson(this);
}

@JsonSerializable()
class Parameter34 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter34({this.forceString, this.name, this.value});

  factory Parameter34.fromJson(Map<String, dynamic> json) =>
      _$Parameter34FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter34ToJson(this);
}

@JsonSerializable()
class Kustomize11 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch11?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica11?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize11({
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

  factory Kustomize11.fromJson(Map<String, dynamic> json) =>
      _$Kustomize11FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize11ToJson(this);
}

@JsonSerializable()
class Patch11 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target11? target;

  Patch11({this.options, this.patch, this.path, this.target});

  factory Patch11.fromJson(Map<String, dynamic> json) =>
      _$Patch11FromJson(json);

  Map<String, dynamic> toJson() => _$Patch11ToJson(this);
}

@JsonSerializable()
class Target11 {
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

  Target11({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target11.fromJson(Map<String, dynamic> json) =>
      _$Target11FromJson(json);

  Map<String, dynamic> toJson() => _$Target11ToJson(this);
}

@JsonSerializable()
class Replica11 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica11({required this.count, required this.name});

  factory Replica11.fromJson(Map<String, dynamic> json) =>
      _$Replica11FromJson(json);

  Map<String, dynamic> toJson() => _$Replica11ToJson(this);
}

@JsonSerializable()
class Plugin12 {
  @JsonKey(name: 'env')
  List<Env11?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter35?>? parameters;

  Plugin12({this.env, this.name, this.parameters});

  factory Plugin12.fromJson(Map<String, dynamic> json) =>
      _$Plugin12FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin12ToJson(this);
}

@JsonSerializable()
class Env11 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env11({required this.name, required this.value});

  factory Env11.fromJson(Map<String, dynamic> json) => _$Env11FromJson(json);

  Map<String, dynamic> toJson() => _$Env11ToJson(this);
}

@JsonSerializable()
class Parameter35 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter35({this.array, this.map, this.name, this.string});

  factory Parameter35.fromJson(Map<String, dynamic> json) =>
      _$Parameter35FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter35ToJson(this);
}

@JsonSerializable()
class MischievousSyncPolicy {
  @JsonKey(name: 'automated')
  MischievousAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  MischievousManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  MischievousRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  MischievousSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory MischievousSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$MischievousSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousSyncPolicyToJson(this);
}

@JsonSerializable()
class MischievousAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  MischievousAutomated({
    this.allowEmpty,
    this.enabled,
    this.prune,
    this.selfHeal,
  });

  factory MischievousAutomated.fromJson(Map<String, dynamic> json) =>
      _$MischievousAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousAutomatedToJson(this);
}

@JsonSerializable()
class MischievousManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  MischievousManagedNamespaceMetadata({this.annotations, this.labels});

  factory MischievousManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$MischievousManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MischievousManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class MischievousRetry {
  @JsonKey(name: 'backoff')
  MischievousBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  MischievousRetry({this.backoff, this.limit, this.refresh});

  factory MischievousRetry.fromJson(Map<String, dynamic> json) =>
      _$MischievousRetryFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousRetryToJson(this);
}

@JsonSerializable()
class MischievousBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  MischievousBackoff({this.duration, this.factor, this.maxDuration});

  factory MischievousBackoff.fromJson(Map<String, dynamic> json) =>
      _$MischievousBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousBackoffToJson(this);
}

@JsonSerializable()
class Merge {
  @JsonKey(name: 'generators')
  List<MergeGenerator?> generators;
  @JsonKey(name: 'mergeKeys')
  List<String?> mergeKeys;
  @JsonKey(name: 'template')
  MergeTemplate? template;

  Merge({required this.generators, required this.mergeKeys, this.template});

  factory Merge.fromJson(Map<String, dynamic> json) => _$MergeFromJson(json);

  Map<String, dynamic> toJson() => _$MergeToJson(this);
}

@JsonSerializable()
class MergeGenerator {
  @JsonKey(name: 'clusterDecisionResource')
  TentacledClusterDecisionResource? clusterDecisionResource;
  @JsonKey(name: 'clusters')
  TentacledClusters? clusters;
  @JsonKey(name: 'git')
  TentacledGit? git;
  @JsonKey(name: 'list')
  TentacledList? list;
  @JsonKey(name: 'matrix')
  dynamic matrix;
  @JsonKey(name: 'merge')
  dynamic merge;
  @JsonKey(name: 'plugin')
  Plugin21? plugin;
  @JsonKey(name: 'pullRequest')
  FluffyPullRequest? pullRequest;
  @JsonKey(name: 'scmProvider')
  FluffyScmProvider? scmProvider;
  @JsonKey(name: 'selector')
  IndigoSelector? selector;

  MergeGenerator({
    this.clusterDecisionResource,
    this.clusters,
    this.git,
    this.list,
    this.matrix,
    this.merge,
    this.plugin,
    this.pullRequest,
    this.scmProvider,
    this.selector,
  });

  factory MergeGenerator.fromJson(Map<String, dynamic> json) =>
      _$MergeGeneratorFromJson(json);

  Map<String, dynamic> toJson() => _$MergeGeneratorToJson(this);
}

@JsonSerializable()
class TentacledClusterDecisionResource {
  @JsonKey(name: 'configMapRef')
  String configMapRef;
  @JsonKey(name: 'labelSelector')
  TentacledLabelSelector? labelSelector;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  MischievousTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  TentacledClusterDecisionResource({
    required this.configMapRef,
    this.labelSelector,
    this.name,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory TentacledClusterDecisionResource.fromJson(
    Map<String, dynamic> json,
  ) => _$TentacledClusterDecisionResourceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TentacledClusterDecisionResourceToJson(this);
}

@JsonSerializable()
class TentacledLabelSelector {
  @JsonKey(name: 'matchExpressions')
  List<IndecentMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledLabelSelector({this.matchExpressions, this.matchLabels});

  factory TentacledLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledLabelSelectorToJson(this);
}

@JsonSerializable()
class IndecentMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class MischievousTemplate {
  @JsonKey(name: 'metadata')
  BraggadociousMetadata metadata;
  @JsonKey(name: 'spec')
  BraggadociousSpec spec;

  MischievousTemplate({required this.metadata, required this.spec});

  factory MischievousTemplate.fromJson(Map<String, dynamic> json) =>
      _$MischievousTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousTemplateToJson(this);
}

@JsonSerializable()
class BraggadociousMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  BraggadociousMetadata({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory BraggadociousMetadata.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousMetadataToJson(this);
}

@JsonSerializable()
class BraggadociousSpec {
  @JsonKey(name: 'destination')
  BraggadociousDestination destination;
  @JsonKey(name: 'ignoreDifferences')
  List<BraggadociousIgnoreDifference?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<BraggadociousInfo?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source12? source;
  @JsonKey(name: 'sourceHydrator')
  BraggadociousSourceHydrator? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source13?>? sources;
  @JsonKey(name: 'syncPolicy')
  BraggadociousSyncPolicy? syncPolicy;

  BraggadociousSpec({
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

  factory BraggadociousSpec.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousSpecFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousSpecToJson(this);
}

@JsonSerializable()
class BraggadociousDestination {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  BraggadociousDestination({this.name, this.namespace, this.server});

  factory BraggadociousDestination.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousDestinationToJson(this);
}

@JsonSerializable()
class BraggadociousIgnoreDifference {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  BraggadociousIgnoreDifference({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory BraggadociousIgnoreDifference.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousIgnoreDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousIgnoreDifferenceToJson(this);
}

@JsonSerializable()
class BraggadociousInfo {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  BraggadociousInfo({required this.name, required this.value});

  factory BraggadociousInfo.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousInfoToJson(this);
}

@JsonSerializable()
class Source12 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory14? directory;
  @JsonKey(name: 'helm')
  Helm12? helm;
  @JsonKey(name: 'kustomize')
  Kustomize12? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin13? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source12({
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

  factory Source12.fromJson(Map<String, dynamic> json) =>
      _$Source12FromJson(json);

  Map<String, dynamic> toJson() => _$Source12ToJson(this);
}

@JsonSerializable()
class Directory14 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet12? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory14({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory14.fromJson(Map<String, dynamic> json) =>
      _$Directory14FromJson(json);

  Map<String, dynamic> toJson() => _$Directory14ToJson(this);
}

@JsonSerializable()
class Jsonnet12 {
  @JsonKey(name: 'extVars')
  List<ExtVar12?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas12?>? tlas;

  Jsonnet12({this.extVars, this.libs, this.tlas});

  factory Jsonnet12.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet12FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet12ToJson(this);
}

@JsonSerializable()
class ExtVar12 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar12({this.code, required this.name, required this.value});

  factory ExtVar12.fromJson(Map<String, dynamic> json) =>
      _$ExtVar12FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar12ToJson(this);
}

@JsonSerializable()
class Tlas12 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas12({this.code, required this.name, required this.value});

  factory Tlas12.fromJson(Map<String, dynamic> json) => _$Tlas12FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas12ToJson(this);
}

@JsonSerializable()
class Helm12 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter12?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter36?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm12({
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

  factory Helm12.fromJson(Map<String, dynamic> json) => _$Helm12FromJson(json);

  Map<String, dynamic> toJson() => _$Helm12ToJson(this);
}

@JsonSerializable()
class FileParameter12 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter12({this.name, this.path});

  factory FileParameter12.fromJson(Map<String, dynamic> json) =>
      _$FileParameter12FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter12ToJson(this);
}

@JsonSerializable()
class Parameter36 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter36({this.forceString, this.name, this.value});

  factory Parameter36.fromJson(Map<String, dynamic> json) =>
      _$Parameter36FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter36ToJson(this);
}

@JsonSerializable()
class Kustomize12 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch12?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica12?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize12({
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

  factory Kustomize12.fromJson(Map<String, dynamic> json) =>
      _$Kustomize12FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize12ToJson(this);
}

@JsonSerializable()
class Patch12 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target12? target;

  Patch12({this.options, this.patch, this.path, this.target});

  factory Patch12.fromJson(Map<String, dynamic> json) =>
      _$Patch12FromJson(json);

  Map<String, dynamic> toJson() => _$Patch12ToJson(this);
}

@JsonSerializable()
class Target12 {
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

  Target12({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target12.fromJson(Map<String, dynamic> json) =>
      _$Target12FromJson(json);

  Map<String, dynamic> toJson() => _$Target12ToJson(this);
}

@JsonSerializable()
class Replica12 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica12({required this.count, required this.name});

  factory Replica12.fromJson(Map<String, dynamic> json) =>
      _$Replica12FromJson(json);

  Map<String, dynamic> toJson() => _$Replica12ToJson(this);
}

@JsonSerializable()
class Plugin13 {
  @JsonKey(name: 'env')
  List<Env12?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter37?>? parameters;

  Plugin13({this.env, this.name, this.parameters});

  factory Plugin13.fromJson(Map<String, dynamic> json) =>
      _$Plugin13FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin13ToJson(this);
}

@JsonSerializable()
class Env12 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env12({required this.name, required this.value});

  factory Env12.fromJson(Map<String, dynamic> json) => _$Env12FromJson(json);

  Map<String, dynamic> toJson() => _$Env12ToJson(this);
}

@JsonSerializable()
class Parameter37 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter37({this.array, this.map, this.name, this.string});

  factory Parameter37.fromJson(Map<String, dynamic> json) =>
      _$Parameter37FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter37ToJson(this);
}

@JsonSerializable()
class BraggadociousSourceHydrator {
  @JsonKey(name: 'drySource')
  BraggadociousDrySource drySource;
  @JsonKey(name: 'hydrateTo')
  BraggadociousHydrateTo? hydrateTo;
  @JsonKey(name: 'syncSource')
  BraggadociousSyncSource syncSource;

  BraggadociousSourceHydrator({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory BraggadociousSourceHydrator.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousSourceHydratorFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousSourceHydratorToJson(this);
}

@JsonSerializable()
class BraggadociousDrySource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  BraggadociousDrySource({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory BraggadociousDrySource.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousDrySourceFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousDrySourceToJson(this);
}

@JsonSerializable()
class BraggadociousHydrateTo {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  BraggadociousHydrateTo({required this.targetBranch});

  factory BraggadociousHydrateTo.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousHydrateToFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousHydrateToToJson(this);
}

@JsonSerializable()
class BraggadociousSyncSource {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  BraggadociousSyncSource({required this.path, required this.targetBranch});

  factory BraggadociousSyncSource.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousSyncSourceFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousSyncSourceToJson(this);
}

@JsonSerializable()
class Source13 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory15? directory;
  @JsonKey(name: 'helm')
  Helm13? helm;
  @JsonKey(name: 'kustomize')
  Kustomize13? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin14? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source13({
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

  factory Source13.fromJson(Map<String, dynamic> json) =>
      _$Source13FromJson(json);

  Map<String, dynamic> toJson() => _$Source13ToJson(this);
}

@JsonSerializable()
class Directory15 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet13? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory15({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory15.fromJson(Map<String, dynamic> json) =>
      _$Directory15FromJson(json);

  Map<String, dynamic> toJson() => _$Directory15ToJson(this);
}

@JsonSerializable()
class Jsonnet13 {
  @JsonKey(name: 'extVars')
  List<ExtVar13?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas13?>? tlas;

  Jsonnet13({this.extVars, this.libs, this.tlas});

  factory Jsonnet13.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet13FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet13ToJson(this);
}

@JsonSerializable()
class ExtVar13 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar13({this.code, required this.name, required this.value});

  factory ExtVar13.fromJson(Map<String, dynamic> json) =>
      _$ExtVar13FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar13ToJson(this);
}

@JsonSerializable()
class Tlas13 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas13({this.code, required this.name, required this.value});

  factory Tlas13.fromJson(Map<String, dynamic> json) => _$Tlas13FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas13ToJson(this);
}

@JsonSerializable()
class Helm13 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter13?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter38?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm13({
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

  factory Helm13.fromJson(Map<String, dynamic> json) => _$Helm13FromJson(json);

  Map<String, dynamic> toJson() => _$Helm13ToJson(this);
}

@JsonSerializable()
class FileParameter13 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter13({this.name, this.path});

  factory FileParameter13.fromJson(Map<String, dynamic> json) =>
      _$FileParameter13FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter13ToJson(this);
}

@JsonSerializable()
class Parameter38 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter38({this.forceString, this.name, this.value});

  factory Parameter38.fromJson(Map<String, dynamic> json) =>
      _$Parameter38FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter38ToJson(this);
}

@JsonSerializable()
class Kustomize13 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch13?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica13?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize13({
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

  factory Kustomize13.fromJson(Map<String, dynamic> json) =>
      _$Kustomize13FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize13ToJson(this);
}

@JsonSerializable()
class Patch13 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target13? target;

  Patch13({this.options, this.patch, this.path, this.target});

  factory Patch13.fromJson(Map<String, dynamic> json) =>
      _$Patch13FromJson(json);

  Map<String, dynamic> toJson() => _$Patch13ToJson(this);
}

@JsonSerializable()
class Target13 {
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

  Target13({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target13.fromJson(Map<String, dynamic> json) =>
      _$Target13FromJson(json);

  Map<String, dynamic> toJson() => _$Target13ToJson(this);
}

@JsonSerializable()
class Replica13 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica13({required this.count, required this.name});

  factory Replica13.fromJson(Map<String, dynamic> json) =>
      _$Replica13FromJson(json);

  Map<String, dynamic> toJson() => _$Replica13ToJson(this);
}

@JsonSerializable()
class Plugin14 {
  @JsonKey(name: 'env')
  List<Env13?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter39?>? parameters;

  Plugin14({this.env, this.name, this.parameters});

  factory Plugin14.fromJson(Map<String, dynamic> json) =>
      _$Plugin14FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin14ToJson(this);
}

@JsonSerializable()
class Env13 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env13({required this.name, required this.value});

  factory Env13.fromJson(Map<String, dynamic> json) => _$Env13FromJson(json);

  Map<String, dynamic> toJson() => _$Env13ToJson(this);
}

@JsonSerializable()
class Parameter39 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter39({this.array, this.map, this.name, this.string});

  factory Parameter39.fromJson(Map<String, dynamic> json) =>
      _$Parameter39FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter39ToJson(this);
}

@JsonSerializable()
class BraggadociousSyncPolicy {
  @JsonKey(name: 'automated')
  BraggadociousAutomated? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  BraggadociousManagedNamespaceMetadata? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  BraggadociousRetry? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  BraggadociousSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory BraggadociousSyncPolicy.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousSyncPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousSyncPolicyToJson(this);
}

@JsonSerializable()
class BraggadociousAutomated {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  BraggadociousAutomated({
    this.allowEmpty,
    this.enabled,
    this.prune,
    this.selfHeal,
  });

  factory BraggadociousAutomated.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousAutomatedFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousAutomatedToJson(this);
}

@JsonSerializable()
class BraggadociousManagedNamespaceMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  BraggadociousManagedNamespaceMetadata({this.annotations, this.labels});

  factory BraggadociousManagedNamespaceMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$BraggadociousManagedNamespaceMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BraggadociousManagedNamespaceMetadataToJson(this);
}

@JsonSerializable()
class BraggadociousRetry {
  @JsonKey(name: 'backoff')
  BraggadociousBackoff? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  BraggadociousRetry({this.backoff, this.limit, this.refresh});

  factory BraggadociousRetry.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousRetryFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousRetryToJson(this);
}

@JsonSerializable()
class BraggadociousBackoff {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  BraggadociousBackoff({this.duration, this.factor, this.maxDuration});

  factory BraggadociousBackoff.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousBackoffFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousBackoffToJson(this);
}

@JsonSerializable()
class TentacledClusters {
  @JsonKey(name: 'flatList')
  bool? flatList;
  @JsonKey(name: 'selector')
  StickySelector? selector;
  @JsonKey(name: 'template')
  BraggadociousTemplate? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  TentacledClusters({this.flatList, this.selector, this.template, this.values});

  factory TentacledClusters.fromJson(Map<String, dynamic> json) =>
      _$TentacledClustersFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledClustersToJson(this);
}

@JsonSerializable()
class StickySelector {
  @JsonKey(name: 'matchExpressions')
  List<HilariousMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickySelector({this.matchExpressions, this.matchLabels});

  factory StickySelector.fromJson(Map<String, dynamic> json) =>
      _$StickySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickySelectorToJson(this);
}

@JsonSerializable()
class HilariousMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class BraggadociousTemplate {
  @JsonKey(name: 'metadata')
  Metadata1 metadata;
  @JsonKey(name: 'spec')
  Spec1 spec;

  BraggadociousTemplate({required this.metadata, required this.spec});

  factory BraggadociousTemplate.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousTemplateToJson(this);
}

@JsonSerializable()
class Metadata1 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata1({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata1.fromJson(Map<String, dynamic> json) =>
      _$Metadata1FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata1ToJson(this);
}

@JsonSerializable()
class Spec1 {
  @JsonKey(name: 'destination')
  Destination1 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference1?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info1?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source14? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator1? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source15?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy1? syncPolicy;

  Spec1({
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

  factory Spec1.fromJson(Map<String, dynamic> json) => _$Spec1FromJson(json);

  Map<String, dynamic> toJson() => _$Spec1ToJson(this);
}

@JsonSerializable()
class Destination1 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination1({this.name, this.namespace, this.server});

  factory Destination1.fromJson(Map<String, dynamic> json) =>
      _$Destination1FromJson(json);

  Map<String, dynamic> toJson() => _$Destination1ToJson(this);
}

@JsonSerializable()
class IgnoreDifference1 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference1({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference1.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference1FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference1ToJson(this);
}

@JsonSerializable()
class Info1 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info1({required this.name, required this.value});

  factory Info1.fromJson(Map<String, dynamic> json) => _$Info1FromJson(json);

  Map<String, dynamic> toJson() => _$Info1ToJson(this);
}

@JsonSerializable()
class Source14 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory16? directory;
  @JsonKey(name: 'helm')
  Helm14? helm;
  @JsonKey(name: 'kustomize')
  Kustomize14? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin15? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source14({
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

  factory Source14.fromJson(Map<String, dynamic> json) =>
      _$Source14FromJson(json);

  Map<String, dynamic> toJson() => _$Source14ToJson(this);
}

@JsonSerializable()
class Directory16 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet14? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory16({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory16.fromJson(Map<String, dynamic> json) =>
      _$Directory16FromJson(json);

  Map<String, dynamic> toJson() => _$Directory16ToJson(this);
}

@JsonSerializable()
class Jsonnet14 {
  @JsonKey(name: 'extVars')
  List<ExtVar14?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas14?>? tlas;

  Jsonnet14({this.extVars, this.libs, this.tlas});

  factory Jsonnet14.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet14FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet14ToJson(this);
}

@JsonSerializable()
class ExtVar14 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar14({this.code, required this.name, required this.value});

  factory ExtVar14.fromJson(Map<String, dynamic> json) =>
      _$ExtVar14FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar14ToJson(this);
}

@JsonSerializable()
class Tlas14 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas14({this.code, required this.name, required this.value});

  factory Tlas14.fromJson(Map<String, dynamic> json) => _$Tlas14FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas14ToJson(this);
}

@JsonSerializable()
class Helm14 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter14?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter40?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm14({
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

  factory Helm14.fromJson(Map<String, dynamic> json) => _$Helm14FromJson(json);

  Map<String, dynamic> toJson() => _$Helm14ToJson(this);
}

@JsonSerializable()
class FileParameter14 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter14({this.name, this.path});

  factory FileParameter14.fromJson(Map<String, dynamic> json) =>
      _$FileParameter14FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter14ToJson(this);
}

@JsonSerializable()
class Parameter40 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter40({this.forceString, this.name, this.value});

  factory Parameter40.fromJson(Map<String, dynamic> json) =>
      _$Parameter40FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter40ToJson(this);
}

@JsonSerializable()
class Kustomize14 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch14?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica14?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize14({
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

  factory Kustomize14.fromJson(Map<String, dynamic> json) =>
      _$Kustomize14FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize14ToJson(this);
}

@JsonSerializable()
class Patch14 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target14? target;

  Patch14({this.options, this.patch, this.path, this.target});

  factory Patch14.fromJson(Map<String, dynamic> json) =>
      _$Patch14FromJson(json);

  Map<String, dynamic> toJson() => _$Patch14ToJson(this);
}

@JsonSerializable()
class Target14 {
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

  Target14({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target14.fromJson(Map<String, dynamic> json) =>
      _$Target14FromJson(json);

  Map<String, dynamic> toJson() => _$Target14ToJson(this);
}

@JsonSerializable()
class Replica14 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica14({required this.count, required this.name});

  factory Replica14.fromJson(Map<String, dynamic> json) =>
      _$Replica14FromJson(json);

  Map<String, dynamic> toJson() => _$Replica14ToJson(this);
}

@JsonSerializable()
class Plugin15 {
  @JsonKey(name: 'env')
  List<Env14?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter41?>? parameters;

  Plugin15({this.env, this.name, this.parameters});

  factory Plugin15.fromJson(Map<String, dynamic> json) =>
      _$Plugin15FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin15ToJson(this);
}

@JsonSerializable()
class Env14 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env14({required this.name, required this.value});

  factory Env14.fromJson(Map<String, dynamic> json) => _$Env14FromJson(json);

  Map<String, dynamic> toJson() => _$Env14ToJson(this);
}

@JsonSerializable()
class Parameter41 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter41({this.array, this.map, this.name, this.string});

  factory Parameter41.fromJson(Map<String, dynamic> json) =>
      _$Parameter41FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter41ToJson(this);
}

@JsonSerializable()
class SourceHydrator1 {
  @JsonKey(name: 'drySource')
  DrySource1 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo1? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource1 syncSource;

  SourceHydrator1({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator1.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator1FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator1ToJson(this);
}

@JsonSerializable()
class DrySource1 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource1({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource1.fromJson(Map<String, dynamic> json) =>
      _$DrySource1FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource1ToJson(this);
}

@JsonSerializable()
class HydrateTo1 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo1({required this.targetBranch});

  factory HydrateTo1.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo1FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo1ToJson(this);
}

@JsonSerializable()
class SyncSource1 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource1({required this.path, required this.targetBranch});

  factory SyncSource1.fromJson(Map<String, dynamic> json) =>
      _$SyncSource1FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource1ToJson(this);
}

@JsonSerializable()
class Source15 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory17? directory;
  @JsonKey(name: 'helm')
  Helm15? helm;
  @JsonKey(name: 'kustomize')
  Kustomize15? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin16? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source15({
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

  factory Source15.fromJson(Map<String, dynamic> json) =>
      _$Source15FromJson(json);

  Map<String, dynamic> toJson() => _$Source15ToJson(this);
}

@JsonSerializable()
class Directory17 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet15? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory17({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory17.fromJson(Map<String, dynamic> json) =>
      _$Directory17FromJson(json);

  Map<String, dynamic> toJson() => _$Directory17ToJson(this);
}

@JsonSerializable()
class Jsonnet15 {
  @JsonKey(name: 'extVars')
  List<ExtVar15?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas15?>? tlas;

  Jsonnet15({this.extVars, this.libs, this.tlas});

  factory Jsonnet15.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet15FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet15ToJson(this);
}

@JsonSerializable()
class ExtVar15 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar15({this.code, required this.name, required this.value});

  factory ExtVar15.fromJson(Map<String, dynamic> json) =>
      _$ExtVar15FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar15ToJson(this);
}

@JsonSerializable()
class Tlas15 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas15({this.code, required this.name, required this.value});

  factory Tlas15.fromJson(Map<String, dynamic> json) => _$Tlas15FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas15ToJson(this);
}

@JsonSerializable()
class Helm15 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter15?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter42?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm15({
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

  factory Helm15.fromJson(Map<String, dynamic> json) => _$Helm15FromJson(json);

  Map<String, dynamic> toJson() => _$Helm15ToJson(this);
}

@JsonSerializable()
class FileParameter15 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter15({this.name, this.path});

  factory FileParameter15.fromJson(Map<String, dynamic> json) =>
      _$FileParameter15FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter15ToJson(this);
}

@JsonSerializable()
class Parameter42 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter42({this.forceString, this.name, this.value});

  factory Parameter42.fromJson(Map<String, dynamic> json) =>
      _$Parameter42FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter42ToJson(this);
}

@JsonSerializable()
class Kustomize15 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch15?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica15?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize15({
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

  factory Kustomize15.fromJson(Map<String, dynamic> json) =>
      _$Kustomize15FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize15ToJson(this);
}

@JsonSerializable()
class Patch15 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target15? target;

  Patch15({this.options, this.patch, this.path, this.target});

  factory Patch15.fromJson(Map<String, dynamic> json) =>
      _$Patch15FromJson(json);

  Map<String, dynamic> toJson() => _$Patch15ToJson(this);
}

@JsonSerializable()
class Target15 {
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

  Target15({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target15.fromJson(Map<String, dynamic> json) =>
      _$Target15FromJson(json);

  Map<String, dynamic> toJson() => _$Target15ToJson(this);
}

@JsonSerializable()
class Replica15 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica15({required this.count, required this.name});

  factory Replica15.fromJson(Map<String, dynamic> json) =>
      _$Replica15FromJson(json);

  Map<String, dynamic> toJson() => _$Replica15ToJson(this);
}

@JsonSerializable()
class Plugin16 {
  @JsonKey(name: 'env')
  List<Env15?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter43?>? parameters;

  Plugin16({this.env, this.name, this.parameters});

  factory Plugin16.fromJson(Map<String, dynamic> json) =>
      _$Plugin16FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin16ToJson(this);
}

@JsonSerializable()
class Env15 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env15({required this.name, required this.value});

  factory Env15.fromJson(Map<String, dynamic> json) => _$Env15FromJson(json);

  Map<String, dynamic> toJson() => _$Env15ToJson(this);
}

@JsonSerializable()
class Parameter43 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter43({this.array, this.map, this.name, this.string});

  factory Parameter43.fromJson(Map<String, dynamic> json) =>
      _$Parameter43FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter43ToJson(this);
}

@JsonSerializable()
class SyncPolicy1 {
  @JsonKey(name: 'automated')
  Automated1? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata1? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry1? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy1({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy1.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy1FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy1ToJson(this);
}

@JsonSerializable()
class Automated1 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated1({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated1.fromJson(Map<String, dynamic> json) =>
      _$Automated1FromJson(json);

  Map<String, dynamic> toJson() => _$Automated1ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata1 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata1({this.annotations, this.labels});

  factory ManagedNamespaceMetadata1.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata1FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata1ToJson(this);
}

@JsonSerializable()
class Retry1 {
  @JsonKey(name: 'backoff')
  Backoff1? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry1({this.backoff, this.limit, this.refresh});

  factory Retry1.fromJson(Map<String, dynamic> json) => _$Retry1FromJson(json);

  Map<String, dynamic> toJson() => _$Retry1ToJson(this);
}

@JsonSerializable()
class Backoff1 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff1({this.duration, this.factor, this.maxDuration});

  factory Backoff1.fromJson(Map<String, dynamic> json) =>
      _$Backoff1FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff1ToJson(this);
}

@JsonSerializable()
class TentacledGit {
  @JsonKey(name: 'directories')
  List<Directory18?>? directories;
  @JsonKey(name: 'files')
  List<TentacledFile?>? files;
  @JsonKey(name: 'pathParamPrefix')
  String? pathParamPrefix;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'revision')
  String revision;
  @JsonKey(name: 'template')
  Template1? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  TentacledGit({
    this.directories,
    this.files,
    this.pathParamPrefix,
    required this.repoUrl,
    this.requeueAfterSeconds,
    required this.revision,
    this.template,
    this.values,
  });

  factory TentacledGit.fromJson(Map<String, dynamic> json) =>
      _$TentacledGitFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledGitToJson(this);
}

@JsonSerializable()
class Directory18 {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  Directory18({this.exclude, required this.path});

  factory Directory18.fromJson(Map<String, dynamic> json) =>
      _$Directory18FromJson(json);

  Map<String, dynamic> toJson() => _$Directory18ToJson(this);
}

@JsonSerializable()
class TentacledFile {
  @JsonKey(name: 'exclude')
  bool? exclude;
  @JsonKey(name: 'path')
  String path;

  TentacledFile({this.exclude, required this.path});

  factory TentacledFile.fromJson(Map<String, dynamic> json) =>
      _$TentacledFileFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFileToJson(this);
}

@JsonSerializable()
class Template1 {
  @JsonKey(name: 'metadata')
  Metadata2 metadata;
  @JsonKey(name: 'spec')
  Spec2 spec;

  Template1({required this.metadata, required this.spec});

  factory Template1.fromJson(Map<String, dynamic> json) =>
      _$Template1FromJson(json);

  Map<String, dynamic> toJson() => _$Template1ToJson(this);
}

@JsonSerializable()
class Metadata2 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata2({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata2.fromJson(Map<String, dynamic> json) =>
      _$Metadata2FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata2ToJson(this);
}

@JsonSerializable()
class Spec2 {
  @JsonKey(name: 'destination')
  Destination2 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference2?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info2?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source16? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator2? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source17?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy2? syncPolicy;

  Spec2({
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

  factory Spec2.fromJson(Map<String, dynamic> json) => _$Spec2FromJson(json);

  Map<String, dynamic> toJson() => _$Spec2ToJson(this);
}

@JsonSerializable()
class Destination2 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination2({this.name, this.namespace, this.server});

  factory Destination2.fromJson(Map<String, dynamic> json) =>
      _$Destination2FromJson(json);

  Map<String, dynamic> toJson() => _$Destination2ToJson(this);
}

@JsonSerializable()
class IgnoreDifference2 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference2({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference2.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference2FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference2ToJson(this);
}

@JsonSerializable()
class Info2 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info2({required this.name, required this.value});

  factory Info2.fromJson(Map<String, dynamic> json) => _$Info2FromJson(json);

  Map<String, dynamic> toJson() => _$Info2ToJson(this);
}

@JsonSerializable()
class Source16 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory19? directory;
  @JsonKey(name: 'helm')
  Helm16? helm;
  @JsonKey(name: 'kustomize')
  Kustomize16? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin17? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source16({
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

  factory Source16.fromJson(Map<String, dynamic> json) =>
      _$Source16FromJson(json);

  Map<String, dynamic> toJson() => _$Source16ToJson(this);
}

@JsonSerializable()
class Directory19 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet16? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory19({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory19.fromJson(Map<String, dynamic> json) =>
      _$Directory19FromJson(json);

  Map<String, dynamic> toJson() => _$Directory19ToJson(this);
}

@JsonSerializable()
class Jsonnet16 {
  @JsonKey(name: 'extVars')
  List<ExtVar16?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas16?>? tlas;

  Jsonnet16({this.extVars, this.libs, this.tlas});

  factory Jsonnet16.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet16FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet16ToJson(this);
}

@JsonSerializable()
class ExtVar16 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar16({this.code, required this.name, required this.value});

  factory ExtVar16.fromJson(Map<String, dynamic> json) =>
      _$ExtVar16FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar16ToJson(this);
}

@JsonSerializable()
class Tlas16 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas16({this.code, required this.name, required this.value});

  factory Tlas16.fromJson(Map<String, dynamic> json) => _$Tlas16FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas16ToJson(this);
}

@JsonSerializable()
class Helm16 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter16?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter44?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm16({
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

  factory Helm16.fromJson(Map<String, dynamic> json) => _$Helm16FromJson(json);

  Map<String, dynamic> toJson() => _$Helm16ToJson(this);
}

@JsonSerializable()
class FileParameter16 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter16({this.name, this.path});

  factory FileParameter16.fromJson(Map<String, dynamic> json) =>
      _$FileParameter16FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter16ToJson(this);
}

@JsonSerializable()
class Parameter44 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter44({this.forceString, this.name, this.value});

  factory Parameter44.fromJson(Map<String, dynamic> json) =>
      _$Parameter44FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter44ToJson(this);
}

@JsonSerializable()
class Kustomize16 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch16?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica16?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize16({
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

  factory Kustomize16.fromJson(Map<String, dynamic> json) =>
      _$Kustomize16FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize16ToJson(this);
}

@JsonSerializable()
class Patch16 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target16? target;

  Patch16({this.options, this.patch, this.path, this.target});

  factory Patch16.fromJson(Map<String, dynamic> json) =>
      _$Patch16FromJson(json);

  Map<String, dynamic> toJson() => _$Patch16ToJson(this);
}

@JsonSerializable()
class Target16 {
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

  Target16({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target16.fromJson(Map<String, dynamic> json) =>
      _$Target16FromJson(json);

  Map<String, dynamic> toJson() => _$Target16ToJson(this);
}

@JsonSerializable()
class Replica16 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica16({required this.count, required this.name});

  factory Replica16.fromJson(Map<String, dynamic> json) =>
      _$Replica16FromJson(json);

  Map<String, dynamic> toJson() => _$Replica16ToJson(this);
}

@JsonSerializable()
class Plugin17 {
  @JsonKey(name: 'env')
  List<Env16?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter45?>? parameters;

  Plugin17({this.env, this.name, this.parameters});

  factory Plugin17.fromJson(Map<String, dynamic> json) =>
      _$Plugin17FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin17ToJson(this);
}

@JsonSerializable()
class Env16 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env16({required this.name, required this.value});

  factory Env16.fromJson(Map<String, dynamic> json) => _$Env16FromJson(json);

  Map<String, dynamic> toJson() => _$Env16ToJson(this);
}

@JsonSerializable()
class Parameter45 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter45({this.array, this.map, this.name, this.string});

  factory Parameter45.fromJson(Map<String, dynamic> json) =>
      _$Parameter45FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter45ToJson(this);
}

@JsonSerializable()
class SourceHydrator2 {
  @JsonKey(name: 'drySource')
  DrySource2 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo2? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource2 syncSource;

  SourceHydrator2({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator2.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator2FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator2ToJson(this);
}

@JsonSerializable()
class DrySource2 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource2({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource2.fromJson(Map<String, dynamic> json) =>
      _$DrySource2FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource2ToJson(this);
}

@JsonSerializable()
class HydrateTo2 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo2({required this.targetBranch});

  factory HydrateTo2.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo2FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo2ToJson(this);
}

@JsonSerializable()
class SyncSource2 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource2({required this.path, required this.targetBranch});

  factory SyncSource2.fromJson(Map<String, dynamic> json) =>
      _$SyncSource2FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource2ToJson(this);
}

@JsonSerializable()
class Source17 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory20? directory;
  @JsonKey(name: 'helm')
  Helm17? helm;
  @JsonKey(name: 'kustomize')
  Kustomize17? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin18? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source17({
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

  factory Source17.fromJson(Map<String, dynamic> json) =>
      _$Source17FromJson(json);

  Map<String, dynamic> toJson() => _$Source17ToJson(this);
}

@JsonSerializable()
class Directory20 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet17? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory20({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory20.fromJson(Map<String, dynamic> json) =>
      _$Directory20FromJson(json);

  Map<String, dynamic> toJson() => _$Directory20ToJson(this);
}

@JsonSerializable()
class Jsonnet17 {
  @JsonKey(name: 'extVars')
  List<ExtVar17?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas17?>? tlas;

  Jsonnet17({this.extVars, this.libs, this.tlas});

  factory Jsonnet17.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet17FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet17ToJson(this);
}

@JsonSerializable()
class ExtVar17 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar17({this.code, required this.name, required this.value});

  factory ExtVar17.fromJson(Map<String, dynamic> json) =>
      _$ExtVar17FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar17ToJson(this);
}

@JsonSerializable()
class Tlas17 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas17({this.code, required this.name, required this.value});

  factory Tlas17.fromJson(Map<String, dynamic> json) => _$Tlas17FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas17ToJson(this);
}

@JsonSerializable()
class Helm17 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter17?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter46?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm17({
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

  factory Helm17.fromJson(Map<String, dynamic> json) => _$Helm17FromJson(json);

  Map<String, dynamic> toJson() => _$Helm17ToJson(this);
}

@JsonSerializable()
class FileParameter17 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter17({this.name, this.path});

  factory FileParameter17.fromJson(Map<String, dynamic> json) =>
      _$FileParameter17FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter17ToJson(this);
}

@JsonSerializable()
class Parameter46 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter46({this.forceString, this.name, this.value});

  factory Parameter46.fromJson(Map<String, dynamic> json) =>
      _$Parameter46FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter46ToJson(this);
}

@JsonSerializable()
class Kustomize17 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch17?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica17?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize17({
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

  factory Kustomize17.fromJson(Map<String, dynamic> json) =>
      _$Kustomize17FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize17ToJson(this);
}

@JsonSerializable()
class Patch17 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target17? target;

  Patch17({this.options, this.patch, this.path, this.target});

  factory Patch17.fromJson(Map<String, dynamic> json) =>
      _$Patch17FromJson(json);

  Map<String, dynamic> toJson() => _$Patch17ToJson(this);
}

@JsonSerializable()
class Target17 {
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

  Target17({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target17.fromJson(Map<String, dynamic> json) =>
      _$Target17FromJson(json);

  Map<String, dynamic> toJson() => _$Target17ToJson(this);
}

@JsonSerializable()
class Replica17 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica17({required this.count, required this.name});

  factory Replica17.fromJson(Map<String, dynamic> json) =>
      _$Replica17FromJson(json);

  Map<String, dynamic> toJson() => _$Replica17ToJson(this);
}

@JsonSerializable()
class Plugin18 {
  @JsonKey(name: 'env')
  List<Env17?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter47?>? parameters;

  Plugin18({this.env, this.name, this.parameters});

  factory Plugin18.fromJson(Map<String, dynamic> json) =>
      _$Plugin18FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin18ToJson(this);
}

@JsonSerializable()
class Env17 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env17({required this.name, required this.value});

  factory Env17.fromJson(Map<String, dynamic> json) => _$Env17FromJson(json);

  Map<String, dynamic> toJson() => _$Env17ToJson(this);
}

@JsonSerializable()
class Parameter47 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter47({this.array, this.map, this.name, this.string});

  factory Parameter47.fromJson(Map<String, dynamic> json) =>
      _$Parameter47FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter47ToJson(this);
}

@JsonSerializable()
class SyncPolicy2 {
  @JsonKey(name: 'automated')
  Automated2? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata2? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry2? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy2({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy2.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy2FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy2ToJson(this);
}

@JsonSerializable()
class Automated2 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated2({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated2.fromJson(Map<String, dynamic> json) =>
      _$Automated2FromJson(json);

  Map<String, dynamic> toJson() => _$Automated2ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata2 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata2({this.annotations, this.labels});

  factory ManagedNamespaceMetadata2.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata2FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata2ToJson(this);
}

@JsonSerializable()
class Retry2 {
  @JsonKey(name: 'backoff')
  Backoff2? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry2({this.backoff, this.limit, this.refresh});

  factory Retry2.fromJson(Map<String, dynamic> json) => _$Retry2FromJson(json);

  Map<String, dynamic> toJson() => _$Retry2ToJson(this);
}

@JsonSerializable()
class Backoff2 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff2({this.duration, this.factor, this.maxDuration});

  factory Backoff2.fromJson(Map<String, dynamic> json) =>
      _$Backoff2FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff2ToJson(this);
}

@JsonSerializable()
class TentacledList {
  @JsonKey(name: 'elements')
  List<dynamic>? elements;
  @JsonKey(name: 'elementsYaml')
  String? elementsYaml;
  @JsonKey(name: 'template')
  Template2? template;

  TentacledList({this.elements, this.elementsYaml, this.template});

  factory TentacledList.fromJson(Map<String, dynamic> json) =>
      _$TentacledListFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledListToJson(this);
}

@JsonSerializable()
class Template2 {
  @JsonKey(name: 'metadata')
  Metadata3 metadata;
  @JsonKey(name: 'spec')
  Spec3 spec;

  Template2({required this.metadata, required this.spec});

  factory Template2.fromJson(Map<String, dynamic> json) =>
      _$Template2FromJson(json);

  Map<String, dynamic> toJson() => _$Template2ToJson(this);
}

@JsonSerializable()
class Metadata3 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata3({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata3.fromJson(Map<String, dynamic> json) =>
      _$Metadata3FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata3ToJson(this);
}

@JsonSerializable()
class Spec3 {
  @JsonKey(name: 'destination')
  Destination3 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference3?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info3?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source18? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator3? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source19?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy3? syncPolicy;

  Spec3({
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

  factory Spec3.fromJson(Map<String, dynamic> json) => _$Spec3FromJson(json);

  Map<String, dynamic> toJson() => _$Spec3ToJson(this);
}

@JsonSerializable()
class Destination3 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination3({this.name, this.namespace, this.server});

  factory Destination3.fromJson(Map<String, dynamic> json) =>
      _$Destination3FromJson(json);

  Map<String, dynamic> toJson() => _$Destination3ToJson(this);
}

@JsonSerializable()
class IgnoreDifference3 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference3({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference3.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference3FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference3ToJson(this);
}

@JsonSerializable()
class Info3 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info3({required this.name, required this.value});

  factory Info3.fromJson(Map<String, dynamic> json) => _$Info3FromJson(json);

  Map<String, dynamic> toJson() => _$Info3ToJson(this);
}

@JsonSerializable()
class Source18 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory21? directory;
  @JsonKey(name: 'helm')
  Helm18? helm;
  @JsonKey(name: 'kustomize')
  Kustomize18? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin19? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source18({
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

  factory Source18.fromJson(Map<String, dynamic> json) =>
      _$Source18FromJson(json);

  Map<String, dynamic> toJson() => _$Source18ToJson(this);
}

@JsonSerializable()
class Directory21 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet18? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory21({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory21.fromJson(Map<String, dynamic> json) =>
      _$Directory21FromJson(json);

  Map<String, dynamic> toJson() => _$Directory21ToJson(this);
}

@JsonSerializable()
class Jsonnet18 {
  @JsonKey(name: 'extVars')
  List<ExtVar18?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas18?>? tlas;

  Jsonnet18({this.extVars, this.libs, this.tlas});

  factory Jsonnet18.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet18FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet18ToJson(this);
}

@JsonSerializable()
class ExtVar18 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar18({this.code, required this.name, required this.value});

  factory ExtVar18.fromJson(Map<String, dynamic> json) =>
      _$ExtVar18FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar18ToJson(this);
}

@JsonSerializable()
class Tlas18 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas18({this.code, required this.name, required this.value});

  factory Tlas18.fromJson(Map<String, dynamic> json) => _$Tlas18FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas18ToJson(this);
}

@JsonSerializable()
class Helm18 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter18?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter48?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm18({
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

  factory Helm18.fromJson(Map<String, dynamic> json) => _$Helm18FromJson(json);

  Map<String, dynamic> toJson() => _$Helm18ToJson(this);
}

@JsonSerializable()
class FileParameter18 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter18({this.name, this.path});

  factory FileParameter18.fromJson(Map<String, dynamic> json) =>
      _$FileParameter18FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter18ToJson(this);
}

@JsonSerializable()
class Parameter48 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter48({this.forceString, this.name, this.value});

  factory Parameter48.fromJson(Map<String, dynamic> json) =>
      _$Parameter48FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter48ToJson(this);
}

@JsonSerializable()
class Kustomize18 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch18?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica18?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize18({
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

  factory Kustomize18.fromJson(Map<String, dynamic> json) =>
      _$Kustomize18FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize18ToJson(this);
}

@JsonSerializable()
class Patch18 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target18? target;

  Patch18({this.options, this.patch, this.path, this.target});

  factory Patch18.fromJson(Map<String, dynamic> json) =>
      _$Patch18FromJson(json);

  Map<String, dynamic> toJson() => _$Patch18ToJson(this);
}

@JsonSerializable()
class Target18 {
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

  Target18({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target18.fromJson(Map<String, dynamic> json) =>
      _$Target18FromJson(json);

  Map<String, dynamic> toJson() => _$Target18ToJson(this);
}

@JsonSerializable()
class Replica18 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica18({required this.count, required this.name});

  factory Replica18.fromJson(Map<String, dynamic> json) =>
      _$Replica18FromJson(json);

  Map<String, dynamic> toJson() => _$Replica18ToJson(this);
}

@JsonSerializable()
class Plugin19 {
  @JsonKey(name: 'env')
  List<Env18?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter49?>? parameters;

  Plugin19({this.env, this.name, this.parameters});

  factory Plugin19.fromJson(Map<String, dynamic> json) =>
      _$Plugin19FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin19ToJson(this);
}

@JsonSerializable()
class Env18 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env18({required this.name, required this.value});

  factory Env18.fromJson(Map<String, dynamic> json) => _$Env18FromJson(json);

  Map<String, dynamic> toJson() => _$Env18ToJson(this);
}

@JsonSerializable()
class Parameter49 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter49({this.array, this.map, this.name, this.string});

  factory Parameter49.fromJson(Map<String, dynamic> json) =>
      _$Parameter49FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter49ToJson(this);
}

@JsonSerializable()
class SourceHydrator3 {
  @JsonKey(name: 'drySource')
  DrySource3 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo3? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource3 syncSource;

  SourceHydrator3({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator3.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator3FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator3ToJson(this);
}

@JsonSerializable()
class DrySource3 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource3({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource3.fromJson(Map<String, dynamic> json) =>
      _$DrySource3FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource3ToJson(this);
}

@JsonSerializable()
class HydrateTo3 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo3({required this.targetBranch});

  factory HydrateTo3.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo3FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo3ToJson(this);
}

@JsonSerializable()
class SyncSource3 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource3({required this.path, required this.targetBranch});

  factory SyncSource3.fromJson(Map<String, dynamic> json) =>
      _$SyncSource3FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource3ToJson(this);
}

@JsonSerializable()
class Source19 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory22? directory;
  @JsonKey(name: 'helm')
  Helm19? helm;
  @JsonKey(name: 'kustomize')
  Kustomize19? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin20? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source19({
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

  factory Source19.fromJson(Map<String, dynamic> json) =>
      _$Source19FromJson(json);

  Map<String, dynamic> toJson() => _$Source19ToJson(this);
}

@JsonSerializable()
class Directory22 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet19? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory22({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory22.fromJson(Map<String, dynamic> json) =>
      _$Directory22FromJson(json);

  Map<String, dynamic> toJson() => _$Directory22ToJson(this);
}

@JsonSerializable()
class Jsonnet19 {
  @JsonKey(name: 'extVars')
  List<ExtVar19?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas19?>? tlas;

  Jsonnet19({this.extVars, this.libs, this.tlas});

  factory Jsonnet19.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet19FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet19ToJson(this);
}

@JsonSerializable()
class ExtVar19 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar19({this.code, required this.name, required this.value});

  factory ExtVar19.fromJson(Map<String, dynamic> json) =>
      _$ExtVar19FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar19ToJson(this);
}

@JsonSerializable()
class Tlas19 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas19({this.code, required this.name, required this.value});

  factory Tlas19.fromJson(Map<String, dynamic> json) => _$Tlas19FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas19ToJson(this);
}

@JsonSerializable()
class Helm19 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter19?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter50?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm19({
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

  factory Helm19.fromJson(Map<String, dynamic> json) => _$Helm19FromJson(json);

  Map<String, dynamic> toJson() => _$Helm19ToJson(this);
}

@JsonSerializable()
class FileParameter19 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter19({this.name, this.path});

  factory FileParameter19.fromJson(Map<String, dynamic> json) =>
      _$FileParameter19FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter19ToJson(this);
}

@JsonSerializable()
class Parameter50 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter50({this.forceString, this.name, this.value});

  factory Parameter50.fromJson(Map<String, dynamic> json) =>
      _$Parameter50FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter50ToJson(this);
}

@JsonSerializable()
class Kustomize19 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch19?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica19?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize19({
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

  factory Kustomize19.fromJson(Map<String, dynamic> json) =>
      _$Kustomize19FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize19ToJson(this);
}

@JsonSerializable()
class Patch19 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target19? target;

  Patch19({this.options, this.patch, this.path, this.target});

  factory Patch19.fromJson(Map<String, dynamic> json) =>
      _$Patch19FromJson(json);

  Map<String, dynamic> toJson() => _$Patch19ToJson(this);
}

@JsonSerializable()
class Target19 {
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

  Target19({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target19.fromJson(Map<String, dynamic> json) =>
      _$Target19FromJson(json);

  Map<String, dynamic> toJson() => _$Target19ToJson(this);
}

@JsonSerializable()
class Replica19 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica19({required this.count, required this.name});

  factory Replica19.fromJson(Map<String, dynamic> json) =>
      _$Replica19FromJson(json);

  Map<String, dynamic> toJson() => _$Replica19ToJson(this);
}

@JsonSerializable()
class Plugin20 {
  @JsonKey(name: 'env')
  List<Env19?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter51?>? parameters;

  Plugin20({this.env, this.name, this.parameters});

  factory Plugin20.fromJson(Map<String, dynamic> json) =>
      _$Plugin20FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin20ToJson(this);
}

@JsonSerializable()
class Env19 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env19({required this.name, required this.value});

  factory Env19.fromJson(Map<String, dynamic> json) => _$Env19FromJson(json);

  Map<String, dynamic> toJson() => _$Env19ToJson(this);
}

@JsonSerializable()
class Parameter51 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter51({this.array, this.map, this.name, this.string});

  factory Parameter51.fromJson(Map<String, dynamic> json) =>
      _$Parameter51FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter51ToJson(this);
}

@JsonSerializable()
class SyncPolicy3 {
  @JsonKey(name: 'automated')
  Automated3? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata3? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry3? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy3({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy3.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy3FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy3ToJson(this);
}

@JsonSerializable()
class Automated3 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated3({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated3.fromJson(Map<String, dynamic> json) =>
      _$Automated3FromJson(json);

  Map<String, dynamic> toJson() => _$Automated3ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata3 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata3({this.annotations, this.labels});

  factory ManagedNamespaceMetadata3.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata3FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata3ToJson(this);
}

@JsonSerializable()
class Retry3 {
  @JsonKey(name: 'backoff')
  Backoff3? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry3({this.backoff, this.limit, this.refresh});

  factory Retry3.fromJson(Map<String, dynamic> json) => _$Retry3FromJson(json);

  Map<String, dynamic> toJson() => _$Retry3ToJson(this);
}

@JsonSerializable()
class Backoff3 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff3({this.duration, this.factor, this.maxDuration});

  factory Backoff3.fromJson(Map<String, dynamic> json) =>
      _$Backoff3FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff3ToJson(this);
}

@JsonSerializable()
class Plugin21 {
  @JsonKey(name: 'configMapRef')
  FluffyConfigMapRef configMapRef;
  @JsonKey(name: 'input')
  FluffyInput? input;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template3? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  Plugin21({
    required this.configMapRef,
    this.input,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory Plugin21.fromJson(Map<String, dynamic> json) =>
      _$Plugin21FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin21ToJson(this);
}

@JsonSerializable()
class FluffyConfigMapRef {
  @JsonKey(name: 'name')
  String name;

  FluffyConfigMapRef({required this.name});

  factory FluffyConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyConfigMapRefToJson(this);
}

@JsonSerializable()
class FluffyInput {
  @JsonKey(name: 'parameters')
  Map<String, dynamic>? parameters;

  FluffyInput({this.parameters});

  factory FluffyInput.fromJson(Map<String, dynamic> json) =>
      _$FluffyInputFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyInputToJson(this);
}

@JsonSerializable()
class Template3 {
  @JsonKey(name: 'metadata')
  Metadata4 metadata;
  @JsonKey(name: 'spec')
  Spec4 spec;

  Template3({required this.metadata, required this.spec});

  factory Template3.fromJson(Map<String, dynamic> json) =>
      _$Template3FromJson(json);

  Map<String, dynamic> toJson() => _$Template3ToJson(this);
}

@JsonSerializable()
class Metadata4 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata4({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata4.fromJson(Map<String, dynamic> json) =>
      _$Metadata4FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata4ToJson(this);
}

@JsonSerializable()
class Spec4 {
  @JsonKey(name: 'destination')
  Destination4 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference4?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info4?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source20? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator4? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source21?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy4? syncPolicy;

  Spec4({
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

  factory Spec4.fromJson(Map<String, dynamic> json) => _$Spec4FromJson(json);

  Map<String, dynamic> toJson() => _$Spec4ToJson(this);
}

@JsonSerializable()
class Destination4 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination4({this.name, this.namespace, this.server});

  factory Destination4.fromJson(Map<String, dynamic> json) =>
      _$Destination4FromJson(json);

  Map<String, dynamic> toJson() => _$Destination4ToJson(this);
}

@JsonSerializable()
class IgnoreDifference4 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference4({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference4.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference4FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference4ToJson(this);
}

@JsonSerializable()
class Info4 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info4({required this.name, required this.value});

  factory Info4.fromJson(Map<String, dynamic> json) => _$Info4FromJson(json);

  Map<String, dynamic> toJson() => _$Info4ToJson(this);
}

@JsonSerializable()
class Source20 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory23? directory;
  @JsonKey(name: 'helm')
  Helm20? helm;
  @JsonKey(name: 'kustomize')
  Kustomize20? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin22? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source20({
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

  factory Source20.fromJson(Map<String, dynamic> json) =>
      _$Source20FromJson(json);

  Map<String, dynamic> toJson() => _$Source20ToJson(this);
}

@JsonSerializable()
class Directory23 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet20? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory23({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory23.fromJson(Map<String, dynamic> json) =>
      _$Directory23FromJson(json);

  Map<String, dynamic> toJson() => _$Directory23ToJson(this);
}

@JsonSerializable()
class Jsonnet20 {
  @JsonKey(name: 'extVars')
  List<ExtVar20?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas20?>? tlas;

  Jsonnet20({this.extVars, this.libs, this.tlas});

  factory Jsonnet20.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet20FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet20ToJson(this);
}

@JsonSerializable()
class ExtVar20 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar20({this.code, required this.name, required this.value});

  factory ExtVar20.fromJson(Map<String, dynamic> json) =>
      _$ExtVar20FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar20ToJson(this);
}

@JsonSerializable()
class Tlas20 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas20({this.code, required this.name, required this.value});

  factory Tlas20.fromJson(Map<String, dynamic> json) => _$Tlas20FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas20ToJson(this);
}

@JsonSerializable()
class Helm20 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter20?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter52?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm20({
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

  factory Helm20.fromJson(Map<String, dynamic> json) => _$Helm20FromJson(json);

  Map<String, dynamic> toJson() => _$Helm20ToJson(this);
}

@JsonSerializable()
class FileParameter20 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter20({this.name, this.path});

  factory FileParameter20.fromJson(Map<String, dynamic> json) =>
      _$FileParameter20FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter20ToJson(this);
}

@JsonSerializable()
class Parameter52 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter52({this.forceString, this.name, this.value});

  factory Parameter52.fromJson(Map<String, dynamic> json) =>
      _$Parameter52FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter52ToJson(this);
}

@JsonSerializable()
class Kustomize20 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch20?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica20?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize20({
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

  factory Kustomize20.fromJson(Map<String, dynamic> json) =>
      _$Kustomize20FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize20ToJson(this);
}

@JsonSerializable()
class Patch20 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target20? target;

  Patch20({this.options, this.patch, this.path, this.target});

  factory Patch20.fromJson(Map<String, dynamic> json) =>
      _$Patch20FromJson(json);

  Map<String, dynamic> toJson() => _$Patch20ToJson(this);
}

@JsonSerializable()
class Target20 {
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

  Target20({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target20.fromJson(Map<String, dynamic> json) =>
      _$Target20FromJson(json);

  Map<String, dynamic> toJson() => _$Target20ToJson(this);
}

@JsonSerializable()
class Replica20 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica20({required this.count, required this.name});

  factory Replica20.fromJson(Map<String, dynamic> json) =>
      _$Replica20FromJson(json);

  Map<String, dynamic> toJson() => _$Replica20ToJson(this);
}

@JsonSerializable()
class Plugin22 {
  @JsonKey(name: 'env')
  List<Env20?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter53?>? parameters;

  Plugin22({this.env, this.name, this.parameters});

  factory Plugin22.fromJson(Map<String, dynamic> json) =>
      _$Plugin22FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin22ToJson(this);
}

@JsonSerializable()
class Env20 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env20({required this.name, required this.value});

  factory Env20.fromJson(Map<String, dynamic> json) => _$Env20FromJson(json);

  Map<String, dynamic> toJson() => _$Env20ToJson(this);
}

@JsonSerializable()
class Parameter53 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter53({this.array, this.map, this.name, this.string});

  factory Parameter53.fromJson(Map<String, dynamic> json) =>
      _$Parameter53FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter53ToJson(this);
}

@JsonSerializable()
class SourceHydrator4 {
  @JsonKey(name: 'drySource')
  DrySource4 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo4? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource4 syncSource;

  SourceHydrator4({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator4.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator4FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator4ToJson(this);
}

@JsonSerializable()
class DrySource4 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource4({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource4.fromJson(Map<String, dynamic> json) =>
      _$DrySource4FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource4ToJson(this);
}

@JsonSerializable()
class HydrateTo4 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo4({required this.targetBranch});

  factory HydrateTo4.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo4FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo4ToJson(this);
}

@JsonSerializable()
class SyncSource4 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource4({required this.path, required this.targetBranch});

  factory SyncSource4.fromJson(Map<String, dynamic> json) =>
      _$SyncSource4FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource4ToJson(this);
}

@JsonSerializable()
class Source21 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory24? directory;
  @JsonKey(name: 'helm')
  Helm21? helm;
  @JsonKey(name: 'kustomize')
  Kustomize21? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin23? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source21({
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

  factory Source21.fromJson(Map<String, dynamic> json) =>
      _$Source21FromJson(json);

  Map<String, dynamic> toJson() => _$Source21ToJson(this);
}

@JsonSerializable()
class Directory24 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet21? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory24({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory24.fromJson(Map<String, dynamic> json) =>
      _$Directory24FromJson(json);

  Map<String, dynamic> toJson() => _$Directory24ToJson(this);
}

@JsonSerializable()
class Jsonnet21 {
  @JsonKey(name: 'extVars')
  List<ExtVar21?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas21?>? tlas;

  Jsonnet21({this.extVars, this.libs, this.tlas});

  factory Jsonnet21.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet21FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet21ToJson(this);
}

@JsonSerializable()
class ExtVar21 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar21({this.code, required this.name, required this.value});

  factory ExtVar21.fromJson(Map<String, dynamic> json) =>
      _$ExtVar21FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar21ToJson(this);
}

@JsonSerializable()
class Tlas21 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas21({this.code, required this.name, required this.value});

  factory Tlas21.fromJson(Map<String, dynamic> json) => _$Tlas21FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas21ToJson(this);
}

@JsonSerializable()
class Helm21 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter21?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter54?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm21({
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

  factory Helm21.fromJson(Map<String, dynamic> json) => _$Helm21FromJson(json);

  Map<String, dynamic> toJson() => _$Helm21ToJson(this);
}

@JsonSerializable()
class FileParameter21 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter21({this.name, this.path});

  factory FileParameter21.fromJson(Map<String, dynamic> json) =>
      _$FileParameter21FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter21ToJson(this);
}

@JsonSerializable()
class Parameter54 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter54({this.forceString, this.name, this.value});

  factory Parameter54.fromJson(Map<String, dynamic> json) =>
      _$Parameter54FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter54ToJson(this);
}

@JsonSerializable()
class Kustomize21 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch21?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica21?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize21({
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

  factory Kustomize21.fromJson(Map<String, dynamic> json) =>
      _$Kustomize21FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize21ToJson(this);
}

@JsonSerializable()
class Patch21 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target21? target;

  Patch21({this.options, this.patch, this.path, this.target});

  factory Patch21.fromJson(Map<String, dynamic> json) =>
      _$Patch21FromJson(json);

  Map<String, dynamic> toJson() => _$Patch21ToJson(this);
}

@JsonSerializable()
class Target21 {
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

  Target21({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target21.fromJson(Map<String, dynamic> json) =>
      _$Target21FromJson(json);

  Map<String, dynamic> toJson() => _$Target21ToJson(this);
}

@JsonSerializable()
class Replica21 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica21({required this.count, required this.name});

  factory Replica21.fromJson(Map<String, dynamic> json) =>
      _$Replica21FromJson(json);

  Map<String, dynamic> toJson() => _$Replica21ToJson(this);
}

@JsonSerializable()
class Plugin23 {
  @JsonKey(name: 'env')
  List<Env21?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter55?>? parameters;

  Plugin23({this.env, this.name, this.parameters});

  factory Plugin23.fromJson(Map<String, dynamic> json) =>
      _$Plugin23FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin23ToJson(this);
}

@JsonSerializable()
class Env21 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env21({required this.name, required this.value});

  factory Env21.fromJson(Map<String, dynamic> json) => _$Env21FromJson(json);

  Map<String, dynamic> toJson() => _$Env21ToJson(this);
}

@JsonSerializable()
class Parameter55 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter55({this.array, this.map, this.name, this.string});

  factory Parameter55.fromJson(Map<String, dynamic> json) =>
      _$Parameter55FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter55ToJson(this);
}

@JsonSerializable()
class SyncPolicy4 {
  @JsonKey(name: 'automated')
  Automated4? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata4? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry4? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy4({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy4.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy4FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy4ToJson(this);
}

@JsonSerializable()
class Automated4 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated4({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated4.fromJson(Map<String, dynamic> json) =>
      _$Automated4FromJson(json);

  Map<String, dynamic> toJson() => _$Automated4ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata4 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata4({this.annotations, this.labels});

  factory ManagedNamespaceMetadata4.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata4FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata4ToJson(this);
}

@JsonSerializable()
class Retry4 {
  @JsonKey(name: 'backoff')
  Backoff4? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry4({this.backoff, this.limit, this.refresh});

  factory Retry4.fromJson(Map<String, dynamic> json) => _$Retry4FromJson(json);

  Map<String, dynamic> toJson() => _$Retry4ToJson(this);
}

@JsonSerializable()
class Backoff4 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff4({this.duration, this.factor, this.maxDuration});

  factory Backoff4.fromJson(Map<String, dynamic> json) =>
      _$Backoff4FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff4ToJson(this);
}

@JsonSerializable()
class FluffyPullRequest {
  @JsonKey(name: 'azuredevops')
  FluffyAzuredevops? azuredevops;
  @JsonKey(name: 'bitbucket')
  TentacledBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  TentacledBitbucketServer? bitbucketServer;
  @JsonKey(name: 'continueOnRepoNotFoundError')
  bool? continueOnRepoNotFoundError;
  @JsonKey(name: 'filters')
  List<TentacledFilter?>? filters;
  @JsonKey(name: 'gitea')
  TentacledGitea? gitea;
  @JsonKey(name: 'github')
  TentacledGithub? github;
  @JsonKey(name: 'gitlab')
  TentacledGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template4? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  FluffyPullRequest({
    this.azuredevops,
    this.bitbucket,
    this.bitbucketServer,
    this.continueOnRepoNotFoundError,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory FluffyPullRequest.fromJson(Map<String, dynamic> json) =>
      _$FluffyPullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPullRequestToJson(this);
}

@JsonSerializable()
class FluffyAzuredevops {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  FriskyTokenRef? tokenRef;

  FluffyAzuredevops({
    this.api,
    this.labels,
    required this.organization,
    required this.project,
    required this.repo,
    this.tokenRef,
  });

  factory FluffyAzuredevops.fromJson(Map<String, dynamic> json) =>
      _$FluffyAzuredevopsFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAzuredevopsToJson(this);
}

@JsonSerializable()
class FriskyTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  FriskyTokenRef({required this.key, required this.secretName});

  factory FriskyTokenRef.fromJson(Map<String, dynamic> json) =>
      _$FriskyTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyTokenRefToJson(this);
}

@JsonSerializable()
class TentacledBitbucket {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'basicAuth')
  StickyBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  StickyBearerToken? bearerToken;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;

  TentacledBitbucket({
    this.api,
    this.basicAuth,
    this.bearerToken,
    required this.owner,
    required this.repo,
  });

  factory TentacledBitbucket.fromJson(Map<String, dynamic> json) =>
      _$TentacledBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBitbucketToJson(this);
}

@JsonSerializable()
class StickyBasicAuth {
  @JsonKey(name: 'passwordRef')
  StickyPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  StickyBasicAuth({required this.passwordRef, required this.username});

  factory StickyBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$StickyBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$StickyBasicAuthToJson(this);
}

@JsonSerializable()
class StickyPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  StickyPasswordRef({required this.key, required this.secretName});

  factory StickyPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$StickyPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$StickyPasswordRefToJson(this);
}

@JsonSerializable()
class StickyBearerToken {
  @JsonKey(name: 'tokenRef')
  MischievousTokenRef tokenRef;

  StickyBearerToken({required this.tokenRef});

  factory StickyBearerToken.fromJson(Map<String, dynamic> json) =>
      _$StickyBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$StickyBearerTokenToJson(this);
}

@JsonSerializable()
class MischievousTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  MischievousTokenRef({required this.key, required this.secretName});

  factory MischievousTokenRef.fromJson(Map<String, dynamic> json) =>
      _$MischievousTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousTokenRefToJson(this);
}

@JsonSerializable()
class TentacledBitbucketServer {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  IndigoBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  IndigoBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  IndigoCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;

  TentacledBitbucketServer({
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
    required this.repo,
  });

  factory TentacledBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$TentacledBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledBitbucketServerToJson(this);
}

@JsonSerializable()
class IndigoBasicAuth {
  @JsonKey(name: 'passwordRef')
  IndigoPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  IndigoBasicAuth({required this.passwordRef, required this.username});

  factory IndigoBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$IndigoBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoBasicAuthToJson(this);
}

@JsonSerializable()
class IndigoPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  IndigoPasswordRef({required this.key, required this.secretName});

  factory IndigoPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$IndigoPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoPasswordRefToJson(this);
}

@JsonSerializable()
class IndigoBearerToken {
  @JsonKey(name: 'tokenRef')
  BraggadociousTokenRef tokenRef;

  IndigoBearerToken({required this.tokenRef});

  factory IndigoBearerToken.fromJson(Map<String, dynamic> json) =>
      _$IndigoBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoBearerTokenToJson(this);
}

@JsonSerializable()
class BraggadociousTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  BraggadociousTokenRef({required this.key, required this.secretName});

  factory BraggadociousTokenRef.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousTokenRefToJson(this);
}

@JsonSerializable()
class IndigoCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  IndigoCaRef({required this.configMapName, required this.key});

  factory IndigoCaRef.fromJson(Map<String, dynamic> json) =>
      _$IndigoCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoCaRefToJson(this);
}

@JsonSerializable()
class TentacledFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'targetBranchMatch')
  String? targetBranchMatch;
  @JsonKey(name: 'titleMatch')
  String? titleMatch;

  TentacledFilter({this.branchMatch, this.targetBranchMatch, this.titleMatch});

  factory TentacledFilter.fromJson(Map<String, dynamic> json) =>
      _$TentacledFilterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledFilterToJson(this);
}

@JsonSerializable()
class TentacledGitea {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  TokenRef1? tokenRef;

  TentacledGitea({
    required this.api,
    this.insecure,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory TentacledGitea.fromJson(Map<String, dynamic> json) =>
      _$TentacledGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledGiteaToJson(this);
}

@JsonSerializable()
class TokenRef1 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef1({required this.key, required this.secretName});

  factory TokenRef1.fromJson(Map<String, dynamic> json) =>
      _$TokenRef1FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef1ToJson(this);
}

@JsonSerializable()
class TentacledGithub {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  TokenRef2? tokenRef;

  TentacledGithub({
    this.api,
    this.appSecretName,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory TentacledGithub.fromJson(Map<String, dynamic> json) =>
      _$TentacledGithubFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledGithubToJson(this);
}

@JsonSerializable()
class TokenRef2 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef2({required this.key, required this.secretName});

  factory TokenRef2.fromJson(Map<String, dynamic> json) =>
      _$TokenRef2FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef2ToJson(this);
}

@JsonSerializable()
class TentacledGitlab {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  IndecentCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'pullRequestState')
  String? pullRequestState;
  @JsonKey(name: 'tokenRef')
  TokenRef3? tokenRef;

  TentacledGitlab({
    this.api,
    this.caRef,
    this.insecure,
    this.labels,
    required this.project,
    this.pullRequestState,
    this.tokenRef,
  });

  factory TentacledGitlab.fromJson(Map<String, dynamic> json) =>
      _$TentacledGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledGitlabToJson(this);
}

@JsonSerializable()
class IndecentCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  IndecentCaRef({required this.configMapName, required this.key});

  factory IndecentCaRef.fromJson(Map<String, dynamic> json) =>
      _$IndecentCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentCaRefToJson(this);
}

@JsonSerializable()
class TokenRef3 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef3({required this.key, required this.secretName});

  factory TokenRef3.fromJson(Map<String, dynamic> json) =>
      _$TokenRef3FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef3ToJson(this);
}

@JsonSerializable()
class Template4 {
  @JsonKey(name: 'metadata')
  Metadata5 metadata;
  @JsonKey(name: 'spec')
  Spec5 spec;

  Template4({required this.metadata, required this.spec});

  factory Template4.fromJson(Map<String, dynamic> json) =>
      _$Template4FromJson(json);

  Map<String, dynamic> toJson() => _$Template4ToJson(this);
}

@JsonSerializable()
class Metadata5 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata5({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata5.fromJson(Map<String, dynamic> json) =>
      _$Metadata5FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata5ToJson(this);
}

@JsonSerializable()
class Spec5 {
  @JsonKey(name: 'destination')
  Destination5 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference5?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info5?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source22? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator5? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source23?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy5? syncPolicy;

  Spec5({
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

  factory Spec5.fromJson(Map<String, dynamic> json) => _$Spec5FromJson(json);

  Map<String, dynamic> toJson() => _$Spec5ToJson(this);
}

@JsonSerializable()
class Destination5 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination5({this.name, this.namespace, this.server});

  factory Destination5.fromJson(Map<String, dynamic> json) =>
      _$Destination5FromJson(json);

  Map<String, dynamic> toJson() => _$Destination5ToJson(this);
}

@JsonSerializable()
class IgnoreDifference5 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference5({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference5.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference5FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference5ToJson(this);
}

@JsonSerializable()
class Info5 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info5({required this.name, required this.value});

  factory Info5.fromJson(Map<String, dynamic> json) => _$Info5FromJson(json);

  Map<String, dynamic> toJson() => _$Info5ToJson(this);
}

@JsonSerializable()
class Source22 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory25? directory;
  @JsonKey(name: 'helm')
  Helm22? helm;
  @JsonKey(name: 'kustomize')
  Kustomize22? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin24? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source22({
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

  factory Source22.fromJson(Map<String, dynamic> json) =>
      _$Source22FromJson(json);

  Map<String, dynamic> toJson() => _$Source22ToJson(this);
}

@JsonSerializable()
class Directory25 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet22? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory25({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory25.fromJson(Map<String, dynamic> json) =>
      _$Directory25FromJson(json);

  Map<String, dynamic> toJson() => _$Directory25ToJson(this);
}

@JsonSerializable()
class Jsonnet22 {
  @JsonKey(name: 'extVars')
  List<ExtVar22?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas22?>? tlas;

  Jsonnet22({this.extVars, this.libs, this.tlas});

  factory Jsonnet22.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet22FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet22ToJson(this);
}

@JsonSerializable()
class ExtVar22 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar22({this.code, required this.name, required this.value});

  factory ExtVar22.fromJson(Map<String, dynamic> json) =>
      _$ExtVar22FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar22ToJson(this);
}

@JsonSerializable()
class Tlas22 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas22({this.code, required this.name, required this.value});

  factory Tlas22.fromJson(Map<String, dynamic> json) => _$Tlas22FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas22ToJson(this);
}

@JsonSerializable()
class Helm22 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter22?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter56?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm22({
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

  factory Helm22.fromJson(Map<String, dynamic> json) => _$Helm22FromJson(json);

  Map<String, dynamic> toJson() => _$Helm22ToJson(this);
}

@JsonSerializable()
class FileParameter22 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter22({this.name, this.path});

  factory FileParameter22.fromJson(Map<String, dynamic> json) =>
      _$FileParameter22FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter22ToJson(this);
}

@JsonSerializable()
class Parameter56 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter56({this.forceString, this.name, this.value});

  factory Parameter56.fromJson(Map<String, dynamic> json) =>
      _$Parameter56FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter56ToJson(this);
}

@JsonSerializable()
class Kustomize22 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch22?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica22?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize22({
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

  factory Kustomize22.fromJson(Map<String, dynamic> json) =>
      _$Kustomize22FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize22ToJson(this);
}

@JsonSerializable()
class Patch22 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target22? target;

  Patch22({this.options, this.patch, this.path, this.target});

  factory Patch22.fromJson(Map<String, dynamic> json) =>
      _$Patch22FromJson(json);

  Map<String, dynamic> toJson() => _$Patch22ToJson(this);
}

@JsonSerializable()
class Target22 {
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

  Target22({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target22.fromJson(Map<String, dynamic> json) =>
      _$Target22FromJson(json);

  Map<String, dynamic> toJson() => _$Target22ToJson(this);
}

@JsonSerializable()
class Replica22 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica22({required this.count, required this.name});

  factory Replica22.fromJson(Map<String, dynamic> json) =>
      _$Replica22FromJson(json);

  Map<String, dynamic> toJson() => _$Replica22ToJson(this);
}

@JsonSerializable()
class Plugin24 {
  @JsonKey(name: 'env')
  List<Env22?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter57?>? parameters;

  Plugin24({this.env, this.name, this.parameters});

  factory Plugin24.fromJson(Map<String, dynamic> json) =>
      _$Plugin24FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin24ToJson(this);
}

@JsonSerializable()
class Env22 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env22({required this.name, required this.value});

  factory Env22.fromJson(Map<String, dynamic> json) => _$Env22FromJson(json);

  Map<String, dynamic> toJson() => _$Env22ToJson(this);
}

@JsonSerializable()
class Parameter57 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter57({this.array, this.map, this.name, this.string});

  factory Parameter57.fromJson(Map<String, dynamic> json) =>
      _$Parameter57FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter57ToJson(this);
}

@JsonSerializable()
class SourceHydrator5 {
  @JsonKey(name: 'drySource')
  DrySource5 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo5? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource5 syncSource;

  SourceHydrator5({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator5.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator5FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator5ToJson(this);
}

@JsonSerializable()
class DrySource5 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource5({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource5.fromJson(Map<String, dynamic> json) =>
      _$DrySource5FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource5ToJson(this);
}

@JsonSerializable()
class HydrateTo5 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo5({required this.targetBranch});

  factory HydrateTo5.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo5FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo5ToJson(this);
}

@JsonSerializable()
class SyncSource5 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource5({required this.path, required this.targetBranch});

  factory SyncSource5.fromJson(Map<String, dynamic> json) =>
      _$SyncSource5FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource5ToJson(this);
}

@JsonSerializable()
class Source23 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory26? directory;
  @JsonKey(name: 'helm')
  Helm23? helm;
  @JsonKey(name: 'kustomize')
  Kustomize23? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin25? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source23({
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

  factory Source23.fromJson(Map<String, dynamic> json) =>
      _$Source23FromJson(json);

  Map<String, dynamic> toJson() => _$Source23ToJson(this);
}

@JsonSerializable()
class Directory26 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet23? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory26({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory26.fromJson(Map<String, dynamic> json) =>
      _$Directory26FromJson(json);

  Map<String, dynamic> toJson() => _$Directory26ToJson(this);
}

@JsonSerializable()
class Jsonnet23 {
  @JsonKey(name: 'extVars')
  List<ExtVar23?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas23?>? tlas;

  Jsonnet23({this.extVars, this.libs, this.tlas});

  factory Jsonnet23.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet23FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet23ToJson(this);
}

@JsonSerializable()
class ExtVar23 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar23({this.code, required this.name, required this.value});

  factory ExtVar23.fromJson(Map<String, dynamic> json) =>
      _$ExtVar23FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar23ToJson(this);
}

@JsonSerializable()
class Tlas23 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas23({this.code, required this.name, required this.value});

  factory Tlas23.fromJson(Map<String, dynamic> json) => _$Tlas23FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas23ToJson(this);
}

@JsonSerializable()
class Helm23 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter23?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter58?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm23({
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

  factory Helm23.fromJson(Map<String, dynamic> json) => _$Helm23FromJson(json);

  Map<String, dynamic> toJson() => _$Helm23ToJson(this);
}

@JsonSerializable()
class FileParameter23 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter23({this.name, this.path});

  factory FileParameter23.fromJson(Map<String, dynamic> json) =>
      _$FileParameter23FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter23ToJson(this);
}

@JsonSerializable()
class Parameter58 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter58({this.forceString, this.name, this.value});

  factory Parameter58.fromJson(Map<String, dynamic> json) =>
      _$Parameter58FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter58ToJson(this);
}

@JsonSerializable()
class Kustomize23 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch23?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica23?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize23({
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

  factory Kustomize23.fromJson(Map<String, dynamic> json) =>
      _$Kustomize23FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize23ToJson(this);
}

@JsonSerializable()
class Patch23 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target23? target;

  Patch23({this.options, this.patch, this.path, this.target});

  factory Patch23.fromJson(Map<String, dynamic> json) =>
      _$Patch23FromJson(json);

  Map<String, dynamic> toJson() => _$Patch23ToJson(this);
}

@JsonSerializable()
class Target23 {
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

  Target23({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target23.fromJson(Map<String, dynamic> json) =>
      _$Target23FromJson(json);

  Map<String, dynamic> toJson() => _$Target23ToJson(this);
}

@JsonSerializable()
class Replica23 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica23({required this.count, required this.name});

  factory Replica23.fromJson(Map<String, dynamic> json) =>
      _$Replica23FromJson(json);

  Map<String, dynamic> toJson() => _$Replica23ToJson(this);
}

@JsonSerializable()
class Plugin25 {
  @JsonKey(name: 'env')
  List<Env23?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter59?>? parameters;

  Plugin25({this.env, this.name, this.parameters});

  factory Plugin25.fromJson(Map<String, dynamic> json) =>
      _$Plugin25FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin25ToJson(this);
}

@JsonSerializable()
class Env23 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env23({required this.name, required this.value});

  factory Env23.fromJson(Map<String, dynamic> json) => _$Env23FromJson(json);

  Map<String, dynamic> toJson() => _$Env23ToJson(this);
}

@JsonSerializable()
class Parameter59 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter59({this.array, this.map, this.name, this.string});

  factory Parameter59.fromJson(Map<String, dynamic> json) =>
      _$Parameter59FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter59ToJson(this);
}

@JsonSerializable()
class SyncPolicy5 {
  @JsonKey(name: 'automated')
  Automated5? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata5? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry5? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy5({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy5.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy5FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy5ToJson(this);
}

@JsonSerializable()
class Automated5 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated5({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated5.fromJson(Map<String, dynamic> json) =>
      _$Automated5FromJson(json);

  Map<String, dynamic> toJson() => _$Automated5ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata5 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata5({this.annotations, this.labels});

  factory ManagedNamespaceMetadata5.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata5FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata5ToJson(this);
}

@JsonSerializable()
class Retry5 {
  @JsonKey(name: 'backoff')
  Backoff5? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry5({this.backoff, this.limit, this.refresh});

  factory Retry5.fromJson(Map<String, dynamic> json) => _$Retry5FromJson(json);

  Map<String, dynamic> toJson() => _$Retry5ToJson(this);
}

@JsonSerializable()
class Backoff5 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff5({this.duration, this.factor, this.maxDuration});

  factory Backoff5.fromJson(Map<String, dynamic> json) =>
      _$Backoff5FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff5ToJson(this);
}

@JsonSerializable()
class FluffyScmProvider {
  @JsonKey(name: 'awsCodeCommit')
  FluffyAwsCodeCommit? awsCodeCommit;
  @JsonKey(name: 'azureDevOps')
  FluffyAzureDevOps? azureDevOps;
  @JsonKey(name: 'bitbucket')
  StickyBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  StickyBitbucketServer? bitbucketServer;
  @JsonKey(name: 'cloneProtocol')
  String? cloneProtocol;
  @JsonKey(name: 'filters')
  List<StickyFilter?>? filters;
  @JsonKey(name: 'gitea')
  StickyGitea? gitea;
  @JsonKey(name: 'github')
  StickyGithub? github;
  @JsonKey(name: 'gitlab')
  StickyGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template5? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  FluffyScmProvider({
    this.awsCodeCommit,
    this.azureDevOps,
    this.bitbucket,
    this.bitbucketServer,
    this.cloneProtocol,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory FluffyScmProvider.fromJson(Map<String, dynamic> json) =>
      _$FluffyScmProviderFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyScmProviderToJson(this);
}

@JsonSerializable()
class FluffyAwsCodeCommit {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'tagFilters')
  List<FluffyTagFilter?>? tagFilters;

  FluffyAwsCodeCommit({
    this.allBranches,
    this.region,
    this.role,
    this.tagFilters,
  });

  factory FluffyAwsCodeCommit.fromJson(Map<String, dynamic> json) =>
      _$FluffyAwsCodeCommitFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAwsCodeCommitToJson(this);
}

@JsonSerializable()
class FluffyTagFilter {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'value')
  String? value;

  FluffyTagFilter({required this.key, this.value});

  factory FluffyTagFilter.fromJson(Map<String, dynamic> json) =>
      _$FluffyTagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTagFilterToJson(this);
}

@JsonSerializable()
class FluffyAzureDevOps {
  @JsonKey(name: 'accessTokenRef')
  FluffyAccessTokenRef accessTokenRef;
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'teamProject')
  String teamProject;

  FluffyAzureDevOps({
    required this.accessTokenRef,
    this.allBranches,
    this.api,
    required this.organization,
    required this.teamProject,
  });

  factory FluffyAzureDevOps.fromJson(Map<String, dynamic> json) =>
      _$FluffyAzureDevOpsFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAzureDevOpsToJson(this);
}

@JsonSerializable()
class FluffyAccessTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  FluffyAccessTokenRef({required this.key, required this.secretName});

  factory FluffyAccessTokenRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyAccessTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAccessTokenRefToJson(this);
}

@JsonSerializable()
class StickyBitbucket {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'appPasswordRef')
  FluffyAppPasswordRef appPasswordRef;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'user')
  String user;

  StickyBitbucket({
    this.allBranches,
    required this.appPasswordRef,
    required this.owner,
    required this.user,
  });

  factory StickyBitbucket.fromJson(Map<String, dynamic> json) =>
      _$StickyBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$StickyBitbucketToJson(this);
}

@JsonSerializable()
class FluffyAppPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  FluffyAppPasswordRef({required this.key, required this.secretName});

  factory FluffyAppPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$FluffyAppPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAppPasswordRefToJson(this);
}

@JsonSerializable()
class StickyBitbucketServer {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  IndecentBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  IndecentBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  HilariousCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;

  StickyBitbucketServer({
    this.allBranches,
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
  });

  factory StickyBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$StickyBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$StickyBitbucketServerToJson(this);
}

@JsonSerializable()
class IndecentBasicAuth {
  @JsonKey(name: 'passwordRef')
  IndecentPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  IndecentBasicAuth({required this.passwordRef, required this.username});

  factory IndecentBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$IndecentBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentBasicAuthToJson(this);
}

@JsonSerializable()
class IndecentPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  IndecentPasswordRef({required this.key, required this.secretName});

  factory IndecentPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$IndecentPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentPasswordRefToJson(this);
}

@JsonSerializable()
class IndecentBearerToken {
  @JsonKey(name: 'tokenRef')
  TokenRef4 tokenRef;

  IndecentBearerToken({required this.tokenRef});

  factory IndecentBearerToken.fromJson(Map<String, dynamic> json) =>
      _$IndecentBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentBearerTokenToJson(this);
}

@JsonSerializable()
class TokenRef4 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef4({required this.key, required this.secretName});

  factory TokenRef4.fromJson(Map<String, dynamic> json) =>
      _$TokenRef4FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef4ToJson(this);
}

@JsonSerializable()
class HilariousCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  HilariousCaRef({required this.configMapName, required this.key});

  factory HilariousCaRef.fromJson(Map<String, dynamic> json) =>
      _$HilariousCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousCaRefToJson(this);
}

@JsonSerializable()
class StickyFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'labelMatch')
  String? labelMatch;
  @JsonKey(name: 'pathsDoNotExist')
  List<String?>? pathsDoNotExist;
  @JsonKey(name: 'pathsExist')
  List<String?>? pathsExist;
  @JsonKey(name: 'repositoryMatch')
  String? repositoryMatch;

  StickyFilter({
    this.branchMatch,
    this.labelMatch,
    this.pathsDoNotExist,
    this.pathsExist,
    this.repositoryMatch,
  });

  factory StickyFilter.fromJson(Map<String, dynamic> json) =>
      _$StickyFilterFromJson(json);

  Map<String, dynamic> toJson() => _$StickyFilterToJson(this);
}

@JsonSerializable()
class StickyGitea {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'tokenRef')
  TokenRef5? tokenRef;

  StickyGitea({
    this.allBranches,
    required this.api,
    this.insecure,
    required this.owner,
    this.tokenRef,
  });

  factory StickyGitea.fromJson(Map<String, dynamic> json) =>
      _$StickyGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$StickyGiteaToJson(this);
}

@JsonSerializable()
class TokenRef5 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef5({required this.key, required this.secretName});

  factory TokenRef5.fromJson(Map<String, dynamic> json) =>
      _$TokenRef5FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef5ToJson(this);
}

@JsonSerializable()
class StickyGithub {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'tokenRef')
  TokenRef6? tokenRef;

  StickyGithub({
    this.allBranches,
    this.api,
    this.appSecretName,
    required this.organization,
    this.tokenRef,
  });

  factory StickyGithub.fromJson(Map<String, dynamic> json) =>
      _$StickyGithubFromJson(json);

  Map<String, dynamic> toJson() => _$StickyGithubToJson(this);
}

@JsonSerializable()
class TokenRef6 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef6({required this.key, required this.secretName});

  factory TokenRef6.fromJson(Map<String, dynamic> json) =>
      _$TokenRef6FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef6ToJson(this);
}

@JsonSerializable()
class StickyGitlab {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  AmbitiousCaRef? caRef;
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'includeSharedProjects')
  bool? includeSharedProjects;
  @JsonKey(name: 'includeSubgroups')
  bool? includeSubgroups;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'tokenRef')
  TokenRef7? tokenRef;
  @JsonKey(name: 'topic')
  String? topic;

  StickyGitlab({
    this.allBranches,
    this.api,
    this.caRef,
    required this.group,
    this.includeSharedProjects,
    this.includeSubgroups,
    this.insecure,
    this.tokenRef,
    this.topic,
  });

  factory StickyGitlab.fromJson(Map<String, dynamic> json) =>
      _$StickyGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$StickyGitlabToJson(this);
}

@JsonSerializable()
class AmbitiousCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  AmbitiousCaRef({required this.configMapName, required this.key});

  factory AmbitiousCaRef.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousCaRefToJson(this);
}

@JsonSerializable()
class TokenRef7 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef7({required this.key, required this.secretName});

  factory TokenRef7.fromJson(Map<String, dynamic> json) =>
      _$TokenRef7FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef7ToJson(this);
}

@JsonSerializable()
class Template5 {
  @JsonKey(name: 'metadata')
  Metadata6 metadata;
  @JsonKey(name: 'spec')
  Spec6 spec;

  Template5({required this.metadata, required this.spec});

  factory Template5.fromJson(Map<String, dynamic> json) =>
      _$Template5FromJson(json);

  Map<String, dynamic> toJson() => _$Template5ToJson(this);
}

@JsonSerializable()
class Metadata6 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata6({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata6.fromJson(Map<String, dynamic> json) =>
      _$Metadata6FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata6ToJson(this);
}

@JsonSerializable()
class Spec6 {
  @JsonKey(name: 'destination')
  Destination6 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference6?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info6?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source24? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator6? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source25?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy6? syncPolicy;

  Spec6({
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

  factory Spec6.fromJson(Map<String, dynamic> json) => _$Spec6FromJson(json);

  Map<String, dynamic> toJson() => _$Spec6ToJson(this);
}

@JsonSerializable()
class Destination6 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination6({this.name, this.namespace, this.server});

  factory Destination6.fromJson(Map<String, dynamic> json) =>
      _$Destination6FromJson(json);

  Map<String, dynamic> toJson() => _$Destination6ToJson(this);
}

@JsonSerializable()
class IgnoreDifference6 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference6({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference6.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference6FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference6ToJson(this);
}

@JsonSerializable()
class Info6 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info6({required this.name, required this.value});

  factory Info6.fromJson(Map<String, dynamic> json) => _$Info6FromJson(json);

  Map<String, dynamic> toJson() => _$Info6ToJson(this);
}

@JsonSerializable()
class Source24 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory27? directory;
  @JsonKey(name: 'helm')
  Helm24? helm;
  @JsonKey(name: 'kustomize')
  Kustomize24? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin26? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source24({
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

  factory Source24.fromJson(Map<String, dynamic> json) =>
      _$Source24FromJson(json);

  Map<String, dynamic> toJson() => _$Source24ToJson(this);
}

@JsonSerializable()
class Directory27 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet24? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory27({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory27.fromJson(Map<String, dynamic> json) =>
      _$Directory27FromJson(json);

  Map<String, dynamic> toJson() => _$Directory27ToJson(this);
}

@JsonSerializable()
class Jsonnet24 {
  @JsonKey(name: 'extVars')
  List<ExtVar24?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas24?>? tlas;

  Jsonnet24({this.extVars, this.libs, this.tlas});

  factory Jsonnet24.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet24FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet24ToJson(this);
}

@JsonSerializable()
class ExtVar24 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar24({this.code, required this.name, required this.value});

  factory ExtVar24.fromJson(Map<String, dynamic> json) =>
      _$ExtVar24FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar24ToJson(this);
}

@JsonSerializable()
class Tlas24 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas24({this.code, required this.name, required this.value});

  factory Tlas24.fromJson(Map<String, dynamic> json) => _$Tlas24FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas24ToJson(this);
}

@JsonSerializable()
class Helm24 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter24?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter60?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm24({
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

  factory Helm24.fromJson(Map<String, dynamic> json) => _$Helm24FromJson(json);

  Map<String, dynamic> toJson() => _$Helm24ToJson(this);
}

@JsonSerializable()
class FileParameter24 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter24({this.name, this.path});

  factory FileParameter24.fromJson(Map<String, dynamic> json) =>
      _$FileParameter24FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter24ToJson(this);
}

@JsonSerializable()
class Parameter60 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter60({this.forceString, this.name, this.value});

  factory Parameter60.fromJson(Map<String, dynamic> json) =>
      _$Parameter60FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter60ToJson(this);
}

@JsonSerializable()
class Kustomize24 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch24?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica24?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize24({
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

  factory Kustomize24.fromJson(Map<String, dynamic> json) =>
      _$Kustomize24FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize24ToJson(this);
}

@JsonSerializable()
class Patch24 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target24? target;

  Patch24({this.options, this.patch, this.path, this.target});

  factory Patch24.fromJson(Map<String, dynamic> json) =>
      _$Patch24FromJson(json);

  Map<String, dynamic> toJson() => _$Patch24ToJson(this);
}

@JsonSerializable()
class Target24 {
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

  Target24({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target24.fromJson(Map<String, dynamic> json) =>
      _$Target24FromJson(json);

  Map<String, dynamic> toJson() => _$Target24ToJson(this);
}

@JsonSerializable()
class Replica24 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica24({required this.count, required this.name});

  factory Replica24.fromJson(Map<String, dynamic> json) =>
      _$Replica24FromJson(json);

  Map<String, dynamic> toJson() => _$Replica24ToJson(this);
}

@JsonSerializable()
class Plugin26 {
  @JsonKey(name: 'env')
  List<Env24?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter61?>? parameters;

  Plugin26({this.env, this.name, this.parameters});

  factory Plugin26.fromJson(Map<String, dynamic> json) =>
      _$Plugin26FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin26ToJson(this);
}

@JsonSerializable()
class Env24 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env24({required this.name, required this.value});

  factory Env24.fromJson(Map<String, dynamic> json) => _$Env24FromJson(json);

  Map<String, dynamic> toJson() => _$Env24ToJson(this);
}

@JsonSerializable()
class Parameter61 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter61({this.array, this.map, this.name, this.string});

  factory Parameter61.fromJson(Map<String, dynamic> json) =>
      _$Parameter61FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter61ToJson(this);
}

@JsonSerializable()
class SourceHydrator6 {
  @JsonKey(name: 'drySource')
  DrySource6 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo6? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource6 syncSource;

  SourceHydrator6({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator6.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator6FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator6ToJson(this);
}

@JsonSerializable()
class DrySource6 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource6({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource6.fromJson(Map<String, dynamic> json) =>
      _$DrySource6FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource6ToJson(this);
}

@JsonSerializable()
class HydrateTo6 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo6({required this.targetBranch});

  factory HydrateTo6.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo6FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo6ToJson(this);
}

@JsonSerializable()
class SyncSource6 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource6({required this.path, required this.targetBranch});

  factory SyncSource6.fromJson(Map<String, dynamic> json) =>
      _$SyncSource6FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource6ToJson(this);
}

@JsonSerializable()
class Source25 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory28? directory;
  @JsonKey(name: 'helm')
  Helm25? helm;
  @JsonKey(name: 'kustomize')
  Kustomize25? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin27? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source25({
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

  factory Source25.fromJson(Map<String, dynamic> json) =>
      _$Source25FromJson(json);

  Map<String, dynamic> toJson() => _$Source25ToJson(this);
}

@JsonSerializable()
class Directory28 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet25? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory28({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory28.fromJson(Map<String, dynamic> json) =>
      _$Directory28FromJson(json);

  Map<String, dynamic> toJson() => _$Directory28ToJson(this);
}

@JsonSerializable()
class Jsonnet25 {
  @JsonKey(name: 'extVars')
  List<ExtVar25?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas25?>? tlas;

  Jsonnet25({this.extVars, this.libs, this.tlas});

  factory Jsonnet25.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet25FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet25ToJson(this);
}

@JsonSerializable()
class ExtVar25 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar25({this.code, required this.name, required this.value});

  factory ExtVar25.fromJson(Map<String, dynamic> json) =>
      _$ExtVar25FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar25ToJson(this);
}

@JsonSerializable()
class Tlas25 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas25({this.code, required this.name, required this.value});

  factory Tlas25.fromJson(Map<String, dynamic> json) => _$Tlas25FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas25ToJson(this);
}

@JsonSerializable()
class Helm25 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter25?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter62?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm25({
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

  factory Helm25.fromJson(Map<String, dynamic> json) => _$Helm25FromJson(json);

  Map<String, dynamic> toJson() => _$Helm25ToJson(this);
}

@JsonSerializable()
class FileParameter25 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter25({this.name, this.path});

  factory FileParameter25.fromJson(Map<String, dynamic> json) =>
      _$FileParameter25FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter25ToJson(this);
}

@JsonSerializable()
class Parameter62 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter62({this.forceString, this.name, this.value});

  factory Parameter62.fromJson(Map<String, dynamic> json) =>
      _$Parameter62FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter62ToJson(this);
}

@JsonSerializable()
class Kustomize25 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch25?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica25?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize25({
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

  factory Kustomize25.fromJson(Map<String, dynamic> json) =>
      _$Kustomize25FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize25ToJson(this);
}

@JsonSerializable()
class Patch25 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target25? target;

  Patch25({this.options, this.patch, this.path, this.target});

  factory Patch25.fromJson(Map<String, dynamic> json) =>
      _$Patch25FromJson(json);

  Map<String, dynamic> toJson() => _$Patch25ToJson(this);
}

@JsonSerializable()
class Target25 {
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

  Target25({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target25.fromJson(Map<String, dynamic> json) =>
      _$Target25FromJson(json);

  Map<String, dynamic> toJson() => _$Target25ToJson(this);
}

@JsonSerializable()
class Replica25 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica25({required this.count, required this.name});

  factory Replica25.fromJson(Map<String, dynamic> json) =>
      _$Replica25FromJson(json);

  Map<String, dynamic> toJson() => _$Replica25ToJson(this);
}

@JsonSerializable()
class Plugin27 {
  @JsonKey(name: 'env')
  List<Env25?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter63?>? parameters;

  Plugin27({this.env, this.name, this.parameters});

  factory Plugin27.fromJson(Map<String, dynamic> json) =>
      _$Plugin27FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin27ToJson(this);
}

@JsonSerializable()
class Env25 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env25({required this.name, required this.value});

  factory Env25.fromJson(Map<String, dynamic> json) => _$Env25FromJson(json);

  Map<String, dynamic> toJson() => _$Env25ToJson(this);
}

@JsonSerializable()
class Parameter63 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter63({this.array, this.map, this.name, this.string});

  factory Parameter63.fromJson(Map<String, dynamic> json) =>
      _$Parameter63FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter63ToJson(this);
}

@JsonSerializable()
class SyncPolicy6 {
  @JsonKey(name: 'automated')
  Automated6? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata6? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry6? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy6({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy6.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy6FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy6ToJson(this);
}

@JsonSerializable()
class Automated6 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated6({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated6.fromJson(Map<String, dynamic> json) =>
      _$Automated6FromJson(json);

  Map<String, dynamic> toJson() => _$Automated6ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata6 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata6({this.annotations, this.labels});

  factory ManagedNamespaceMetadata6.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata6FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata6ToJson(this);
}

@JsonSerializable()
class Retry6 {
  @JsonKey(name: 'backoff')
  Backoff6? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry6({this.backoff, this.limit, this.refresh});

  factory Retry6.fromJson(Map<String, dynamic> json) => _$Retry6FromJson(json);

  Map<String, dynamic> toJson() => _$Retry6ToJson(this);
}

@JsonSerializable()
class Backoff6 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff6({this.duration, this.factor, this.maxDuration});

  factory Backoff6.fromJson(Map<String, dynamic> json) =>
      _$Backoff6FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff6ToJson(this);
}

@JsonSerializable()
class IndigoSelector {
  @JsonKey(name: 'matchExpressions')
  List<AmbitiousMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndigoSelector({this.matchExpressions, this.matchLabels});

  factory IndigoSelector.fromJson(Map<String, dynamic> json) =>
      _$IndigoSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSelectorToJson(this);
}

@JsonSerializable()
class AmbitiousMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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
class MergeTemplate {
  @JsonKey(name: 'metadata')
  Metadata7 metadata;
  @JsonKey(name: 'spec')
  Spec7 spec;

  MergeTemplate({required this.metadata, required this.spec});

  factory MergeTemplate.fromJson(Map<String, dynamic> json) =>
      _$MergeTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MergeTemplateToJson(this);
}

@JsonSerializable()
class Metadata7 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata7({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata7.fromJson(Map<String, dynamic> json) =>
      _$Metadata7FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata7ToJson(this);
}

@JsonSerializable()
class Spec7 {
  @JsonKey(name: 'destination')
  Destination7 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference7?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info7?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source26? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator7? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source27?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy7? syncPolicy;

  Spec7({
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

  factory Spec7.fromJson(Map<String, dynamic> json) => _$Spec7FromJson(json);

  Map<String, dynamic> toJson() => _$Spec7ToJson(this);
}

@JsonSerializable()
class Destination7 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination7({this.name, this.namespace, this.server});

  factory Destination7.fromJson(Map<String, dynamic> json) =>
      _$Destination7FromJson(json);

  Map<String, dynamic> toJson() => _$Destination7ToJson(this);
}

@JsonSerializable()
class IgnoreDifference7 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference7({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference7.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference7FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference7ToJson(this);
}

@JsonSerializable()
class Info7 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info7({required this.name, required this.value});

  factory Info7.fromJson(Map<String, dynamic> json) => _$Info7FromJson(json);

  Map<String, dynamic> toJson() => _$Info7ToJson(this);
}

@JsonSerializable()
class Source26 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory29? directory;
  @JsonKey(name: 'helm')
  Helm26? helm;
  @JsonKey(name: 'kustomize')
  Kustomize26? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin28? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source26({
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

  factory Source26.fromJson(Map<String, dynamic> json) =>
      _$Source26FromJson(json);

  Map<String, dynamic> toJson() => _$Source26ToJson(this);
}

@JsonSerializable()
class Directory29 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet26? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory29({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory29.fromJson(Map<String, dynamic> json) =>
      _$Directory29FromJson(json);

  Map<String, dynamic> toJson() => _$Directory29ToJson(this);
}

@JsonSerializable()
class Jsonnet26 {
  @JsonKey(name: 'extVars')
  List<ExtVar26?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas26?>? tlas;

  Jsonnet26({this.extVars, this.libs, this.tlas});

  factory Jsonnet26.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet26FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet26ToJson(this);
}

@JsonSerializable()
class ExtVar26 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar26({this.code, required this.name, required this.value});

  factory ExtVar26.fromJson(Map<String, dynamic> json) =>
      _$ExtVar26FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar26ToJson(this);
}

@JsonSerializable()
class Tlas26 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas26({this.code, required this.name, required this.value});

  factory Tlas26.fromJson(Map<String, dynamic> json) => _$Tlas26FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas26ToJson(this);
}

@JsonSerializable()
class Helm26 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter26?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter64?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm26({
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

  factory Helm26.fromJson(Map<String, dynamic> json) => _$Helm26FromJson(json);

  Map<String, dynamic> toJson() => _$Helm26ToJson(this);
}

@JsonSerializable()
class FileParameter26 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter26({this.name, this.path});

  factory FileParameter26.fromJson(Map<String, dynamic> json) =>
      _$FileParameter26FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter26ToJson(this);
}

@JsonSerializable()
class Parameter64 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter64({this.forceString, this.name, this.value});

  factory Parameter64.fromJson(Map<String, dynamic> json) =>
      _$Parameter64FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter64ToJson(this);
}

@JsonSerializable()
class Kustomize26 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch26?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica26?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize26({
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

  factory Kustomize26.fromJson(Map<String, dynamic> json) =>
      _$Kustomize26FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize26ToJson(this);
}

@JsonSerializable()
class Patch26 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target26? target;

  Patch26({this.options, this.patch, this.path, this.target});

  factory Patch26.fromJson(Map<String, dynamic> json) =>
      _$Patch26FromJson(json);

  Map<String, dynamic> toJson() => _$Patch26ToJson(this);
}

@JsonSerializable()
class Target26 {
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

  Target26({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target26.fromJson(Map<String, dynamic> json) =>
      _$Target26FromJson(json);

  Map<String, dynamic> toJson() => _$Target26ToJson(this);
}

@JsonSerializable()
class Replica26 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica26({required this.count, required this.name});

  factory Replica26.fromJson(Map<String, dynamic> json) =>
      _$Replica26FromJson(json);

  Map<String, dynamic> toJson() => _$Replica26ToJson(this);
}

@JsonSerializable()
class Plugin28 {
  @JsonKey(name: 'env')
  List<Env26?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter65?>? parameters;

  Plugin28({this.env, this.name, this.parameters});

  factory Plugin28.fromJson(Map<String, dynamic> json) =>
      _$Plugin28FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin28ToJson(this);
}

@JsonSerializable()
class Env26 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env26({required this.name, required this.value});

  factory Env26.fromJson(Map<String, dynamic> json) => _$Env26FromJson(json);

  Map<String, dynamic> toJson() => _$Env26ToJson(this);
}

@JsonSerializable()
class Parameter65 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter65({this.array, this.map, this.name, this.string});

  factory Parameter65.fromJson(Map<String, dynamic> json) =>
      _$Parameter65FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter65ToJson(this);
}

@JsonSerializable()
class SourceHydrator7 {
  @JsonKey(name: 'drySource')
  DrySource7 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo7? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource7 syncSource;

  SourceHydrator7({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator7.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator7FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator7ToJson(this);
}

@JsonSerializable()
class DrySource7 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource7({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource7.fromJson(Map<String, dynamic> json) =>
      _$DrySource7FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource7ToJson(this);
}

@JsonSerializable()
class HydrateTo7 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo7({required this.targetBranch});

  factory HydrateTo7.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo7FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo7ToJson(this);
}

@JsonSerializable()
class SyncSource7 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource7({required this.path, required this.targetBranch});

  factory SyncSource7.fromJson(Map<String, dynamic> json) =>
      _$SyncSource7FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource7ToJson(this);
}

@JsonSerializable()
class Source27 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory30? directory;
  @JsonKey(name: 'helm')
  Helm27? helm;
  @JsonKey(name: 'kustomize')
  Kustomize27? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin29? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source27({
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

  factory Source27.fromJson(Map<String, dynamic> json) =>
      _$Source27FromJson(json);

  Map<String, dynamic> toJson() => _$Source27ToJson(this);
}

@JsonSerializable()
class Directory30 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet27? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory30({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory30.fromJson(Map<String, dynamic> json) =>
      _$Directory30FromJson(json);

  Map<String, dynamic> toJson() => _$Directory30ToJson(this);
}

@JsonSerializable()
class Jsonnet27 {
  @JsonKey(name: 'extVars')
  List<ExtVar27?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas27?>? tlas;

  Jsonnet27({this.extVars, this.libs, this.tlas});

  factory Jsonnet27.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet27FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet27ToJson(this);
}

@JsonSerializable()
class ExtVar27 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar27({this.code, required this.name, required this.value});

  factory ExtVar27.fromJson(Map<String, dynamic> json) =>
      _$ExtVar27FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar27ToJson(this);
}

@JsonSerializable()
class Tlas27 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas27({this.code, required this.name, required this.value});

  factory Tlas27.fromJson(Map<String, dynamic> json) => _$Tlas27FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas27ToJson(this);
}

@JsonSerializable()
class Helm27 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter27?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter66?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm27({
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

  factory Helm27.fromJson(Map<String, dynamic> json) => _$Helm27FromJson(json);

  Map<String, dynamic> toJson() => _$Helm27ToJson(this);
}

@JsonSerializable()
class FileParameter27 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter27({this.name, this.path});

  factory FileParameter27.fromJson(Map<String, dynamic> json) =>
      _$FileParameter27FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter27ToJson(this);
}

@JsonSerializable()
class Parameter66 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter66({this.forceString, this.name, this.value});

  factory Parameter66.fromJson(Map<String, dynamic> json) =>
      _$Parameter66FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter66ToJson(this);
}

@JsonSerializable()
class Kustomize27 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch27?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica27?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize27({
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

  factory Kustomize27.fromJson(Map<String, dynamic> json) =>
      _$Kustomize27FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize27ToJson(this);
}

@JsonSerializable()
class Patch27 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target27? target;

  Patch27({this.options, this.patch, this.path, this.target});

  factory Patch27.fromJson(Map<String, dynamic> json) =>
      _$Patch27FromJson(json);

  Map<String, dynamic> toJson() => _$Patch27ToJson(this);
}

@JsonSerializable()
class Target27 {
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

  Target27({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target27.fromJson(Map<String, dynamic> json) =>
      _$Target27FromJson(json);

  Map<String, dynamic> toJson() => _$Target27ToJson(this);
}

@JsonSerializable()
class Replica27 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica27({required this.count, required this.name});

  factory Replica27.fromJson(Map<String, dynamic> json) =>
      _$Replica27FromJson(json);

  Map<String, dynamic> toJson() => _$Replica27ToJson(this);
}

@JsonSerializable()
class Plugin29 {
  @JsonKey(name: 'env')
  List<Env27?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter67?>? parameters;

  Plugin29({this.env, this.name, this.parameters});

  factory Plugin29.fromJson(Map<String, dynamic> json) =>
      _$Plugin29FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin29ToJson(this);
}

@JsonSerializable()
class Env27 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env27({required this.name, required this.value});

  factory Env27.fromJson(Map<String, dynamic> json) => _$Env27FromJson(json);

  Map<String, dynamic> toJson() => _$Env27ToJson(this);
}

@JsonSerializable()
class Parameter67 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter67({this.array, this.map, this.name, this.string});

  factory Parameter67.fromJson(Map<String, dynamic> json) =>
      _$Parameter67FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter67ToJson(this);
}

@JsonSerializable()
class SyncPolicy7 {
  @JsonKey(name: 'automated')
  Automated7? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata7? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry7? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy7({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy7.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy7FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy7ToJson(this);
}

@JsonSerializable()
class Automated7 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated7({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated7.fromJson(Map<String, dynamic> json) =>
      _$Automated7FromJson(json);

  Map<String, dynamic> toJson() => _$Automated7ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata7 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata7({this.annotations, this.labels});

  factory ManagedNamespaceMetadata7.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata7FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata7ToJson(this);
}

@JsonSerializable()
class Retry7 {
  @JsonKey(name: 'backoff')
  Backoff7? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry7({this.backoff, this.limit, this.refresh});

  factory Retry7.fromJson(Map<String, dynamic> json) => _$Retry7FromJson(json);

  Map<String, dynamic> toJson() => _$Retry7ToJson(this);
}

@JsonSerializable()
class Backoff7 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff7({this.duration, this.factor, this.maxDuration});

  factory Backoff7.fromJson(Map<String, dynamic> json) =>
      _$Backoff7FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff7ToJson(this);
}

@JsonSerializable()
class Plugin30 {
  @JsonKey(name: 'configMapRef')
  TentacledConfigMapRef configMapRef;
  @JsonKey(name: 'input')
  TentacledInput? input;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template6? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  Plugin30({
    required this.configMapRef,
    this.input,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory Plugin30.fromJson(Map<String, dynamic> json) =>
      _$Plugin30FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin30ToJson(this);
}

@JsonSerializable()
class TentacledConfigMapRef {
  @JsonKey(name: 'name')
  String name;

  TentacledConfigMapRef({required this.name});

  factory TentacledConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledConfigMapRefToJson(this);
}

@JsonSerializable()
class TentacledInput {
  @JsonKey(name: 'parameters')
  Map<String, dynamic>? parameters;

  TentacledInput({this.parameters});

  factory TentacledInput.fromJson(Map<String, dynamic> json) =>
      _$TentacledInputFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledInputToJson(this);
}

@JsonSerializable()
class Template6 {
  @JsonKey(name: 'metadata')
  Metadata8 metadata;
  @JsonKey(name: 'spec')
  Spec8 spec;

  Template6({required this.metadata, required this.spec});

  factory Template6.fromJson(Map<String, dynamic> json) =>
      _$Template6FromJson(json);

  Map<String, dynamic> toJson() => _$Template6ToJson(this);
}

@JsonSerializable()
class Metadata8 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata8({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata8.fromJson(Map<String, dynamic> json) =>
      _$Metadata8FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata8ToJson(this);
}

@JsonSerializable()
class Spec8 {
  @JsonKey(name: 'destination')
  Destination8 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference8?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info8?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source28? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator8? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source29?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy8? syncPolicy;

  Spec8({
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

  factory Spec8.fromJson(Map<String, dynamic> json) => _$Spec8FromJson(json);

  Map<String, dynamic> toJson() => _$Spec8ToJson(this);
}

@JsonSerializable()
class Destination8 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination8({this.name, this.namespace, this.server});

  factory Destination8.fromJson(Map<String, dynamic> json) =>
      _$Destination8FromJson(json);

  Map<String, dynamic> toJson() => _$Destination8ToJson(this);
}

@JsonSerializable()
class IgnoreDifference8 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference8({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference8.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference8FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference8ToJson(this);
}

@JsonSerializable()
class Info8 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info8({required this.name, required this.value});

  factory Info8.fromJson(Map<String, dynamic> json) => _$Info8FromJson(json);

  Map<String, dynamic> toJson() => _$Info8ToJson(this);
}

@JsonSerializable()
class Source28 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory31? directory;
  @JsonKey(name: 'helm')
  Helm28? helm;
  @JsonKey(name: 'kustomize')
  Kustomize28? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin31? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source28({
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

  factory Source28.fromJson(Map<String, dynamic> json) =>
      _$Source28FromJson(json);

  Map<String, dynamic> toJson() => _$Source28ToJson(this);
}

@JsonSerializable()
class Directory31 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet28? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory31({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory31.fromJson(Map<String, dynamic> json) =>
      _$Directory31FromJson(json);

  Map<String, dynamic> toJson() => _$Directory31ToJson(this);
}

@JsonSerializable()
class Jsonnet28 {
  @JsonKey(name: 'extVars')
  List<ExtVar28?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas28?>? tlas;

  Jsonnet28({this.extVars, this.libs, this.tlas});

  factory Jsonnet28.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet28FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet28ToJson(this);
}

@JsonSerializable()
class ExtVar28 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar28({this.code, required this.name, required this.value});

  factory ExtVar28.fromJson(Map<String, dynamic> json) =>
      _$ExtVar28FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar28ToJson(this);
}

@JsonSerializable()
class Tlas28 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas28({this.code, required this.name, required this.value});

  factory Tlas28.fromJson(Map<String, dynamic> json) => _$Tlas28FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas28ToJson(this);
}

@JsonSerializable()
class Helm28 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter28?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter68?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm28({
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

  factory Helm28.fromJson(Map<String, dynamic> json) => _$Helm28FromJson(json);

  Map<String, dynamic> toJson() => _$Helm28ToJson(this);
}

@JsonSerializable()
class FileParameter28 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter28({this.name, this.path});

  factory FileParameter28.fromJson(Map<String, dynamic> json) =>
      _$FileParameter28FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter28ToJson(this);
}

@JsonSerializable()
class Parameter68 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter68({this.forceString, this.name, this.value});

  factory Parameter68.fromJson(Map<String, dynamic> json) =>
      _$Parameter68FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter68ToJson(this);
}

@JsonSerializable()
class Kustomize28 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch28?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica28?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize28({
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

  factory Kustomize28.fromJson(Map<String, dynamic> json) =>
      _$Kustomize28FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize28ToJson(this);
}

@JsonSerializable()
class Patch28 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target28? target;

  Patch28({this.options, this.patch, this.path, this.target});

  factory Patch28.fromJson(Map<String, dynamic> json) =>
      _$Patch28FromJson(json);

  Map<String, dynamic> toJson() => _$Patch28ToJson(this);
}

@JsonSerializable()
class Target28 {
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

  Target28({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target28.fromJson(Map<String, dynamic> json) =>
      _$Target28FromJson(json);

  Map<String, dynamic> toJson() => _$Target28ToJson(this);
}

@JsonSerializable()
class Replica28 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica28({required this.count, required this.name});

  factory Replica28.fromJson(Map<String, dynamic> json) =>
      _$Replica28FromJson(json);

  Map<String, dynamic> toJson() => _$Replica28ToJson(this);
}

@JsonSerializable()
class Plugin31 {
  @JsonKey(name: 'env')
  List<Env28?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter69?>? parameters;

  Plugin31({this.env, this.name, this.parameters});

  factory Plugin31.fromJson(Map<String, dynamic> json) =>
      _$Plugin31FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin31ToJson(this);
}

@JsonSerializable()
class Env28 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env28({required this.name, required this.value});

  factory Env28.fromJson(Map<String, dynamic> json) => _$Env28FromJson(json);

  Map<String, dynamic> toJson() => _$Env28ToJson(this);
}

@JsonSerializable()
class Parameter69 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter69({this.array, this.map, this.name, this.string});

  factory Parameter69.fromJson(Map<String, dynamic> json) =>
      _$Parameter69FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter69ToJson(this);
}

@JsonSerializable()
class SourceHydrator8 {
  @JsonKey(name: 'drySource')
  DrySource8 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo8? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource8 syncSource;

  SourceHydrator8({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator8.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator8FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator8ToJson(this);
}

@JsonSerializable()
class DrySource8 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource8({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource8.fromJson(Map<String, dynamic> json) =>
      _$DrySource8FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource8ToJson(this);
}

@JsonSerializable()
class HydrateTo8 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo8({required this.targetBranch});

  factory HydrateTo8.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo8FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo8ToJson(this);
}

@JsonSerializable()
class SyncSource8 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource8({required this.path, required this.targetBranch});

  factory SyncSource8.fromJson(Map<String, dynamic> json) =>
      _$SyncSource8FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource8ToJson(this);
}

@JsonSerializable()
class Source29 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory32? directory;
  @JsonKey(name: 'helm')
  Helm29? helm;
  @JsonKey(name: 'kustomize')
  Kustomize29? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin32? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source29({
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

  factory Source29.fromJson(Map<String, dynamic> json) =>
      _$Source29FromJson(json);

  Map<String, dynamic> toJson() => _$Source29ToJson(this);
}

@JsonSerializable()
class Directory32 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet29? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory32({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory32.fromJson(Map<String, dynamic> json) =>
      _$Directory32FromJson(json);

  Map<String, dynamic> toJson() => _$Directory32ToJson(this);
}

@JsonSerializable()
class Jsonnet29 {
  @JsonKey(name: 'extVars')
  List<ExtVar29?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas29?>? tlas;

  Jsonnet29({this.extVars, this.libs, this.tlas});

  factory Jsonnet29.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet29FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet29ToJson(this);
}

@JsonSerializable()
class ExtVar29 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar29({this.code, required this.name, required this.value});

  factory ExtVar29.fromJson(Map<String, dynamic> json) =>
      _$ExtVar29FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar29ToJson(this);
}

@JsonSerializable()
class Tlas29 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas29({this.code, required this.name, required this.value});

  factory Tlas29.fromJson(Map<String, dynamic> json) => _$Tlas29FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas29ToJson(this);
}

@JsonSerializable()
class Helm29 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter29?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter70?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm29({
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

  factory Helm29.fromJson(Map<String, dynamic> json) => _$Helm29FromJson(json);

  Map<String, dynamic> toJson() => _$Helm29ToJson(this);
}

@JsonSerializable()
class FileParameter29 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter29({this.name, this.path});

  factory FileParameter29.fromJson(Map<String, dynamic> json) =>
      _$FileParameter29FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter29ToJson(this);
}

@JsonSerializable()
class Parameter70 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter70({this.forceString, this.name, this.value});

  factory Parameter70.fromJson(Map<String, dynamic> json) =>
      _$Parameter70FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter70ToJson(this);
}

@JsonSerializable()
class Kustomize29 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch29?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica29?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize29({
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

  factory Kustomize29.fromJson(Map<String, dynamic> json) =>
      _$Kustomize29FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize29ToJson(this);
}

@JsonSerializable()
class Patch29 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target29? target;

  Patch29({this.options, this.patch, this.path, this.target});

  factory Patch29.fromJson(Map<String, dynamic> json) =>
      _$Patch29FromJson(json);

  Map<String, dynamic> toJson() => _$Patch29ToJson(this);
}

@JsonSerializable()
class Target29 {
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

  Target29({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target29.fromJson(Map<String, dynamic> json) =>
      _$Target29FromJson(json);

  Map<String, dynamic> toJson() => _$Target29ToJson(this);
}

@JsonSerializable()
class Replica29 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica29({required this.count, required this.name});

  factory Replica29.fromJson(Map<String, dynamic> json) =>
      _$Replica29FromJson(json);

  Map<String, dynamic> toJson() => _$Replica29ToJson(this);
}

@JsonSerializable()
class Plugin32 {
  @JsonKey(name: 'env')
  List<Env29?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter71?>? parameters;

  Plugin32({this.env, this.name, this.parameters});

  factory Plugin32.fromJson(Map<String, dynamic> json) =>
      _$Plugin32FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin32ToJson(this);
}

@JsonSerializable()
class Env29 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env29({required this.name, required this.value});

  factory Env29.fromJson(Map<String, dynamic> json) => _$Env29FromJson(json);

  Map<String, dynamic> toJson() => _$Env29ToJson(this);
}

@JsonSerializable()
class Parameter71 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter71({this.array, this.map, this.name, this.string});

  factory Parameter71.fromJson(Map<String, dynamic> json) =>
      _$Parameter71FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter71ToJson(this);
}

@JsonSerializable()
class SyncPolicy8 {
  @JsonKey(name: 'automated')
  Automated8? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata8? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry8? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy8({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy8.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy8FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy8ToJson(this);
}

@JsonSerializable()
class Automated8 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated8({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated8.fromJson(Map<String, dynamic> json) =>
      _$Automated8FromJson(json);

  Map<String, dynamic> toJson() => _$Automated8ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata8 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata8({this.annotations, this.labels});

  factory ManagedNamespaceMetadata8.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata8FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata8ToJson(this);
}

@JsonSerializable()
class Retry8 {
  @JsonKey(name: 'backoff')
  Backoff8? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry8({this.backoff, this.limit, this.refresh});

  factory Retry8.fromJson(Map<String, dynamic> json) => _$Retry8FromJson(json);

  Map<String, dynamic> toJson() => _$Retry8ToJson(this);
}

@JsonSerializable()
class Backoff8 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff8({this.duration, this.factor, this.maxDuration});

  factory Backoff8.fromJson(Map<String, dynamic> json) =>
      _$Backoff8FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff8ToJson(this);
}

@JsonSerializable()
class TentacledPullRequest {
  @JsonKey(name: 'azuredevops')
  TentacledAzuredevops? azuredevops;
  @JsonKey(name: 'bitbucket')
  IndigoBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  IndigoBitbucketServer? bitbucketServer;
  @JsonKey(name: 'continueOnRepoNotFoundError')
  bool? continueOnRepoNotFoundError;
  @JsonKey(name: 'filters')
  List<IndigoFilter?>? filters;
  @JsonKey(name: 'gitea')
  IndigoGitea? gitea;
  @JsonKey(name: 'github')
  IndigoGithub? github;
  @JsonKey(name: 'gitlab')
  IndigoGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template7? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  TentacledPullRequest({
    this.azuredevops,
    this.bitbucket,
    this.bitbucketServer,
    this.continueOnRepoNotFoundError,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory TentacledPullRequest.fromJson(Map<String, dynamic> json) =>
      _$TentacledPullRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPullRequestToJson(this);
}

@JsonSerializable()
class TentacledAzuredevops {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  TokenRef8? tokenRef;

  TentacledAzuredevops({
    this.api,
    this.labels,
    required this.organization,
    required this.project,
    required this.repo,
    this.tokenRef,
  });

  factory TentacledAzuredevops.fromJson(Map<String, dynamic> json) =>
      _$TentacledAzuredevopsFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAzuredevopsToJson(this);
}

@JsonSerializable()
class TokenRef8 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef8({required this.key, required this.secretName});

  factory TokenRef8.fromJson(Map<String, dynamic> json) =>
      _$TokenRef8FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef8ToJson(this);
}

@JsonSerializable()
class IndigoBitbucket {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'basicAuth')
  HilariousBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  HilariousBearerToken? bearerToken;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;

  IndigoBitbucket({
    this.api,
    this.basicAuth,
    this.bearerToken,
    required this.owner,
    required this.repo,
  });

  factory IndigoBitbucket.fromJson(Map<String, dynamic> json) =>
      _$IndigoBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoBitbucketToJson(this);
}

@JsonSerializable()
class HilariousBasicAuth {
  @JsonKey(name: 'passwordRef')
  HilariousPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  HilariousBasicAuth({required this.passwordRef, required this.username});

  factory HilariousBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$HilariousBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousBasicAuthToJson(this);
}

@JsonSerializable()
class HilariousPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  HilariousPasswordRef({required this.key, required this.secretName});

  factory HilariousPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$HilariousPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousPasswordRefToJson(this);
}

@JsonSerializable()
class HilariousBearerToken {
  @JsonKey(name: 'tokenRef')
  TokenRef9 tokenRef;

  HilariousBearerToken({required this.tokenRef});

  factory HilariousBearerToken.fromJson(Map<String, dynamic> json) =>
      _$HilariousBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousBearerTokenToJson(this);
}

@JsonSerializable()
class TokenRef9 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef9({required this.key, required this.secretName});

  factory TokenRef9.fromJson(Map<String, dynamic> json) =>
      _$TokenRef9FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef9ToJson(this);
}

@JsonSerializable()
class IndigoBitbucketServer {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  AmbitiousBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  AmbitiousBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  CunningCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'repo')
  String repo;

  IndigoBitbucketServer({
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
    required this.repo,
  });

  factory IndigoBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$IndigoBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoBitbucketServerToJson(this);
}

@JsonSerializable()
class AmbitiousBasicAuth {
  @JsonKey(name: 'passwordRef')
  AmbitiousPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  AmbitiousBasicAuth({required this.passwordRef, required this.username});

  factory AmbitiousBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousBasicAuthToJson(this);
}

@JsonSerializable()
class AmbitiousPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  AmbitiousPasswordRef({required this.key, required this.secretName});

  factory AmbitiousPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousPasswordRefToJson(this);
}

@JsonSerializable()
class AmbitiousBearerToken {
  @JsonKey(name: 'tokenRef')
  TokenRef10 tokenRef;

  AmbitiousBearerToken({required this.tokenRef});

  factory AmbitiousBearerToken.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousBearerTokenToJson(this);
}

@JsonSerializable()
class TokenRef10 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef10({required this.key, required this.secretName});

  factory TokenRef10.fromJson(Map<String, dynamic> json) =>
      _$TokenRef10FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef10ToJson(this);
}

@JsonSerializable()
class CunningCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  CunningCaRef({required this.configMapName, required this.key});

  factory CunningCaRef.fromJson(Map<String, dynamic> json) =>
      _$CunningCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$CunningCaRefToJson(this);
}

@JsonSerializable()
class IndigoFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'targetBranchMatch')
  String? targetBranchMatch;
  @JsonKey(name: 'titleMatch')
  String? titleMatch;

  IndigoFilter({this.branchMatch, this.targetBranchMatch, this.titleMatch});

  factory IndigoFilter.fromJson(Map<String, dynamic> json) =>
      _$IndigoFilterFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoFilterToJson(this);
}

@JsonSerializable()
class IndigoGitea {
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  TokenRef11? tokenRef;

  IndigoGitea({
    required this.api,
    this.insecure,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory IndigoGitea.fromJson(Map<String, dynamic> json) =>
      _$IndigoGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoGiteaToJson(this);
}

@JsonSerializable()
class TokenRef11 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef11({required this.key, required this.secretName});

  factory TokenRef11.fromJson(Map<String, dynamic> json) =>
      _$TokenRef11FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef11ToJson(this);
}

@JsonSerializable()
class IndigoGithub {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'repo')
  String repo;
  @JsonKey(name: 'tokenRef')
  TokenRef12? tokenRef;

  IndigoGithub({
    this.api,
    this.appSecretName,
    this.labels,
    required this.owner,
    required this.repo,
    this.tokenRef,
  });

  factory IndigoGithub.fromJson(Map<String, dynamic> json) =>
      _$IndigoGithubFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoGithubToJson(this);
}

@JsonSerializable()
class TokenRef12 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef12({required this.key, required this.secretName});

  factory TokenRef12.fromJson(Map<String, dynamic> json) =>
      _$TokenRef12FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef12ToJson(this);
}

@JsonSerializable()
class IndigoGitlab {
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  MagentaCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'labels')
  List<String?>? labels;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'pullRequestState')
  String? pullRequestState;
  @JsonKey(name: 'tokenRef')
  TokenRef13? tokenRef;

  IndigoGitlab({
    this.api,
    this.caRef,
    this.insecure,
    this.labels,
    required this.project,
    this.pullRequestState,
    this.tokenRef,
  });

  factory IndigoGitlab.fromJson(Map<String, dynamic> json) =>
      _$IndigoGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoGitlabToJson(this);
}

@JsonSerializable()
class MagentaCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  MagentaCaRef({required this.configMapName, required this.key});

  factory MagentaCaRef.fromJson(Map<String, dynamic> json) =>
      _$MagentaCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaCaRefToJson(this);
}

@JsonSerializable()
class TokenRef13 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef13({required this.key, required this.secretName});

  factory TokenRef13.fromJson(Map<String, dynamic> json) =>
      _$TokenRef13FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef13ToJson(this);
}

@JsonSerializable()
class Template7 {
  @JsonKey(name: 'metadata')
  Metadata9 metadata;
  @JsonKey(name: 'spec')
  Spec9 spec;

  Template7({required this.metadata, required this.spec});

  factory Template7.fromJson(Map<String, dynamic> json) =>
      _$Template7FromJson(json);

  Map<String, dynamic> toJson() => _$Template7ToJson(this);
}

@JsonSerializable()
class Metadata9 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata9({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata9.fromJson(Map<String, dynamic> json) =>
      _$Metadata9FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata9ToJson(this);
}

@JsonSerializable()
class Spec9 {
  @JsonKey(name: 'destination')
  Destination9 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference9?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info9?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source30? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator9? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source31?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy9? syncPolicy;

  Spec9({
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

  factory Spec9.fromJson(Map<String, dynamic> json) => _$Spec9FromJson(json);

  Map<String, dynamic> toJson() => _$Spec9ToJson(this);
}

@JsonSerializable()
class Destination9 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination9({this.name, this.namespace, this.server});

  factory Destination9.fromJson(Map<String, dynamic> json) =>
      _$Destination9FromJson(json);

  Map<String, dynamic> toJson() => _$Destination9ToJson(this);
}

@JsonSerializable()
class IgnoreDifference9 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference9({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference9.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference9FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference9ToJson(this);
}

@JsonSerializable()
class Info9 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info9({required this.name, required this.value});

  factory Info9.fromJson(Map<String, dynamic> json) => _$Info9FromJson(json);

  Map<String, dynamic> toJson() => _$Info9ToJson(this);
}

@JsonSerializable()
class Source30 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory33? directory;
  @JsonKey(name: 'helm')
  Helm30? helm;
  @JsonKey(name: 'kustomize')
  Kustomize30? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin33? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source30({
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

  factory Source30.fromJson(Map<String, dynamic> json) =>
      _$Source30FromJson(json);

  Map<String, dynamic> toJson() => _$Source30ToJson(this);
}

@JsonSerializable()
class Directory33 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet30? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory33({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory33.fromJson(Map<String, dynamic> json) =>
      _$Directory33FromJson(json);

  Map<String, dynamic> toJson() => _$Directory33ToJson(this);
}

@JsonSerializable()
class Jsonnet30 {
  @JsonKey(name: 'extVars')
  List<ExtVar30?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas30?>? tlas;

  Jsonnet30({this.extVars, this.libs, this.tlas});

  factory Jsonnet30.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet30FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet30ToJson(this);
}

@JsonSerializable()
class ExtVar30 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar30({this.code, required this.name, required this.value});

  factory ExtVar30.fromJson(Map<String, dynamic> json) =>
      _$ExtVar30FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar30ToJson(this);
}

@JsonSerializable()
class Tlas30 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas30({this.code, required this.name, required this.value});

  factory Tlas30.fromJson(Map<String, dynamic> json) => _$Tlas30FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas30ToJson(this);
}

@JsonSerializable()
class Helm30 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter30?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter72?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm30({
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

  factory Helm30.fromJson(Map<String, dynamic> json) => _$Helm30FromJson(json);

  Map<String, dynamic> toJson() => _$Helm30ToJson(this);
}

@JsonSerializable()
class FileParameter30 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter30({this.name, this.path});

  factory FileParameter30.fromJson(Map<String, dynamic> json) =>
      _$FileParameter30FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter30ToJson(this);
}

@JsonSerializable()
class Parameter72 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter72({this.forceString, this.name, this.value});

  factory Parameter72.fromJson(Map<String, dynamic> json) =>
      _$Parameter72FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter72ToJson(this);
}

@JsonSerializable()
class Kustomize30 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch30?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica30?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize30({
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

  factory Kustomize30.fromJson(Map<String, dynamic> json) =>
      _$Kustomize30FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize30ToJson(this);
}

@JsonSerializable()
class Patch30 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target30? target;

  Patch30({this.options, this.patch, this.path, this.target});

  factory Patch30.fromJson(Map<String, dynamic> json) =>
      _$Patch30FromJson(json);

  Map<String, dynamic> toJson() => _$Patch30ToJson(this);
}

@JsonSerializable()
class Target30 {
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

  Target30({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target30.fromJson(Map<String, dynamic> json) =>
      _$Target30FromJson(json);

  Map<String, dynamic> toJson() => _$Target30ToJson(this);
}

@JsonSerializable()
class Replica30 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica30({required this.count, required this.name});

  factory Replica30.fromJson(Map<String, dynamic> json) =>
      _$Replica30FromJson(json);

  Map<String, dynamic> toJson() => _$Replica30ToJson(this);
}

@JsonSerializable()
class Plugin33 {
  @JsonKey(name: 'env')
  List<Env30?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter73?>? parameters;

  Plugin33({this.env, this.name, this.parameters});

  factory Plugin33.fromJson(Map<String, dynamic> json) =>
      _$Plugin33FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin33ToJson(this);
}

@JsonSerializable()
class Env30 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env30({required this.name, required this.value});

  factory Env30.fromJson(Map<String, dynamic> json) => _$Env30FromJson(json);

  Map<String, dynamic> toJson() => _$Env30ToJson(this);
}

@JsonSerializable()
class Parameter73 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter73({this.array, this.map, this.name, this.string});

  factory Parameter73.fromJson(Map<String, dynamic> json) =>
      _$Parameter73FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter73ToJson(this);
}

@JsonSerializable()
class SourceHydrator9 {
  @JsonKey(name: 'drySource')
  DrySource9 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo9? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource9 syncSource;

  SourceHydrator9({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator9.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator9FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator9ToJson(this);
}

@JsonSerializable()
class DrySource9 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource9({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource9.fromJson(Map<String, dynamic> json) =>
      _$DrySource9FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource9ToJson(this);
}

@JsonSerializable()
class HydrateTo9 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo9({required this.targetBranch});

  factory HydrateTo9.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo9FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo9ToJson(this);
}

@JsonSerializable()
class SyncSource9 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource9({required this.path, required this.targetBranch});

  factory SyncSource9.fromJson(Map<String, dynamic> json) =>
      _$SyncSource9FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource9ToJson(this);
}

@JsonSerializable()
class Source31 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory34? directory;
  @JsonKey(name: 'helm')
  Helm31? helm;
  @JsonKey(name: 'kustomize')
  Kustomize31? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin34? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source31({
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

  factory Source31.fromJson(Map<String, dynamic> json) =>
      _$Source31FromJson(json);

  Map<String, dynamic> toJson() => _$Source31ToJson(this);
}

@JsonSerializable()
class Directory34 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet31? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory34({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory34.fromJson(Map<String, dynamic> json) =>
      _$Directory34FromJson(json);

  Map<String, dynamic> toJson() => _$Directory34ToJson(this);
}

@JsonSerializable()
class Jsonnet31 {
  @JsonKey(name: 'extVars')
  List<ExtVar31?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas31?>? tlas;

  Jsonnet31({this.extVars, this.libs, this.tlas});

  factory Jsonnet31.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet31FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet31ToJson(this);
}

@JsonSerializable()
class ExtVar31 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar31({this.code, required this.name, required this.value});

  factory ExtVar31.fromJson(Map<String, dynamic> json) =>
      _$ExtVar31FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar31ToJson(this);
}

@JsonSerializable()
class Tlas31 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas31({this.code, required this.name, required this.value});

  factory Tlas31.fromJson(Map<String, dynamic> json) => _$Tlas31FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas31ToJson(this);
}

@JsonSerializable()
class Helm31 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter31?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter74?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm31({
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

  factory Helm31.fromJson(Map<String, dynamic> json) => _$Helm31FromJson(json);

  Map<String, dynamic> toJson() => _$Helm31ToJson(this);
}

@JsonSerializable()
class FileParameter31 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter31({this.name, this.path});

  factory FileParameter31.fromJson(Map<String, dynamic> json) =>
      _$FileParameter31FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter31ToJson(this);
}

@JsonSerializable()
class Parameter74 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter74({this.forceString, this.name, this.value});

  factory Parameter74.fromJson(Map<String, dynamic> json) =>
      _$Parameter74FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter74ToJson(this);
}

@JsonSerializable()
class Kustomize31 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch31?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica31?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize31({
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

  factory Kustomize31.fromJson(Map<String, dynamic> json) =>
      _$Kustomize31FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize31ToJson(this);
}

@JsonSerializable()
class Patch31 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target31? target;

  Patch31({this.options, this.patch, this.path, this.target});

  factory Patch31.fromJson(Map<String, dynamic> json) =>
      _$Patch31FromJson(json);

  Map<String, dynamic> toJson() => _$Patch31ToJson(this);
}

@JsonSerializable()
class Target31 {
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

  Target31({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target31.fromJson(Map<String, dynamic> json) =>
      _$Target31FromJson(json);

  Map<String, dynamic> toJson() => _$Target31ToJson(this);
}

@JsonSerializable()
class Replica31 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica31({required this.count, required this.name});

  factory Replica31.fromJson(Map<String, dynamic> json) =>
      _$Replica31FromJson(json);

  Map<String, dynamic> toJson() => _$Replica31ToJson(this);
}

@JsonSerializable()
class Plugin34 {
  @JsonKey(name: 'env')
  List<Env31?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter75?>? parameters;

  Plugin34({this.env, this.name, this.parameters});

  factory Plugin34.fromJson(Map<String, dynamic> json) =>
      _$Plugin34FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin34ToJson(this);
}

@JsonSerializable()
class Env31 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env31({required this.name, required this.value});

  factory Env31.fromJson(Map<String, dynamic> json) => _$Env31FromJson(json);

  Map<String, dynamic> toJson() => _$Env31ToJson(this);
}

@JsonSerializable()
class Parameter75 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter75({this.array, this.map, this.name, this.string});

  factory Parameter75.fromJson(Map<String, dynamic> json) =>
      _$Parameter75FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter75ToJson(this);
}

@JsonSerializable()
class SyncPolicy9 {
  @JsonKey(name: 'automated')
  Automated9? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata9? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry9? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy9({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy9.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy9FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy9ToJson(this);
}

@JsonSerializable()
class Automated9 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated9({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated9.fromJson(Map<String, dynamic> json) =>
      _$Automated9FromJson(json);

  Map<String, dynamic> toJson() => _$Automated9ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata9 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata9({this.annotations, this.labels});

  factory ManagedNamespaceMetadata9.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata9FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata9ToJson(this);
}

@JsonSerializable()
class Retry9 {
  @JsonKey(name: 'backoff')
  Backoff9? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry9({this.backoff, this.limit, this.refresh});

  factory Retry9.fromJson(Map<String, dynamic> json) => _$Retry9FromJson(json);

  Map<String, dynamic> toJson() => _$Retry9ToJson(this);
}

@JsonSerializable()
class Backoff9 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff9({this.duration, this.factor, this.maxDuration});

  factory Backoff9.fromJson(Map<String, dynamic> json) =>
      _$Backoff9FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff9ToJson(this);
}

@JsonSerializable()
class TentacledScmProvider {
  @JsonKey(name: 'awsCodeCommit')
  TentacledAwsCodeCommit? awsCodeCommit;
  @JsonKey(name: 'azureDevOps')
  TentacledAzureDevOps? azureDevOps;
  @JsonKey(name: 'bitbucket')
  IndecentBitbucket? bitbucket;
  @JsonKey(name: 'bitbucketServer')
  IndecentBitbucketServer? bitbucketServer;
  @JsonKey(name: 'cloneProtocol')
  String? cloneProtocol;
  @JsonKey(name: 'filters')
  List<IndecentFilter?>? filters;
  @JsonKey(name: 'gitea')
  IndecentGitea? gitea;
  @JsonKey(name: 'github')
  IndecentGithub? github;
  @JsonKey(name: 'gitlab')
  IndecentGitlab? gitlab;
  @JsonKey(name: 'requeueAfterSeconds')
  int? requeueAfterSeconds;
  @JsonKey(name: 'template')
  Template8? template;
  @JsonKey(name: 'values')
  Map<String, String?>? values;

  TentacledScmProvider({
    this.awsCodeCommit,
    this.azureDevOps,
    this.bitbucket,
    this.bitbucketServer,
    this.cloneProtocol,
    this.filters,
    this.gitea,
    this.github,
    this.gitlab,
    this.requeueAfterSeconds,
    this.template,
    this.values,
  });

  factory TentacledScmProvider.fromJson(Map<String, dynamic> json) =>
      _$TentacledScmProviderFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledScmProviderToJson(this);
}

@JsonSerializable()
class TentacledAwsCodeCommit {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'tagFilters')
  List<TentacledTagFilter?>? tagFilters;

  TentacledAwsCodeCommit({
    this.allBranches,
    this.region,
    this.role,
    this.tagFilters,
  });

  factory TentacledAwsCodeCommit.fromJson(Map<String, dynamic> json) =>
      _$TentacledAwsCodeCommitFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAwsCodeCommitToJson(this);
}

@JsonSerializable()
class TentacledTagFilter {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'value')
  String? value;

  TentacledTagFilter({required this.key, this.value});

  factory TentacledTagFilter.fromJson(Map<String, dynamic> json) =>
      _$TentacledTagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledTagFilterToJson(this);
}

@JsonSerializable()
class TentacledAzureDevOps {
  @JsonKey(name: 'accessTokenRef')
  TentacledAccessTokenRef accessTokenRef;
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'teamProject')
  String teamProject;

  TentacledAzureDevOps({
    required this.accessTokenRef,
    this.allBranches,
    this.api,
    required this.organization,
    required this.teamProject,
  });

  factory TentacledAzureDevOps.fromJson(Map<String, dynamic> json) =>
      _$TentacledAzureDevOpsFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAzureDevOpsToJson(this);
}

@JsonSerializable()
class TentacledAccessTokenRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TentacledAccessTokenRef({required this.key, required this.secretName});

  factory TentacledAccessTokenRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledAccessTokenRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAccessTokenRefToJson(this);
}

@JsonSerializable()
class IndecentBitbucket {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'appPasswordRef')
  TentacledAppPasswordRef appPasswordRef;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'user')
  String user;

  IndecentBitbucket({
    this.allBranches,
    required this.appPasswordRef,
    required this.owner,
    required this.user,
  });

  factory IndecentBitbucket.fromJson(Map<String, dynamic> json) =>
      _$IndecentBitbucketFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentBitbucketToJson(this);
}

@JsonSerializable()
class TentacledAppPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TentacledAppPasswordRef({required this.key, required this.secretName});

  factory TentacledAppPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$TentacledAppPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledAppPasswordRefToJson(this);
}

@JsonSerializable()
class IndecentBitbucketServer {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'basicAuth')
  CunningBasicAuth? basicAuth;
  @JsonKey(name: 'bearerToken')
  CunningBearerToken? bearerToken;
  @JsonKey(name: 'caRef')
  FriskyCaRef? caRef;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'project')
  String project;

  IndecentBitbucketServer({
    this.allBranches,
    required this.api,
    this.basicAuth,
    this.bearerToken,
    this.caRef,
    this.insecure,
    required this.project,
  });

  factory IndecentBitbucketServer.fromJson(Map<String, dynamic> json) =>
      _$IndecentBitbucketServerFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentBitbucketServerToJson(this);
}

@JsonSerializable()
class CunningBasicAuth {
  @JsonKey(name: 'passwordRef')
  CunningPasswordRef passwordRef;
  @JsonKey(name: 'username')
  String username;

  CunningBasicAuth({required this.passwordRef, required this.username});

  factory CunningBasicAuth.fromJson(Map<String, dynamic> json) =>
      _$CunningBasicAuthFromJson(json);

  Map<String, dynamic> toJson() => _$CunningBasicAuthToJson(this);
}

@JsonSerializable()
class CunningPasswordRef {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  CunningPasswordRef({required this.key, required this.secretName});

  factory CunningPasswordRef.fromJson(Map<String, dynamic> json) =>
      _$CunningPasswordRefFromJson(json);

  Map<String, dynamic> toJson() => _$CunningPasswordRefToJson(this);
}

@JsonSerializable()
class CunningBearerToken {
  @JsonKey(name: 'tokenRef')
  TokenRef14 tokenRef;

  CunningBearerToken({required this.tokenRef});

  factory CunningBearerToken.fromJson(Map<String, dynamic> json) =>
      _$CunningBearerTokenFromJson(json);

  Map<String, dynamic> toJson() => _$CunningBearerTokenToJson(this);
}

@JsonSerializable()
class TokenRef14 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef14({required this.key, required this.secretName});

  factory TokenRef14.fromJson(Map<String, dynamic> json) =>
      _$TokenRef14FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef14ToJson(this);
}

@JsonSerializable()
class FriskyCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  FriskyCaRef({required this.configMapName, required this.key});

  factory FriskyCaRef.fromJson(Map<String, dynamic> json) =>
      _$FriskyCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyCaRefToJson(this);
}

@JsonSerializable()
class IndecentFilter {
  @JsonKey(name: 'branchMatch')
  String? branchMatch;
  @JsonKey(name: 'labelMatch')
  String? labelMatch;
  @JsonKey(name: 'pathsDoNotExist')
  List<String?>? pathsDoNotExist;
  @JsonKey(name: 'pathsExist')
  List<String?>? pathsExist;
  @JsonKey(name: 'repositoryMatch')
  String? repositoryMatch;

  IndecentFilter({
    this.branchMatch,
    this.labelMatch,
    this.pathsDoNotExist,
    this.pathsExist,
    this.repositoryMatch,
  });

  factory IndecentFilter.fromJson(Map<String, dynamic> json) =>
      _$IndecentFilterFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentFilterToJson(this);
}

@JsonSerializable()
class IndecentGitea {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String api;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'tokenRef')
  TokenRef15? tokenRef;

  IndecentGitea({
    this.allBranches,
    required this.api,
    this.insecure,
    required this.owner,
    this.tokenRef,
  });

  factory IndecentGitea.fromJson(Map<String, dynamic> json) =>
      _$IndecentGiteaFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentGiteaToJson(this);
}

@JsonSerializable()
class TokenRef15 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef15({required this.key, required this.secretName});

  factory TokenRef15.fromJson(Map<String, dynamic> json) =>
      _$TokenRef15FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef15ToJson(this);
}

@JsonSerializable()
class IndecentGithub {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'appSecretName')
  String? appSecretName;
  @JsonKey(name: 'organization')
  String organization;
  @JsonKey(name: 'tokenRef')
  TokenRef16? tokenRef;

  IndecentGithub({
    this.allBranches,
    this.api,
    this.appSecretName,
    required this.organization,
    this.tokenRef,
  });

  factory IndecentGithub.fromJson(Map<String, dynamic> json) =>
      _$IndecentGithubFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentGithubToJson(this);
}

@JsonSerializable()
class TokenRef16 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef16({required this.key, required this.secretName});

  factory TokenRef16.fromJson(Map<String, dynamic> json) =>
      _$TokenRef16FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef16ToJson(this);
}

@JsonSerializable()
class IndecentGitlab {
  @JsonKey(name: 'allBranches')
  bool? allBranches;
  @JsonKey(name: 'api')
  String? api;
  @JsonKey(name: 'caRef')
  MischievousCaRef? caRef;
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'includeSharedProjects')
  bool? includeSharedProjects;
  @JsonKey(name: 'includeSubgroups')
  bool? includeSubgroups;
  @JsonKey(name: 'insecure')
  bool? insecure;
  @JsonKey(name: 'tokenRef')
  TokenRef17? tokenRef;
  @JsonKey(name: 'topic')
  String? topic;

  IndecentGitlab({
    this.allBranches,
    this.api,
    this.caRef,
    required this.group,
    this.includeSharedProjects,
    this.includeSubgroups,
    this.insecure,
    this.tokenRef,
    this.topic,
  });

  factory IndecentGitlab.fromJson(Map<String, dynamic> json) =>
      _$IndecentGitlabFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentGitlabToJson(this);
}

@JsonSerializable()
class MischievousCaRef {
  @JsonKey(name: 'configMapName')
  String configMapName;
  @JsonKey(name: 'key')
  String key;

  MischievousCaRef({required this.configMapName, required this.key});

  factory MischievousCaRef.fromJson(Map<String, dynamic> json) =>
      _$MischievousCaRefFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousCaRefToJson(this);
}

@JsonSerializable()
class TokenRef17 {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'secretName')
  String secretName;

  TokenRef17({required this.key, required this.secretName});

  factory TokenRef17.fromJson(Map<String, dynamic> json) =>
      _$TokenRef17FromJson(json);

  Map<String, dynamic> toJson() => _$TokenRef17ToJson(this);
}

@JsonSerializable()
class Template8 {
  @JsonKey(name: 'metadata')
  Metadata10 metadata;
  @JsonKey(name: 'spec')
  Spec10 spec;

  Template8({required this.metadata, required this.spec});

  factory Template8.fromJson(Map<String, dynamic> json) =>
      _$Template8FromJson(json);

  Map<String, dynamic> toJson() => _$Template8ToJson(this);
}

@JsonSerializable()
class Metadata10 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata10({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata10.fromJson(Map<String, dynamic> json) =>
      _$Metadata10FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata10ToJson(this);
}

@JsonSerializable()
class Spec10 {
  @JsonKey(name: 'destination')
  Destination10 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference10?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info10?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source32? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator10? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source33?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy10? syncPolicy;

  Spec10({
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

  factory Spec10.fromJson(Map<String, dynamic> json) => _$Spec10FromJson(json);

  Map<String, dynamic> toJson() => _$Spec10ToJson(this);
}

@JsonSerializable()
class Destination10 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination10({this.name, this.namespace, this.server});

  factory Destination10.fromJson(Map<String, dynamic> json) =>
      _$Destination10FromJson(json);

  Map<String, dynamic> toJson() => _$Destination10ToJson(this);
}

@JsonSerializable()
class IgnoreDifference10 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference10({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference10.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference10FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference10ToJson(this);
}

@JsonSerializable()
class Info10 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info10({required this.name, required this.value});

  factory Info10.fromJson(Map<String, dynamic> json) => _$Info10FromJson(json);

  Map<String, dynamic> toJson() => _$Info10ToJson(this);
}

@JsonSerializable()
class Source32 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory35? directory;
  @JsonKey(name: 'helm')
  Helm32? helm;
  @JsonKey(name: 'kustomize')
  Kustomize32? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin35? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source32({
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

  factory Source32.fromJson(Map<String, dynamic> json) =>
      _$Source32FromJson(json);

  Map<String, dynamic> toJson() => _$Source32ToJson(this);
}

@JsonSerializable()
class Directory35 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet32? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory35({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory35.fromJson(Map<String, dynamic> json) =>
      _$Directory35FromJson(json);

  Map<String, dynamic> toJson() => _$Directory35ToJson(this);
}

@JsonSerializable()
class Jsonnet32 {
  @JsonKey(name: 'extVars')
  List<ExtVar32?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas32?>? tlas;

  Jsonnet32({this.extVars, this.libs, this.tlas});

  factory Jsonnet32.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet32FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet32ToJson(this);
}

@JsonSerializable()
class ExtVar32 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar32({this.code, required this.name, required this.value});

  factory ExtVar32.fromJson(Map<String, dynamic> json) =>
      _$ExtVar32FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar32ToJson(this);
}

@JsonSerializable()
class Tlas32 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas32({this.code, required this.name, required this.value});

  factory Tlas32.fromJson(Map<String, dynamic> json) => _$Tlas32FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas32ToJson(this);
}

@JsonSerializable()
class Helm32 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter32?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter76?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm32({
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

  factory Helm32.fromJson(Map<String, dynamic> json) => _$Helm32FromJson(json);

  Map<String, dynamic> toJson() => _$Helm32ToJson(this);
}

@JsonSerializable()
class FileParameter32 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter32({this.name, this.path});

  factory FileParameter32.fromJson(Map<String, dynamic> json) =>
      _$FileParameter32FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter32ToJson(this);
}

@JsonSerializable()
class Parameter76 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter76({this.forceString, this.name, this.value});

  factory Parameter76.fromJson(Map<String, dynamic> json) =>
      _$Parameter76FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter76ToJson(this);
}

@JsonSerializable()
class Kustomize32 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch32?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica32?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize32({
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

  factory Kustomize32.fromJson(Map<String, dynamic> json) =>
      _$Kustomize32FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize32ToJson(this);
}

@JsonSerializable()
class Patch32 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target32? target;

  Patch32({this.options, this.patch, this.path, this.target});

  factory Patch32.fromJson(Map<String, dynamic> json) =>
      _$Patch32FromJson(json);

  Map<String, dynamic> toJson() => _$Patch32ToJson(this);
}

@JsonSerializable()
class Target32 {
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

  Target32({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target32.fromJson(Map<String, dynamic> json) =>
      _$Target32FromJson(json);

  Map<String, dynamic> toJson() => _$Target32ToJson(this);
}

@JsonSerializable()
class Replica32 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica32({required this.count, required this.name});

  factory Replica32.fromJson(Map<String, dynamic> json) =>
      _$Replica32FromJson(json);

  Map<String, dynamic> toJson() => _$Replica32ToJson(this);
}

@JsonSerializable()
class Plugin35 {
  @JsonKey(name: 'env')
  List<Env32?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter77?>? parameters;

  Plugin35({this.env, this.name, this.parameters});

  factory Plugin35.fromJson(Map<String, dynamic> json) =>
      _$Plugin35FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin35ToJson(this);
}

@JsonSerializable()
class Env32 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env32({required this.name, required this.value});

  factory Env32.fromJson(Map<String, dynamic> json) => _$Env32FromJson(json);

  Map<String, dynamic> toJson() => _$Env32ToJson(this);
}

@JsonSerializable()
class Parameter77 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter77({this.array, this.map, this.name, this.string});

  factory Parameter77.fromJson(Map<String, dynamic> json) =>
      _$Parameter77FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter77ToJson(this);
}

@JsonSerializable()
class SourceHydrator10 {
  @JsonKey(name: 'drySource')
  DrySource10 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo10? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource10 syncSource;

  SourceHydrator10({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator10.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator10FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator10ToJson(this);
}

@JsonSerializable()
class DrySource10 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource10({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource10.fromJson(Map<String, dynamic> json) =>
      _$DrySource10FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource10ToJson(this);
}

@JsonSerializable()
class HydrateTo10 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo10({required this.targetBranch});

  factory HydrateTo10.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo10FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo10ToJson(this);
}

@JsonSerializable()
class SyncSource10 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource10({required this.path, required this.targetBranch});

  factory SyncSource10.fromJson(Map<String, dynamic> json) =>
      _$SyncSource10FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource10ToJson(this);
}

@JsonSerializable()
class Source33 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory36? directory;
  @JsonKey(name: 'helm')
  Helm33? helm;
  @JsonKey(name: 'kustomize')
  Kustomize33? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin36? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source33({
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

  factory Source33.fromJson(Map<String, dynamic> json) =>
      _$Source33FromJson(json);

  Map<String, dynamic> toJson() => _$Source33ToJson(this);
}

@JsonSerializable()
class Directory36 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet33? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory36({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory36.fromJson(Map<String, dynamic> json) =>
      _$Directory36FromJson(json);

  Map<String, dynamic> toJson() => _$Directory36ToJson(this);
}

@JsonSerializable()
class Jsonnet33 {
  @JsonKey(name: 'extVars')
  List<ExtVar33?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas33?>? tlas;

  Jsonnet33({this.extVars, this.libs, this.tlas});

  factory Jsonnet33.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet33FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet33ToJson(this);
}

@JsonSerializable()
class ExtVar33 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar33({this.code, required this.name, required this.value});

  factory ExtVar33.fromJson(Map<String, dynamic> json) =>
      _$ExtVar33FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar33ToJson(this);
}

@JsonSerializable()
class Tlas33 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas33({this.code, required this.name, required this.value});

  factory Tlas33.fromJson(Map<String, dynamic> json) => _$Tlas33FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas33ToJson(this);
}

@JsonSerializable()
class Helm33 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter33?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter78?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm33({
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

  factory Helm33.fromJson(Map<String, dynamic> json) => _$Helm33FromJson(json);

  Map<String, dynamic> toJson() => _$Helm33ToJson(this);
}

@JsonSerializable()
class FileParameter33 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter33({this.name, this.path});

  factory FileParameter33.fromJson(Map<String, dynamic> json) =>
      _$FileParameter33FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter33ToJson(this);
}

@JsonSerializable()
class Parameter78 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter78({this.forceString, this.name, this.value});

  factory Parameter78.fromJson(Map<String, dynamic> json) =>
      _$Parameter78FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter78ToJson(this);
}

@JsonSerializable()
class Kustomize33 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch33?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica33?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize33({
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

  factory Kustomize33.fromJson(Map<String, dynamic> json) =>
      _$Kustomize33FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize33ToJson(this);
}

@JsonSerializable()
class Patch33 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target33? target;

  Patch33({this.options, this.patch, this.path, this.target});

  factory Patch33.fromJson(Map<String, dynamic> json) =>
      _$Patch33FromJson(json);

  Map<String, dynamic> toJson() => _$Patch33ToJson(this);
}

@JsonSerializable()
class Target33 {
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

  Target33({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target33.fromJson(Map<String, dynamic> json) =>
      _$Target33FromJson(json);

  Map<String, dynamic> toJson() => _$Target33ToJson(this);
}

@JsonSerializable()
class Replica33 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica33({required this.count, required this.name});

  factory Replica33.fromJson(Map<String, dynamic> json) =>
      _$Replica33FromJson(json);

  Map<String, dynamic> toJson() => _$Replica33ToJson(this);
}

@JsonSerializable()
class Plugin36 {
  @JsonKey(name: 'env')
  List<Env33?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter79?>? parameters;

  Plugin36({this.env, this.name, this.parameters});

  factory Plugin36.fromJson(Map<String, dynamic> json) =>
      _$Plugin36FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin36ToJson(this);
}

@JsonSerializable()
class Env33 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env33({required this.name, required this.value});

  factory Env33.fromJson(Map<String, dynamic> json) => _$Env33FromJson(json);

  Map<String, dynamic> toJson() => _$Env33ToJson(this);
}

@JsonSerializable()
class Parameter79 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter79({this.array, this.map, this.name, this.string});

  factory Parameter79.fromJson(Map<String, dynamic> json) =>
      _$Parameter79FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter79ToJson(this);
}

@JsonSerializable()
class SyncPolicy10 {
  @JsonKey(name: 'automated')
  Automated10? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata10? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry10? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy10({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy10.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy10FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy10ToJson(this);
}

@JsonSerializable()
class Automated10 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated10({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated10.fromJson(Map<String, dynamic> json) =>
      _$Automated10FromJson(json);

  Map<String, dynamic> toJson() => _$Automated10ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata10 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata10({this.annotations, this.labels});

  factory ManagedNamespaceMetadata10.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata10FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata10ToJson(this);
}

@JsonSerializable()
class Retry10 {
  @JsonKey(name: 'backoff')
  Backoff10? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry10({this.backoff, this.limit, this.refresh});

  factory Retry10.fromJson(Map<String, dynamic> json) =>
      _$Retry10FromJson(json);

  Map<String, dynamic> toJson() => _$Retry10ToJson(this);
}

@JsonSerializable()
class Backoff10 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff10({this.duration, this.factor, this.maxDuration});

  factory Backoff10.fromJson(Map<String, dynamic> json) =>
      _$Backoff10FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff10ToJson(this);
}

@JsonSerializable()
class IndecentSelector {
  @JsonKey(name: 'matchExpressions')
  List<CunningMatchExpression?>? matchExpressions;
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndecentSelector({this.matchExpressions, this.matchLabels});

  factory IndecentSelector.fromJson(Map<String, dynamic> json) =>
      _$IndecentSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSelectorToJson(this);
}

@JsonSerializable()
class CunningMatchExpression {
  @JsonKey(name: 'key')
  String key;
  @JsonKey(name: 'operator')
  String matchExpressionOperator;
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

@JsonSerializable()
class IgnoreApplicationDifference {
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'name')
  String? name;

  IgnoreApplicationDifference({
    this.jqPathExpressions,
    this.jsonPointers,
    this.name,
  });

  factory IgnoreApplicationDifference.fromJson(Map<String, dynamic> json) =>
      _$IgnoreApplicationDifferenceFromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreApplicationDifferenceToJson(this);
}

@JsonSerializable()
class PreservedFields {
  @JsonKey(name: 'annotations')
  List<String?>? annotations;
  @JsonKey(name: 'labels')
  List<String?>? labels;

  PreservedFields({this.annotations, this.labels});

  factory PreservedFields.fromJson(Map<String, dynamic> json) =>
      _$PreservedFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$PreservedFieldsToJson(this);
}

@JsonSerializable()
class Strategy {
  @JsonKey(name: 'deletionOrder')
  String? deletionOrder;
  @JsonKey(name: 'rollingSync')
  RollingSync? rollingSync;
  @JsonKey(name: 'type')
  String? type;

  Strategy({this.deletionOrder, this.rollingSync, this.type});

  factory Strategy.fromJson(Map<String, dynamic> json) =>
      _$StrategyFromJson(json);

  Map<String, dynamic> toJson() => _$StrategyToJson(this);
}

@JsonSerializable()
class RollingSync {
  @JsonKey(name: 'steps')
  List<Step?>? steps;

  RollingSync({this.steps});

  factory RollingSync.fromJson(Map<String, dynamic> json) =>
      _$RollingSyncFromJson(json);

  Map<String, dynamic> toJson() => _$RollingSyncToJson(this);
}

@JsonSerializable()
class Step {
  @JsonKey(name: 'matchExpressions')
  List<StepMatchExpression?>? matchExpressions;
  @JsonKey(name: 'maxUpdate')
  dynamic maxUpdate;

  Step({this.matchExpressions, this.maxUpdate});

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);
}

@JsonSerializable()
class StepMatchExpression {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'operator')
  String? matchExpressionOperator;
  @JsonKey(name: 'values')
  List<String?>? values;

  StepMatchExpression({this.key, this.matchExpressionOperator, this.values});

  factory StepMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$StepMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$StepMatchExpressionToJson(this);
}

@JsonSerializable()
class SyncPolicy11 {
  @JsonKey(name: 'applicationsSync')
  ApplicationsSync? applicationsSync;
  @JsonKey(name: 'preserveResourcesOnDeletion')
  bool? preserveResourcesOnDeletion;

  SyncPolicy11({this.applicationsSync, this.preserveResourcesOnDeletion});

  factory SyncPolicy11.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy11FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy11ToJson(this);
}

enum ApplicationsSync {
  @JsonValue('create-delete')
  CREATE_DELETE,
  @JsonValue('create-only')
  CREATE_ONLY,
  @JsonValue('create-update')
  CREATE_UPDATE,
  @JsonValue('sync')
  SYNC,
}

final applicationsSyncValues = EnumValues({
  'create-delete': ApplicationsSync.CREATE_DELETE,
  'create-only': ApplicationsSync.CREATE_ONLY,
  'create-update': ApplicationsSync.CREATE_UPDATE,
  'sync': ApplicationsSync.SYNC,
});

@JsonSerializable()
class SpecTemplate {
  @JsonKey(name: 'metadata')
  Metadata11 metadata;
  @JsonKey(name: 'spec')
  Spec11 spec;

  SpecTemplate({required this.metadata, required this.spec});

  factory SpecTemplate.fromJson(Map<String, dynamic> json) =>
      _$SpecTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SpecTemplateToJson(this);
}

@JsonSerializable()
class Metadata11 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  Metadata11({
    this.annotations,
    this.finalizers,
    this.labels,
    this.name,
    this.namespace,
  });

  factory Metadata11.fromJson(Map<String, dynamic> json) =>
      _$Metadata11FromJson(json);

  Map<String, dynamic> toJson() => _$Metadata11ToJson(this);
}

@JsonSerializable()
class Spec11 {
  @JsonKey(name: 'destination')
  Destination11 destination;
  @JsonKey(name: 'ignoreDifferences')
  List<IgnoreDifference11?>? ignoreDifferences;
  @JsonKey(name: 'info')
  List<Info11?>? info;
  @JsonKey(name: 'project')
  String project;
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;
  @JsonKey(name: 'source')
  Source34? source;
  @JsonKey(name: 'sourceHydrator')
  SourceHydrator11? sourceHydrator;
  @JsonKey(name: 'sources')
  List<Source35?>? sources;
  @JsonKey(name: 'syncPolicy')
  SyncPolicy12? syncPolicy;

  Spec11({
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

  factory Spec11.fromJson(Map<String, dynamic> json) => _$Spec11FromJson(json);

  Map<String, dynamic> toJson() => _$Spec11ToJson(this);
}

@JsonSerializable()
class Destination11 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'server')
  String? server;

  Destination11({this.name, this.namespace, this.server});

  factory Destination11.fromJson(Map<String, dynamic> json) =>
      _$Destination11FromJson(json);

  Map<String, dynamic> toJson() => _$Destination11ToJson(this);
}

@JsonSerializable()
class IgnoreDifference11 {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'jqPathExpressions')
  List<String?>? jqPathExpressions;
  @JsonKey(name: 'jsonPointers')
  List<String?>? jsonPointers;
  @JsonKey(name: 'kind')
  String kind;
  @JsonKey(name: 'managedFieldsManagers')
  List<String?>? managedFieldsManagers;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;

  IgnoreDifference11({
    this.group,
    this.jqPathExpressions,
    this.jsonPointers,
    required this.kind,
    this.managedFieldsManagers,
    this.name,
    this.namespace,
  });

  factory IgnoreDifference11.fromJson(Map<String, dynamic> json) =>
      _$IgnoreDifference11FromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreDifference11ToJson(this);
}

@JsonSerializable()
class Info11 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Info11({required this.name, required this.value});

  factory Info11.fromJson(Map<String, dynamic> json) => _$Info11FromJson(json);

  Map<String, dynamic> toJson() => _$Info11ToJson(this);
}

@JsonSerializable()
class Source34 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory37? directory;
  @JsonKey(name: 'helm')
  Helm34? helm;
  @JsonKey(name: 'kustomize')
  Kustomize34? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin37? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source34({
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

  factory Source34.fromJson(Map<String, dynamic> json) =>
      _$Source34FromJson(json);

  Map<String, dynamic> toJson() => _$Source34ToJson(this);
}

@JsonSerializable()
class Directory37 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet34? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory37({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory37.fromJson(Map<String, dynamic> json) =>
      _$Directory37FromJson(json);

  Map<String, dynamic> toJson() => _$Directory37ToJson(this);
}

@JsonSerializable()
class Jsonnet34 {
  @JsonKey(name: 'extVars')
  List<ExtVar34?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas34?>? tlas;

  Jsonnet34({this.extVars, this.libs, this.tlas});

  factory Jsonnet34.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet34FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet34ToJson(this);
}

@JsonSerializable()
class ExtVar34 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar34({this.code, required this.name, required this.value});

  factory ExtVar34.fromJson(Map<String, dynamic> json) =>
      _$ExtVar34FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar34ToJson(this);
}

@JsonSerializable()
class Tlas34 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas34({this.code, required this.name, required this.value});

  factory Tlas34.fromJson(Map<String, dynamic> json) => _$Tlas34FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas34ToJson(this);
}

@JsonSerializable()
class Helm34 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter34?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter80?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm34({
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

  factory Helm34.fromJson(Map<String, dynamic> json) => _$Helm34FromJson(json);

  Map<String, dynamic> toJson() => _$Helm34ToJson(this);
}

@JsonSerializable()
class FileParameter34 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter34({this.name, this.path});

  factory FileParameter34.fromJson(Map<String, dynamic> json) =>
      _$FileParameter34FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter34ToJson(this);
}

@JsonSerializable()
class Parameter80 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter80({this.forceString, this.name, this.value});

  factory Parameter80.fromJson(Map<String, dynamic> json) =>
      _$Parameter80FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter80ToJson(this);
}

@JsonSerializable()
class Kustomize34 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch34?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica34?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize34({
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

  factory Kustomize34.fromJson(Map<String, dynamic> json) =>
      _$Kustomize34FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize34ToJson(this);
}

@JsonSerializable()
class Patch34 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target34? target;

  Patch34({this.options, this.patch, this.path, this.target});

  factory Patch34.fromJson(Map<String, dynamic> json) =>
      _$Patch34FromJson(json);

  Map<String, dynamic> toJson() => _$Patch34ToJson(this);
}

@JsonSerializable()
class Target34 {
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

  Target34({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target34.fromJson(Map<String, dynamic> json) =>
      _$Target34FromJson(json);

  Map<String, dynamic> toJson() => _$Target34ToJson(this);
}

@JsonSerializable()
class Replica34 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica34({required this.count, required this.name});

  factory Replica34.fromJson(Map<String, dynamic> json) =>
      _$Replica34FromJson(json);

  Map<String, dynamic> toJson() => _$Replica34ToJson(this);
}

@JsonSerializable()
class Plugin37 {
  @JsonKey(name: 'env')
  List<Env34?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter81?>? parameters;

  Plugin37({this.env, this.name, this.parameters});

  factory Plugin37.fromJson(Map<String, dynamic> json) =>
      _$Plugin37FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin37ToJson(this);
}

@JsonSerializable()
class Env34 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env34({required this.name, required this.value});

  factory Env34.fromJson(Map<String, dynamic> json) => _$Env34FromJson(json);

  Map<String, dynamic> toJson() => _$Env34ToJson(this);
}

@JsonSerializable()
class Parameter81 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter81({this.array, this.map, this.name, this.string});

  factory Parameter81.fromJson(Map<String, dynamic> json) =>
      _$Parameter81FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter81ToJson(this);
}

@JsonSerializable()
class SourceHydrator11 {
  @JsonKey(name: 'drySource')
  DrySource11 drySource;
  @JsonKey(name: 'hydrateTo')
  HydrateTo11? hydrateTo;
  @JsonKey(name: 'syncSource')
  SyncSource11 syncSource;

  SourceHydrator11({
    required this.drySource,
    this.hydrateTo,
    required this.syncSource,
  });

  factory SourceHydrator11.fromJson(Map<String, dynamic> json) =>
      _$SourceHydrator11FromJson(json);

  Map<String, dynamic> toJson() => _$SourceHydrator11ToJson(this);
}

@JsonSerializable()
class DrySource11 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String targetRevision;

  DrySource11({
    required this.path,
    required this.repoUrl,
    required this.targetRevision,
  });

  factory DrySource11.fromJson(Map<String, dynamic> json) =>
      _$DrySource11FromJson(json);

  Map<String, dynamic> toJson() => _$DrySource11ToJson(this);
}

@JsonSerializable()
class HydrateTo11 {
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  HydrateTo11({required this.targetBranch});

  factory HydrateTo11.fromJson(Map<String, dynamic> json) =>
      _$HydrateTo11FromJson(json);

  Map<String, dynamic> toJson() => _$HydrateTo11ToJson(this);
}

@JsonSerializable()
class SyncSource11 {
  @JsonKey(name: 'path')
  String path;
  @JsonKey(name: 'targetBranch')
  String targetBranch;

  SyncSource11({required this.path, required this.targetBranch});

  factory SyncSource11.fromJson(Map<String, dynamic> json) =>
      _$SyncSource11FromJson(json);

  Map<String, dynamic> toJson() => _$SyncSource11ToJson(this);
}

@JsonSerializable()
class Source35 {
  @JsonKey(name: 'chart')
  String? chart;
  @JsonKey(name: 'directory')
  Directory38? directory;
  @JsonKey(name: 'helm')
  Helm35? helm;
  @JsonKey(name: 'kustomize')
  Kustomize35? kustomize;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'plugin')
  Plugin38? plugin;
  @JsonKey(name: 'ref')
  String? ref;
  @JsonKey(name: 'repoURL')
  String repoUrl;
  @JsonKey(name: 'targetRevision')
  String? targetRevision;

  Source35({
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

  factory Source35.fromJson(Map<String, dynamic> json) =>
      _$Source35FromJson(json);

  Map<String, dynamic> toJson() => _$Source35ToJson(this);
}

@JsonSerializable()
class Directory38 {
  @JsonKey(name: 'exclude')
  String? exclude;
  @JsonKey(name: 'include')
  String? include;
  @JsonKey(name: 'jsonnet')
  Jsonnet35? jsonnet;
  @JsonKey(name: 'recurse')
  bool? recurse;

  Directory38({this.exclude, this.include, this.jsonnet, this.recurse});

  factory Directory38.fromJson(Map<String, dynamic> json) =>
      _$Directory38FromJson(json);

  Map<String, dynamic> toJson() => _$Directory38ToJson(this);
}

@JsonSerializable()
class Jsonnet35 {
  @JsonKey(name: 'extVars')
  List<ExtVar35?>? extVars;
  @JsonKey(name: 'libs')
  List<String?>? libs;
  @JsonKey(name: 'tlas')
  List<Tlas35?>? tlas;

  Jsonnet35({this.extVars, this.libs, this.tlas});

  factory Jsonnet35.fromJson(Map<String, dynamic> json) =>
      _$Jsonnet35FromJson(json);

  Map<String, dynamic> toJson() => _$Jsonnet35ToJson(this);
}

@JsonSerializable()
class ExtVar35 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  ExtVar35({this.code, required this.name, required this.value});

  factory ExtVar35.fromJson(Map<String, dynamic> json) =>
      _$ExtVar35FromJson(json);

  Map<String, dynamic> toJson() => _$ExtVar35ToJson(this);
}

@JsonSerializable()
class Tlas35 {
  @JsonKey(name: 'code')
  bool? code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Tlas35({this.code, required this.name, required this.value});

  factory Tlas35.fromJson(Map<String, dynamic> json) => _$Tlas35FromJson(json);

  Map<String, dynamic> toJson() => _$Tlas35ToJson(this);
}

@JsonSerializable()
class Helm35 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'fileParameters')
  List<FileParameter35?>? fileParameters;
  @JsonKey(name: 'ignoreMissingValueFiles')
  bool? ignoreMissingValueFiles;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'parameters')
  List<Parameter82?>? parameters;
  @JsonKey(name: 'passCredentials')
  bool? passCredentials;
  @JsonKey(name: 'releaseName')
  String? releaseName;
  @JsonKey(name: 'skipCrds')
  bool? skipCrds;
  @JsonKey(name: 'skipSchemaValidation')
  bool? skipSchemaValidation;
  @JsonKey(name: 'skipTests')
  bool? skipTests;
  @JsonKey(name: 'valueFiles')
  List<String?>? valueFiles;
  @JsonKey(name: 'values')
  String? values;
  @JsonKey(name: 'valuesObject')
  dynamic valuesObject;
  @JsonKey(name: 'version')
  String? version;

  Helm35({
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

  factory Helm35.fromJson(Map<String, dynamic> json) => _$Helm35FromJson(json);

  Map<String, dynamic> toJson() => _$Helm35ToJson(this);
}

@JsonSerializable()
class FileParameter35 {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'path')
  String? path;

  FileParameter35({this.name, this.path});

  factory FileParameter35.fromJson(Map<String, dynamic> json) =>
      _$FileParameter35FromJson(json);

  Map<String, dynamic> toJson() => _$FileParameter35ToJson(this);
}

@JsonSerializable()
class Parameter82 {
  @JsonKey(name: 'forceString')
  bool? forceString;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  Parameter82({this.forceString, this.name, this.value});

  factory Parameter82.fromJson(Map<String, dynamic> json) =>
      _$Parameter82FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter82ToJson(this);
}

@JsonSerializable()
class Kustomize35 {
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;
  @JsonKey(name: 'commonAnnotations')
  Map<String, String?>? commonAnnotations;
  @JsonKey(name: 'commonAnnotationsEnvsubst')
  bool? commonAnnotationsEnvsubst;
  @JsonKey(name: 'commonLabels')
  Map<String, String?>? commonLabels;
  @JsonKey(name: 'components')
  List<String?>? components;
  @JsonKey(name: 'forceCommonAnnotations')
  bool? forceCommonAnnotations;
  @JsonKey(name: 'forceCommonLabels')
  bool? forceCommonLabels;
  @JsonKey(name: 'ignoreMissingComponents')
  bool? ignoreMissingComponents;
  @JsonKey(name: 'images')
  List<String?>? images;
  @JsonKey(name: 'kubeVersion')
  String? kubeVersion;
  @JsonKey(name: 'labelIncludeTemplates')
  bool? labelIncludeTemplates;
  @JsonKey(name: 'labelWithoutSelector')
  bool? labelWithoutSelector;
  @JsonKey(name: 'namePrefix')
  String? namePrefix;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'nameSuffix')
  String? nameSuffix;
  @JsonKey(name: 'patches')
  List<Patch35?>? patches;
  @JsonKey(name: 'replicas')
  List<Replica35?>? replicas;
  @JsonKey(name: 'version')
  String? version;

  Kustomize35({
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

  factory Kustomize35.fromJson(Map<String, dynamic> json) =>
      _$Kustomize35FromJson(json);

  Map<String, dynamic> toJson() => _$Kustomize35ToJson(this);
}

@JsonSerializable()
class Patch35 {
  @JsonKey(name: 'options')
  Map<String, bool?>? options;
  @JsonKey(name: 'patch')
  String? patch;
  @JsonKey(name: 'path')
  String? path;
  @JsonKey(name: 'target')
  Target35? target;

  Patch35({this.options, this.patch, this.path, this.target});

  factory Patch35.fromJson(Map<String, dynamic> json) =>
      _$Patch35FromJson(json);

  Map<String, dynamic> toJson() => _$Patch35ToJson(this);
}

@JsonSerializable()
class Target35 {
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

  Target35({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory Target35.fromJson(Map<String, dynamic> json) =>
      _$Target35FromJson(json);

  Map<String, dynamic> toJson() => _$Target35ToJson(this);
}

@JsonSerializable()
class Replica35 {
  @JsonKey(name: 'count')
  dynamic count;
  @JsonKey(name: 'name')
  String name;

  Replica35({required this.count, required this.name});

  factory Replica35.fromJson(Map<String, dynamic> json) =>
      _$Replica35FromJson(json);

  Map<String, dynamic> toJson() => _$Replica35ToJson(this);
}

@JsonSerializable()
class Plugin38 {
  @JsonKey(name: 'env')
  List<Env35?>? env;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'parameters')
  List<Parameter83?>? parameters;

  Plugin38({this.env, this.name, this.parameters});

  factory Plugin38.fromJson(Map<String, dynamic> json) =>
      _$Plugin38FromJson(json);

  Map<String, dynamic> toJson() => _$Plugin38ToJson(this);
}

@JsonSerializable()
class Env35 {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;

  Env35({required this.name, required this.value});

  factory Env35.fromJson(Map<String, dynamic> json) => _$Env35FromJson(json);

  Map<String, dynamic> toJson() => _$Env35ToJson(this);
}

@JsonSerializable()
class Parameter83 {
  @JsonKey(name: 'array')
  List<String?>? array;
  @JsonKey(name: 'map')
  Map<String, String?>? map;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'string')
  String? string;

  Parameter83({this.array, this.map, this.name, this.string});

  factory Parameter83.fromJson(Map<String, dynamic> json) =>
      _$Parameter83FromJson(json);

  Map<String, dynamic> toJson() => _$Parameter83ToJson(this);
}

@JsonSerializable()
class SyncPolicy12 {
  @JsonKey(name: 'automated')
  Automated11? automated;
  @JsonKey(name: 'managedNamespaceMetadata')
  ManagedNamespaceMetadata11? managedNamespaceMetadata;
  @JsonKey(name: 'retry')
  Retry11? retry;
  @JsonKey(name: 'syncOptions')
  List<String?>? syncOptions;

  SyncPolicy12({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions,
  });

  factory SyncPolicy12.fromJson(Map<String, dynamic> json) =>
      _$SyncPolicy12FromJson(json);

  Map<String, dynamic> toJson() => _$SyncPolicy12ToJson(this);
}

@JsonSerializable()
class Automated11 {
  @JsonKey(name: 'allowEmpty')
  bool? allowEmpty;
  @JsonKey(name: 'enabled')
  bool? enabled;
  @JsonKey(name: 'prune')
  bool? prune;
  @JsonKey(name: 'selfHeal')
  bool? selfHeal;

  Automated11({this.allowEmpty, this.enabled, this.prune, this.selfHeal});

  factory Automated11.fromJson(Map<String, dynamic> json) =>
      _$Automated11FromJson(json);

  Map<String, dynamic> toJson() => _$Automated11ToJson(this);
}

@JsonSerializable()
class ManagedNamespaceMetadata11 {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ManagedNamespaceMetadata11({this.annotations, this.labels});

  factory ManagedNamespaceMetadata11.fromJson(Map<String, dynamic> json) =>
      _$ManagedNamespaceMetadata11FromJson(json);

  Map<String, dynamic> toJson() => _$ManagedNamespaceMetadata11ToJson(this);
}

@JsonSerializable()
class Retry11 {
  @JsonKey(name: 'backoff')
  Backoff11? backoff;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'refresh')
  bool? refresh;

  Retry11({this.backoff, this.limit, this.refresh});

  factory Retry11.fromJson(Map<String, dynamic> json) =>
      _$Retry11FromJson(json);

  Map<String, dynamic> toJson() => _$Retry11ToJson(this);
}

@JsonSerializable()
class Backoff11 {
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'factor')
  int? factor;
  @JsonKey(name: 'maxDuration')
  String? maxDuration;

  Backoff11({this.duration, this.factor, this.maxDuration});

  factory Backoff11.fromJson(Map<String, dynamic> json) =>
      _$Backoff11FromJson(json);

  Map<String, dynamic> toJson() => _$Backoff11ToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: 'applicationStatus')
  List<ApplicationStatus?>? applicationStatus;
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;
  @JsonKey(name: 'resources')
  List<Resource?>? resources;
  @JsonKey(name: 'resourcesCount')
  int? resourcesCount;

  Status({
    this.applicationStatus,
    this.conditions,
    this.resources,
    this.resourcesCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class ApplicationStatus {
  @JsonKey(name: 'application')
  String application;
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'step')
  String step;
  @JsonKey(name: 'targetRevisions')
  List<String?> targetRevisions;

  ApplicationStatus({
    required this.application,
    this.lastTransitionTime,
    required this.message,
    required this.status,
    required this.step,
    required this.targetRevisions,
  });

  factory ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationStatusToJson(this);
}

@JsonSerializable()
class Condition {
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'reason')
  String reason;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastTransitionTime,
    required this.message,
    required this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Resource {
  @JsonKey(name: 'group')
  String? group;
  @JsonKey(name: 'health')
  Health? health;
  @JsonKey(name: 'hook')
  bool? hook;
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'namespace')
  String? namespace;
  @JsonKey(name: 'requiresDeletionConfirmation')
  bool? requiresDeletionConfirmation;
  @JsonKey(name: 'requiresPruning')
  bool? requiresPruning;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'syncWave')
  int? syncWave;
  @JsonKey(name: 'version')
  String? version;

  Resource({
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

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

@JsonSerializable()
class Health {
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  Health({this.lastTransitionTime, this.message, this.status});

  factory Health.fromJson(Map<String, dynamic> json) => _$HealthFromJson(json);

  Map<String, dynamic> toJson() => _$HealthToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ApplicationsetlistArgoprojV1Alpha1Kind {
  @JsonValue('ApplicationSetList')
  APPLICATION_SET_LIST,
}

final applicationsetlistArgoprojV1Alpha1KindValues = EnumValues({
  'ApplicationSetList':
      ApplicationsetlistArgoprojV1Alpha1Kind.APPLICATION_SET_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ApplicationsetlistArgoprojV1Alpha1Metadata {
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

  ApplicationsetlistArgoprojV1Alpha1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ApplicationsetlistArgoprojV1Alpha1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ApplicationsetlistArgoprojV1Alpha1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApplicationsetlistArgoprojV1Alpha1MetadataToJson(this);
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
