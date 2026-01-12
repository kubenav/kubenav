import 'package:json_annotation/json_annotation.dart';

part 'horizontalpodautoscalerlist_autoscaling_v2.g.dart';

///HorizontalPodAutoscalerList is a list of horizontal pod autoscaler objects.
@JsonSerializable()
class HorizontalpodautoscalerlistAutoscalingV2 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///items is the list of horizontal pod autoscaler objects.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  HorizontalpodautoscalerlistAutoscalingV2Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  HorizontalpodautoscalerlistAutoscalingV2Metadata? metadata;

  HorizontalpodautoscalerlistAutoscalingV2({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory HorizontalpodautoscalerlistAutoscalingV2.fromJson(
    Map<String, dynamic> json,
  ) => _$HorizontalpodautoscalerlistAutoscalingV2FromJson(json);

  Map<String, dynamic> toJson() =>
      _$HorizontalpodautoscalerlistAutoscalingV2ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('autoscaling/v2')
  AUTOSCALING_V2,
}

final apiVersionValues = EnumValues({
  'autoscaling/v2': ApiVersion.AUTOSCALING_V2,
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

  ///HorizontalPodAutoscalerSpec describes the desired functionality of the
  ///HorizontalPodAutoscaler.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler.
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
  @JsonValue('HorizontalPodAutoscaler')
  HORIZONTAL_POD_AUTOSCALER,
}

final itemKindValues = EnumValues({
  'HorizontalPodAutoscaler': ItemKind.HORIZONTAL_POD_AUTOSCALER,
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
  ///HorizontalPodAutoscalerBehavior configures the scaling behavior of the target in both Up
  ///and Down directions (scaleUp and scaleDown fields respectively).
  @JsonKey(name: 'behavior')
  Behavior? behavior;

  ///maxReplicas is the upper limit for the number of replicas to which the autoscaler can
  ///scale up. It cannot be less that minReplicas.
  @JsonKey(name: 'maxReplicas')
  int maxReplicas;

  ///metrics contains the specifications for which to use to calculate the desired replica
  ///count (the maximum replica count across all metrics will be used).  The desired replica
  ///count is calculated multiplying the ratio between the target value and the current value
  ///by the current number of pods.  Ergo, metrics used must decrease as the pod count is
  ///increased, and vice-versa.  See the individual metric source types for more information
  ///about how each type of metric must respond. If not set, the default metric will be set to
  ///80% average CPU utilization.
  @JsonKey(name: 'metrics')
  List<SpecMetric?>? metrics;

  ///minReplicas is the lower limit for the number of replicas to which the autoscaler can
  ///scale down.  It defaults to 1 pod.  minReplicas is allowed to be 0 if the alpha feature
  ///gate HPAScaleToZero is enabled and at least one Object or External metric is configured.
  ///Scaling is active as long as at least one metric value is available.
  @JsonKey(name: 'minReplicas')
  int? minReplicas;

  ///CrossVersionObjectReference contains enough information to let you identify the referred
  ///resource.
  @JsonKey(name: 'scaleTargetRef')
  ScaleTargetRef scaleTargetRef;

  Spec({
    this.behavior,
    required this.maxReplicas,
    this.metrics,
    this.minReplicas,
    required this.scaleTargetRef,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Behavior {
  ///HPAScalingRules configures the scaling behavior for one direction via scaling Policy
  ///Rules and a configurable metric tolerance.
  ///
  ///Scaling Policy Rules are applied after calculating DesiredReplicas from metrics for the
  ///HPA. They can limit the scaling velocity by specifying scaling policies. They can prevent
  ///flapping by specifying the stabilization window, so that the number of replicas is not
  ///set instantly, instead, the safest value from the stabilization window is chosen.
  ///
  ///The tolerance is applied to the metric values and prevents scaling too eagerly for small
  ///metric variations. (Note that setting a tolerance requires the beta
  ///HPAConfigurableTolerance feature gate to be enabled.)
  @JsonKey(name: 'scaleDown')
  ScaleDown? scaleDown;

  ///HPAScalingRules configures the scaling behavior for one direction via scaling Policy
  ///Rules and a configurable metric tolerance.
  ///
  ///Scaling Policy Rules are applied after calculating DesiredReplicas from metrics for the
  ///HPA. They can limit the scaling velocity by specifying scaling policies. They can prevent
  ///flapping by specifying the stabilization window, so that the number of replicas is not
  ///set instantly, instead, the safest value from the stabilization window is chosen.
  ///
  ///The tolerance is applied to the metric values and prevents scaling too eagerly for small
  ///metric variations. (Note that setting a tolerance requires the beta
  ///HPAConfigurableTolerance feature gate to be enabled.)
  @JsonKey(name: 'scaleUp')
  ScaleUp? scaleUp;

  Behavior({this.scaleDown, this.scaleUp});

  factory Behavior.fromJson(Map<String, dynamic> json) =>
      _$BehaviorFromJson(json);

  Map<String, dynamic> toJson() => _$BehaviorToJson(this);
}

@JsonSerializable()
class ScaleDown {
  ///policies is a list of potential scaling polices which can be used during scaling. If not
  ///set, use the default values: - For scale up: allow doubling the number of pods, or an
  ///absolute change of 4 pods in a 15s window. - For scale down: allow all pods to be removed
  ///in a 15s window.
  @JsonKey(name: 'policies')
  List<ScaleDownPolicy?>? policies;

  ///selectPolicy is used to specify which policy should be used. If not set, the default
  ///value Max is used.
  @JsonKey(name: 'selectPolicy')
  String? selectPolicy;

  ///stabilizationWindowSeconds is the number of seconds for which past recommendations should
  ///be considered while scaling up or scaling down. StabilizationWindowSeconds must be
  ///greater than or equal to zero and less than or equal to 3600 (one hour). If not set, use
  ///the default values: - For scale up: 0 (i.e. no stabilization is done). - For scale down:
  ///300 (i.e. the stabilization window is 300 seconds long).
  @JsonKey(name: 'stabilizationWindowSeconds')
  int? stabilizationWindowSeconds;
  @JsonKey(name: 'tolerance')
  dynamic tolerance;

  ScaleDown({
    this.policies,
    this.selectPolicy,
    this.stabilizationWindowSeconds,
    this.tolerance,
  });

  factory ScaleDown.fromJson(Map<String, dynamic> json) =>
      _$ScaleDownFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleDownToJson(this);
}

@JsonSerializable()
class ScaleDownPolicy {
  ///periodSeconds specifies the window of time for which the policy should hold true.
  ///PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min).
  @JsonKey(name: 'periodSeconds')
  int periodSeconds;

  ///type is used to specify the scaling policy.
  @JsonKey(name: 'type')
  String type;

  ///value contains the amount of change which is permitted by the policy. It must be greater
  ///than zero
  @JsonKey(name: 'value')
  int value;

  ScaleDownPolicy({
    required this.periodSeconds,
    required this.type,
    required this.value,
  });

  factory ScaleDownPolicy.fromJson(Map<String, dynamic> json) =>
      _$ScaleDownPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleDownPolicyToJson(this);
}

@JsonSerializable()
class ScaleUp {
  ///policies is a list of potential scaling polices which can be used during scaling. If not
  ///set, use the default values: - For scale up: allow doubling the number of pods, or an
  ///absolute change of 4 pods in a 15s window. - For scale down: allow all pods to be removed
  ///in a 15s window.
  @JsonKey(name: 'policies')
  List<ScaleUpPolicy?>? policies;

  ///selectPolicy is used to specify which policy should be used. If not set, the default
  ///value Max is used.
  @JsonKey(name: 'selectPolicy')
  String? selectPolicy;

  ///stabilizationWindowSeconds is the number of seconds for which past recommendations should
  ///be considered while scaling up or scaling down. StabilizationWindowSeconds must be
  ///greater than or equal to zero and less than or equal to 3600 (one hour). If not set, use
  ///the default values: - For scale up: 0 (i.e. no stabilization is done). - For scale down:
  ///300 (i.e. the stabilization window is 300 seconds long).
  @JsonKey(name: 'stabilizationWindowSeconds')
  int? stabilizationWindowSeconds;
  @JsonKey(name: 'tolerance')
  dynamic tolerance;

  ScaleUp({
    this.policies,
    this.selectPolicy,
    this.stabilizationWindowSeconds,
    this.tolerance,
  });

  factory ScaleUp.fromJson(Map<String, dynamic> json) =>
      _$ScaleUpFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleUpToJson(this);
}

@JsonSerializable()
class ScaleUpPolicy {
  ///periodSeconds specifies the window of time for which the policy should hold true.
  ///PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min).
  @JsonKey(name: 'periodSeconds')
  int periodSeconds;

  ///type is used to specify the scaling policy.
  @JsonKey(name: 'type')
  String type;

  ///value contains the amount of change which is permitted by the policy. It must be greater
  ///than zero
  @JsonKey(name: 'value')
  int value;

  ScaleUpPolicy({
    required this.periodSeconds,
    required this.type,
    required this.value,
  });

  factory ScaleUpPolicy.fromJson(Map<String, dynamic> json) =>
      _$ScaleUpPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleUpPolicyToJson(this);
}

@JsonSerializable()
class SpecMetric {
  ///ContainerResourceMetricSource indicates how to scale on a resource metric known to
  ///Kubernetes, as specified in requests and limits, describing each pod in the current scale
  ///target (e.g. CPU or memory).  The values will be averaged together before being compared
  ///to the target.  Such metrics are built in to Kubernetes, and have special scaling options
  ///on top of those available to normal per-pod metrics using the "pods" source.  Only one
  ///"target" type should be set.
  @JsonKey(name: 'containerResource')
  MetricContainerResource? containerResource;

  ///ExternalMetricSource indicates how to scale on a metric not associated with any
  ///Kubernetes object (for example length of queue in cloud messaging service, or QPS from
  ///loadbalancer running outside of cluster).
  @JsonKey(name: 'external')
  MetricExternal? metricExternal;

  ///ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for
  ///example, hits-per-second on an Ingress object).
  @JsonKey(name: 'object')
  MetricObject? object;

  ///PodsMetricSource indicates how to scale on a metric describing each pod in the current
  ///scale target (for example, transactions-processed-per-second). The values will be
  ///averaged together before being compared to the target value.
  @JsonKey(name: 'pods')
  MetricPods? pods;

  ///ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as
  ///specified in requests and limits, describing each pod in the current scale target (e.g.
  ///CPU or memory).  The values will be averaged together before being compared to the
  ///target.  Such metrics are built in to Kubernetes, and have special scaling options on top
  ///of those available to normal per-pod metrics using the "pods" source.  Only one "target"
  ///type should be set.
  @JsonKey(name: 'resource')
  MetricResource? resource;

  ///type is the type of metric source.  It should be one of "ContainerResource", "External",
  ///"Object", "Pods" or "Resource", each mapping to a matching field in the object.
  @JsonKey(name: 'type')
  String type;

  SpecMetric({
    this.containerResource,
    this.metricExternal,
    this.object,
    this.pods,
    this.resource,
    required this.type,
  });

  factory SpecMetric.fromJson(Map<String, dynamic> json) =>
      _$SpecMetricFromJson(json);

  Map<String, dynamic> toJson() => _$SpecMetricToJson(this);
}

@JsonSerializable()
class MetricContainerResource {
  ///container is the name of the container in the pods of the scaling target
  @JsonKey(name: 'container')
  String container;

  ///name is the name of the resource in question.
  @JsonKey(name: 'name')
  String name;

  ///MetricTarget defines the target value, average value, or average utilization of a
  ///specific metric
  @JsonKey(name: 'target')
  ContainerResourceTarget target;

  MetricContainerResource({
    required this.container,
    required this.name,
    required this.target,
  });

  factory MetricContainerResource.fromJson(Map<String, dynamic> json) =>
      _$MetricContainerResourceFromJson(json);

  Map<String, dynamic> toJson() => _$MetricContainerResourceToJson(this);
}

///MetricTarget defines the target value, average value, or average utilization of a
///specific metric
@JsonSerializable()
class ContainerResourceTarget {
  ///averageUtilization is the target value of the average of the resource metric across all
  ///relevant pods, represented as a percentage of the requested value of the resource for the
  ///pods. Currently only valid for Resource metric source type
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;

  ///type represents whether the metric type is Utilization, Value, or AverageValue
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  dynamic value;

  ContainerResourceTarget({
    this.averageUtilization,
    this.averageValue,
    required this.type,
    this.value,
  });

  factory ContainerResourceTarget.fromJson(Map<String, dynamic> json) =>
      _$ContainerResourceTargetFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResourceTargetToJson(this);
}

@JsonSerializable()
class MetricExternal {
  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  PurpleMetric metric;

  ///MetricTarget defines the target value, average value, or average utilization of a
  ///specific metric
  @JsonKey(name: 'target')
  ExternalTarget target;

  MetricExternal({required this.metric, required this.target});

  factory MetricExternal.fromJson(Map<String, dynamic> json) =>
      _$MetricExternalFromJson(json);

  Map<String, dynamic> toJson() => _$MetricExternalToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class PurpleMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  PurpleSelector? selector;

  PurpleMetric({required this.name, this.selector});

  factory PurpleMetric.fromJson(Map<String, dynamic> json) =>
      _$PurpleMetricFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMetricToJson(this);
}

@JsonSerializable()
class PurpleSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleSelector({this.matchExpressions, this.matchLabels});

  factory PurpleSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSelectorToJson(this);
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

///MetricTarget defines the target value, average value, or average utilization of a
///specific metric
@JsonSerializable()
class ExternalTarget {
  ///averageUtilization is the target value of the average of the resource metric across all
  ///relevant pods, represented as a percentage of the requested value of the resource for the
  ///pods. Currently only valid for Resource metric source type
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;

  ///type represents whether the metric type is Utilization, Value, or AverageValue
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  dynamic value;

  ExternalTarget({
    this.averageUtilization,
    this.averageValue,
    required this.type,
    this.value,
  });

  factory ExternalTarget.fromJson(Map<String, dynamic> json) =>
      _$ExternalTargetFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalTargetToJson(this);
}

@JsonSerializable()
class MetricObject {
  ///CrossVersionObjectReference contains enough information to let you identify the referred
  ///resource.
  @JsonKey(name: 'describedObject')
  PurpleDescribedObject describedObject;

  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  FluffyMetric metric;

  ///MetricTarget defines the target value, average value, or average utilization of a
  ///specific metric
  @JsonKey(name: 'target')
  ObjectTarget target;

  MetricObject({
    required this.describedObject,
    required this.metric,
    required this.target,
  });

  factory MetricObject.fromJson(Map<String, dynamic> json) =>
      _$MetricObjectFromJson(json);

  Map<String, dynamic> toJson() => _$MetricObjectToJson(this);
}

///CrossVersionObjectReference contains enough information to let you identify the referred
///resource.
@JsonSerializable()
class PurpleDescribedObject {
  ///apiVersion is the API version of the referent
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///kind is the kind of the referent; More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///name is the name of the referent; More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  PurpleDescribedObject({
    this.apiVersion,
    required this.kind,
    required this.name,
  });

  factory PurpleDescribedObject.fromJson(Map<String, dynamic> json) =>
      _$PurpleDescribedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleDescribedObjectToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class FluffyMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  FluffySelector? selector;

  FluffyMetric({required this.name, this.selector});

  factory FluffyMetric.fromJson(Map<String, dynamic> json) =>
      _$FluffyMetricFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMetricToJson(this);
}

@JsonSerializable()
class FluffySelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffySelector({this.matchExpressions, this.matchLabels});

  factory FluffySelector.fromJson(Map<String, dynamic> json) =>
      _$FluffySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySelectorToJson(this);
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

///MetricTarget defines the target value, average value, or average utilization of a
///specific metric
@JsonSerializable()
class ObjectTarget {
  ///averageUtilization is the target value of the average of the resource metric across all
  ///relevant pods, represented as a percentage of the requested value of the resource for the
  ///pods. Currently only valid for Resource metric source type
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;

  ///type represents whether the metric type is Utilization, Value, or AverageValue
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  dynamic value;

  ObjectTarget({
    this.averageUtilization,
    this.averageValue,
    required this.type,
    this.value,
  });

  factory ObjectTarget.fromJson(Map<String, dynamic> json) =>
      _$ObjectTargetFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectTargetToJson(this);
}

@JsonSerializable()
class MetricPods {
  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  TentacledMetric metric;

  ///MetricTarget defines the target value, average value, or average utilization of a
  ///specific metric
  @JsonKey(name: 'target')
  PodsTarget target;

  MetricPods({required this.metric, required this.target});

  factory MetricPods.fromJson(Map<String, dynamic> json) =>
      _$MetricPodsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricPodsToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class TentacledMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  TentacledSelector? selector;

  TentacledMetric({required this.name, this.selector});

  factory TentacledMetric.fromJson(Map<String, dynamic> json) =>
      _$TentacledMetricFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledMetricToJson(this);
}

@JsonSerializable()
class TentacledSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<TentacledMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledSelector({this.matchExpressions, this.matchLabels});

  factory TentacledSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledSelectorToJson(this);
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

///MetricTarget defines the target value, average value, or average utilization of a
///specific metric
@JsonSerializable()
class PodsTarget {
  ///averageUtilization is the target value of the average of the resource metric across all
  ///relevant pods, represented as a percentage of the requested value of the resource for the
  ///pods. Currently only valid for Resource metric source type
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;

  ///type represents whether the metric type is Utilization, Value, or AverageValue
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  dynamic value;

  PodsTarget({
    this.averageUtilization,
    this.averageValue,
    required this.type,
    this.value,
  });

  factory PodsTarget.fromJson(Map<String, dynamic> json) =>
      _$PodsTargetFromJson(json);

  Map<String, dynamic> toJson() => _$PodsTargetToJson(this);
}

@JsonSerializable()
class MetricResource {
  ///name is the name of the resource in question.
  @JsonKey(name: 'name')
  String name;

  ///MetricTarget defines the target value, average value, or average utilization of a
  ///specific metric
  @JsonKey(name: 'target')
  ResourceTarget target;

  MetricResource({required this.name, required this.target});

  factory MetricResource.fromJson(Map<String, dynamic> json) =>
      _$MetricResourceFromJson(json);

  Map<String, dynamic> toJson() => _$MetricResourceToJson(this);
}

///MetricTarget defines the target value, average value, or average utilization of a
///specific metric
@JsonSerializable()
class ResourceTarget {
  ///averageUtilization is the target value of the average of the resource metric across all
  ///relevant pods, represented as a percentage of the requested value of the resource for the
  ///pods. Currently only valid for Resource metric source type
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;

  ///type represents whether the metric type is Utilization, Value, or AverageValue
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'value')
  dynamic value;

  ResourceTarget({
    this.averageUtilization,
    this.averageValue,
    required this.type,
    this.value,
  });

  factory ResourceTarget.fromJson(Map<String, dynamic> json) =>
      _$ResourceTargetFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceTargetToJson(this);
}

///CrossVersionObjectReference contains enough information to let you identify the referred
///resource.
@JsonSerializable()
class ScaleTargetRef {
  ///apiVersion is the API version of the referent
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///kind is the kind of the referent; More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///name is the name of the referent; More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ScaleTargetRef({this.apiVersion, required this.kind, required this.name});

  factory ScaleTargetRef.fromJson(Map<String, dynamic> json) =>
      _$ScaleTargetRefFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleTargetRefToJson(this);
}

@JsonSerializable()
class Status {
  ///conditions is the set of conditions required for this autoscaler to scale its target, and
  ///indicates whether or not those conditions are met.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///currentMetrics is the last read state of the metrics used by this autoscaler.
  @JsonKey(name: 'currentMetrics')
  List<CurrentMetric?>? currentMetrics;

  ///currentReplicas is current number of replicas of pods managed by this autoscaler, as last
  ///seen by the autoscaler.
  @JsonKey(name: 'currentReplicas')
  int? currentReplicas;

  ///desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as
  ///last calculated by the autoscaler.
  @JsonKey(name: 'desiredReplicas')
  int desiredReplicas;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastScaleTime')
  DateTime? lastScaleTime;

  ///observedGeneration is the most recent generation observed by this autoscaler.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  Status({
    this.conditions,
    this.currentMetrics,
    this.currentReplicas,
    required this.desiredReplicas,
    this.lastScaleTime,
    this.observedGeneration,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///message is a human-readable explanation containing details about the transition
  @JsonKey(name: 'message')
  String? message;

  ///reason is the reason for the condition's last transition.
  @JsonKey(name: 'reason')
  String? reason;

  ///status is the status of the condition (True, False, Unknown)
  @JsonKey(name: 'status')
  String status;

  ///type describes the current condition
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastTransitionTime,
    this.message,
    this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class CurrentMetric {
  ///ContainerResourceMetricStatus indicates the current value of a resource metric known to
  ///Kubernetes, as specified in requests and limits, describing a single container in each
  ///pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to
  ///Kubernetes, and have special scaling options on top of those available to normal per-pod
  ///metrics using the "pods" source.
  @JsonKey(name: 'containerResource')
  CurrentMetricContainerResource? containerResource;

  ///ExternalMetricStatus indicates the current value of a global metric not associated with
  ///any Kubernetes object.
  @JsonKey(name: 'external')
  CurrentMetricExternal? currentMetricExternal;

  ///ObjectMetricStatus indicates the current value of a metric describing a kubernetes object
  ///(for example, hits-per-second on an Ingress object).
  @JsonKey(name: 'object')
  CurrentMetricObject? object;

  ///PodsMetricStatus indicates the current value of a metric describing each pod in the
  ///current scale target (for example, transactions-processed-per-second).
  @JsonKey(name: 'pods')
  CurrentMetricPods? pods;

  ///ResourceMetricStatus indicates the current value of a resource metric known to
  ///Kubernetes, as specified in requests and limits, describing each pod in the current scale
  ///target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special
  ///scaling options on top of those available to normal per-pod metrics using the "pods"
  ///source.
  @JsonKey(name: 'resource')
  CurrentMetricResource? resource;

  ///type is the type of metric source.  It will be one of "ContainerResource", "External",
  ///"Object", "Pods" or "Resource", each corresponds to a matching field in the object.
  @JsonKey(name: 'type')
  String type;

  CurrentMetric({
    this.containerResource,
    this.currentMetricExternal,
    this.object,
    this.pods,
    this.resource,
    required this.type,
  });

  factory CurrentMetric.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricToJson(this);
}

@JsonSerializable()
class CurrentMetricContainerResource {
  ///container is the name of the container in the pods of the scaling target
  @JsonKey(name: 'container')
  String container;

  ///MetricValueStatus holds the current value for a metric
  @JsonKey(name: 'current')
  ContainerResourceCurrent current;

  ///name is the name of the resource in question.
  @JsonKey(name: 'name')
  String name;

  CurrentMetricContainerResource({
    required this.container,
    required this.current,
    required this.name,
  });

  factory CurrentMetricContainerResource.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricContainerResourceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricContainerResourceToJson(this);
}

///MetricValueStatus holds the current value for a metric
@JsonSerializable()
class ContainerResourceCurrent {
  ///currentAverageUtilization is the current value of the average of the resource metric
  ///across all relevant pods, represented as a percentage of the requested value of the
  ///resource for the pods.
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;
  @JsonKey(name: 'value')
  dynamic value;

  ContainerResourceCurrent({
    this.averageUtilization,
    this.averageValue,
    this.value,
  });

  factory ContainerResourceCurrent.fromJson(Map<String, dynamic> json) =>
      _$ContainerResourceCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResourceCurrentToJson(this);
}

@JsonSerializable()
class CurrentMetricExternal {
  ///MetricValueStatus holds the current value for a metric
  @JsonKey(name: 'current')
  ExternalCurrent current;

  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  StickyMetric metric;

  CurrentMetricExternal({required this.current, required this.metric});

  factory CurrentMetricExternal.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricExternalFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricExternalToJson(this);
}

///MetricValueStatus holds the current value for a metric
@JsonSerializable()
class ExternalCurrent {
  ///currentAverageUtilization is the current value of the average of the resource metric
  ///across all relevant pods, represented as a percentage of the requested value of the
  ///resource for the pods.
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;
  @JsonKey(name: 'value')
  dynamic value;

  ExternalCurrent({this.averageUtilization, this.averageValue, this.value});

  factory ExternalCurrent.fromJson(Map<String, dynamic> json) =>
      _$ExternalCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalCurrentToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class StickyMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  StickySelector? selector;

  StickyMetric({required this.name, this.selector});

  factory StickyMetric.fromJson(Map<String, dynamic> json) =>
      _$StickyMetricFromJson(json);

  Map<String, dynamic> toJson() => _$StickyMetricToJson(this);
}

@JsonSerializable()
class StickySelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<StickyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickySelector({this.matchExpressions, this.matchLabels});

  factory StickySelector.fromJson(Map<String, dynamic> json) =>
      _$StickySelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickySelectorToJson(this);
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
class CurrentMetricObject {
  ///MetricValueStatus holds the current value for a metric
  @JsonKey(name: 'current')
  ObjectCurrent current;

  ///CrossVersionObjectReference contains enough information to let you identify the referred
  ///resource.
  @JsonKey(name: 'describedObject')
  FluffyDescribedObject describedObject;

  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  IndigoMetric metric;

  CurrentMetricObject({
    required this.current,
    required this.describedObject,
    required this.metric,
  });

  factory CurrentMetricObject.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricObjectToJson(this);
}

///MetricValueStatus holds the current value for a metric
@JsonSerializable()
class ObjectCurrent {
  ///currentAverageUtilization is the current value of the average of the resource metric
  ///across all relevant pods, represented as a percentage of the requested value of the
  ///resource for the pods.
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;
  @JsonKey(name: 'value')
  dynamic value;

  ObjectCurrent({this.averageUtilization, this.averageValue, this.value});

  factory ObjectCurrent.fromJson(Map<String, dynamic> json) =>
      _$ObjectCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectCurrentToJson(this);
}

///CrossVersionObjectReference contains enough information to let you identify the referred
///resource.
@JsonSerializable()
class FluffyDescribedObject {
  ///apiVersion is the API version of the referent
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///kind is the kind of the referent; More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///name is the name of the referent; More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  FluffyDescribedObject({
    this.apiVersion,
    required this.kind,
    required this.name,
  });

  factory FluffyDescribedObject.fromJson(Map<String, dynamic> json) =>
      _$FluffyDescribedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyDescribedObjectToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class IndigoMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  IndigoSelector? selector;

  IndigoMetric({required this.name, this.selector});

  factory IndigoMetric.fromJson(Map<String, dynamic> json) =>
      _$IndigoMetricFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoMetricToJson(this);
}

@JsonSerializable()
class IndigoSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndigoMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndigoSelector({this.matchExpressions, this.matchLabels});

  factory IndigoSelector.fromJson(Map<String, dynamic> json) =>
      _$IndigoSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoSelectorToJson(this);
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
class CurrentMetricPods {
  ///MetricValueStatus holds the current value for a metric
  @JsonKey(name: 'current')
  PodsCurrent current;

  ///MetricIdentifier defines the name and optionally selector for a metric
  @JsonKey(name: 'metric')
  IndecentMetric metric;

  CurrentMetricPods({required this.current, required this.metric});

  factory CurrentMetricPods.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricPodsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricPodsToJson(this);
}

///MetricValueStatus holds the current value for a metric
@JsonSerializable()
class PodsCurrent {
  ///currentAverageUtilization is the current value of the average of the resource metric
  ///across all relevant pods, represented as a percentage of the requested value of the
  ///resource for the pods.
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;
  @JsonKey(name: 'value')
  dynamic value;

  PodsCurrent({this.averageUtilization, this.averageValue, this.value});

  factory PodsCurrent.fromJson(Map<String, dynamic> json) =>
      _$PodsCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$PodsCurrentToJson(this);
}

///MetricIdentifier defines the name and optionally selector for a metric
@JsonSerializable()
class IndecentMetric {
  ///name is the name of the given metric
  @JsonKey(name: 'name')
  String name;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  IndecentSelector? selector;

  IndecentMetric({required this.name, this.selector});

  factory IndecentMetric.fromJson(Map<String, dynamic> json) =>
      _$IndecentMetricFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentMetricToJson(this);
}

@JsonSerializable()
class IndecentSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndecentMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndecentSelector({this.matchExpressions, this.matchLabels});

  factory IndecentSelector.fromJson(Map<String, dynamic> json) =>
      _$IndecentSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentSelectorToJson(this);
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
class CurrentMetricResource {
  ///MetricValueStatus holds the current value for a metric
  @JsonKey(name: 'current')
  ResourceCurrent current;

  ///name is the name of the resource in question.
  @JsonKey(name: 'name')
  String name;

  CurrentMetricResource({required this.current, required this.name});

  factory CurrentMetricResource.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricResourceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricResourceToJson(this);
}

///MetricValueStatus holds the current value for a metric
@JsonSerializable()
class ResourceCurrent {
  ///currentAverageUtilization is the current value of the average of the resource metric
  ///across all relevant pods, represented as a percentage of the requested value of the
  ///resource for the pods.
  @JsonKey(name: 'averageUtilization')
  int? averageUtilization;
  @JsonKey(name: 'averageValue')
  dynamic averageValue;
  @JsonKey(name: 'value')
  dynamic value;

  ResourceCurrent({this.averageUtilization, this.averageValue, this.value});

  factory ResourceCurrent.fromJson(Map<String, dynamic> json) =>
      _$ResourceCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceCurrentToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum HorizontalpodautoscalerlistAutoscalingV2Kind {
  @JsonValue('HorizontalPodAutoscalerList')
  HORIZONTAL_POD_AUTOSCALER_LIST,
}

final horizontalpodautoscalerlistAutoscalingV2KindValues = EnumValues({
  'HorizontalPodAutoscalerList': HorizontalpodautoscalerlistAutoscalingV2Kind
      .HORIZONTAL_POD_AUTOSCALER_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class HorizontalpodautoscalerlistAutoscalingV2Metadata {
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

  HorizontalpodautoscalerlistAutoscalingV2Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory HorizontalpodautoscalerlistAutoscalingV2Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$HorizontalpodautoscalerlistAutoscalingV2MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HorizontalpodautoscalerlistAutoscalingV2MetadataToJson(this);
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
