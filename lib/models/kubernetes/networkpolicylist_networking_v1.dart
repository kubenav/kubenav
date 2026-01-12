import 'package:json_annotation/json_annotation.dart';

part 'networkpolicylist_networking_v1.g.dart';

///NetworkPolicyList is a list of NetworkPolicy objects.
@JsonSerializable()
class NetworkpolicylistNetworkingV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///items is a list of schema objects.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  NetworkpolicylistNetworkingV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  NetworkpolicylistNetworkingV1Metadata? metadata;

  NetworkpolicylistNetworkingV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory NetworkpolicylistNetworkingV1.fromJson(Map<String, dynamic> json) =>
      _$NetworkpolicylistNetworkingV1FromJson(json);

  Map<String, dynamic> toJson() => _$NetworkpolicylistNetworkingV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('networking.k8s.io/v1')
  NETWORKING_K8_S_IO_V1,
}

final apiVersionValues = EnumValues({
  'networking.k8s.io/v1': ApiVersion.NETWORKING_K8_S_IO_V1,
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

  ///NetworkPolicySpec provides the specification of a NetworkPolicy
  @JsonKey(name: 'spec')
  Spec? spec;

  Item({this.apiVersion, this.kind, this.metadata, this.spec});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('NetworkPolicy')
  NETWORK_POLICY,
}

final itemKindValues = EnumValues({'NetworkPolicy': ItemKind.NETWORK_POLICY});

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
  ///egress is a list of egress rules to be applied to the selected pods. Outgoing traffic is
  ///allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise
  ///allows the traffic), OR if the traffic matches at least one egress rule across all of the
  ///NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this
  ///NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it
  ///selects are isolated by default). This field is beta-level in 1.8
  @JsonKey(name: 'egress')
  List<Egress?>? egress;

  ///ingress is a list of ingress rules to be applied to the selected pods. Traffic is allowed
  ///to a pod if there are no NetworkPolicies selecting the pod (and cluster policy otherwise
  ///allows the traffic), OR if the traffic source is the pod's local node, OR if the traffic
  ///matches at least one ingress rule across all of the NetworkPolicy objects whose
  ///podSelector matches the pod. If this field is empty then this NetworkPolicy does not
  ///allow any traffic (and serves solely to ensure that the pods it selects are isolated by
  ///default)
  @JsonKey(name: 'ingress')
  List<Ingress?>? ingress;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'podSelector')
  SpecPodSelector? podSelector;

  ///policyTypes is a list of rule types that the NetworkPolicy relates to. Valid options are
  ///["Ingress"], ["Egress"], or ["Ingress", "Egress"]. If this field is not specified, it
  ///will default based on the existence of ingress or egress rules; policies that contain an
  ///egress section are assumed to affect egress, and all policies (whether or not they
  ///contain an ingress section) are assumed to affect ingress. If you want to write an
  ///egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if
  ///you want to write a policy that specifies that no egress is allowed, you must specify a
  ///policyTypes value that include "Egress" (since such a policy would not include an egress
  ///section and would otherwise default to just [ "Ingress" ]). This field is beta-level in
  ///1.8
  @JsonKey(name: 'policyTypes')
  List<PolicyType>? policyTypes;

  Spec({this.egress, this.ingress, this.podSelector, this.policyTypes});

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class Egress {
  ///ports is a list of destination ports for outgoing traffic. Each item in this list is
  ///combined using a logical OR. If this field is empty or missing, this rule matches all
  ///ports (traffic not restricted by port). If this field is present and contains at least
  ///one item, then this rule allows traffic only if the traffic matches at least one port in
  ///the list.
  @JsonKey(name: 'ports')
  List<EgressPort?>? ports;

  ///to is a list of destinations for outgoing traffic of pods selected for this rule. Items
  ///in this list are combined using a logical OR operation. If this field is empty or
  ///missing, this rule matches all destinations (traffic not restricted by destination). If
  ///this field is present and contains at least one item, this rule allows traffic only if
  ///the traffic matches at least one item in the to list.
  @JsonKey(name: 'to')
  List<To?>? to;

  Egress({this.ports, this.to});

  factory Egress.fromJson(Map<String, dynamic> json) => _$EgressFromJson(json);

  Map<String, dynamic> toJson() => _$EgressToJson(this);
}

@JsonSerializable()
class EgressPort {
  ///endPort indicates that the range of ports from port to endPort if set, inclusive, should
  ///be allowed by the policy. This field cannot be defined if the port field is not defined
  ///or if the port field is defined as a named (string) port. The endPort must be equal or
  ///greater than port.
  @JsonKey(name: 'endPort')
  int? endPort;
  @JsonKey(name: 'port')
  dynamic port;

  ///protocol represents the protocol (TCP, UDP, or SCTP) which traffic must match. If not
  ///specified, this field defaults to TCP.
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  EgressPort({this.endPort, this.port, this.protocol});

  factory EgressPort.fromJson(Map<String, dynamic> json) =>
      _$EgressPortFromJson(json);

  Map<String, dynamic> toJson() => _$EgressPortToJson(this);
}

///protocol represents the protocol (TCP, UDP, or SCTP) which traffic must match. If not
///specified, this field defaults to TCP.
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

@JsonSerializable()
class To {
  ///IPBlock describes a particular CIDR (Ex. "192.168.1.0/24","2001:db8::/64") that is
  ///allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry
  ///describes CIDRs that should not be included within this rule.
  @JsonKey(name: 'ipBlock')
  ToIpBlock? ipBlock;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  ToNamespaceSelector? namespaceSelector;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'podSelector')
  ToPodSelector? podSelector;

  To({this.ipBlock, this.namespaceSelector, this.podSelector});

  factory To.fromJson(Map<String, dynamic> json) => _$ToFromJson(json);

  Map<String, dynamic> toJson() => _$ToToJson(this);
}

@JsonSerializable()
class ToIpBlock {
  ///cidr is a string representing the IPBlock Valid examples are "192.168.1.0/24" or
  ///"2001:db8::/64"
  @JsonKey(name: 'cidr')
  String cidr;

  ///except is a slice of CIDRs that should not be included within an IPBlock Valid examples
  ///are "192.168.1.0/24" or "2001:db8::/64" Except values will be rejected if they are
  ///outside the cidr range
  @JsonKey(name: 'except')
  List<String?>? except;

  ToIpBlock({required this.cidr, this.except});

  factory ToIpBlock.fromJson(Map<String, dynamic> json) =>
      _$ToIpBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ToIpBlockToJson(this);
}

@JsonSerializable()
class ToNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  ToNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory ToNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$ToNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ToNamespaceSelectorToJson(this);
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

@JsonSerializable()
class ToPodSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  ToPodSelector({this.matchExpressions, this.matchLabels});

  factory ToPodSelector.fromJson(Map<String, dynamic> json) =>
      _$ToPodSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ToPodSelectorToJson(this);
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

@JsonSerializable()
class Ingress {
  ///from is a list of sources which should be able to access the pods selected for this rule.
  ///Items in this list are combined using a logical OR operation. If this field is empty or
  ///missing, this rule matches all sources (traffic not restricted by source). If this field
  ///is present and contains at least one item, this rule allows traffic only if the traffic
  ///matches at least one item in the from list.
  @JsonKey(name: 'from')
  List<From?>? from;

  ///ports is a list of ports which should be made accessible on the pods selected for this
  ///rule. Each item in this list is combined using a logical OR. If this field is empty or
  ///missing, this rule matches all ports (traffic not restricted by port). If this field is
  ///present and contains at least one item, then this rule allows traffic only if the traffic
  ///matches at least one port in the list.
  @JsonKey(name: 'ports')
  List<IngressPort?>? ports;

  Ingress({this.from, this.ports});

  factory Ingress.fromJson(Map<String, dynamic> json) =>
      _$IngressFromJson(json);

  Map<String, dynamic> toJson() => _$IngressToJson(this);
}

@JsonSerializable()
class From {
  ///IPBlock describes a particular CIDR (Ex. "192.168.1.0/24","2001:db8::/64") that is
  ///allowed to the pods matched by a NetworkPolicySpec's podSelector. The except entry
  ///describes CIDRs that should not be included within this rule.
  @JsonKey(name: 'ipBlock')
  FromIpBlock? ipBlock;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  FromNamespaceSelector? namespaceSelector;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'podSelector')
  FromPodSelector? podSelector;

  From({this.ipBlock, this.namespaceSelector, this.podSelector});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class FromIpBlock {
  ///cidr is a string representing the IPBlock Valid examples are "192.168.1.0/24" or
  ///"2001:db8::/64"
  @JsonKey(name: 'cidr')
  String cidr;

  ///except is a slice of CIDRs that should not be included within an IPBlock Valid examples
  ///are "192.168.1.0/24" or "2001:db8::/64" Except values will be rejected if they are
  ///outside the cidr range
  @JsonKey(name: 'except')
  List<String?>? except;

  FromIpBlock({required this.cidr, this.except});

  factory FromIpBlock.fromJson(Map<String, dynamic> json) =>
      _$FromIpBlockFromJson(json);

  Map<String, dynamic> toJson() => _$FromIpBlockToJson(this);
}

@JsonSerializable()
class FromNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<TentacledMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FromNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory FromNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$FromNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FromNamespaceSelectorToJson(this);
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

@JsonSerializable()
class FromPodSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<StickyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FromPodSelector({this.matchExpressions, this.matchLabels});

  factory FromPodSelector.fromJson(Map<String, dynamic> json) =>
      _$FromPodSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FromPodSelectorToJson(this);
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
class IngressPort {
  ///endPort indicates that the range of ports from port to endPort if set, inclusive, should
  ///be allowed by the policy. This field cannot be defined if the port field is not defined
  ///or if the port field is defined as a named (string) port. The endPort must be equal or
  ///greater than port.
  @JsonKey(name: 'endPort')
  int? endPort;
  @JsonKey(name: 'port')
  dynamic port;

  ///protocol represents the protocol (TCP, UDP, or SCTP) which traffic must match. If not
  ///specified, this field defaults to TCP.
  ///
  ///Possible enum values:
  ///- `"SCTP"` is the SCTP protocol.
  ///- `"TCP"` is the TCP protocol.
  ///- `"UDP"` is the UDP protocol.
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  IngressPort({this.endPort, this.port, this.protocol});

  factory IngressPort.fromJson(Map<String, dynamic> json) =>
      _$IngressPortFromJson(json);

  Map<String, dynamic> toJson() => _$IngressPortToJson(this);
}

@JsonSerializable()
class SpecPodSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndigoMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  SpecPodSelector({this.matchExpressions, this.matchLabels});

  factory SpecPodSelector.fromJson(Map<String, dynamic> json) =>
      _$SpecPodSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SpecPodSelectorToJson(this);
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

enum PolicyType {
  @JsonValue('Egress')
  EGRESS,
  @JsonValue('Ingress')
  INGRESS,
}

final policyTypeValues = EnumValues({
  'Egress': PolicyType.EGRESS,
  'Ingress': PolicyType.INGRESS,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum NetworkpolicylistNetworkingV1Kind {
  @JsonValue('NetworkPolicyList')
  NETWORK_POLICY_LIST,
}

final networkpolicylistNetworkingV1KindValues = EnumValues({
  'NetworkPolicyList': NetworkpolicylistNetworkingV1Kind.NETWORK_POLICY_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class NetworkpolicylistNetworkingV1Metadata {
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

  NetworkpolicylistNetworkingV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory NetworkpolicylistNetworkingV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$NetworkpolicylistNetworkingV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NetworkpolicylistNetworkingV1MetadataToJson(this);
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
