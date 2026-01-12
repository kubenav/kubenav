import 'package:json_annotation/json_annotation.dart';

part 'providerlist_notification_v1beta3.g.dart';

///ProviderList is a list of Provider
@JsonSerializable()
class ProviderlistNotificationV1Beta3 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of providers. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ProviderlistNotificationV1Beta3Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ProviderlistNotificationV1Beta3Metadata? metadata;

  ProviderlistNotificationV1Beta3({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ProviderlistNotificationV1Beta3.fromJson(Map<String, dynamic> json) =>
      _$ProviderlistNotificationV1Beta3FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProviderlistNotificationV1Beta3ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('notification.toolkit.fluxcd.io/v1beta3')
  NOTIFICATION_TOOLKIT_FLUXCD_IO_V1_BETA3,
}

final apiVersionValues = EnumValues({
  'notification.toolkit.fluxcd.io/v1beta3':
      ApiVersion.NOTIFICATION_TOOLKIT_FLUXCD_IO_V1_BETA3,
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

  ///ProviderSpec defines the desired state of the Provider.
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
  @JsonValue('Provider')
  PROVIDER,
}

final itemKindValues = EnumValues({'Provider': ItemKind.PROVIDER});

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
  ///Address specifies the endpoint, in a generic sense, to where alerts are sent.
  ///What kind of endpoint depends on the specific Provider type being used.
  ///For the generic Provider, for example, this is an HTTP/S address.
  ///For other Provider types this could be a project ID or a namespace.
  @JsonKey(name: 'address')
  String? address;

  ///CertSecretRef specifies the Secret containing TLS certificates
  ///for secure communication.
  ///
  ///Supported configurations:
  ///- CA-only: Server authentication (provide ca.crt only)
  ///- mTLS: Mutual authentication (provide ca.crt + tls.crt + tls.key)
  ///- Client-only: Client authentication with system CA (provide tls.crt + tls.key only)
  ///
  ///Legacy keys "caFile", "certFile", "keyFile" are supported but deprecated. Use "ca.crt",
  ///"tls.crt", "tls.key" instead.
  @JsonKey(name: 'certSecretRef')
  CertSecretRef? certSecretRef;

  ///Channel specifies the destination channel where events should be posted.
  @JsonKey(name: 'channel')
  String? channel;

  ///CommitStatusExpr is a CEL expression that evaluates to a string value
  ///that can be used to generate a custom commit status message for use
  ///with eligible Provider types (github, gitlab, gitea, bitbucketserver,
  ///bitbucket, azuredevops). Supported variables are: event, provider,
  ///and alert.
  @JsonKey(name: 'commitStatusExpr')
  String? commitStatusExpr;

  ///Interval at which to reconcile the Provider with its Secret references.
  ///Deprecated and not used in v1beta3.
  @JsonKey(name: 'interval')
  String? interval;

  ///Proxy the HTTP/S address of the proxy server.
  ///Deprecated: Use ProxySecretRef instead. Will be removed in v1.
  @JsonKey(name: 'proxy')
  String? proxy;

  ///ProxySecretRef specifies the Secret containing the proxy configuration
  ///for this Provider. The Secret should contain an 'address' key with the
  ///HTTP/S address of the proxy server. Optional 'username' and 'password'
  ///keys can be provided for proxy authentication.
  @JsonKey(name: 'proxySecretRef')
  ProxySecretRef? proxySecretRef;

  ///SecretRef specifies the Secret containing the authentication
  ///credentials for this Provider.
  @JsonKey(name: 'secretRef')
  SecretRef? secretRef;

  ///ServiceAccountName is the name of the Kubernetes ServiceAccount used to
  ///authenticate with cloud provider services through workload identity.
  ///This enables multi-tenant authentication without storing static credentials.
  ///
  ///Supported provider types: azureeventhub, azuredevops, googlepubsub
  ///
  ///When specified, the controller will:
  ///1. Create an OIDC token for the specified ServiceAccount
  ///2. Exchange it for cloud provider credentials via STS
  ///3. Use the obtained credentials for API authentication
  ///
  ///When unspecified, controller-level authentication is used (single-tenant).
  ///
  ///An error is thrown if static credentials are also defined in SecretRef.
  ///This field requires the ObjectLevelWorkloadIdentity feature gate to be enabled.
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///Suspend tells the controller to suspend subsequent
  ///events handling for this Provider.
  @JsonKey(name: 'suspend')
  bool? suspend;

  ///Timeout for sending alerts to the Provider.
  @JsonKey(name: 'timeout')
  String? timeout;

  ///Type specifies which Provider implementation to use.
  @JsonKey(name: 'type')
  Type type;

  ///Username specifies the name under which events are posted.
  @JsonKey(name: 'username')
  String? username;

  Spec({
    this.address,
    this.certSecretRef,
    this.channel,
    this.commitStatusExpr,
    this.interval,
    this.proxy,
    this.proxySecretRef,
    this.secretRef,
    this.serviceAccountName,
    this.suspend,
    this.timeout,
    required this.type,
    this.username,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class CertSecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  CertSecretRef({required this.name});

  factory CertSecretRef.fromJson(Map<String, dynamic> json) =>
      _$CertSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$CertSecretRefToJson(this);
}

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
class SecretRef {
  ///Name of the referent.
  @JsonKey(name: 'name')
  String name;

  SecretRef({required this.name});

  factory SecretRef.fromJson(Map<String, dynamic> json) =>
      _$SecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$SecretRefToJson(this);
}

///Type specifies which Provider implementation to use.
enum Type {
  @JsonValue('alertmanager')
  ALERTMANAGER,
  @JsonValue('azuredevops')
  AZUREDEVOPS,
  @JsonValue('azureeventhub')
  AZUREEVENTHUB,
  @JsonValue('bitbucket')
  BITBUCKET,
  @JsonValue('bitbucketserver')
  BITBUCKETSERVER,
  @JsonValue('datadog')
  DATADOG,
  @JsonValue('discord')
  DISCORD,
  @JsonValue('generic')
  GENERIC,
  @JsonValue('generic-hmac')
  GENERIC_HMAC,
  @JsonValue('gitea')
  GITEA,
  @JsonValue('github')
  GITHUB,
  @JsonValue('githubdispatch')
  GITHUBDISPATCH,
  @JsonValue('gitlab')
  GITLAB,
  @JsonValue('googlechat')
  GOOGLECHAT,
  @JsonValue('googlepubsub')
  GOOGLEPUBSUB,
  @JsonValue('grafana')
  GRAFANA,
  @JsonValue('lark')
  LARK,
  @JsonValue('matrix')
  MATRIX,
  @JsonValue('msteams')
  MSTEAMS,
  @JsonValue('nats')
  NATS,
  @JsonValue('opsgenie')
  OPSGENIE,
  @JsonValue('otel')
  OTEL,
  @JsonValue('pagerduty')
  PAGERDUTY,
  @JsonValue('rocket')
  ROCKET,
  @JsonValue('sentry')
  SENTRY,
  @JsonValue('slack')
  SLACK,
  @JsonValue('telegram')
  TELEGRAM,
  @JsonValue('webex')
  WEBEX,
  @JsonValue('zulip')
  ZULIP,
}

final typeValues = EnumValues({
  'alertmanager': Type.ALERTMANAGER,
  'azuredevops': Type.AZUREDEVOPS,
  'azureeventhub': Type.AZUREEVENTHUB,
  'bitbucket': Type.BITBUCKET,
  'bitbucketserver': Type.BITBUCKETSERVER,
  'datadog': Type.DATADOG,
  'discord': Type.DISCORD,
  'generic': Type.GENERIC,
  'generic-hmac': Type.GENERIC_HMAC,
  'gitea': Type.GITEA,
  'github': Type.GITHUB,
  'githubdispatch': Type.GITHUBDISPATCH,
  'gitlab': Type.GITLAB,
  'googlechat': Type.GOOGLECHAT,
  'googlepubsub': Type.GOOGLEPUBSUB,
  'grafana': Type.GRAFANA,
  'lark': Type.LARK,
  'matrix': Type.MATRIX,
  'msteams': Type.MSTEAMS,
  'nats': Type.NATS,
  'opsgenie': Type.OPSGENIE,
  'otel': Type.OTEL,
  'pagerduty': Type.PAGERDUTY,
  'rocket': Type.ROCKET,
  'sentry': Type.SENTRY,
  'slack': Type.SLACK,
  'telegram': Type.TELEGRAM,
  'webex': Type.WEBEX,
  'zulip': Type.ZULIP,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ProviderlistNotificationV1Beta3Kind {
  @JsonValue('ProviderList')
  PROVIDER_LIST,
}

final providerlistNotificationV1Beta3KindValues = EnumValues({
  'ProviderList': ProviderlistNotificationV1Beta3Kind.PROVIDER_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ProviderlistNotificationV1Beta3Metadata {
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

  ProviderlistNotificationV1Beta3Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ProviderlistNotificationV1Beta3Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ProviderlistNotificationV1Beta3MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProviderlistNotificationV1Beta3MetadataToJson(this);
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
