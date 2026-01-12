import 'package:json_annotation/json_annotation.dart';

part 'kustomizationlist_kustomize_v1beta2.g.dart';

///KustomizationList is a list of Kustomization
@JsonSerializable()
class KustomizationlistKustomizeV1Beta2 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of kustomizations. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  KustomizationlistKustomizeV1Beta2Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  KustomizationlistKustomizeV1Beta2Metadata? metadata;

  KustomizationlistKustomizeV1Beta2({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory KustomizationlistKustomizeV1Beta2.fromJson(
    Map<String, dynamic> json,
  ) => _$KustomizationlistKustomizeV1Beta2FromJson(json);

  Map<String, dynamic> toJson() =>
      _$KustomizationlistKustomizeV1Beta2ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('kustomize.toolkit.fluxcd.io/v1beta2')
  KUSTOMIZE_TOOLKIT_FLUXCD_IO_V1_BETA2,
}

final apiVersionValues = EnumValues({
  'kustomize.toolkit.fluxcd.io/v1beta2':
      ApiVersion.KUSTOMIZE_TOOLKIT_FLUXCD_IO_V1_BETA2,
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

  ///KustomizationSpec defines the configuration to calculate the desired state from a Source
  ///using Kustomize.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///KustomizationStatus defines the observed state of a kustomization.
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
  @JsonValue('Kustomization')
  KUSTOMIZATION,
}

final itemKindValues = EnumValues({'Kustomization': ItemKind.KUSTOMIZATION});

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
  ///CommonMetadata specifies the common labels and annotations that are applied to all
  ///resources.
  ///Any existing label or annotation will be overridden if its key matches a common one.
  @JsonKey(name: 'commonMetadata')
  CommonMetadata? commonMetadata;

  ///Components specifies relative paths to specifications of other Components.
  @JsonKey(name: 'components')
  List<String?>? components;

  ///Decrypt Kubernetes secrets before applying them on the cluster.
  @JsonKey(name: 'decryption')
  Decryption? decryption;

  ///DependsOn may contain a meta.NamespacedObjectReference slice
  ///with references to Kustomization resources that must be ready before this
  ///Kustomization can be reconciled.
  @JsonKey(name: 'dependsOn')
  List<DependsOn?>? dependsOn;

  ///Force instructs the controller to recreate resources
  ///when patching fails due to an immutable field change.
  @JsonKey(name: 'force')
  bool? force;

  ///A list of resources to be included in the health assessment.
  @JsonKey(name: 'healthChecks')
  List<HealthCheck?>? healthChecks;

  ///Images is a list of (image name, new name, new tag or digest)
  ///for changing image names, tags or digests. This can also be achieved with a
  ///patch, but this operator is simpler to specify.
  @JsonKey(name: 'images')
  List<Image?>? images;

  ///The interval at which to reconcile the Kustomization.
  @JsonKey(name: 'interval')
  String interval;

  ///The KubeConfig for reconciling the Kustomization on a remote cluster.
  ///When used in combination with KustomizationSpec.ServiceAccountName,
  ///forces the controller to act on behalf of that Service Account at the
  ///target cluster.
  ///If the --default-service-account flag is set, its value will be used as
  ///a controller level fallback for when KustomizationSpec.ServiceAccountName
  ///is empty.
  @JsonKey(name: 'kubeConfig')
  KubeConfig? kubeConfig;

  ///Strategic merge and JSON patches, defined as inline YAML objects,
  ///capable of targeting objects based on kind, label and annotation selectors.
  @JsonKey(name: 'patches')
  List<SpecPatch?>? patches;

  ///JSON 6902 patches, defined as inline YAML objects.
  ///Deprecated: Use Patches instead.
  @JsonKey(name: 'patchesJson6902')
  List<PatchesJson6902?>? patchesJson6902;

  ///Strategic merge patches, defined as inline YAML objects.
  ///Deprecated: Use Patches instead.
  @JsonKey(name: 'patchesStrategicMerge')
  List<dynamic>? patchesStrategicMerge;

  ///Path to the directory containing the kustomization.yaml file, or the
  ///set of plain YAMLs a kustomization.yaml should be generated for.
  ///Defaults to 'None', which translates to the root path of the SourceRef.
  @JsonKey(name: 'path')
  String? path;

  ///PostBuild describes which actions to perform on the YAML manifest
  ///generated by building the kustomize overlay.
  @JsonKey(name: 'postBuild')
  PostBuild? postBuild;

  ///Prune enables garbage collection.
  @JsonKey(name: 'prune')
  bool prune;

  ///The interval at which to retry a previously failed reconciliation.
  ///When not specified, the controller uses the KustomizationSpec.Interval
  ///value to retry failures.
  @JsonKey(name: 'retryInterval')
  String? retryInterval;

  ///The name of the Kubernetes service account to impersonate
  ///when reconciling this Kustomization.
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///Reference of the source where the kustomization file is.
  @JsonKey(name: 'sourceRef')
  SourceRef sourceRef;

  ///This flag tells the controller to suspend subsequent kustomize executions,
  ///it does not apply to already started executions. Defaults to false.
  @JsonKey(name: 'suspend')
  bool? suspend;

  ///TargetNamespace sets or overrides the namespace in the
  ///kustomization.yaml file.
  @JsonKey(name: 'targetNamespace')
  String? targetNamespace;

  ///Timeout for validation, apply and health checking operations.
  ///Defaults to 'Interval' duration.
  @JsonKey(name: 'timeout')
  String? timeout;

  ///Deprecated: Not used in v1beta2.
  @JsonKey(name: 'validation')
  Validation? validation;

  ///Wait instructs the controller to check the health of all the reconciled resources.
  ///When enabled, the HealthChecks are ignored. Defaults to false.
  @JsonKey(name: 'wait')
  bool? wait;

  Spec({
    this.commonMetadata,
    this.components,
    this.decryption,
    this.dependsOn,
    this.force,
    this.healthChecks,
    this.images,
    required this.interval,
    this.kubeConfig,
    this.patches,
    this.patchesJson6902,
    this.patchesStrategicMerge,
    this.path,
    this.postBuild,
    required this.prune,
    this.retryInterval,
    this.serviceAccountName,
    required this.sourceRef,
    this.suspend,
    this.targetNamespace,
    this.timeout,
    this.validation,
    this.wait,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class CommonMetadata {
  ///Annotations to be added to the object's metadata.
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Labels to be added to the object's metadata.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  CommonMetadata({this.annotations, this.labels});

  factory CommonMetadata.fromJson(Map<String, dynamic> json) =>
      _$CommonMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$CommonMetadataToJson(this);
}

@JsonSerializable()
class Decryption {
  ///Provider is the name of the decryption engine.
  @JsonKey(name: 'provider')
  Provider provider;

  ///The secret name containing the private OpenPGP keys used for decryption.
  @JsonKey(name: 'secretRef')
  DecryptionSecretRef? secretRef;

  Decryption({required this.provider, this.secretRef});

  factory Decryption.fromJson(Map<String, dynamic> json) =>
      _$DecryptionFromJson(json);

  Map<String, dynamic> toJson() => _$DecryptionToJson(this);
}

///Provider is the name of the decryption engine.
enum Provider {
  @JsonValue('sops')
  SOPS,
}

final providerValues = EnumValues({'sops': Provider.SOPS});

@JsonSerializable()
class DecryptionSecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  DecryptionSecretRef({required this.name});

  factory DecryptionSecretRef.fromJson(Map<String, dynamic> json) =>
      _$DecryptionSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$DecryptionSecretRefToJson(this);
}

@JsonSerializable()
class DependsOn {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ///Namespace of the referent, when not specified it acts as LocalObjectReference.
  @JsonKey(name: 'namespace')
  String? namespace;

  DependsOn({required this.name, this.namespace});

  factory DependsOn.fromJson(Map<String, dynamic> json) =>
      _$DependsOnFromJson(json);

  Map<String, dynamic> toJson() => _$DependsOnToJson(this);
}

@JsonSerializable()
class HealthCheck {
  ///API version of the referent, if not specified the Kubernetes preferred version will be
  ///used.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Kind of the referent.
  @JsonKey(name: 'kind')
  String kind;

  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ///Namespace of the referent, when not specified it acts as LocalObjectReference.
  @JsonKey(name: 'namespace')
  String? namespace;

  HealthCheck({
    this.apiVersion,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory HealthCheck.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckToJson(this);
}

@JsonSerializable()
class Image {
  ///Digest is the value used to replace the original image tag.
  ///If digest is present NewTag value is ignored.
  @JsonKey(name: 'digest')
  String? digest;

  ///Name is a tag-less image name.
  @JsonKey(name: 'name')
  String name;

  ///NewName is the value used to replace the original name.
  @JsonKey(name: 'newName')
  String? newName;

  ///NewTag is the value used to replace the original tag.
  @JsonKey(name: 'newTag')
  String? newTag;

  Image({this.digest, required this.name, this.newName, this.newTag});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class KubeConfig {
  ///ConfigMapRef holds an optional name of a ConfigMap that contains
  ///the following keys:
  ///
  ///- `provider`: the provider to use. One of `aws`, `azure`, `gcp`, or
  ///`generic`. Required.
  ///- `cluster`: the fully qualified resource name of the Kubernetes
  ///cluster in the cloud provider API. Not used by the `generic`
  ///provider. Required when one of `address` or `ca.crt` is not set.
  ///- `address`: the address of the Kubernetes API server. Required
  ///for `generic`. For the other providers, if not specified, the
  ///first address in the cluster resource will be used, and if
  ///specified, it must match one of the addresses in the cluster
  ///resource.
  ///If audiences is not set, will be used as the audience for the
  ///`generic` provider.
  ///- `ca.crt`: the optional PEM-encoded CA certificate for the
  ///Kubernetes API server. If not set, the controller will use the
  ///CA certificate from the cluster resource.
  ///- `audiences`: the optional audiences as a list of
  ///line-break-separated strings for the Kubernetes ServiceAccount
  ///token. Defaults to the `address` for the `generic` provider, or
  ///to specific values for the other providers depending on the
  ///provider.
  ///-  `serviceAccountName`: the optional name of the Kubernetes
  ///ServiceAccount in the same namespace that should be used
  ///for authentication. If not specified, the controller
  ///ServiceAccount will be used.
  ///
  ///Mutually exclusive with SecretRef.
  @JsonKey(name: 'configMapRef')
  ConfigMapRef? configMapRef;

  ///SecretRef holds an optional name of a secret that contains a key with
  ///the kubeconfig file as the value. If no key is set, the key will default
  ///to 'value'. Mutually exclusive with ConfigMapRef.
  ///It is recommended that the kubeconfig is self-contained, and the secret
  ///is regularly updated if credentials such as a cloud-access-token expire.
  ///Cloud specific `cmd-path` auth helpers will not function without adding
  ///binaries and credentials to the Pod that is responsible for reconciling
  ///Kubernetes resources. Supported only for the generic provider.
  @JsonKey(name: 'secretRef')
  KubeConfigSecretRef? secretRef;

  KubeConfig({this.configMapRef, this.secretRef});

  factory KubeConfig.fromJson(Map<String, dynamic> json) =>
      _$KubeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$KubeConfigToJson(this);
}

@JsonSerializable()
class ConfigMapRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ConfigMapRef({required this.name});

  factory ConfigMapRef.fromJson(Map<String, dynamic> json) =>
      _$ConfigMapRefFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigMapRefToJson(this);
}

@JsonSerializable()
class KubeConfigSecretRef {
  ///Key in the Secret, when not specified an implementation-specific default key is used.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the Secret.
  @JsonKey(name: 'name')
  String name;

  KubeConfigSecretRef({this.key, required this.name});

  factory KubeConfigSecretRef.fromJson(Map<String, dynamic> json) =>
      _$KubeConfigSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$KubeConfigSecretRefToJson(this);
}

@JsonSerializable()
class SpecPatch {
  ///Patch contains an inline StrategicMerge patch or an inline JSON6902 patch with
  ///an array of operation objects.
  @JsonKey(name: 'patch')
  String patch;

  ///Target points to the resources that the patch document should be applied to.
  @JsonKey(name: 'target')
  PatchTarget? target;

  SpecPatch({required this.patch, this.target});

  factory SpecPatch.fromJson(Map<String, dynamic> json) =>
      _$SpecPatchFromJson(json);

  Map<String, dynamic> toJson() => _$SpecPatchToJson(this);
}

@JsonSerializable()
class PatchTarget {
  ///AnnotationSelector is a string that follows the label selection expression
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#api
  ///It matches with the resource annotations.
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;

  ///Group is the API group to select resources from.
  ///Together with Version and Kind it is capable of unambiguously identifying and/or
  ///selecting resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'group')
  String? group;

  ///Kind of the API Group to select resources from.
  ///Together with Group and Version it is capable of unambiguously
  ///identifying and/or selecting resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'kind')
  String? kind;

  ///LabelSelector is a string that follows the label selection expression
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#api
  ///It matches with the resource labels.
  @JsonKey(name: 'labelSelector')
  String? labelSelector;

  ///Name to match resources with.
  @JsonKey(name: 'name')
  String? name;

  ///Namespace to select resources from.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Version of the API Group to select resources from.
  ///Together with Group and Kind it is capable of unambiguously identifying and/or selecting
  ///resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'version')
  String? version;

  PatchTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory PatchTarget.fromJson(Map<String, dynamic> json) =>
      _$PatchTargetFromJson(json);

  Map<String, dynamic> toJson() => _$PatchTargetToJson(this);
}

@JsonSerializable()
class PatchesJson6902 {
  ///Patch contains the JSON6902 patch document with an array of operation objects.
  @JsonKey(name: 'patch')
  List<PatchesJson6902Patch?> patch;

  ///Target points to the resources that the patch document should be applied to.
  @JsonKey(name: 'target')
  PatchesJson6902Target target;

  PatchesJson6902({required this.patch, required this.target});

  factory PatchesJson6902.fromJson(Map<String, dynamic> json) =>
      _$PatchesJson6902FromJson(json);

  Map<String, dynamic> toJson() => _$PatchesJson6902ToJson(this);
}

@JsonSerializable()
class PatchesJson6902Patch {
  ///From contains a JSON-pointer value that references a location within the target document
  ///where the operation is
  ///performed. The meaning of the value depends on the value of Op, and is NOT taken into
  ///account by all operations.
  @JsonKey(name: 'from')
  String? from;

  ///Op indicates the operation to perform. Its value MUST be one of "add", "remove",
  ///"replace", "move", "copy", or
  ///"test".
  ///https://datatracker.ietf.org/doc/html/rfc6902#section-4
  @JsonKey(name: 'op')
  Op op;

  ///Path contains the JSON-pointer value that references a location within the target
  ///document where the operation
  ///is performed. The meaning of the value depends on the value of Op.
  @JsonKey(name: 'path')
  String path;

  ///Value contains a valid JSON structure. The meaning of the value depends on the value of
  ///Op, and is NOT taken into
  ///account by all operations.
  @JsonKey(name: 'value')
  dynamic value;

  PatchesJson6902Patch({
    this.from,
    required this.op,
    required this.path,
    this.value,
  });

  factory PatchesJson6902Patch.fromJson(Map<String, dynamic> json) =>
      _$PatchesJson6902PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchesJson6902PatchToJson(this);
}

///Op indicates the operation to perform. Its value MUST be one of "add", "remove",
///"replace", "move", "copy", or
///"test".
///https://datatracker.ietf.org/doc/html/rfc6902#section-4
enum Op {
  @JsonValue('add')
  ADD,
  @JsonValue('copy')
  COPY,
  @JsonValue('move')
  MOVE,
  @JsonValue('remove')
  REMOVE,
  @JsonValue('replace')
  REPLACE,
  @JsonValue('test')
  TEST,
}

final opValues = EnumValues({
  'add': Op.ADD,
  'copy': Op.COPY,
  'move': Op.MOVE,
  'remove': Op.REMOVE,
  'replace': Op.REPLACE,
  'test': Op.TEST,
});

///Target points to the resources that the patch document should be applied to.
@JsonSerializable()
class PatchesJson6902Target {
  ///AnnotationSelector is a string that follows the label selection expression
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#api
  ///It matches with the resource annotations.
  @JsonKey(name: 'annotationSelector')
  String? annotationSelector;

  ///Group is the API group to select resources from.
  ///Together with Version and Kind it is capable of unambiguously identifying and/or
  ///selecting resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'group')
  String? group;

  ///Kind of the API Group to select resources from.
  ///Together with Group and Version it is capable of unambiguously
  ///identifying and/or selecting resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'kind')
  String? kind;

  ///LabelSelector is a string that follows the label selection expression
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#api
  ///It matches with the resource labels.
  @JsonKey(name: 'labelSelector')
  String? labelSelector;

  ///Name to match resources with.
  @JsonKey(name: 'name')
  String? name;

  ///Namespace to select resources from.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Version of the API Group to select resources from.
  ///Together with Group and Kind it is capable of unambiguously identifying and/or selecting
  ///resources.
  ///
  ///https://github.com/kubernetes/community/blob/master/contributors/design-proposals/api-machinery/api-group.md
  @JsonKey(name: 'version')
  String? version;

  PatchesJson6902Target({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory PatchesJson6902Target.fromJson(Map<String, dynamic> json) =>
      _$PatchesJson6902TargetFromJson(json);

  Map<String, dynamic> toJson() => _$PatchesJson6902TargetToJson(this);
}

@JsonSerializable()
class PostBuild {
  ///Substitute holds a map of key/value pairs.
  ///The variables defined in your YAML manifests
  ///that match any of the keys defined in the map
  ///will be substituted with the set value.
  ///Includes support for bash string replacement functions
  ///e.g. ${var:=default}, ${var:position} and ${var/substring/replacement}.
  @JsonKey(name: 'substitute')
  Map<String, String?>? substitute;

  ///SubstituteFrom holds references to ConfigMaps and Secrets containing
  ///the variables and their values to be substituted in the YAML manifests.
  ///The ConfigMap and the Secret data keys represent the var names and they
  ///must match the vars declared in the manifests for the substitution to happen.
  @JsonKey(name: 'substituteFrom')
  List<SubstituteFrom?>? substituteFrom;

  PostBuild({this.substitute, this.substituteFrom});

  factory PostBuild.fromJson(Map<String, dynamic> json) =>
      _$PostBuildFromJson(json);

  Map<String, dynamic> toJson() => _$PostBuildToJson(this);
}

@JsonSerializable()
class SubstituteFrom {
  ///Kind of the values referent, valid values are ('Secret', 'ConfigMap').
  @JsonKey(name: 'kind')
  SubstituteFromKind kind;

  ///Name of the values referent. Should reside in the same namespace as the
  ///referring resource.
  @JsonKey(name: 'name')
  String name;

  ///Optional indicates whether the referenced resource must exist, or whether to
  ///tolerate its absence. If true and the referenced resource is absent, proceed
  ///as if the resource was present but empty, without any variables defined.
  @JsonKey(name: 'optional')
  bool? optional;

  SubstituteFrom({required this.kind, required this.name, this.optional});

  factory SubstituteFrom.fromJson(Map<String, dynamic> json) =>
      _$SubstituteFromFromJson(json);

  Map<String, dynamic> toJson() => _$SubstituteFromToJson(this);
}

///Kind of the values referent, valid values are ('Secret', 'ConfigMap').
enum SubstituteFromKind {
  @JsonValue('ConfigMap')
  CONFIG_MAP,
  @JsonValue('Secret')
  SECRET,
}

final substituteFromKindValues = EnumValues({
  'ConfigMap': SubstituteFromKind.CONFIG_MAP,
  'Secret': SubstituteFromKind.SECRET,
});

///Reference of the source where the kustomization file is.
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
  @JsonValue('Bucket')
  BUCKET,
  @JsonValue('GitRepository')
  GIT_REPOSITORY,
  @JsonValue('OCIRepository')
  OCI_REPOSITORY,
}

final sourceRefKindValues = EnumValues({
  'Bucket': SourceRefKind.BUCKET,
  'GitRepository': SourceRefKind.GIT_REPOSITORY,
  'OCIRepository': SourceRefKind.OCI_REPOSITORY,
});

///Deprecated: Not used in v1beta2.
enum Validation {
  @JsonValue('client')
  CLIENT,
  @JsonValue('none')
  NONE,
  @JsonValue('server')
  SERVER,
}

final validationValues = EnumValues({
  'client': Validation.CLIENT,
  'none': Validation.NONE,
  'server': Validation.SERVER,
});

@JsonSerializable()
class StatusClass {
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///Inventory contains the list of Kubernetes resource object references that have been
  ///successfully applied.
  @JsonKey(name: 'inventory')
  Inventory? inventory;

  ///The last successfully applied revision.
  ///Equals the Revision of the applied Artifact from the referenced Source.
  @JsonKey(name: 'lastAppliedRevision')
  String? lastAppliedRevision;

  ///LastAttemptedRevision is the revision of the last reconciliation attempt.
  @JsonKey(name: 'lastAttemptedRevision')
  String? lastAttemptedRevision;

  ///LastHandledReconcileAt holds the value of the most recent
  ///reconcile request value, so a change of the annotation value
  ///can be detected.
  @JsonKey(name: 'lastHandledReconcileAt')
  String? lastHandledReconcileAt;

  ///ObservedGeneration is the last reconciled generation.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  StatusClass({
    this.conditions,
    this.inventory,
    this.lastAppliedRevision,
    this.lastAttemptedRevision,
    this.lastHandledReconcileAt,
    this.observedGeneration,
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
class Inventory {
  ///Entries of Kubernetes resource object references.
  @JsonKey(name: 'entries')
  List<Entry?> entries;

  Inventory({required this.entries});

  factory Inventory.fromJson(Map<String, dynamic> json) =>
      _$InventoryFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryToJson(this);
}

@JsonSerializable()
class Entry {
  ///ID is the string representation of the Kubernetes resource object's metadata,
  ///in the format '<namespace>_<name>_<group>_<kind>'.
  @JsonKey(name: 'id')
  String id;

  ///Version is the API version of the Kubernetes resource object's kind.
  @JsonKey(name: 'v')
  String v;

  Entry({required this.id, required this.v});

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum KustomizationlistKustomizeV1Beta2Kind {
  @JsonValue('KustomizationList')
  KUSTOMIZATION_LIST,
}

final kustomizationlistKustomizeV1Beta2KindValues = EnumValues({
  'KustomizationList': KustomizationlistKustomizeV1Beta2Kind.KUSTOMIZATION_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class KustomizationlistKustomizeV1Beta2Metadata {
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

  KustomizationlistKustomizeV1Beta2Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory KustomizationlistKustomizeV1Beta2Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$KustomizationlistKustomizeV1Beta2MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$KustomizationlistKustomizeV1Beta2MetadataToJson(this);
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
