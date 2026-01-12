import 'package:json_annotation/json_annotation.dart';

part 'helmreleaselist_helm_v2beta2.g.dart';

///HelmReleaseList is a list of HelmRelease
@JsonSerializable()
class HelmreleaselistHelmV2Beta2 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of helmreleases. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  HelmreleaselistHelmV2Beta2Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  HelmreleaselistHelmV2Beta2Metadata? metadata;

  HelmreleaselistHelmV2Beta2({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory HelmreleaselistHelmV2Beta2.fromJson(Map<String, dynamic> json) =>
      _$HelmreleaselistHelmV2Beta2FromJson(json);

  Map<String, dynamic> toJson() => _$HelmreleaselistHelmV2Beta2ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('helm.toolkit.fluxcd.io/v2beta2')
  HELM_TOOLKIT_FLUXCD_IO_V2_BETA2,
}

final apiVersionValues = EnumValues({
  'helm.toolkit.fluxcd.io/v2beta2': ApiVersion.HELM_TOOLKIT_FLUXCD_IO_V2_BETA2,
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

  ///HelmReleaseSpec defines the desired state of a Helm release.
  @JsonKey(name: 'spec')
  ItemSpec? spec;

  ///HelmReleaseStatus defines the observed state of a HelmRelease.
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
  @JsonValue('HelmRelease')
  HELM_RELEASE,
}

final itemKindValues = EnumValues({'HelmRelease': ItemKind.HELM_RELEASE});

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
  ///Chart defines the template of the v1beta2.HelmChart that should be created
  ///for this HelmRelease.
  @JsonKey(name: 'chart')
  Chart? chart;

  ///ChartRef holds a reference to a source controller resource containing the
  ///Helm chart artifact.
  ///
  ///Note: this field is provisional to the v2 API, and not actively used
  ///by v2beta2 HelmReleases.
  @JsonKey(name: 'chartRef')
  ChartRef? chartRef;

  ///DependsOn may contain a meta.NamespacedObjectReference slice with
  ///references to HelmRelease resources that must be ready before this HelmRelease
  ///can be reconciled.
  @JsonKey(name: 'dependsOn')
  List<DependsOn?>? dependsOn;

  ///DriftDetection holds the configuration for detecting and handling
  ///differences between the manifest in the Helm storage and the resources
  ///currently existing in the cluster.
  @JsonKey(name: 'driftDetection')
  DriftDetection? driftDetection;

  ///Install holds the configuration for Helm install actions for this HelmRelease.
  @JsonKey(name: 'install')
  Install? install;

  ///Interval at which to reconcile the Helm release.
  @JsonKey(name: 'interval')
  String interval;

  ///KubeConfig for reconciling the HelmRelease on a remote cluster.
  ///When used in combination with HelmReleaseSpec.ServiceAccountName,
  ///forces the controller to act on behalf of that Service Account at the
  ///target cluster.
  ///If the --default-service-account flag is set, its value will be used as
  ///a controller level fallback for when HelmReleaseSpec.ServiceAccountName
  ///is empty.
  @JsonKey(name: 'kubeConfig')
  KubeConfig? kubeConfig;

  ///MaxHistory is the number of revisions saved by Helm for this HelmRelease.
  ///Use '0' for an unlimited number of revisions; defaults to '5'.
  @JsonKey(name: 'maxHistory')
  int? maxHistory;

  ///PersistentClient tells the controller to use a persistent Kubernetes
  ///client for this release. When enabled, the client will be reused for the
  ///duration of the reconciliation, instead of being created and destroyed
  ///for each (step of a) Helm action.
  ///
  ///This can improve performance, but may cause issues with some Helm charts
  ///that for example do create Custom Resource Definitions during installation
  ///outside Helm's CRD lifecycle hooks, which are then not observed to be
  ///available by e.g. post-install hooks.
  ///
  ///If not set, it defaults to true.
  @JsonKey(name: 'persistentClient')
  bool? persistentClient;

  ///PostRenderers holds an array of Helm PostRenderers, which will be applied in order
  ///of their definition.
  @JsonKey(name: 'postRenderers')
  List<PostRenderer?>? postRenderers;

  ///ReleaseName used for the Helm release. Defaults to a composition of
  ///'[TargetNamespace-]Name'.
  @JsonKey(name: 'releaseName')
  String? releaseName;

  ///Rollback holds the configuration for Helm rollback actions for this HelmRelease.
  @JsonKey(name: 'rollback')
  Rollback? rollback;

  ///The name of the Kubernetes service account to impersonate
  ///when reconciling this HelmRelease.
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///StorageNamespace used for the Helm storage.
  ///Defaults to the namespace of the HelmRelease.
  @JsonKey(name: 'storageNamespace')
  String? storageNamespace;

  ///Suspend tells the controller to suspend reconciliation for this HelmRelease,
  ///it does not apply to already started reconciliations. Defaults to false.
  @JsonKey(name: 'suspend')
  bool? suspend;

  ///TargetNamespace to target when performing operations for the HelmRelease.
  ///Defaults to the namespace of the HelmRelease.
  @JsonKey(name: 'targetNamespace')
  String? targetNamespace;

  ///Test holds the configuration for Helm test actions for this HelmRelease.
  @JsonKey(name: 'test')
  Test? test;

  ///Timeout is the time to wait for any individual Kubernetes operation (like Jobs
  ///for hooks) during the performance of a Helm action. Defaults to '5m0s'.
  @JsonKey(name: 'timeout')
  String? timeout;

  ///Uninstall holds the configuration for Helm uninstall actions for this HelmRelease.
  @JsonKey(name: 'uninstall')
  Uninstall? uninstall;

  ///Upgrade holds the configuration for Helm upgrade actions for this HelmRelease.
  @JsonKey(name: 'upgrade')
  Upgrade? upgrade;

  ///Values holds the values for this Helm release.
  @JsonKey(name: 'values')
  dynamic values;

  ///ValuesFrom holds references to resources containing Helm values for this HelmRelease,
  ///and information about how they should be merged.
  @JsonKey(name: 'valuesFrom')
  List<ValuesFrom?>? valuesFrom;

  ItemSpec({
    this.chart,
    this.chartRef,
    this.dependsOn,
    this.driftDetection,
    this.install,
    required this.interval,
    this.kubeConfig,
    this.maxHistory,
    this.persistentClient,
    this.postRenderers,
    this.releaseName,
    this.rollback,
    this.serviceAccountName,
    this.storageNamespace,
    this.suspend,
    this.targetNamespace,
    this.test,
    this.timeout,
    this.uninstall,
    this.upgrade,
    this.values,
    this.valuesFrom,
  });

  factory ItemSpec.fromJson(Map<String, dynamic> json) =>
      _$ItemSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSpecToJson(this);
}

@JsonSerializable()
class Chart {
  ///ObjectMeta holds the template for metadata like labels and annotations.
  @JsonKey(name: 'metadata')
  ChartMetadata? metadata;

  ///Spec holds the template for the v1beta2.HelmChartSpec for this HelmRelease.
  @JsonKey(name: 'spec')
  ChartSpec spec;

  Chart({this.metadata, required this.spec});

  factory Chart.fromJson(Map<String, dynamic> json) => _$ChartFromJson(json);

  Map<String, dynamic> toJson() => _$ChartToJson(this);
}

@JsonSerializable()
class ChartMetadata {
  ///Annotations is an unstructured key value map stored with a resource that may be
  ///set by external tools to store and retrieve arbitrary metadata. They are not
  ///queryable and should be preserved when modifying objects.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Map of string keys and values that can be used to organize and categorize
  ///(scope and select) objects.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ChartMetadata({this.annotations, this.labels});

  factory ChartMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChartMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ChartMetadataToJson(this);
}

///Spec holds the template for the v1beta2.HelmChartSpec for this HelmRelease.
@JsonSerializable()
class ChartSpec {
  ///The name or path the Helm chart is available at in the SourceRef.
  @JsonKey(name: 'chart')
  String chart;

  ///IgnoreMissingValuesFiles controls whether to silently ignore missing values files rather
  ///than failing.
  @JsonKey(name: 'ignoreMissingValuesFiles')
  bool? ignoreMissingValuesFiles;

  ///Interval at which to check the v1.Source for updates. Defaults to
  ///'HelmReleaseSpec.Interval'.
  @JsonKey(name: 'interval')
  String? interval;

  ///Determines what enables the creation of a new artifact. Valid values are
  ///('ChartVersion', 'Revision').
  ///See the documentation of the values for an explanation on their behavior.
  ///Defaults to ChartVersion when omitted.
  @JsonKey(name: 'reconcileStrategy')
  ReconcileStrategy? reconcileStrategy;

  ///The name and namespace of the v1.Source the chart is available at.
  @JsonKey(name: 'sourceRef')
  SourceRef sourceRef;

  ///Alternative values file to use as the default chart values, expected to
  ///be a relative path in the SourceRef. Deprecated in favor of ValuesFiles,
  ///for backwards compatibility the file defined here is merged before the
  ///ValuesFiles items. Ignored when omitted.
  @JsonKey(name: 'valuesFile')
  String? valuesFile;

  ///Alternative list of values files to use as the chart values (values.yaml
  ///is not included by default), expected to be a relative path in the SourceRef.
  ///Values files are merged in the order of this list with the last file overriding
  ///the first. Ignored when omitted.
  @JsonKey(name: 'valuesFiles')
  List<String?>? valuesFiles;

  ///Verify contains the secret name containing the trusted public keys
  ///used to verify the signature and specifies which provider to use to check
  ///whether OCI image is authentic.
  ///This field is only supported for OCI sources.
  ///Chart dependencies, which are not bundled in the umbrella chart artifact,
  ///are not verified.
  @JsonKey(name: 'verify')
  Verify? verify;

  ///Version semver expression, ignored for charts from v1beta2.GitRepository and
  ///v1beta2.Bucket sources. Defaults to latest when omitted.
  @JsonKey(name: 'version')
  String? version;

  ChartSpec({
    required this.chart,
    this.ignoreMissingValuesFiles,
    this.interval,
    this.reconcileStrategy,
    required this.sourceRef,
    this.valuesFile,
    this.valuesFiles,
    this.verify,
    this.version,
  });

  factory ChartSpec.fromJson(Map<String, dynamic> json) =>
      _$ChartSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ChartSpecToJson(this);
}

///Determines what enables the creation of a new artifact. Valid values are
///('ChartVersion', 'Revision').
///See the documentation of the values for an explanation on their behavior.
///Defaults to ChartVersion when omitted.
enum ReconcileStrategy {
  @JsonValue('ChartVersion')
  CHART_VERSION,
  @JsonValue('Revision')
  REVISION,
}

final reconcileStrategyValues = EnumValues({
  'ChartVersion': ReconcileStrategy.CHART_VERSION,
  'Revision': ReconcileStrategy.REVISION,
});

///The name and namespace of the v1.Source the chart is available at.
@JsonSerializable()
class SourceRef {
  ///APIVersion of the referent.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Kind of the referent.
  @JsonKey(name: 'kind')
  SourceRefKind kind;

  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ///Namespace of the referent.
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
  @JsonValue('HelmRepository')
  HELM_REPOSITORY,
}

final sourceRefKindValues = EnumValues({
  'Bucket': SourceRefKind.BUCKET,
  'GitRepository': SourceRefKind.GIT_REPOSITORY,
  'HelmRepository': SourceRefKind.HELM_REPOSITORY,
});

@JsonSerializable()
class Verify {
  ///Provider specifies the technology used to sign the OCI Helm chart.
  @JsonKey(name: 'provider')
  Provider provider;

  ///SecretRef specifies the Kubernetes Secret containing the
  ///trusted public keys.
  @JsonKey(name: 'secretRef')
  VerifySecretRef? secretRef;

  Verify({required this.provider, this.secretRef});

  factory Verify.fromJson(Map<String, dynamic> json) => _$VerifyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyToJson(this);
}

///Provider specifies the technology used to sign the OCI Helm chart.
enum Provider {
  @JsonValue('cosign')
  COSIGN,
  @JsonValue('notation')
  NOTATION,
}

final providerValues = EnumValues({
  'cosign': Provider.COSIGN,
  'notation': Provider.NOTATION,
});

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
class ChartRef {
  ///APIVersion of the referent.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Kind of the referent.
  @JsonKey(name: 'kind')
  ChartRefKind kind;

  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  ///Namespace of the referent, defaults to the namespace of the Kubernetes
  ///resource object that contains the reference.
  @JsonKey(name: 'namespace')
  String? namespace;

  ChartRef({
    this.apiVersion,
    required this.kind,
    required this.name,
    this.namespace,
  });

  factory ChartRef.fromJson(Map<String, dynamic> json) =>
      _$ChartRefFromJson(json);

  Map<String, dynamic> toJson() => _$ChartRefToJson(this);
}

///Kind of the referent.
enum ChartRefKind {
  @JsonValue('HelmChart')
  HELM_CHART,
  @JsonValue('OCIRepository')
  OCI_REPOSITORY,
}

final chartRefKindValues = EnumValues({
  'HelmChart': ChartRefKind.HELM_CHART,
  'OCIRepository': ChartRefKind.OCI_REPOSITORY,
});

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
class DriftDetection {
  ///Ignore contains a list of rules for specifying which changes to ignore
  ///during diffing.
  @JsonKey(name: 'ignore')
  List<Ignore?>? ignore;

  ///Mode defines how differences should be handled between the Helm manifest
  ///and the manifest currently applied to the cluster.
  ///If not explicitly set, it defaults to DiffModeDisabled.
  @JsonKey(name: 'mode')
  Mode? mode;

  DriftDetection({this.ignore, this.mode});

  factory DriftDetection.fromJson(Map<String, dynamic> json) =>
      _$DriftDetectionFromJson(json);

  Map<String, dynamic> toJson() => _$DriftDetectionToJson(this);
}

@JsonSerializable()
class Ignore {
  ///Paths is a list of JSON Pointer (RFC 6901) paths to be excluded from
  ///consideration in a Kubernetes object.
  @JsonKey(name: 'paths')
  List<String?> paths;

  ///Target is a selector for specifying Kubernetes objects to which this
  ///rule applies.
  ///If Target is not set, the Paths will be ignored for all Kubernetes
  ///objects within the manifest of the Helm release.
  @JsonKey(name: 'target')
  IgnoreTarget? target;

  Ignore({required this.paths, this.target});

  factory Ignore.fromJson(Map<String, dynamic> json) => _$IgnoreFromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreToJson(this);
}

@JsonSerializable()
class IgnoreTarget {
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

  IgnoreTarget({
    this.annotationSelector,
    this.group,
    this.kind,
    this.labelSelector,
    this.name,
    this.namespace,
    this.version,
  });

  factory IgnoreTarget.fromJson(Map<String, dynamic> json) =>
      _$IgnoreTargetFromJson(json);

  Map<String, dynamic> toJson() => _$IgnoreTargetToJson(this);
}

///Mode defines how differences should be handled between the Helm manifest
///and the manifest currently applied to the cluster.
///If not explicitly set, it defaults to DiffModeDisabled.
enum Mode {
  @JsonValue('disabled')
  DISABLED,
  @JsonValue('enabled')
  ENABLED,
  @JsonValue('warn')
  WARN,
}

final modeValues = EnumValues({
  'disabled': Mode.DISABLED,
  'enabled': Mode.ENABLED,
  'warn': Mode.WARN,
});

@JsonSerializable()
class Install {
  ///CRDs upgrade CRDs from the Helm Chart's crds directory according
  ///to the CRD upgrade policy provided here. Valid values are `Skip`,
  ///`Create` or `CreateReplace`. Default is `Create` and if omitted
  ///CRDs are installed but not updated.
  ///
  ///Skip: do neither install nor replace (update) any CRDs.
  ///
  ///Create: new CRDs are created, existing CRDs are neither updated nor deleted.
  ///
  ///CreateReplace: new CRDs are created, existing CRDs are updated (replaced)
  ///but not deleted.
  ///
  ///By default, CRDs are applied (installed) during Helm install action.
  ///With this option users can opt in to CRD replace existing CRDs on Helm
  ///install actions, which is not (yet) natively supported by Helm.
  ///https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
  @JsonKey(name: 'crds')
  Crds? crds;

  ///CreateNamespace tells the Helm install action to create the
  ///HelmReleaseSpec.TargetNamespace if it does not exist yet.
  ///On uninstall, the namespace will not be garbage collected.
  @JsonKey(name: 'createNamespace')
  bool? createNamespace;

  ///DisableHooks prevents hooks from running during the Helm install action.
  @JsonKey(name: 'disableHooks')
  bool? disableHooks;

  ///DisableOpenAPIValidation prevents the Helm install action from validating
  ///rendered templates against the Kubernetes OpenAPI Schema.
  @JsonKey(name: 'disableOpenAPIValidation')
  bool? disableOpenApiValidation;

  ///DisableWait disables the waiting for resources to be ready after a Helm
  ///install has been performed.
  @JsonKey(name: 'disableWait')
  bool? disableWait;

  ///DisableWaitForJobs disables waiting for jobs to complete after a Helm
  ///install has been performed.
  @JsonKey(name: 'disableWaitForJobs')
  bool? disableWaitForJobs;

  ///Remediation holds the remediation configuration for when the Helm install
  ///action for the HelmRelease fails. The default is to not perform any action.
  @JsonKey(name: 'remediation')
  InstallRemediation? remediation;

  ///Replace tells the Helm install action to re-use the 'ReleaseName', but only
  ///if that name is a deleted release which remains in the history.
  @JsonKey(name: 'replace')
  bool? replace;

  ///SkipCRDs tells the Helm install action to not install any CRDs. By default,
  ///CRDs are installed if not already present.
  ///
  ///Deprecated use CRD policy (`crds`) attribute with value `Skip` instead.
  @JsonKey(name: 'skipCRDs')
  bool? skipCrDs;

  ///Timeout is the time to wait for any individual Kubernetes operation (like
  ///Jobs for hooks) during the performance of a Helm install action. Defaults to
  ///'HelmReleaseSpec.Timeout'.
  @JsonKey(name: 'timeout')
  String? timeout;

  Install({
    this.crds,
    this.createNamespace,
    this.disableHooks,
    this.disableOpenApiValidation,
    this.disableWait,
    this.disableWaitForJobs,
    this.remediation,
    this.replace,
    this.skipCrDs,
    this.timeout,
  });

  factory Install.fromJson(Map<String, dynamic> json) =>
      _$InstallFromJson(json);

  Map<String, dynamic> toJson() => _$InstallToJson(this);
}

///CRDs upgrade CRDs from the Helm Chart's crds directory according
///to the CRD upgrade policy provided here. Valid values are `Skip`,
///`Create` or `CreateReplace`. Default is `Create` and if omitted
///CRDs are installed but not updated.
///
///Skip: do neither install nor replace (update) any CRDs.
///
///Create: new CRDs are created, existing CRDs are neither updated nor deleted.
///
///CreateReplace: new CRDs are created, existing CRDs are updated (replaced)
///but not deleted.
///
///By default, CRDs are applied (installed) during Helm install action.
///With this option users can opt in to CRD replace existing CRDs on Helm
///install actions, which is not (yet) natively supported by Helm.
///https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
///
///CRDs upgrade CRDs from the Helm Chart's crds directory according
///to the CRD upgrade policy provided here. Valid values are `Skip`,
///`Create` or `CreateReplace`. Default is `Skip` and if omitted
///CRDs are neither installed nor upgraded.
///
///Skip: do neither install nor replace (update) any CRDs.
///
///Create: new CRDs are created, existing CRDs are neither updated nor deleted.
///
///CreateReplace: new CRDs are created, existing CRDs are updated (replaced)
///but not deleted.
///
///By default, CRDs are not applied during Helm upgrade action. With this
///option users can opt-in to CRD upgrade, which is not (yet) natively supported by Helm.
///https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
enum Crds {
  @JsonValue('Create')
  CREATE,
  @JsonValue('CreateReplace')
  CREATE_REPLACE,
  @JsonValue('Skip')
  SKIP,
}

final crdsValues = EnumValues({
  'Create': Crds.CREATE,
  'CreateReplace': Crds.CREATE_REPLACE,
  'Skip': Crds.SKIP,
});

@JsonSerializable()
class InstallRemediation {
  ///IgnoreTestFailures tells the controller to skip remediation when the Helm
  ///tests are run after an install action but fail. Defaults to
  ///'Test.IgnoreFailures'.
  @JsonKey(name: 'ignoreTestFailures')
  bool? ignoreTestFailures;

  ///RemediateLastFailure tells the controller to remediate the last failure, when
  ///no retries remain. Defaults to 'false'.
  @JsonKey(name: 'remediateLastFailure')
  bool? remediateLastFailure;

  ///Retries is the number of retries that should be attempted on failures before
  ///bailing. Remediation, using an uninstall, is performed between each attempt.
  ///Defaults to '0', a negative integer equals to unlimited retries.
  @JsonKey(name: 'retries')
  int? retries;

  InstallRemediation({
    this.ignoreTestFailures,
    this.remediateLastFailure,
    this.retries,
  });

  factory InstallRemediation.fromJson(Map<String, dynamic> json) =>
      _$InstallRemediationFromJson(json);

  Map<String, dynamic> toJson() => _$InstallRemediationToJson(this);
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
class PostRenderer {
  ///Kustomization to apply as PostRenderer.
  @JsonKey(name: 'kustomize')
  Kustomize? kustomize;

  PostRenderer({this.kustomize});

  factory PostRenderer.fromJson(Map<String, dynamic> json) =>
      _$PostRendererFromJson(json);

  Map<String, dynamic> toJson() => _$PostRendererToJson(this);
}

@JsonSerializable()
class Kustomize {
  ///Images is a list of (image name, new name, new tag or digest)
  ///for changing image names, tags or digests. This can also be achieved with a
  ///patch, but this operator is simpler to specify.
  @JsonKey(name: 'images')
  List<Image?>? images;

  ///Strategic merge and JSON patches, defined as inline YAML objects,
  ///capable of targeting objects based on kind, label and annotation selectors.
  @JsonKey(name: 'patches')
  List<KustomizePatch?>? patches;

  ///JSON 6902 patches, defined as inline YAML objects.
  ///
  ///Deprecated: use Patches instead.
  @JsonKey(name: 'patchesJson6902')
  List<PatchesJson6902?>? patchesJson6902;

  ///Strategic merge patches, defined as inline YAML objects.
  ///
  ///Deprecated: use Patches instead.
  @JsonKey(name: 'patchesStrategicMerge')
  List<dynamic>? patchesStrategicMerge;

  Kustomize({
    this.images,
    this.patches,
    this.patchesJson6902,
    this.patchesStrategicMerge,
  });

  factory Kustomize.fromJson(Map<String, dynamic> json) =>
      _$KustomizeFromJson(json);

  Map<String, dynamic> toJson() => _$KustomizeToJson(this);
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
class KustomizePatch {
  ///Patch contains an inline StrategicMerge patch or an inline JSON6902 patch with
  ///an array of operation objects.
  @JsonKey(name: 'patch')
  String patch;

  ///Target points to the resources that the patch document should be applied to.
  @JsonKey(name: 'target')
  PatchTarget? target;

  KustomizePatch({required this.patch, this.target});

  factory KustomizePatch.fromJson(Map<String, dynamic> json) =>
      _$KustomizePatchFromJson(json);

  Map<String, dynamic> toJson() => _$KustomizePatchToJson(this);
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
class Rollback {
  ///CleanupOnFail allows deletion of new resources created during the Helm
  ///rollback action when it fails.
  @JsonKey(name: 'cleanupOnFail')
  bool? cleanupOnFail;

  ///DisableHooks prevents hooks from running during the Helm rollback action.
  @JsonKey(name: 'disableHooks')
  bool? disableHooks;

  ///DisableWait disables the waiting for resources to be ready after a Helm
  ///rollback has been performed.
  @JsonKey(name: 'disableWait')
  bool? disableWait;

  ///DisableWaitForJobs disables waiting for jobs to complete after a Helm
  ///rollback has been performed.
  @JsonKey(name: 'disableWaitForJobs')
  bool? disableWaitForJobs;

  ///Force forces resource updates through a replacement strategy.
  @JsonKey(name: 'force')
  bool? force;

  ///Recreate performs pod restarts for the resource if applicable.
  @JsonKey(name: 'recreate')
  bool? recreate;

  ///Timeout is the time to wait for any individual Kubernetes operation (like
  ///Jobs for hooks) during the performance of a Helm rollback action. Defaults to
  ///'HelmReleaseSpec.Timeout'.
  @JsonKey(name: 'timeout')
  String? timeout;

  Rollback({
    this.cleanupOnFail,
    this.disableHooks,
    this.disableWait,
    this.disableWaitForJobs,
    this.force,
    this.recreate,
    this.timeout,
  });

  factory Rollback.fromJson(Map<String, dynamic> json) =>
      _$RollbackFromJson(json);

  Map<String, dynamic> toJson() => _$RollbackToJson(this);
}

@JsonSerializable()
class Test {
  ///Enable enables Helm test actions for this HelmRelease after an Helm install
  ///or upgrade action has been performed.
  @JsonKey(name: 'enable')
  bool? enable;

  ///Filters is a list of tests to run or exclude from running.
  @JsonKey(name: 'filters')
  List<Filter?>? filters;

  ///IgnoreFailures tells the controller to skip remediation when the Helm tests
  ///are run but fail. Can be overwritten for tests run after install or upgrade
  ///actions in 'Install.IgnoreTestFailures' and 'Upgrade.IgnoreTestFailures'.
  @JsonKey(name: 'ignoreFailures')
  bool? ignoreFailures;

  ///Timeout is the time to wait for any individual Kubernetes operation during
  ///the performance of a Helm test action. Defaults to 'HelmReleaseSpec.Timeout'.
  @JsonKey(name: 'timeout')
  String? timeout;

  Test({this.enable, this.filters, this.ignoreFailures, this.timeout});

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

@JsonSerializable()
class Filter {
  ///Exclude specifies whether the named test should be excluded.
  @JsonKey(name: 'exclude')
  bool? exclude;

  ///Name is the name of the test.
  @JsonKey(name: 'name')
  String name;

  Filter({this.exclude, required this.name});

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class Uninstall {
  ///DeletionPropagation specifies the deletion propagation policy when
  ///a Helm uninstall is performed.
  @JsonKey(name: 'deletionPropagation')
  DeletionPropagation? deletionPropagation;

  ///DisableHooks prevents hooks from running during the Helm rollback action.
  @JsonKey(name: 'disableHooks')
  bool? disableHooks;

  ///DisableWait disables waiting for all the resources to be deleted after
  ///a Helm uninstall is performed.
  @JsonKey(name: 'disableWait')
  bool? disableWait;

  ///KeepHistory tells Helm to remove all associated resources and mark the
  ///release as deleted, but retain the release history.
  @JsonKey(name: 'keepHistory')
  bool? keepHistory;

  ///Timeout is the time to wait for any individual Kubernetes operation (like
  ///Jobs for hooks) during the performance of a Helm uninstall action. Defaults
  ///to 'HelmReleaseSpec.Timeout'.
  @JsonKey(name: 'timeout')
  String? timeout;

  Uninstall({
    this.deletionPropagation,
    this.disableHooks,
    this.disableWait,
    this.keepHistory,
    this.timeout,
  });

  factory Uninstall.fromJson(Map<String, dynamic> json) =>
      _$UninstallFromJson(json);

  Map<String, dynamic> toJson() => _$UninstallToJson(this);
}

///DeletionPropagation specifies the deletion propagation policy when
///a Helm uninstall is performed.
enum DeletionPropagation {
  @JsonValue('background')
  BACKGROUND,
  @JsonValue('foreground')
  FOREGROUND,
  @JsonValue('orphan')
  ORPHAN,
}

final deletionPropagationValues = EnumValues({
  'background': DeletionPropagation.BACKGROUND,
  'foreground': DeletionPropagation.FOREGROUND,
  'orphan': DeletionPropagation.ORPHAN,
});

@JsonSerializable()
class Upgrade {
  ///CleanupOnFail allows deletion of new resources created during the Helm
  ///upgrade action when it fails.
  @JsonKey(name: 'cleanupOnFail')
  bool? cleanupOnFail;

  ///CRDs upgrade CRDs from the Helm Chart's crds directory according
  ///to the CRD upgrade policy provided here. Valid values are `Skip`,
  ///`Create` or `CreateReplace`. Default is `Skip` and if omitted
  ///CRDs are neither installed nor upgraded.
  ///
  ///Skip: do neither install nor replace (update) any CRDs.
  ///
  ///Create: new CRDs are created, existing CRDs are neither updated nor deleted.
  ///
  ///CreateReplace: new CRDs are created, existing CRDs are updated (replaced)
  ///but not deleted.
  ///
  ///By default, CRDs are not applied during Helm upgrade action. With this
  ///option users can opt-in to CRD upgrade, which is not (yet) natively supported by Helm.
  ///https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
  @JsonKey(name: 'crds')
  Crds? crds;

  ///DisableHooks prevents hooks from running during the Helm upgrade action.
  @JsonKey(name: 'disableHooks')
  bool? disableHooks;

  ///DisableOpenAPIValidation prevents the Helm upgrade action from validating
  ///rendered templates against the Kubernetes OpenAPI Schema.
  @JsonKey(name: 'disableOpenAPIValidation')
  bool? disableOpenApiValidation;

  ///DisableWait disables the waiting for resources to be ready after a Helm
  ///upgrade has been performed.
  @JsonKey(name: 'disableWait')
  bool? disableWait;

  ///DisableWaitForJobs disables waiting for jobs to complete after a Helm
  ///upgrade has been performed.
  @JsonKey(name: 'disableWaitForJobs')
  bool? disableWaitForJobs;

  ///Force forces resource updates through a replacement strategy.
  @JsonKey(name: 'force')
  bool? force;

  ///PreserveValues will make Helm reuse the last release's values and merge in
  ///overrides from 'Values'. Setting this flag makes the HelmRelease
  ///non-declarative.
  @JsonKey(name: 'preserveValues')
  bool? preserveValues;

  ///Remediation holds the remediation configuration for when the Helm upgrade
  ///action for the HelmRelease fails. The default is to not perform any action.
  @JsonKey(name: 'remediation')
  UpgradeRemediation? remediation;

  ///Timeout is the time to wait for any individual Kubernetes operation (like
  ///Jobs for hooks) during the performance of a Helm upgrade action. Defaults to
  ///'HelmReleaseSpec.Timeout'.
  @JsonKey(name: 'timeout')
  String? timeout;

  Upgrade({
    this.cleanupOnFail,
    this.crds,
    this.disableHooks,
    this.disableOpenApiValidation,
    this.disableWait,
    this.disableWaitForJobs,
    this.force,
    this.preserveValues,
    this.remediation,
    this.timeout,
  });

  factory Upgrade.fromJson(Map<String, dynamic> json) =>
      _$UpgradeFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeToJson(this);
}

@JsonSerializable()
class UpgradeRemediation {
  ///IgnoreTestFailures tells the controller to skip remediation when the Helm
  ///tests are run after an upgrade action but fail.
  ///Defaults to 'Test.IgnoreFailures'.
  @JsonKey(name: 'ignoreTestFailures')
  bool? ignoreTestFailures;

  ///RemediateLastFailure tells the controller to remediate the last failure, when
  ///no retries remain. Defaults to 'false' unless 'Retries' is greater than 0.
  @JsonKey(name: 'remediateLastFailure')
  bool? remediateLastFailure;

  ///Retries is the number of retries that should be attempted on failures before
  ///bailing. Remediation, using 'Strategy', is performed between each attempt.
  ///Defaults to '0', a negative integer equals to unlimited retries.
  @JsonKey(name: 'retries')
  int? retries;

  ///Strategy to use for failure remediation. Defaults to 'rollback'.
  @JsonKey(name: 'strategy')
  Strategy? strategy;

  UpgradeRemediation({
    this.ignoreTestFailures,
    this.remediateLastFailure,
    this.retries,
    this.strategy,
  });

  factory UpgradeRemediation.fromJson(Map<String, dynamic> json) =>
      _$UpgradeRemediationFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeRemediationToJson(this);
}

///Strategy to use for failure remediation. Defaults to 'rollback'.
enum Strategy {
  @JsonValue('rollback')
  ROLLBACK,
  @JsonValue('uninstall')
  UNINSTALL,
}

final strategyValues = EnumValues({
  'rollback': Strategy.ROLLBACK,
  'uninstall': Strategy.UNINSTALL,
});

@JsonSerializable()
class ValuesFrom {
  ///Kind of the values referent, valid values are ('Secret', 'ConfigMap').
  @JsonKey(name: 'kind')
  ValuesFromKind kind;

  ///Name of the values referent. Should reside in the same namespace as the
  ///referring resource.
  @JsonKey(name: 'name')
  String name;

  ///Optional marks this ValuesReference as optional. When set, a not found error
  ///for the values reference is ignored, but any ValuesKey, TargetPath or
  ///transient error will still result in a reconciliation failure.
  @JsonKey(name: 'optional')
  bool? optional;

  ///TargetPath is the YAML dot notation path the value should be merged at. When
  ///set, the ValuesKey is expected to be a single flat value. Defaults to 'None',
  ///which results in the values getting merged at the root.
  @JsonKey(name: 'targetPath')
  String? targetPath;

  ///ValuesKey is the data key where the values.yaml or a specific value can be
  ///found at. Defaults to 'values.yaml'.
  @JsonKey(name: 'valuesKey')
  String? valuesKey;

  ValuesFrom({
    required this.kind,
    required this.name,
    this.optional,
    this.targetPath,
    this.valuesKey,
  });

  factory ValuesFrom.fromJson(Map<String, dynamic> json) =>
      _$ValuesFromFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesFromToJson(this);
}

///Kind of the values referent, valid values are ('Secret', 'ConfigMap').
enum ValuesFromKind {
  @JsonValue('ConfigMap')
  CONFIG_MAP,
  @JsonValue('Secret')
  SECRET,
}

final valuesFromKindValues = EnumValues({
  'ConfigMap': ValuesFromKind.CONFIG_MAP,
  'Secret': ValuesFromKind.SECRET,
});

@JsonSerializable()
class StatusClass {
  ///Conditions holds the conditions for the HelmRelease.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///Failures is the reconciliation failure count against the latest desired
  ///state. It is reset after a successful reconciliation.
  @JsonKey(name: 'failures')
  int? failures;

  ///HelmChart is the namespaced name of the HelmChart resource created by
  ///the controller for the HelmRelease.
  @JsonKey(name: 'helmChart')
  String? helmChart;

  ///History holds the history of Helm releases performed for this HelmRelease
  ///up to the last successfully completed release.
  @JsonKey(name: 'history')
  List<History?>? history;

  ///InstallFailures is the install failure count against the latest desired
  ///state. It is reset after a successful reconciliation.
  @JsonKey(name: 'installFailures')
  int? installFailures;

  ///LastAppliedRevision is the revision of the last successfully applied
  ///source.
  ///
  ///Deprecated: the revision can now be found in the History.
  @JsonKey(name: 'lastAppliedRevision')
  String? lastAppliedRevision;

  ///LastAttemptedConfigDigest is the digest for the config (better known as
  ///"values") of the last reconciliation attempt.
  @JsonKey(name: 'lastAttemptedConfigDigest')
  String? lastAttemptedConfigDigest;

  ///LastAttemptedGeneration is the last generation the controller attempted
  ///to reconcile.
  @JsonKey(name: 'lastAttemptedGeneration')
  int? lastAttemptedGeneration;

  ///LastAttemptedReleaseAction is the last release action performed for this
  ///HelmRelease. It is used to determine the active remediation strategy.
  @JsonKey(name: 'lastAttemptedReleaseAction')
  LastAttemptedReleaseAction? lastAttemptedReleaseAction;

  ///LastAttemptedRevision is the Source revision of the last reconciliation
  ///attempt. For OCIRepository  sources, the 12 first characters of the digest are
  ///appended to the chart version e.g. "1.2.3+1234567890ab".
  @JsonKey(name: 'lastAttemptedRevision')
  String? lastAttemptedRevision;

  ///LastAttemptedRevisionDigest is the digest of the last reconciliation attempt.
  ///This is only set for OCIRepository sources.
  @JsonKey(name: 'lastAttemptedRevisionDigest')
  String? lastAttemptedRevisionDigest;

  ///LastAttemptedValuesChecksum is the SHA1 checksum for the values of the last
  ///reconciliation attempt.
  ///
  ///Deprecated: Use LastAttemptedConfigDigest instead.
  @JsonKey(name: 'lastAttemptedValuesChecksum')
  String? lastAttemptedValuesChecksum;

  ///LastHandledForceAt holds the value of the most recent force request
  ///value, so a change of the annotation value can be detected.
  @JsonKey(name: 'lastHandledForceAt')
  String? lastHandledForceAt;

  ///LastHandledReconcileAt holds the value of the most recent
  ///reconcile request value, so a change of the annotation value
  ///can be detected.
  @JsonKey(name: 'lastHandledReconcileAt')
  String? lastHandledReconcileAt;

  ///LastHandledResetAt holds the value of the most recent reset request
  ///value, so a change of the annotation value can be detected.
  @JsonKey(name: 'lastHandledResetAt')
  String? lastHandledResetAt;

  ///LastReleaseRevision is the revision of the last successful Helm release.
  ///
  ///Deprecated: Use History instead.
  @JsonKey(name: 'lastReleaseRevision')
  int? lastReleaseRevision;

  ///ObservedGeneration is the last observed generation.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///ObservedPostRenderersDigest is the digest for the post-renderers of
  ///the last successful reconciliation attempt.
  @JsonKey(name: 'observedPostRenderersDigest')
  String? observedPostRenderersDigest;

  ///StorageNamespace is the namespace of the Helm release storage for the
  ///current release.
  @JsonKey(name: 'storageNamespace')
  String? storageNamespace;

  ///UpgradeFailures is the upgrade failure count against the latest desired
  ///state. It is reset after a successful reconciliation.
  @JsonKey(name: 'upgradeFailures')
  int? upgradeFailures;

  StatusClass({
    this.conditions,
    this.failures,
    this.helmChart,
    this.history,
    this.installFailures,
    this.lastAppliedRevision,
    this.lastAttemptedConfigDigest,
    this.lastAttemptedGeneration,
    this.lastAttemptedReleaseAction,
    this.lastAttemptedRevision,
    this.lastAttemptedRevisionDigest,
    this.lastAttemptedValuesChecksum,
    this.lastHandledForceAt,
    this.lastHandledReconcileAt,
    this.lastHandledResetAt,
    this.lastReleaseRevision,
    this.observedGeneration,
    this.observedPostRenderersDigest,
    this.storageNamespace,
    this.upgradeFailures,
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
class History {
  ///APIVersion is the API version of the Snapshot.
  ///Provisional: when the calculation method of the Digest field is changed,
  ///this field will be used to distinguish between the old and new methods.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///AppVersion is the chart app version of the release object in storage.
  @JsonKey(name: 'appVersion')
  String? appVersion;

  ///ChartName is the chart name of the release object in storage.
  @JsonKey(name: 'chartName')
  String chartName;

  ///ChartVersion is the chart version of the release object in
  ///storage.
  @JsonKey(name: 'chartVersion')
  String chartVersion;

  ///ConfigDigest is the checksum of the config (better known as
  ///"values") of the release object in storage.
  ///It has the format of `<algo>:<checksum>`.
  @JsonKey(name: 'configDigest')
  String configDigest;

  ///Deleted is when the release was deleted.
  @JsonKey(name: 'deleted')
  DateTime? deleted;

  ///Digest is the checksum of the release object in storage.
  ///It has the format of `<algo>:<checksum>`.
  @JsonKey(name: 'digest')
  String digest;

  ///FirstDeployed is when the release was first deployed.
  @JsonKey(name: 'firstDeployed')
  DateTime firstDeployed;

  ///LastDeployed is when the release was last deployed.
  @JsonKey(name: 'lastDeployed')
  DateTime lastDeployed;

  ///Name is the name of the release.
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the namespace the release is deployed to.
  @JsonKey(name: 'namespace')
  String namespace;

  ///OCIDigest is the digest of the OCI artifact associated with the release.
  @JsonKey(name: 'ociDigest')
  String? ociDigest;

  ///Status is the current state of the release.
  @JsonKey(name: 'status')
  String status;

  ///TestHooks is the list of test hooks for the release as observed to be
  ///run by the controller.
  @JsonKey(name: 'testHooks')
  Map<String, TestHook?>? testHooks;

  ///Version is the version of the release object in storage.
  @JsonKey(name: 'version')
  int version;

  History({
    this.apiVersion,
    this.appVersion,
    required this.chartName,
    required this.chartVersion,
    required this.configDigest,
    this.deleted,
    required this.digest,
    required this.firstDeployed,
    required this.lastDeployed,
    required this.name,
    required this.namespace,
    this.ociDigest,
    required this.status,
    this.testHooks,
    required this.version,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class TestHook {
  ///LastCompleted is the time the test hook last completed.
  @JsonKey(name: 'lastCompleted')
  DateTime? lastCompleted;

  ///LastStarted is the time the test hook was last started.
  @JsonKey(name: 'lastStarted')
  DateTime? lastStarted;

  ///Phase the test hook was observed to be in.
  @JsonKey(name: 'phase')
  String? phase;

  TestHook({this.lastCompleted, this.lastStarted, this.phase});

  factory TestHook.fromJson(Map<String, dynamic> json) =>
      _$TestHookFromJson(json);

  Map<String, dynamic> toJson() => _$TestHookToJson(this);
}

///LastAttemptedReleaseAction is the last release action performed for this
///HelmRelease. It is used to determine the active remediation strategy.
enum LastAttemptedReleaseAction {
  @JsonValue('install')
  INSTALL,
  @JsonValue('upgrade')
  UPGRADE,
}

final lastAttemptedReleaseActionValues = EnumValues({
  'install': LastAttemptedReleaseAction.INSTALL,
  'upgrade': LastAttemptedReleaseAction.UPGRADE,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum HelmreleaselistHelmV2Beta2Kind {
  @JsonValue('HelmReleaseList')
  HELM_RELEASE_LIST,
}

final helmreleaselistHelmV2Beta2KindValues = EnumValues({
  'HelmReleaseList': HelmreleaselistHelmV2Beta2Kind.HELM_RELEASE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class HelmreleaselistHelmV2Beta2Metadata {
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

  HelmreleaselistHelmV2Beta2Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory HelmreleaselistHelmV2Beta2Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$HelmreleaselistHelmV2Beta2MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HelmreleaselistHelmV2Beta2MetadataToJson(this);
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
