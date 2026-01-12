import 'package:json_annotation/json_annotation.dart';

part 'servicelist_v1.g.dart';

///ServiceList holds a list of services.
@JsonSerializable()
class ServicelistV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of services
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ServicelistV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ServicelistV1Metadata? metadata;

  ServicelistV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ServicelistV1.fromJson(Map<String, dynamic> json) =>
      _$ServicelistV1FromJson(json);

  Map<String, dynamic> toJson() => _$ServicelistV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('v1')
  V1,
}

final apiVersionValues = EnumValues({'v1': ApiVersion.V1});

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

  ///ServiceSpec describes the attributes that a user creates on a service.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///ServiceStatus represents the current status of a service.
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
  @JsonValue('Service')
  SERVICE,
}

final itemKindValues = EnumValues({'Service': ItemKind.SERVICE});

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
  ///allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for
  ///services with type LoadBalancer.  Default is "true". It may be set to "false" if the
  ///cluster load-balancer does not rely on NodePorts.  If the caller requests specific
  ///NodePorts (by specifying a value), those requests will be respected, regardless of this
  ///field. This field may only be set for services with type LoadBalancer and will be cleared
  ///if the type is changed to any other type.
  @JsonKey(name: 'allocateLoadBalancerNodePorts')
  bool? allocateLoadBalancerNodePorts;

  ///clusterIP is the IP address of the service and is usually assigned randomly. If an
  ///address is specified manually, is in-range (as per system configuration), and is not in
  ///use, it will be allocated to the service; otherwise creation of the service will fail.
  ///This field may not be changed through updates unless the type field is also being changed
  ///to ExternalName (which requires this field to be blank) or the type field is being
  ///changed from ExternalName (in which case this field may optionally be specified, as
  ///describe above).  Valid values are "None", empty string (""), or a valid IP address.
  ///Setting this to "None" makes a "headless service" (no virtual IP), which is useful when
  ///direct endpoint connections are preferred and proxying is not required.  Only applies to
  ///types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a
  ///Service of type ExternalName, creation will fail. This field will be wiped when updating
  ///a Service to type ExternalName. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  @JsonKey(name: 'clusterIP')
  String? clusterIp;

  ///ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned
  ///randomly.  If an address is specified manually, is in-range (as per system
  ///configuration), and is not in use, it will be allocated to the service; otherwise
  ///creation of the service will fail. This field may not be changed through updates unless
  ///the type field is also being changed to ExternalName (which requires this field to be
  ///empty) or the type field is being changed from ExternalName (in which case this field may
  ///optionally be specified, as describe above).  Valid values are "None", empty string (""),
  ///or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual
  ///IP), which is useful when direct endpoint connections are preferred and proxying is not
  ///required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is
  ///specified when creating a Service of type ExternalName, creation will fail. This field
  ///will be wiped when updating a Service to type ExternalName.  If this field is not
  ///specified, it will be initialized from the clusterIP field.  If this field is specified,
  ///clients must ensure that clusterIPs[0] and clusterIP have the same value.
  ///
  ///This field may hold a maximum of two entries (dual-stack IPs, in either order). These IPs
  ///must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are
  ///governed by the ipFamilyPolicy field. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  @JsonKey(name: 'clusterIPs')
  List<String?>? clusterIPs;

  ///externalIPs is a list of IP addresses for which nodes in the cluster will also accept
  ///traffic for this service.  These IPs are not managed by Kubernetes.  The user is
  ///responsible for ensuring that traffic arrives at a node with this IP.  A common example
  ///is external load-balancers that are not part of the Kubernetes system.
  @JsonKey(name: 'externalIPs')
  List<String?>? externalIPs;

  ///externalName is the external reference that discovery mechanisms will return as an alias
  ///for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a
  ///lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to
  ///be "ExternalName".
  @JsonKey(name: 'externalName')
  String? externalName;

  ///externalTrafficPolicy describes how nodes distribute service traffic they receive on one
  ///of the Service's "externally-facing" addresses (NodePorts, ExternalIPs, and LoadBalancer
  ///IPs). If set to "Local", the proxy will configure the service in a way that assumes that
  ///external load balancers will take care of balancing the service traffic between nodes,
  ///and so each node will deliver traffic only to the node-local endpoints of the service,
  ///without masquerading the client source IP. (Traffic mistakenly sent to a node with no
  ///endpoints will be dropped.) The default value, "Cluster", uses the standard behavior of
  ///routing to all endpoints evenly (possibly modified by topology and other features). Note
  ///that traffic sent to an External IP or LoadBalancer IP from within the cluster will
  ///always get "Cluster" semantics, but clients sending to a NodePort from within the cluster
  ///may need to take traffic policy into account when picking a node.
  ///
  ///Possible enum values:
  ///- `"Cluster"` routes traffic to all endpoints.
  ///- `"Local"` preserves the source IP of the traffic by routing only to endpoints on the
  ///same node as the traffic was received on (dropping the traffic if there are no local
  ///endpoints).
  @JsonKey(name: 'externalTrafficPolicy')
  TernalTrafficPolicy? externalTrafficPolicy;

  ///healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies
  ///when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is
  ///specified, is in-range, and is not in use, it will be used.  If not specified, a value
  ///will be automatically allocated.  External systems (e.g. load-balancers) can use this
  ///port to determine if a given node holds endpoints for this service or not.  If this field
  ///is specified when creating a Service which does not need it, creation will fail. This
  ///field will be wiped when updating a Service to no longer need it (e.g. changing type).
  ///This field cannot be updated once set.
  @JsonKey(name: 'healthCheckNodePort')
  int? healthCheckNodePort;

  ///InternalTrafficPolicy describes how nodes distribute service traffic they receive on the
  ///ClusterIP. If set to "Local", the proxy will assume that pods only want to talk to
  ///endpoints of the service on the same node as the pod, dropping the traffic if there are
  ///no local endpoints. The default value, "Cluster", uses the standard behavior of routing
  ///to all endpoints evenly (possibly modified by topology and other features).
  ///
  ///Possible enum values:
  ///- `"Cluster"` routes traffic to all endpoints.
  ///- `"Local"` routes traffic only to endpoints on the same node as the client pod (dropping
  ///the traffic if there are no local endpoints).
  @JsonKey(name: 'internalTrafficPolicy')
  TernalTrafficPolicy? internalTrafficPolicy;

  ///IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service. This
  ///field is usually assigned automatically based on cluster configuration and the
  ///ipFamilyPolicy field. If this field is specified manually, the requested family is
  ///available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise
  ///creation of the service will fail. This field is conditionally mutable: it allows for
  ///adding or removing a secondary IP family, but it does not allow changing the primary IP
  ///family of the Service. Valid values are "IPv4" and "IPv6".  This field only applies to
  ///Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless"
  ///services. This field will be wiped when updating a Service to type ExternalName.
  ///
  ///This field may hold a maximum of two entries (dual-stack families, in either order).
  ///These families must correspond to the values of the clusterIPs field, if specified. Both
  ///clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.
  @JsonKey(name: 'ipFamilies')
  List<IpFamily>? ipFamilies;

  ///IPFamilyPolicy represents the dual-stack-ness requested or required by this Service. If
  ///there is no value provided, then this field will be set to SingleStack. Services can be
  ///"SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack
  ///configured clusters or a single IP family on single-stack clusters), or
  ///"RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail).
  ///The ipFamilies and clusterIPs fields depend on the value of this field. This field will
  ///be wiped when updating a service to type ExternalName.
  ///
  ///Possible enum values:
  ///- `"PreferDualStack"` indicates that this service prefers dual-stack when the cluster is
  ///configured for dual-stack. If the cluster is not configured for dual-stack the service
  ///will be assigned a single IPFamily. If the IPFamily is not set in service.spec.ipFamilies
  ///then the service will be assigned the default IPFamily configured on the cluster
  ///- `"RequireDualStack"` indicates that this service requires dual-stack. Using
  ///IPFamilyPolicyRequireDualStack on a single stack cluster will result in validation
  ///errors. The IPFamilies (and their order) assigned to this service is based on
  ///service.spec.ipFamilies. If service.spec.ipFamilies was not provided then it will be
  ///assigned according to how they are configured on the cluster. If service.spec.ipFamilies
  ///has only one entry then the alternative IPFamily will be added by apiserver
  ///- `"SingleStack"` indicates that this service is required to have a single IPFamily. The
  ///IPFamily assigned is based on the default IPFamily used by the cluster or as identified
  ///by service.spec.ipFamilies field
  @JsonKey(name: 'ipFamilyPolicy')
  IpFamilyPolicy? ipFamilyPolicy;

  ///loadBalancerClass is the class of the load balancer implementation this Service belongs
  ///to. If specified, the value of this field must be a label-style identifier, with an
  ///optional prefix, e.g. "internal-vip" or "example.com/internal-vip". Unprefixed names are
  ///reserved for end-users. This field can only be set when the Service type is
  ///'LoadBalancer'. If not set, the default load balancer implementation is used, today this
  ///is typically done through the cloud provider integration, but should apply for any
  ///default implementation. If set, it is assumed that a load balancer implementation is
  ///watching for Services with a matching class. Any default load balancer implementation
  ///(e.g. cloud providers) should ignore Services that set this field. This field can only be
  ///set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be
  ///changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.
  @JsonKey(name: 'loadBalancerClass')
  String? loadBalancerClass;

  ///Only applies to Service Type: LoadBalancer. This feature depends on whether the
  ///underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is
  ///created. This field will be ignored if the cloud-provider does not support the feature.
  ///Deprecated: This field was under-specified and its meaning varies across implementations.
  ///Using it is non-portable and it may not support dual-stack. Users are encouraged to use
  ///implementation-specific annotations when available.
  @JsonKey(name: 'loadBalancerIP')
  String? loadBalancerIp;

  ///If specified and supported by the platform, this will restrict traffic through the
  ///cloud-provider load-balancer will be restricted to the specified client IPs. This field
  ///will be ignored if the cloud-provider does not support the feature." More info:
  ///https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/
  @JsonKey(name: 'loadBalancerSourceRanges')
  List<String?>? loadBalancerSourceRanges;

  ///The list of ports that are exposed by this service. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  @JsonKey(name: 'ports')
  List<SpecPort?>? ports;

  ///publishNotReadyAddresses indicates that any agent which deals with endpoints for this
  ///Service should disregard any indications of ready/not-ready. The primary use case for
  ///setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records
  ///for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate
  ///Endpoints and EndpointSlice resources for Services interpret this to mean that all
  ///endpoints are considered "ready" even if the Pods themselves are not. Agents which
  ///consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice
  ///resources can safely assume this behavior.
  @JsonKey(name: 'publishNotReadyAddresses')
  bool? publishNotReadyAddresses;

  ///Route service traffic to pods with label keys and values matching this selector. If empty
  ///or not present, the service is assumed to have an external process managing its
  ///endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort,
  ///and LoadBalancer. Ignored if type is ExternalName. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/
  @JsonKey(name: 'selector')
  Map<String, String?>? selector;

  ///Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based
  ///session affinity. Must be ClientIP or None. Defaults to None. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  ///
  ///Possible enum values:
  ///- `"ClientIP"` is the Client IP based.
  ///- `"None"` - no session affinity.
  @JsonKey(name: 'sessionAffinity')
  SessionAffinity? sessionAffinity;

  ///SessionAffinityConfig represents the configurations of session affinity.
  @JsonKey(name: 'sessionAffinityConfig')
  SessionAffinityConfig? sessionAffinityConfig;

  ///TrafficDistribution offers a way to express preferences for how traffic is distributed to
  ///Service endpoints. Implementations can use this field as a hint, but are not required to
  ///guarantee strict adherence. If the field is not set, the implementation will apply its
  ///default routing strategy. If set to "PreferClose", implementations should prioritize
  ///endpoints that are in the same zone.
  @JsonKey(name: 'trafficDistribution')
  String? trafficDistribution;

  ///type determines how the Service is exposed. Defaults to ClusterIP. Valid options are
  ///ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a
  ///cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by
  ///the selector or if that is not specified, by manual construction of an Endpoints object
  ///or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the
  ///endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds
  ///on ClusterIP and allocates a port on every node which routes to the same endpoints as the
  ///clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if
  ///supported in the current cloud) which routes to the same endpoints as the clusterIP.
  ///"ExternalName" aliases this service to the specified externalName. Several other fields
  ///do not apply to ExternalName services. More info:
  ///https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types
  ///
  ///Possible enum values:
  ///- `"ClusterIP"` means a service will only be accessible inside the cluster, via the
  ///cluster IP.
  ///- `"ExternalName"` means a service consists of only a reference to an external name that
  ///kubedns or equivalent will return as a CNAME record, with no exposing or proxying of any
  ///pods involved.
  ///- `"LoadBalancer"` means a service will be exposed via an external load balancer (if the
  ///cloud provider supports it), in addition to 'NodePort' type.
  ///- `"NodePort"` means a service will be exposed on one port of every node, in addition to
  ///'ClusterIP' type.
  @JsonKey(name: 'type')
  Type? type;

  Spec({
    this.allocateLoadBalancerNodePorts,
    this.clusterIp,
    this.clusterIPs,
    this.externalIPs,
    this.externalName,
    this.externalTrafficPolicy,
    this.healthCheckNodePort,
    this.internalTrafficPolicy,
    this.ipFamilies,
    this.ipFamilyPolicy,
    this.loadBalancerClass,
    this.loadBalancerIp,
    this.loadBalancerSourceRanges,
    this.ports,
    this.publishNotReadyAddresses,
    this.selector,
    this.sessionAffinity,
    this.sessionAffinityConfig,
    this.trafficDistribution,
    this.type,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

///externalTrafficPolicy describes how nodes distribute service traffic they receive on one
///of the Service's "externally-facing" addresses (NodePorts, ExternalIPs, and LoadBalancer
///IPs). If set to "Local", the proxy will configure the service in a way that assumes that
///external load balancers will take care of balancing the service traffic between nodes,
///and so each node will deliver traffic only to the node-local endpoints of the service,
///without masquerading the client source IP. (Traffic mistakenly sent to a node with no
///endpoints will be dropped.) The default value, "Cluster", uses the standard behavior of
///routing to all endpoints evenly (possibly modified by topology and other features). Note
///that traffic sent to an External IP or LoadBalancer IP from within the cluster will
///always get "Cluster" semantics, but clients sending to a NodePort from within the cluster
///may need to take traffic policy into account when picking a node.
///
///Possible enum values:
///- `"Cluster"` routes traffic to all endpoints.
///- `"Local"` preserves the source IP of the traffic by routing only to endpoints on the
///same node as the traffic was received on (dropping the traffic if there are no local
///endpoints).
///
///InternalTrafficPolicy describes how nodes distribute service traffic they receive on the
///ClusterIP. If set to "Local", the proxy will assume that pods only want to talk to
///endpoints of the service on the same node as the pod, dropping the traffic if there are
///no local endpoints. The default value, "Cluster", uses the standard behavior of routing
///to all endpoints evenly (possibly modified by topology and other features).
///
///Possible enum values:
///- `"Cluster"` routes traffic to all endpoints.
///- `"Local"` routes traffic only to endpoints on the same node as the client pod (dropping
///the traffic if there are no local endpoints).
enum TernalTrafficPolicy {
  @JsonValue('Cluster')
  CLUSTER,
  @JsonValue('Local')
  LOCAL,
}

final ternalTrafficPolicyValues = EnumValues({
  'Cluster': TernalTrafficPolicy.CLUSTER,
  'Local': TernalTrafficPolicy.LOCAL,
});

enum IpFamily {
  @JsonValue('')
  EMPTY,
  @JsonValue('IPv4')
  I_PV4,
  @JsonValue('IPv6')
  I_PV6,
}

final ipFamilyValues = EnumValues({
  '': IpFamily.EMPTY,
  'IPv4': IpFamily.I_PV4,
  'IPv6': IpFamily.I_PV6,
});

///IPFamilyPolicy represents the dual-stack-ness requested or required by this Service. If
///there is no value provided, then this field will be set to SingleStack. Services can be
///"SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack
///configured clusters or a single IP family on single-stack clusters), or
///"RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail).
///The ipFamilies and clusterIPs fields depend on the value of this field. This field will
///be wiped when updating a service to type ExternalName.
///
///Possible enum values:
///- `"PreferDualStack"` indicates that this service prefers dual-stack when the cluster is
///configured for dual-stack. If the cluster is not configured for dual-stack the service
///will be assigned a single IPFamily. If the IPFamily is not set in service.spec.ipFamilies
///then the service will be assigned the default IPFamily configured on the cluster
///- `"RequireDualStack"` indicates that this service requires dual-stack. Using
///IPFamilyPolicyRequireDualStack on a single stack cluster will result in validation
///errors. The IPFamilies (and their order) assigned to this service is based on
///service.spec.ipFamilies. If service.spec.ipFamilies was not provided then it will be
///assigned according to how they are configured on the cluster. If service.spec.ipFamilies
///has only one entry then the alternative IPFamily will be added by apiserver
///- `"SingleStack"` indicates that this service is required to have a single IPFamily. The
///IPFamily assigned is based on the default IPFamily used by the cluster or as identified
///by service.spec.ipFamilies field
enum IpFamilyPolicy {
  @JsonValue('PreferDualStack')
  PREFER_DUAL_STACK,
  @JsonValue('RequireDualStack')
  REQUIRE_DUAL_STACK,
  @JsonValue('SingleStack')
  SINGLE_STACK,
}

final ipFamilyPolicyValues = EnumValues({
  'PreferDualStack': IpFamilyPolicy.PREFER_DUAL_STACK,
  'RequireDualStack': IpFamilyPolicy.REQUIRE_DUAL_STACK,
  'SingleStack': IpFamilyPolicy.SINGLE_STACK,
});

@JsonSerializable()
class SpecPort {
  ///The application protocol for this port. This is used as a hint for implementations to
  ///offer richer behavior for protocols that they understand. This field follows standard
  ///Kubernetes label syntax. Valid values are either:
  ///
  ///* Un-prefixed protocol names - reserved for IANA standard service names (as per RFC-6335
  ///and https://www.iana.org/assignments/service-names).
  ///
  ///* Kubernetes-defined prefixed names:
  ///* 'kubernetes.io/h2c' - HTTP/2 prior knowledge over cleartext as described in
  ///https://www.rfc-editor.org/rfc/rfc9113.html#name-starting-http-2-with-prior-
  ///* 'kubernetes.io/ws'  - WebSocket over cleartext as described in
  ///https://www.rfc-editor.org/rfc/rfc6455
  ///* 'kubernetes.io/wss' - WebSocket over TLS as described in
  ///https://www.rfc-editor.org/rfc/rfc6455
  ///
  ///* Other protocols should use implementation-defined prefixed names such as
  ///mycompany.com/my-custom-protocol.
  @JsonKey(name: 'appProtocol')
  String? appProtocol;

  ///The name of this port within the service. This must be a DNS_LABEL. All ports within a
  ///ServiceSpec must have unique names. When considering the endpoints for a Service, this
  ///must match the 'name' field in the EndpointPort. Optional if only one ServicePort is
  ///defined on this service.
  @JsonKey(name: 'name')
  String? name;

  ///The port on each node on which this service is exposed when type is NodePort or
  ///LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not
  ///in use it will be used, otherwise the operation will fail.  If not specified, a port will
  ///be allocated if this Service requires one.  If this field is specified when creating a
  ///Service which does not need it, creation will fail. This field will be wiped when
  ///updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP).
  ///More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
  @JsonKey(name: 'nodePort')
  int? nodePort;

  ///The port that will be exposed by this service.
  @JsonKey(name: 'port')
  int port;

  ///The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;
  @JsonKey(name: 'targetPort')
  dynamic targetPort;

  SpecPort({
    this.appProtocol,
    this.name,
    this.nodePort,
    required this.port,
    this.protocol,
    this.targetPort,
  });

  factory SpecPort.fromJson(Map<String, dynamic> json) =>
      _$SpecPortFromJson(json);

  Map<String, dynamic> toJson() => _$SpecPortToJson(this);
}

///The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.
///
///Possible enum values:
///- `"SCTP"` is the SCTP protocol.
///- `"TCP"` is the TCP protocol.
///- `"UDP"` is the UDP protocol.
///
///Protocol is the protocol of the service port of which status is recorded here The
///supported values are: "TCP", "UDP", "SCTP"
///
///Possible enum values:
///- `"SCTP"` is the SCTP protocol.
///- `"TCP"` is the TCP protocol.
///- `"UDP"` is the UDP protocol.
enum Protocol {
  @JsonValue('SCTP')
  SCTP,
  @JsonValue('TCP')
  TCP,
  @JsonValue('UDP')
  UDP,
}

final protocolValues = EnumValues({
  'SCTP': Protocol.SCTP,
  'TCP': Protocol.TCP,
  'UDP': Protocol.UDP,
});

///Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based
///session affinity. Must be ClientIP or None. Defaults to None. More info:
///https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
///
///Possible enum values:
///- `"ClientIP"` is the Client IP based.
///- `"None"` - no session affinity.
enum SessionAffinity {
  @JsonValue('ClientIP')
  CLIENT_IP,
  @JsonValue('None')
  NONE,
}

final sessionAffinityValues = EnumValues({
  'ClientIP': SessionAffinity.CLIENT_IP,
  'None': SessionAffinity.NONE,
});

@JsonSerializable()
class SessionAffinityConfig {
  ///ClientIPConfig represents the configurations of Client IP based session affinity.
  @JsonKey(name: 'clientIP')
  ClientIp? clientIp;

  SessionAffinityConfig({this.clientIp});

  factory SessionAffinityConfig.fromJson(Map<String, dynamic> json) =>
      _$SessionAffinityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SessionAffinityConfigToJson(this);
}

@JsonSerializable()
class ClientIp {
  ///timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must
  ///be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for
  ///3 hours).
  @JsonKey(name: 'timeoutSeconds')
  int? timeoutSeconds;

  ClientIp({this.timeoutSeconds});

  factory ClientIp.fromJson(Map<String, dynamic> json) =>
      _$ClientIpFromJson(json);

  Map<String, dynamic> toJson() => _$ClientIpToJson(this);
}

///type determines how the Service is exposed. Defaults to ClusterIP. Valid options are
///ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a
///cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by
///the selector or if that is not specified, by manual construction of an Endpoints object
///or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the
///endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds
///on ClusterIP and allocates a port on every node which routes to the same endpoints as the
///clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if
///supported in the current cloud) which routes to the same endpoints as the clusterIP.
///"ExternalName" aliases this service to the specified externalName. Several other fields
///do not apply to ExternalName services. More info:
///https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types
///
///Possible enum values:
///- `"ClusterIP"` means a service will only be accessible inside the cluster, via the
///cluster IP.
///- `"ExternalName"` means a service consists of only a reference to an external name that
///kubedns or equivalent will return as a CNAME record, with no exposing or proxying of any
///pods involved.
///- `"LoadBalancer"` means a service will be exposed via an external load balancer (if the
///cloud provider supports it), in addition to 'NodePort' type.
///- `"NodePort"` means a service will be exposed on one port of every node, in addition to
///'ClusterIP' type.
enum Type {
  @JsonValue('ClusterIP')
  CLUSTER_IP,
  @JsonValue('ExternalName')
  EXTERNAL_NAME,
  @JsonValue('LoadBalancer')
  LOAD_BALANCER,
  @JsonValue('NodePort')
  NODE_PORT,
}

final typeValues = EnumValues({
  'ClusterIP': Type.CLUSTER_IP,
  'ExternalName': Type.EXTERNAL_NAME,
  'LoadBalancer': Type.LOAD_BALANCER,
  'NodePort': Type.NODE_PORT,
});

@JsonSerializable()
class Status {
  ///Current service state
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///LoadBalancerStatus represents the status of a load-balancer.
  @JsonKey(name: 'loadBalancer')
  LoadBalancer? loadBalancer;

  Status({this.conditions, this.loadBalancer});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime lastTransitionTime;

  ///message is a human readable message indicating details about the transition. This may be
  ///an empty string.
  @JsonKey(name: 'message')
  String message;

  ///observedGeneration represents the .metadata.generation that the condition was set based
  ///upon. For instance, if .metadata.generation is currently 12, but the
  ///.status.conditions[x].observedGeneration is 9, the condition is out of date with respect
  ///to the current state of the instance.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///reason contains a programmatic identifier indicating the reason for the condition's last
  ///transition. Producers of specific condition types may define expected values and meanings
  ///for this field, and whether the values are considered a guaranteed API. The value should
  ///be a CamelCase string. This field may not be empty.
  @JsonKey(name: 'reason')
  String reason;

  ///status of the condition, one of True, False, Unknown.
  @JsonKey(name: 'status')
  String status;

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

@JsonSerializable()
class LoadBalancer {
  ///Ingress is a list containing ingress points for the load-balancer. Traffic intended for
  ///the service should be sent to these ingress points.
  @JsonKey(name: 'ingress')
  List<Ingress?>? ingress;

  LoadBalancer({this.ingress});

  factory LoadBalancer.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerFromJson(json);

  Map<String, dynamic> toJson() => _$LoadBalancerToJson(this);
}

@JsonSerializable()
class Ingress {
  ///Hostname is set for load-balancer ingress points that are DNS based (typically AWS
  ///load-balancers)
  @JsonKey(name: 'hostname')
  String? hostname;

  ///IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack
  ///load-balancers)
  @JsonKey(name: 'ip')
  String? ip;

  ///IPMode specifies how the load-balancer IP behaves, and may only be specified when the ip
  ///field is specified. Setting this to "VIP" indicates that traffic is delivered to the node
  ///with the destination set to the load-balancer's IP and port. Setting this to "Proxy"
  ///indicates that traffic is delivered to the node or pod with the destination set to the
  ///node's IP and node port or the pod's IP and port. Service implementations may use this
  ///information to adjust traffic routing.
  @JsonKey(name: 'ipMode')
  String? ipMode;

  ///Ports is a list of records of service ports If used, every port defined in the service
  ///should have an entry in it
  @JsonKey(name: 'ports')
  List<IngressPort?>? ports;

  Ingress({this.hostname, this.ip, this.ipMode, this.ports});

  factory Ingress.fromJson(Map<String, dynamic> json) =>
      _$IngressFromJson(json);

  Map<String, dynamic> toJson() => _$IngressToJson(this);
}

@JsonSerializable()
class IngressPort {
  ///Error is to record the problem with the service port The format of the error shall comply
  ///with the following rules: - built-in error values shall be specified in this file and
  ///those shall use
  ///CamelCase names
  ///- cloud provider specific error values must have names that comply with the
  ///format foo.example.com/CamelCase.
  @JsonKey(name: 'error')
  String? error;

  ///Port is the port number of the service port of which status is recorded here
  @JsonKey(name: 'port')
  int port;

  ///Protocol is the protocol of the service port of which status is recorded here The
  ///supported values are: "TCP", "UDP", "SCTP"
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol protocol;

  IngressPort({this.error, required this.port, required this.protocol});

  factory IngressPort.fromJson(Map<String, dynamic> json) =>
      _$IngressPortFromJson(json);

  Map<String, dynamic> toJson() => _$IngressPortToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ServicelistV1Kind {
  @JsonValue('ServiceList')
  SERVICE_LIST,
}

final servicelistV1KindValues = EnumValues({
  'ServiceList': ServicelistV1Kind.SERVICE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ServicelistV1Metadata {
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

  ServicelistV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ServicelistV1Metadata.fromJson(Map<String, dynamic> json) =>
      _$ServicelistV1MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ServicelistV1MetadataToJson(this);
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
