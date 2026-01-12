import 'package:json_annotation/json_annotation.dart';

part 'challengelist_acme_v1.g.dart';

///ChallengeList is a list of Challenge
@JsonSerializable()
class ChallengelistAcmeV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of challenges. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ChallengelistAcmeV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ChallengelistAcmeV1Metadata? metadata;

  ChallengelistAcmeV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ChallengelistAcmeV1.fromJson(Map<String, dynamic> json) =>
      _$ChallengelistAcmeV1FromJson(json);

  Map<String, dynamic> toJson() => _$ChallengelistAcmeV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('acme.cert-manager.io/v1')
  ACME_CERT_MANAGER_IO_V1,
}

final apiVersionValues = EnumValues({
  'acme.cert-manager.io/v1': ApiVersion.ACME_CERT_MANAGER_IO_V1,
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
  @JsonValue('Challenge')
  CHALLENGE,
}

final itemKindValues = EnumValues({'Challenge': ItemKind.CHALLENGE});

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
  ///The URL to the ACME Authorization resource that this
  ///challenge is a part of.
  @JsonKey(name: 'authorizationURL')
  String authorizationUrl;

  ///dnsName is the identifier that this challenge is for, e.g., example.com.
  ///If the requested DNSName is a 'wildcard', this field MUST be set to the
  ///non-wildcard domain, e.g., for `*.example.com`, it must be `example.com`.
  @JsonKey(name: 'dnsName')
  String dnsName;

  ///References a properly configured ACME-type Issuer which should
  ///be used to create this Challenge.
  ///If the Issuer does not exist, processing will be retried.
  ///If the Issuer is not an 'ACME' Issuer, an error will be returned and the
  ///Challenge will be marked as failed.
  @JsonKey(name: 'issuerRef')
  IssuerRef issuerRef;

  ///The ACME challenge key for this challenge
  ///For HTTP01 challenges, this is the value that must be responded with to
  ///complete the HTTP01 challenge in the format:
  ///`<private key JWK thumbprint>.<key from acme server for challenge>`.
  ///For DNS01 challenges, this is the base64 encoded SHA256 sum of the
  ///`<private key JWK thumbprint>.<key from acme server for challenge>`
  ///text that must be set as the TXT record content.
  @JsonKey(name: 'key')
  String key;

  ///Contains the domain solving configuration that should be used to
  ///solve this challenge resource.
  @JsonKey(name: 'solver')
  Solver solver;

  ///The ACME challenge token for this challenge.
  ///This is the raw value returned from the ACME server.
  @JsonKey(name: 'token')
  String token;

  ///The type of ACME challenge this resource represents.
  ///One of "HTTP-01" or "DNS-01".
  @JsonKey(name: 'type')
  Type type;

  ///The URL of the ACME Challenge resource for this challenge.
  ///This can be used to lookup details about the status of this challenge.
  @JsonKey(name: 'url')
  String url;

  ///wildcard will be true if this challenge is for a wildcard identifier,
  ///for example '*.example.com'.
  @JsonKey(name: 'wildcard')
  bool? wildcard;

  ItemSpec({
    required this.authorizationUrl,
    required this.dnsName,
    required this.issuerRef,
    required this.key,
    required this.solver,
    required this.token,
    required this.type,
    required this.url,
    this.wildcard,
  });

  factory ItemSpec.fromJson(Map<String, dynamic> json) =>
      _$ItemSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSpecToJson(this);
}

///References a properly configured ACME-type Issuer which should
///be used to create this Challenge.
///If the Issuer does not exist, processing will be retried.
///If the Issuer is not an 'ACME' Issuer, an error will be returned and the
///Challenge will be marked as failed.
@JsonSerializable()
class IssuerRef {
  ///Group of the issuer being referred to.
  ///Defaults to 'cert-manager.io'.
  @JsonKey(name: 'group')
  String? group;

  ///Kind of the issuer being referred to.
  ///Defaults to 'Issuer'.
  @JsonKey(name: 'kind')
  String? kind;

  ///Name of the issuer being referred to.
  @JsonKey(name: 'name')
  String name;

  IssuerRef({this.group, this.kind, required this.name});

  factory IssuerRef.fromJson(Map<String, dynamic> json) =>
      _$IssuerRefFromJson(json);

  Map<String, dynamic> toJson() => _$IssuerRefToJson(this);
}

///Contains the domain solving configuration that should be used to
///solve this challenge resource.
@JsonSerializable()
class Solver {
  ///Configures cert-manager to attempt to complete authorizations by
  ///performing the DNS01 challenge flow.
  @JsonKey(name: 'dns01')
  Dns01? dns01;

  ///Configures cert-manager to attempt to complete authorizations by
  ///performing the HTTP01 challenge flow.
  ///It is not possible to obtain certificates for wildcard domain names
  ///(e.g., `*.example.com`) using the HTTP01 challenge mechanism.
  @JsonKey(name: 'http01')
  Http01? http01;

  ///Selector selects a set of DNSNames on the Certificate resource that
  ///should be solved using this challenge solver.
  ///If not specified, the solver will be treated as the 'default' solver
  ///with the lowest priority, i.e. if any other solver has a more specific
  ///match, it will be used instead.
  @JsonKey(name: 'selector')
  Selector? selector;

  Solver({this.dns01, this.http01, this.selector});

  factory Solver.fromJson(Map<String, dynamic> json) => _$SolverFromJson(json);

  Map<String, dynamic> toJson() => _$SolverToJson(this);
}

@JsonSerializable()
class Dns01 {
  ///Use the 'ACME DNS' (https://github.com/joohoi/acme-dns) API to manage
  ///DNS01 challenge records.
  @JsonKey(name: 'acmeDNS')
  AcmeDns? acmeDns;

  ///Use the Akamai DNS zone management API to manage DNS01 challenge records.
  @JsonKey(name: 'akamai')
  Akamai? akamai;

  ///Use the Microsoft Azure DNS API to manage DNS01 challenge records.
  @JsonKey(name: 'azureDNS')
  AzureDns? azureDns;

  ///Use the Google Cloud DNS API to manage DNS01 challenge records.
  @JsonKey(name: 'cloudDNS')
  CloudDns? cloudDns;

  ///Use the Cloudflare API to manage DNS01 challenge records.
  @JsonKey(name: 'cloudflare')
  Cloudflare? cloudflare;

  ///CNAMEStrategy configures how the DNS01 provider should handle CNAME
  ///records when found in DNS zones.
  @JsonKey(name: 'cnameStrategy')
  CnameStrategy? cnameStrategy;

  ///Use the DigitalOcean DNS API to manage DNS01 challenge records.
  @JsonKey(name: 'digitalocean')
  Digitalocean? digitalocean;

  ///Use RFC2136 ("Dynamic Updates in the Domain Name System")
  ///(https://datatracker.ietf.org/doc/rfc2136/)
  ///to manage DNS01 challenge records.
  @JsonKey(name: 'rfc2136')
  Rfc2136? rfc2136;

  ///Use the AWS Route53 API to manage DNS01 challenge records.
  @JsonKey(name: 'route53')
  Route53? route53;

  ///Configure an external webhook based DNS01 challenge solver to manage
  ///DNS01 challenge records.
  @JsonKey(name: 'webhook')
  Webhook? webhook;

  Dns01({
    this.acmeDns,
    this.akamai,
    this.azureDns,
    this.cloudDns,
    this.cloudflare,
    this.cnameStrategy,
    this.digitalocean,
    this.rfc2136,
    this.route53,
    this.webhook,
  });

  factory Dns01.fromJson(Map<String, dynamic> json) => _$Dns01FromJson(json);

  Map<String, dynamic> toJson() => _$Dns01ToJson(this);
}

@JsonSerializable()
class AcmeDns {
  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'accountSecretRef')
  AccountSecretRef accountSecretRef;
  @JsonKey(name: 'host')
  String host;

  AcmeDns({required this.accountSecretRef, required this.host});

  factory AcmeDns.fromJson(Map<String, dynamic> json) =>
      _$AcmeDnsFromJson(json);

  Map<String, dynamic> toJson() => _$AcmeDnsToJson(this);
}

///A reference to a specific 'key' within a Secret resource.
///In some instances, `key` is a required field.
@JsonSerializable()
class AccountSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  AccountSecretRef({this.key, required this.name});

  factory AccountSecretRef.fromJson(Map<String, dynamic> json) =>
      _$AccountSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSecretRefToJson(this);
}

@JsonSerializable()
class Akamai {
  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'accessTokenSecretRef')
  AccessTokenSecretRef accessTokenSecretRef;

  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'clientSecretSecretRef')
  AkamaiClientSecretSecretRef clientSecretSecretRef;

  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'clientTokenSecretRef')
  ClientTokenSecretRef clientTokenSecretRef;
  @JsonKey(name: 'serviceConsumerDomain')
  String serviceConsumerDomain;

  Akamai({
    required this.accessTokenSecretRef,
    required this.clientSecretSecretRef,
    required this.clientTokenSecretRef,
    required this.serviceConsumerDomain,
  });

  factory Akamai.fromJson(Map<String, dynamic> json) => _$AkamaiFromJson(json);

  Map<String, dynamic> toJson() => _$AkamaiToJson(this);
}

///A reference to a specific 'key' within a Secret resource.
///In some instances, `key` is a required field.
@JsonSerializable()
class AccessTokenSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  AccessTokenSecretRef({this.key, required this.name});

  factory AccessTokenSecretRef.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenSecretRefToJson(this);
}

///A reference to a specific 'key' within a Secret resource.
///In some instances, `key` is a required field.
@JsonSerializable()
class AkamaiClientSecretSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  AkamaiClientSecretSecretRef({this.key, required this.name});

  factory AkamaiClientSecretSecretRef.fromJson(Map<String, dynamic> json) =>
      _$AkamaiClientSecretSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$AkamaiClientSecretSecretRefToJson(this);
}

///A reference to a specific 'key' within a Secret resource.
///In some instances, `key` is a required field.
@JsonSerializable()
class ClientTokenSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ClientTokenSecretRef({this.key, required this.name});

  factory ClientTokenSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ClientTokenSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ClientTokenSecretRefToJson(this);
}

@JsonSerializable()
class AzureDns {
  ///Auth: Azure Service Principal:
  ///The ClientID of the Azure Service Principal used to authenticate with Azure DNS.
  ///If set, ClientSecret and TenantID must also be set.
  @JsonKey(name: 'clientID')
  String? clientId;

  ///Auth: Azure Service Principal:
  ///A reference to a Secret containing the password associated with the Service Principal.
  ///If set, ClientID and TenantID must also be set.
  @JsonKey(name: 'clientSecretSecretRef')
  AzureDnsClientSecretSecretRef? clientSecretSecretRef;

  ///name of the Azure environment (default AzurePublicCloud)
  @JsonKey(name: 'environment')
  Environment? environment;

  ///name of the DNS zone that should be used
  @JsonKey(name: 'hostedZoneName')
  String? hostedZoneName;

  ///Auth: Azure Workload Identity or Azure Managed Service Identity:
  ///Settings to enable Azure Workload Identity or Azure Managed Service Identity
  ///If set, ClientID, ClientSecret and TenantID must not be set.
  @JsonKey(name: 'managedIdentity')
  ManagedIdentity? managedIdentity;

  ///resource group the DNS zone is located in
  @JsonKey(name: 'resourceGroupName')
  String resourceGroupName;

  ///ID of the Azure subscription
  @JsonKey(name: 'subscriptionID')
  String subscriptionId;

  ///Auth: Azure Service Principal:
  ///The TenantID of the Azure Service Principal used to authenticate with Azure DNS.
  ///If set, ClientID and ClientSecret must also be set.
  @JsonKey(name: 'tenantID')
  String? tenantId;

  AzureDns({
    this.clientId,
    this.clientSecretSecretRef,
    this.environment,
    this.hostedZoneName,
    this.managedIdentity,
    required this.resourceGroupName,
    required this.subscriptionId,
    this.tenantId,
  });

  factory AzureDns.fromJson(Map<String, dynamic> json) =>
      _$AzureDnsFromJson(json);

  Map<String, dynamic> toJson() => _$AzureDnsToJson(this);
}

@JsonSerializable()
class AzureDnsClientSecretSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  AzureDnsClientSecretSecretRef({this.key, required this.name});

  factory AzureDnsClientSecretSecretRef.fromJson(Map<String, dynamic> json) =>
      _$AzureDnsClientSecretSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$AzureDnsClientSecretSecretRefToJson(this);
}

///name of the Azure environment (default AzurePublicCloud)
enum Environment {
  @JsonValue('AzureChinaCloud')
  AZURE_CHINA_CLOUD,
  @JsonValue('AzureGermanCloud')
  AZURE_GERMAN_CLOUD,
  @JsonValue('AzurePublicCloud')
  AZURE_PUBLIC_CLOUD,
  @JsonValue('AzureUSGovernmentCloud')
  AZURE_US_GOVERNMENT_CLOUD,
}

final environmentValues = EnumValues({
  'AzureChinaCloud': Environment.AZURE_CHINA_CLOUD,
  'AzureGermanCloud': Environment.AZURE_GERMAN_CLOUD,
  'AzurePublicCloud': Environment.AZURE_PUBLIC_CLOUD,
  'AzureUSGovernmentCloud': Environment.AZURE_US_GOVERNMENT_CLOUD,
});

@JsonSerializable()
class ManagedIdentity {
  ///client ID of the managed identity, cannot be used at the same time as resourceID
  @JsonKey(name: 'clientID')
  String? clientId;

  ///resource ID of the managed identity, cannot be used at the same time as clientID
  ///Cannot be used for Azure Managed Service Identity
  @JsonKey(name: 'resourceID')
  String? resourceId;

  ///tenant ID of the managed identity, cannot be used at the same time as resourceID
  @JsonKey(name: 'tenantID')
  String? tenantId;

  ManagedIdentity({this.clientId, this.resourceId, this.tenantId});

  factory ManagedIdentity.fromJson(Map<String, dynamic> json) =>
      _$ManagedIdentityFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedIdentityToJson(this);
}

@JsonSerializable()
class CloudDns {
  ///HostedZoneName is an optional field that tells cert-manager in which
  ///Cloud DNS zone the challenge record has to be created.
  ///If left empty cert-manager will automatically choose a zone.
  @JsonKey(name: 'hostedZoneName')
  String? hostedZoneName;
  @JsonKey(name: 'project')
  String project;

  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'serviceAccountSecretRef')
  ServiceAccountSecretRef? serviceAccountSecretRef;

  CloudDns({
    this.hostedZoneName,
    required this.project,
    this.serviceAccountSecretRef,
  });

  factory CloudDns.fromJson(Map<String, dynamic> json) =>
      _$CloudDnsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudDnsToJson(this);
}

@JsonSerializable()
class ServiceAccountSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ServiceAccountSecretRef({this.key, required this.name});

  factory ServiceAccountSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountSecretRefToJson(this);
}

@JsonSerializable()
class Cloudflare {
  ///API key to use to authenticate with Cloudflare.
  ///Note: using an API token to authenticate is now the recommended method
  ///as it allows greater control of permissions.
  @JsonKey(name: 'apiKeySecretRef')
  ApiKeySecretRef? apiKeySecretRef;

  ///API token used to authenticate with Cloudflare.
  @JsonKey(name: 'apiTokenSecretRef')
  ApiTokenSecretRef? apiTokenSecretRef;

  ///Email of the account, only required when using API key based authentication.
  @JsonKey(name: 'email')
  String? email;

  Cloudflare({this.apiKeySecretRef, this.apiTokenSecretRef, this.email});

  factory Cloudflare.fromJson(Map<String, dynamic> json) =>
      _$CloudflareFromJson(json);

  Map<String, dynamic> toJson() => _$CloudflareToJson(this);
}

@JsonSerializable()
class ApiKeySecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ApiKeySecretRef({this.key, required this.name});

  factory ApiKeySecretRef.fromJson(Map<String, dynamic> json) =>
      _$ApiKeySecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ApiKeySecretRefToJson(this);
}

@JsonSerializable()
class ApiTokenSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  ApiTokenSecretRef({this.key, required this.name});

  factory ApiTokenSecretRef.fromJson(Map<String, dynamic> json) =>
      _$ApiTokenSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$ApiTokenSecretRefToJson(this);
}

///CNAMEStrategy configures how the DNS01 provider should handle CNAME
///records when found in DNS zones.
enum CnameStrategy {
  @JsonValue('Follow')
  FOLLOW,
  @JsonValue('None')
  NONE,
}

final cnameStrategyValues = EnumValues({
  'Follow': CnameStrategy.FOLLOW,
  'None': CnameStrategy.NONE,
});

@JsonSerializable()
class Digitalocean {
  ///A reference to a specific 'key' within a Secret resource.
  ///In some instances, `key` is a required field.
  @JsonKey(name: 'tokenSecretRef')
  TokenSecretRef tokenSecretRef;

  Digitalocean({required this.tokenSecretRef});

  factory Digitalocean.fromJson(Map<String, dynamic> json) =>
      _$DigitaloceanFromJson(json);

  Map<String, dynamic> toJson() => _$DigitaloceanToJson(this);
}

///A reference to a specific 'key' within a Secret resource.
///In some instances, `key` is a required field.
@JsonSerializable()
class TokenSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  TokenSecretRef({this.key, required this.name});

  factory TokenSecretRef.fromJson(Map<String, dynamic> json) =>
      _$TokenSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$TokenSecretRefToJson(this);
}

@JsonSerializable()
class Rfc2136 {
  ///The IP address or hostname of an authoritative DNS server supporting
  ///RFC2136 in the form host:port. If the host is an IPv6 address it must be
  ///enclosed in square brackets (e.g [2001:db8::1]) ; port is optional.
  ///This field is required.
  @JsonKey(name: 'nameserver')
  String nameserver;

  ///Protocol to use for dynamic DNS update queries. Valid values are (case-sensitive) ``TCP``
  ///and ``UDP``; ``UDP`` (default).
  @JsonKey(name: 'protocol')
  Protocol? protocol;

  ///The TSIG Algorithm configured in the DNS supporting RFC2136. Used only
  ///when ``tsigSecretSecretRef`` and ``tsigKeyName`` are defined.
  ///Supported values are (case-insensitive): ``HMACMD5`` (default),
  ///``HMACSHA1``, ``HMACSHA256`` or ``HMACSHA512``.
  @JsonKey(name: 'tsigAlgorithm')
  String? tsigAlgorithm;

  ///The TSIG Key name configured in the DNS.
  ///If ``tsigSecretSecretRef`` is defined, this field is required.
  @JsonKey(name: 'tsigKeyName')
  String? tsigKeyName;

  ///The name of the secret containing the TSIG value.
  ///If ``tsigKeyName`` is defined, this field is required.
  @JsonKey(name: 'tsigSecretSecretRef')
  TsigSecretSecretRef? tsigSecretSecretRef;

  Rfc2136({
    required this.nameserver,
    this.protocol,
    this.tsigAlgorithm,
    this.tsigKeyName,
    this.tsigSecretSecretRef,
  });

  factory Rfc2136.fromJson(Map<String, dynamic> json) =>
      _$Rfc2136FromJson(json);

  Map<String, dynamic> toJson() => _$Rfc2136ToJson(this);
}

///Protocol to use for dynamic DNS update queries. Valid values are (case-sensitive) ``TCP``
///and ``UDP``; ``UDP`` (default).
enum Protocol {
  @JsonValue('TCP')
  TCP,
  @JsonValue('UDP')
  UDP,
}

final protocolValues = EnumValues({'TCP': Protocol.TCP, 'UDP': Protocol.UDP});

@JsonSerializable()
class TsigSecretSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  TsigSecretSecretRef({this.key, required this.name});

  factory TsigSecretSecretRef.fromJson(Map<String, dynamic> json) =>
      _$TsigSecretSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$TsigSecretSecretRefToJson(this);
}

@JsonSerializable()
class Route53 {
  ///The AccessKeyID is used for authentication.
  ///Cannot be set when SecretAccessKeyID is set.
  ///If neither the Access Key nor Key ID are set, we fall-back to using env
  ///vars, shared credentials file or AWS Instance metadata,
  ///see:
  ///https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
  @JsonKey(name: 'accessKeyID')
  String? accessKeyId;

  ///The SecretAccessKey is used for authentication. If set, pull the AWS
  ///access key ID from a key within a Kubernetes Secret.
  ///Cannot be set when AccessKeyID is set.
  ///If neither the Access Key nor Key ID are set, we fall-back to using env
  ///vars, shared credentials file or AWS Instance metadata,
  ///see:
  ///https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
  @JsonKey(name: 'accessKeyIDSecretRef')
  AccessKeyIdSecretRef? accessKeyIdSecretRef;

  ///Auth configures how cert-manager authenticates.
  @JsonKey(name: 'auth')
  Auth? auth;

  ///If set, the provider will manage only this zone in Route53 and will not do a lookup using
  ///the route53:ListHostedZonesByName api call.
  @JsonKey(name: 'hostedZoneID')
  String? hostedZoneId;

  ///Override the AWS region.
  ///
  ///Route53 is a global service and does not have regional endpoints but the
  ///region specified here (or via environment variables) is used as a hint to
  ///help compute the correct AWS credential scope and partition when it
  ///connects to Route53. See:
  ///- [Amazon Route 53 endpoints and
  ///quotas](https://docs.aws.amazon.com/general/latest/gr/r53.html)
  ///- [Global
  ///services](https://docs.aws.amazon.com/whitepapers/latest/aws-fault-isolation-boundaries/global-services.html)
  ///
  ///If you omit this region field, cert-manager will use the region from
  ///AWS_REGION and AWS_DEFAULT_REGION environment variables, if they are set
  ///in the cert-manager controller Pod.
  ///
  ///The `region` field is not needed if you use [IAM Roles for Service Accounts
  ///(IRSA)](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).
  ///Instead an AWS_REGION environment variable is added to the cert-manager controller Pod
  ///by:
  ///[Amazon EKS Pod Identity
  ///Webhook](https://github.com/aws/amazon-eks-pod-identity-webhook).
  ///In this case this `region` field value is ignored.
  ///
  ///The `region` field is not needed if you use [EKS Pod
  ///Identities](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html).
  ///Instead an AWS_REGION environment variable is added to the cert-manager controller Pod
  ///by:
  ///[Amazon EKS Pod Identity Agent](https://github.com/aws/eks-pod-identity-agent),
  ///In this case this `region` field value is ignored.
  @JsonKey(name: 'region')
  String? region;

  ///Role is a Role ARN which the Route53 provider will assume using either the explicit
  ///credentials AccessKeyID/SecretAccessKey
  ///or the inferred credentials from environment variables, shared credentials file or AWS
  ///Instance metadata
  @JsonKey(name: 'role')
  String? role;

  ///The SecretAccessKey is used for authentication.
  ///If neither the Access Key nor Key ID are set, we fall-back to using env
  ///vars, shared credentials file or AWS Instance metadata,
  ///see:
  ///https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials
  @JsonKey(name: 'secretAccessKeySecretRef')
  SecretAccessKeySecretRef? secretAccessKeySecretRef;

  Route53({
    this.accessKeyId,
    this.accessKeyIdSecretRef,
    this.auth,
    this.hostedZoneId,
    this.region,
    this.role,
    this.secretAccessKeySecretRef,
  });

  factory Route53.fromJson(Map<String, dynamic> json) =>
      _$Route53FromJson(json);

  Map<String, dynamic> toJson() => _$Route53ToJson(this);
}

@JsonSerializable()
class AccessKeyIdSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  AccessKeyIdSecretRef({this.key, required this.name});

  factory AccessKeyIdSecretRef.fromJson(Map<String, dynamic> json) =>
      _$AccessKeyIdSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$AccessKeyIdSecretRefToJson(this);
}

@JsonSerializable()
class Auth {
  ///Kubernetes authenticates with Route53 using AssumeRoleWithWebIdentity
  ///by passing a bound ServiceAccount token.
  @JsonKey(name: 'kubernetes')
  Kubernetes kubernetes;

  Auth({required this.kubernetes});

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

///Kubernetes authenticates with Route53 using AssumeRoleWithWebIdentity
///by passing a bound ServiceAccount token.
@JsonSerializable()
class Kubernetes {
  ///A reference to a service account that will be used to request a bound
  ///token (also known as "projected token"). To use this field, you must
  ///configure an RBAC rule to let cert-manager request a token.
  @JsonKey(name: 'serviceAccountRef')
  ServiceAccountRef serviceAccountRef;

  Kubernetes({required this.serviceAccountRef});

  factory Kubernetes.fromJson(Map<String, dynamic> json) =>
      _$KubernetesFromJson(json);

  Map<String, dynamic> toJson() => _$KubernetesToJson(this);
}

///A reference to a service account that will be used to request a bound
///token (also known as "projected token"). To use this field, you must
///configure an RBAC rule to let cert-manager request a token.
@JsonSerializable()
class ServiceAccountRef {
  ///TokenAudiences is an optional list of audiences to include in the
  ///token passed to AWS. The default token consisting of the issuer's namespace
  ///and name is always included.
  ///If unset the audience defaults to `sts.amazonaws.com`.
  @JsonKey(name: 'audiences')
  List<String?>? audiences;

  ///Name of the ServiceAccount used to request a token.
  @JsonKey(name: 'name')
  String name;

  ServiceAccountRef({this.audiences, required this.name});

  factory ServiceAccountRef.fromJson(Map<String, dynamic> json) =>
      _$ServiceAccountRefFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceAccountRefToJson(this);
}

@JsonSerializable()
class SecretAccessKeySecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  SecretAccessKeySecretRef({this.key, required this.name});

  factory SecretAccessKeySecretRef.fromJson(Map<String, dynamic> json) =>
      _$SecretAccessKeySecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$SecretAccessKeySecretRefToJson(this);
}

@JsonSerializable()
class Webhook {
  ///Additional configuration that should be passed to the webhook apiserver
  ///when challenges are processed.
  ///This can contain arbitrary JSON data.
  ///Secret values should not be specified in this stanza.
  ///If secret values are needed (e.g., credentials for a DNS service), you
  ///should use a SecretKeySelector to reference a Secret resource.
  ///For details on the schema of this field, consult the webhook provider
  ///implementation's documentation.
  @JsonKey(name: 'config')
  dynamic config;

  ///The API group name that should be used when POSTing ChallengePayload
  ///resources to the webhook apiserver.
  ///This should be the same as the GroupName specified in the webhook
  ///provider implementation.
  @JsonKey(name: 'groupName')
  String groupName;

  ///The name of the solver to use, as defined in the webhook provider
  ///implementation.
  ///This will typically be the name of the provider, e.g., 'cloudflare'.
  @JsonKey(name: 'solverName')
  String solverName;

  Webhook({this.config, required this.groupName, required this.solverName});

  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookToJson(this);
}

@JsonSerializable()
class Http01 {
  ///The Gateway API is a sig-network community API that models service networking
  ///in Kubernetes (https://gateway-api.sigs.k8s.io/). The Gateway solver will
  ///create HTTPRoutes with the specified labels in the same namespace as the challenge.
  ///This solver is experimental, and fields / behaviour may change in the future.
  @JsonKey(name: 'gatewayHTTPRoute')
  GatewayHttpRoute? gatewayHttpRoute;

  ///The ingress based HTTP01 challenge solver will solve challenges by
  ///creating or modifying Ingress resources in order to route requests for
  ///'/.well-known/acme-challenge/XYZ' to 'challenge solver' pods that are
  ///provisioned by cert-manager for each Challenge to be completed.
  @JsonKey(name: 'ingress')
  Ingress? ingress;

  Http01({this.gatewayHttpRoute, this.ingress});

  factory Http01.fromJson(Map<String, dynamic> json) => _$Http01FromJson(json);

  Map<String, dynamic> toJson() => _$Http01ToJson(this);
}

@JsonSerializable()
class GatewayHttpRoute {
  ///Custom labels that will be applied to HTTPRoutes created by cert-manager
  ///while solving HTTP-01 challenges.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ///When solving an HTTP-01 challenge, cert-manager creates an HTTPRoute.
  ///cert-manager needs to know which parentRefs should be used when creating
  ///the HTTPRoute. Usually, the parentRef references a Gateway. See:
  ///https://gateway-api.sigs.k8s.io/api-types/httproute/#attaching-to-gateways
  @JsonKey(name: 'parentRefs')
  List<ParentRef?>? parentRefs;

  ///Optional pod template used to configure the ACME challenge solver pods
  ///used for HTTP01 challenges.
  @JsonKey(name: 'podTemplate')
  GatewayHttpRoutePodTemplate? podTemplate;

  ///Optional service type for Kubernetes solver service. Supported values
  ///are NodePort or ClusterIP. If unset, defaults to NodePort.
  @JsonKey(name: 'serviceType')
  String? serviceType;

  GatewayHttpRoute({
    this.labels,
    this.parentRefs,
    this.podTemplate,
    this.serviceType,
  });

  factory GatewayHttpRoute.fromJson(Map<String, dynamic> json) =>
      _$GatewayHttpRouteFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayHttpRouteToJson(this);
}

@JsonSerializable()
class ParentRef {
  ///Group is the group of the referent.
  ///When unspecified, "gateway.networking.k8s.io" is inferred.
  ///To set the core API group (such as for a "Service" kind referent),
  ///Group must be explicitly set to "" (empty string).
  ///
  ///Support: Core
  @JsonKey(name: 'group')
  String? group;

  ///Kind is kind of the referent.
  ///
  ///There are two kinds of parent resources with "Core" support:
  ///
  ///* Gateway (Gateway conformance profile)
  ///* Service (Mesh conformance profile, ClusterIP Services only)
  ///
  ///Support for other resources is Implementation-Specific.
  @JsonKey(name: 'kind')
  String? kind;

  ///Name is the name of the referent.
  ///
  ///Support: Core
  @JsonKey(name: 'name')
  String name;

  ///Namespace is the namespace of the referent. When unspecified, this refers
  ///to the local namespace of the Route.
  ///
  ///Note that there are specific rules for ParentRefs which cross namespace
  ///boundaries. Cross-namespace references are only valid if they are explicitly
  ///allowed by something in the namespace they are referring to. For example:
  ///Gateway has the AllowedRoutes field, and ReferenceGrant provides a
  ///generic way to enable any other kind of cross-namespace reference.
  ///
  ///<gateway:experimental:description>
  ///ParentRefs from a Route to a Service in the same namespace are "producer"
  ///routes, which apply default routing rules to inbound connections from
  ///any namespace to the Service.
  ///
  ///ParentRefs from a Route to a Service in a different namespace are
  ///"consumer" routes, and these routing rules are only applied to outbound
  ///connections originating from the same namespace as the Route, for which
  ///the intended destination of the connections are a Service targeted as a
  ///ParentRef of the Route.
  ///</gateway:experimental:description>
  ///
  ///Support: Core
  @JsonKey(name: 'namespace')
  String? namespace;

  ///Port is the network port this Route targets. It can be interpreted
  ///differently based on the type of parent resource.
  ///
  ///When the parent resource is a Gateway, this targets all listeners
  ///listening on the specified port that also support this kind of Route(and
  ///select this Route). It's not recommended to set `Port` unless the
  ///networking behaviors specified in a Route must apply to a specific port
  ///as opposed to a listener(s) whose port(s) may be changed. When both Port
  ///and SectionName are specified, the name and port of the selected listener
  ///must match both specified values.
  ///
  ///<gateway:experimental:description>
  ///When the parent resource is a Service, this targets a specific port in the
  ///Service spec. When both Port (experimental) and SectionName are specified,
  ///the name and port of the selected port must match both specified values.
  ///</gateway:experimental:description>
  ///
  ///Implementations MAY choose to support other parent resources.
  ///Implementations supporting other types of parent resources MUST clearly
  ///document how/if Port is interpreted.
  ///
  ///For the purpose of status, an attachment is considered successful as
  ///long as the parent resource accepts it partially. For example, Gateway
  ///listeners can restrict which Routes can attach to them by Route kind,
  ///namespace, or hostname. If 1 of 2 Gateway listeners accept attachment
  ///from the referencing Route, the Route MUST be considered successfully
  ///attached. If no Gateway listeners accept attachment from this Route,
  ///the Route MUST be considered detached from the Gateway.
  ///
  ///Support: Extended
  @JsonKey(name: 'port')
  int? port;

  ///SectionName is the name of a section within the target resource. In the
  ///following resources, SectionName is interpreted as the following:
  ///
  ///* Gateway: Listener name. When both Port (experimental) and SectionName
  ///are specified, the name and port of the selected listener must match
  ///both specified values.
  ///* Service: Port name. When both Port (experimental) and SectionName
  ///are specified, the name and port of the selected listener must match
  ///both specified values.
  ///
  ///Implementations MAY choose to support attaching Routes to other resources.
  ///If that is the case, they MUST clearly document how SectionName is
  ///interpreted.
  ///
  ///When unspecified (empty string), this will reference the entire resource.
  ///For the purpose of status, an attachment is considered successful if at
  ///least one section in the parent resource accepts it. For example, Gateway
  ///listeners can restrict which Routes can attach to them by Route kind,
  ///namespace, or hostname. If 1 of 2 Gateway listeners accept attachment from
  ///the referencing Route, the Route MUST be considered successfully
  ///attached. If no Gateway listeners accept attachment from this Route, the
  ///Route MUST be considered detached from the Gateway.
  ///
  ///Support: Core
  @JsonKey(name: 'sectionName')
  String? sectionName;

  ParentRef({
    this.group,
    this.kind,
    required this.name,
    this.namespace,
    this.port,
    this.sectionName,
  });

  factory ParentRef.fromJson(Map<String, dynamic> json) =>
      _$ParentRefFromJson(json);

  Map<String, dynamic> toJson() => _$ParentRefToJson(this);
}

@JsonSerializable()
class GatewayHttpRoutePodTemplate {
  ///ObjectMeta overrides for the pod used to solve HTTP01 challenges.
  ///Only the 'labels' and 'annotations' fields may be set.
  ///If labels or annotations overlap with in-built values, the values here
  ///will override the in-built values.
  @JsonKey(name: 'metadata')
  PurpleMetadata? metadata;

  ///PodSpec defines overrides for the HTTP01 challenge solver pod.
  ///Check ACMEChallengeSolverHTTP01IngressPodSpec to find out currently supported fields.
  ///All other fields will be ignored.
  @JsonKey(name: 'spec')
  PurpleSpec? spec;

  GatewayHttpRoutePodTemplate({this.metadata, this.spec});

  factory GatewayHttpRoutePodTemplate.fromJson(Map<String, dynamic> json) =>
      _$GatewayHttpRoutePodTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayHttpRoutePodTemplateToJson(this);
}

@JsonSerializable()
class PurpleMetadata {
  ///Annotations that should be added to the created ACME HTTP01 solver pods.
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Labels that should be added to the created ACME HTTP01 solver pods.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  PurpleMetadata({this.annotations, this.labels});

  factory PurpleMetadata.fromJson(Map<String, dynamic> json) =>
      _$PurpleMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMetadataToJson(this);
}

@JsonSerializable()
class PurpleSpec {
  ///If specified, the pod's scheduling constraints
  @JsonKey(name: 'affinity')
  PurpleAffinity? affinity;

  ///If specified, the pod's imagePullSecrets
  @JsonKey(name: 'imagePullSecrets')
  List<PurpleImagePullSecret?>? imagePullSecrets;

  ///NodeSelector is a selector which must be true for the pod to fit on a node.
  ///Selector which must match a node's labels for the pod to be scheduled on that node.
  ///More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
  @JsonKey(name: 'nodeSelector')
  Map<String, String?>? nodeSelector;

  ///If specified, the pod's priorityClassName.
  @JsonKey(name: 'priorityClassName')
  String? priorityClassName;

  ///If specified, the pod's resource requirements.
  ///These values override the global resource configuration flags.
  ///Note that when only specifying resource limits, ensure they are greater than or equal
  ///to the corresponding global resource requests configured via controller flags
  ///(--acme-http01-solver-resource-request-cpu,
  ///--acme-http01-solver-resource-request-memory).
  ///Kubernetes will reject pod creation if limits are lower than requests, causing challenge
  ///failures.
  @JsonKey(name: 'resources')
  PurpleResources? resources;

  ///If specified, the pod's security context
  @JsonKey(name: 'securityContext')
  PurpleSecurityContext? securityContext;

  ///If specified, the pod's service account
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///If specified, the pod's tolerations.
  @JsonKey(name: 'tolerations')
  List<PurpleToleration?>? tolerations;

  PurpleSpec({
    this.affinity,
    this.imagePullSecrets,
    this.nodeSelector,
    this.priorityClassName,
    this.resources,
    this.securityContext,
    this.serviceAccountName,
    this.tolerations,
  });

  factory PurpleSpec.fromJson(Map<String, dynamic> json) =>
      _$PurpleSpecFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSpecToJson(this);
}

@JsonSerializable()
class PurpleAffinity {
  ///Describes node affinity scheduling rules for the pod.
  @JsonKey(name: 'nodeAffinity')
  PurpleNodeAffinity? nodeAffinity;

  ///Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone,
  ///etc. as some other pod(s)).
  @JsonKey(name: 'podAffinity')
  PurplePodAffinity? podAffinity;

  ///Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same
  ///node, zone, etc. as some other pod(s)).
  @JsonKey(name: 'podAntiAffinity')
  PurplePodAntiAffinity? podAntiAffinity;

  PurpleAffinity({this.nodeAffinity, this.podAffinity, this.podAntiAffinity});

  factory PurpleAffinity.fromJson(Map<String, dynamic> json) =>
      _$PurpleAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleAffinityToJson(this);
}

@JsonSerializable()
class PurpleNodeAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and adding
  ///"weight" to the sum if the node matches the corresponding matchExpressions; the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<PurplePreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to an update), the system
  ///may or may not try to eventually evict the pod from its node.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  PurpleRequiredDuringSchedulingIgnoredDuringExecution?
  requiredDuringSchedulingIgnoredDuringExecution;

  PurpleNodeAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory PurpleNodeAffinity.fromJson(Map<String, dynamic> json) =>
      _$PurpleNodeAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleNodeAffinityToJson(this);
}

@JsonSerializable()
class PurplePreferredDuringSchedulingIgnoredDuringExecution {
  ///A node selector term, associated with the corresponding weight.
  @JsonKey(name: 'preference')
  PurplePreference preference;

  ///Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  PurplePreferredDuringSchedulingIgnoredDuringExecution({
    required this.preference,
    required this.weight,
  });

  factory PurplePreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$PurplePreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PurplePreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///A node selector term, associated with the corresponding weight.
@JsonSerializable()
class PurplePreference {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<PurpleMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<PurpleMatchField?>? matchFields;

  PurplePreference({this.matchExpressions, this.matchFields});

  factory PurplePreference.fromJson(Map<String, dynamic> json) =>
      _$PurplePreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePreferenceToJson(this);
}

@JsonSerializable()
class PurpleMatchExpression {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
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
class PurpleMatchField {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  PurpleMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory PurpleMatchField.fromJson(Map<String, dynamic> json) =>
      _$PurpleMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleMatchFieldToJson(this);
}

@JsonSerializable()
class PurpleRequiredDuringSchedulingIgnoredDuringExecution {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<PurpleNodeSelectorTerm?> nodeSelectorTerms;

  PurpleRequiredDuringSchedulingIgnoredDuringExecution({
    required this.nodeSelectorTerms,
  });

  factory PurpleRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$PurpleRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PurpleRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class PurpleNodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<FluffyMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<FluffyMatchField?>? matchFields;

  PurpleNodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory PurpleNodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$PurpleNodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleNodeSelectorTermToJson(this);
}

@JsonSerializable()
class FluffyMatchExpression {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
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
class FluffyMatchField {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  FluffyMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory FluffyMatchField.fromJson(Map<String, dynamic> json) =>
      _$FluffyMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMatchFieldToJson(this);
}

@JsonSerializable()
class PurplePodAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and adding
  ///"weight" to the sum if the node has pods which matches the corresponding podAffinityTerm;
  ///the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<FluffyPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to a pod label update), the
  ///system may or may not try to eventually evict the pod from its node.
  ///When there are multiple elements, the lists of nodes corresponding to each
  ///podAffinityTerm are intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<FluffyRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  PurplePodAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory PurplePodAffinity.fromJson(Map<String, dynamic> json) =>
      _$PurplePodAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePodAffinityToJson(this);
}

@JsonSerializable()
class FluffyPreferredDuringSchedulingIgnoredDuringExecution {
  ///Required. A pod affinity term, associated with the corresponding weight.
  @JsonKey(name: 'podAffinityTerm')
  PurplePodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm,
  ///in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  FluffyPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory FluffyPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$FluffyPreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FluffyPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///Required. A pod affinity term, associated with the corresponding weight.
@JsonSerializable()
class PurplePodAffinityTerm {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  PurpleLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  PurpleNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  PurplePodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory PurplePodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$PurplePodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePodAffinityTermToJson(this);
}

@JsonSerializable()
class PurpleLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<TentacledMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleLabelSelector({this.matchExpressions, this.matchLabels});

  factory PurpleLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleLabelSelectorToJson(this);
}

@JsonSerializable()
class TentacledMatchExpression {
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
class PurpleNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<StickyMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  PurpleNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory PurpleNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$PurpleNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleNamespaceSelectorToJson(this);
}

@JsonSerializable()
class StickyMatchExpression {
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
class FluffyRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  FluffyLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  FluffyNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  FluffyRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory FluffyRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$FluffyRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FluffyRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class FluffyLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndigoMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffyLabelSelector({this.matchExpressions, this.matchLabels});

  factory FluffyLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$FluffyLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyLabelSelectorToJson(this);
}

@JsonSerializable()
class IndigoMatchExpression {
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
class FluffyNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<IndecentMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  FluffyNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory FluffyNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$FluffyNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyNamespaceSelectorToJson(this);
}

@JsonSerializable()
class IndecentMatchExpression {
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
class PurplePodAntiAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the anti-affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling anti-affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and subtracting
  ///"weight" from the sum if the node has pods which matches the corresponding
  ///podAffinityTerm; the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<TentacledPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the anti-affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the anti-affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to a pod label update), the
  ///system may or may not try to eventually evict the pod from its node.
  ///When there are multiple elements, the lists of nodes corresponding to each
  ///podAffinityTerm are intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<TentacledRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  PurplePodAntiAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory PurplePodAntiAffinity.fromJson(Map<String, dynamic> json) =>
      _$PurplePodAntiAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$PurplePodAntiAffinityToJson(this);
}

@JsonSerializable()
class TentacledPreferredDuringSchedulingIgnoredDuringExecution {
  ///Required. A pod affinity term, associated with the corresponding weight.
  @JsonKey(name: 'podAffinityTerm')
  FluffyPodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm,
  ///in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  TentacledPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory TentacledPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$TentacledPreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TentacledPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///Required. A pod affinity term, associated with the corresponding weight.
@JsonSerializable()
class FluffyPodAffinityTerm {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  TentacledLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  TentacledNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  FluffyPodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory FluffyPodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$FluffyPodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPodAffinityTermToJson(this);
}

@JsonSerializable()
class TentacledLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<HilariousMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledLabelSelector({this.matchExpressions, this.matchLabels});

  factory TentacledLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledLabelSelectorToJson(this);
}

@JsonSerializable()
class HilariousMatchExpression {
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
class TentacledNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<AmbitiousMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  TentacledNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory TentacledNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$TentacledNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledNamespaceSelectorToJson(this);
}

@JsonSerializable()
class AmbitiousMatchExpression {
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
class TentacledRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  StickyLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  StickyNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  TentacledRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory TentacledRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$TentacledRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TentacledRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class StickyLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<CunningMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickyLabelSelector({this.matchExpressions, this.matchLabels});

  factory StickyLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$StickyLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickyLabelSelectorToJson(this);
}

@JsonSerializable()
class CunningMatchExpression {
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
class StickyNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MagentaMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  StickyNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory StickyNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$StickyNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$StickyNamespaceSelectorToJson(this);
}

@JsonSerializable()
class MagentaMatchExpression {
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

  MagentaMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MagentaMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$MagentaMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$MagentaMatchExpressionToJson(this);
}

@JsonSerializable()
class PurpleImagePullSecret {
  ///Name of the referent.
  ///This field is effectively required, but due to backwards compatibility is
  ///allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  PurpleImagePullSecret({this.name});

  factory PurpleImagePullSecret.fromJson(Map<String, dynamic> json) =>
      _$PurpleImagePullSecretFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleImagePullSecretToJson(this);
}

@JsonSerializable()
class PurpleResources {
  ///Limits describes the maximum amount of compute resources allowed.
  ///More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'limits')
  Map<String, dynamic>? limits;

  ///Requests describes the minimum amount of compute resources required.
  ///If Requests is omitted for a container, it defaults to Limits if that is explicitly
  ///specified,
  ///otherwise to the global values configured via controller flags. Requests cannot exceed
  ///Limits.
  ///More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'requests')
  Map<String, dynamic>? requests;

  PurpleResources({this.limits, this.requests});

  factory PurpleResources.fromJson(Map<String, dynamic> json) =>
      _$PurpleResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleResourcesToJson(this);
}

@JsonSerializable()
class PurpleSecurityContext {
  ///A special supplemental group that applies to all containers in a pod.
  ///Some volume types allow the Kubelet to change the ownership of that volume
  ///to be owned by the pod:
  ///
  ///1. The owning GID will be the FSGroup
  ///2. The setgid bit is set (new files created in the volume will be owned by FSGroup)
  ///3. The permission bits are OR'd with rw-rw----
  ///
  ///If unset, the Kubelet will not modify the ownership and permissions of any volume.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'fsGroup')
  int? fsGroup;

  ///fsGroupChangePolicy defines behavior of changing ownership and permission of the volume
  ///before being exposed inside Pod. This field will only apply to
  ///volume types which support fsGroup based ownership(and permissions).
  ///It will have no effect on ephemeral volume types such as: secret, configmaps
  ///and emptydir.
  ///Valid values are "OnRootMismatch" and "Always". If not specified, "Always" is used.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'fsGroupChangePolicy')
  String? fsGroupChangePolicy;

  ///The GID to run the entrypoint of the container process.
  ///Uses runtime default if unset.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence
  ///for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user.
  ///If true, the Kubelet will validate the image at runtime to ensure that it
  ///does not run as UID 0 (root) and fail to start the container if it does.
  ///If unset or false, no such validation will be performed.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process.
  ///Defaults to user specified in image metadata if unspecified.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence
  ///for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///The seccomp options to use by the containers in this pod.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'seccompProfile')
  PurpleSeccompProfile? seccompProfile;

  ///The SELinux context to be applied to all containers.
  ///If unspecified, the container runtime will allocate a random SELinux context for each
  ///container.  May also be set in SecurityContext.  If set in
  ///both SecurityContext and PodSecurityContext, the value specified in SecurityContext
  ///takes precedence for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'seLinuxOptions')
  PurpleSeLinuxOptions? seLinuxOptions;

  ///A list of groups applied to the first process run in each container, in addition
  ///to the container's primary GID, the fsGroup (if specified), and group memberships
  ///defined in the container image for the uid of the container process. If unspecified,
  ///no additional groups are added to any container. Note that group memberships
  ///defined in the container image for the uid of the container process are still effective,
  ///even if they are not included in this list.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'supplementalGroups')
  List<int?>? supplementalGroups;

  ///Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported
  ///sysctls (by the container runtime) might fail to launch.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'sysctls')
  List<PurpleSysctl?>? sysctls;

  PurpleSecurityContext({
    this.fsGroup,
    this.fsGroupChangePolicy,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxOptions,
    this.supplementalGroups,
    this.sysctls,
  });

  factory PurpleSecurityContext.fromJson(Map<String, dynamic> json) =>
      _$PurpleSecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSecurityContextToJson(this);
}

@JsonSerializable()
class PurpleSeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  PurpleSeLinuxOptions({this.level, this.role, this.type, this.user});

  factory PurpleSeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$PurpleSeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSeLinuxOptionsToJson(this);
}

@JsonSerializable()
class PurpleSeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used.
  ///The profile must be preconfigured on the node to work.
  ///Must be a descending path, relative to the kubelet's configured seccomp profile location.
  ///Must be set if type is "Localhost". Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied.
  ///Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used.
  ///RuntimeDefault - the container runtime default profile should be used.
  ///Unconfined - no profile should be applied.
  @JsonKey(name: 'type')
  String type;

  PurpleSeccompProfile({this.localhostProfile, required this.type});

  factory PurpleSeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$PurpleSeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSeccompProfileToJson(this);
}

@JsonSerializable()
class PurpleSysctl {
  ///Name of a property to set
  @JsonKey(name: 'name')
  String name;

  ///Value of a property to set
  @JsonKey(name: 'value')
  String value;

  PurpleSysctl({required this.name, required this.value});

  factory PurpleSysctl.fromJson(Map<String, dynamic> json) =>
      _$PurpleSysctlFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleSysctlToJson(this);
}

@JsonSerializable()
class PurpleToleration {
  ///Effect indicates the taint effect to match. Empty means match all taint effects.
  ///When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
  @JsonKey(name: 'effect')
  String? effect;

  ///Key is the taint key that the toleration applies to. Empty means match all taint keys.
  ///If the key is empty, operator must be Exists; this combination means to match all values
  ///and all keys.
  @JsonKey(name: 'key')
  String? key;

  ///Operator represents a key's relationship to the value.
  ///Valid operators are Exists and Equal. Defaults to Equal.
  ///Exists is equivalent to wildcard for value, so that a pod can
  ///tolerate all taints of a particular category.
  @JsonKey(name: 'operator')
  String? tolerationOperator;

  ///TolerationSeconds represents the period of time the toleration (which must be
  ///of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default,
  ///it is not set, which means tolerate the taint forever (do not evict). Zero and
  ///negative values will be treated as 0 (evict immediately) by the system.
  @JsonKey(name: 'tolerationSeconds')
  int? tolerationSeconds;

  ///Value is the taint value the toleration matches to.
  ///If the operator is Exists, the value should be empty, otherwise just a regular string.
  @JsonKey(name: 'value')
  String? value;

  PurpleToleration({
    this.effect,
    this.key,
    this.tolerationOperator,
    this.tolerationSeconds,
    this.value,
  });

  factory PurpleToleration.fromJson(Map<String, dynamic> json) =>
      _$PurpleTolerationFromJson(json);

  Map<String, dynamic> toJson() => _$PurpleTolerationToJson(this);
}

@JsonSerializable()
class Ingress {
  ///This field configures the annotation `kubernetes.io/ingress.class` when
  ///creating Ingress resources to solve ACME challenges that use this
  ///challenge solver. Only one of `class`, `name` or `ingressClassName` may
  ///be specified.
  @JsonKey(name: 'class')
  String? ingressClass;

  ///This field configures the field `ingressClassName` on the created Ingress
  ///resources used to solve ACME challenges that use this challenge solver.
  ///This is the recommended way of configuring the ingress class. Only one of
  ///`class`, `name` or `ingressClassName` may be specified.
  @JsonKey(name: 'ingressClassName')
  String? ingressClassName;

  ///Optional ingress template used to configure the ACME challenge solver
  ///ingress used for HTTP01 challenges.
  @JsonKey(name: 'ingressTemplate')
  IngressTemplate? ingressTemplate;

  ///The name of the ingress resource that should have ACME challenge solving
  ///routes inserted into it in order to solve HTTP01 challenges.
  ///This is typically used in conjunction with ingress controllers like
  ///ingress-gce, which maintains a 1:1 mapping between external IPs and
  ///ingress resources. Only one of `class`, `name` or `ingressClassName` may
  ///be specified.
  @JsonKey(name: 'name')
  String? name;

  ///Optional pod template used to configure the ACME challenge solver pods
  ///used for HTTP01 challenges.
  @JsonKey(name: 'podTemplate')
  IngressPodTemplate? podTemplate;

  ///Optional service type for Kubernetes solver service. Supported values
  ///are NodePort or ClusterIP. If unset, defaults to NodePort.
  @JsonKey(name: 'serviceType')
  String? serviceType;

  Ingress({
    this.ingressClass,
    this.ingressClassName,
    this.ingressTemplate,
    this.name,
    this.podTemplate,
    this.serviceType,
  });

  factory Ingress.fromJson(Map<String, dynamic> json) =>
      _$IngressFromJson(json);

  Map<String, dynamic> toJson() => _$IngressToJson(this);
}

@JsonSerializable()
class IngressTemplate {
  ///ObjectMeta overrides for the ingress used to solve HTTP01 challenges.
  ///Only the 'labels' and 'annotations' fields may be set.
  ///If labels or annotations overlap with in-built values, the values here
  ///will override the in-built values.
  @JsonKey(name: 'metadata')
  IngressTemplateMetadata? metadata;

  IngressTemplate({this.metadata});

  factory IngressTemplate.fromJson(Map<String, dynamic> json) =>
      _$IngressTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$IngressTemplateToJson(this);
}

@JsonSerializable()
class IngressTemplateMetadata {
  ///Annotations that should be added to the created ACME HTTP01 solver ingress.
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Labels that should be added to the created ACME HTTP01 solver ingress.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  IngressTemplateMetadata({this.annotations, this.labels});

  factory IngressTemplateMetadata.fromJson(Map<String, dynamic> json) =>
      _$IngressTemplateMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$IngressTemplateMetadataToJson(this);
}

@JsonSerializable()
class IngressPodTemplate {
  ///ObjectMeta overrides for the pod used to solve HTTP01 challenges.
  ///Only the 'labels' and 'annotations' fields may be set.
  ///If labels or annotations overlap with in-built values, the values here
  ///will override the in-built values.
  @JsonKey(name: 'metadata')
  FluffyMetadata? metadata;

  ///PodSpec defines overrides for the HTTP01 challenge solver pod.
  ///Check ACMEChallengeSolverHTTP01IngressPodSpec to find out currently supported fields.
  ///All other fields will be ignored.
  @JsonKey(name: 'spec')
  FluffySpec? spec;

  IngressPodTemplate({this.metadata, this.spec});

  factory IngressPodTemplate.fromJson(Map<String, dynamic> json) =>
      _$IngressPodTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$IngressPodTemplateToJson(this);
}

@JsonSerializable()
class FluffyMetadata {
  ///Annotations that should be added to the created ACME HTTP01 solver pods.
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Labels that should be added to the created ACME HTTP01 solver pods.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  FluffyMetadata({this.annotations, this.labels});

  factory FluffyMetadata.fromJson(Map<String, dynamic> json) =>
      _$FluffyMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyMetadataToJson(this);
}

@JsonSerializable()
class FluffySpec {
  ///If specified, the pod's scheduling constraints
  @JsonKey(name: 'affinity')
  FluffyAffinity? affinity;

  ///If specified, the pod's imagePullSecrets
  @JsonKey(name: 'imagePullSecrets')
  List<FluffyImagePullSecret?>? imagePullSecrets;

  ///NodeSelector is a selector which must be true for the pod to fit on a node.
  ///Selector which must match a node's labels for the pod to be scheduled on that node.
  ///More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
  @JsonKey(name: 'nodeSelector')
  Map<String, String?>? nodeSelector;

  ///If specified, the pod's priorityClassName.
  @JsonKey(name: 'priorityClassName')
  String? priorityClassName;

  ///If specified, the pod's resource requirements.
  ///These values override the global resource configuration flags.
  ///Note that when only specifying resource limits, ensure they are greater than or equal
  ///to the corresponding global resource requests configured via controller flags
  ///(--acme-http01-solver-resource-request-cpu,
  ///--acme-http01-solver-resource-request-memory).
  ///Kubernetes will reject pod creation if limits are lower than requests, causing challenge
  ///failures.
  @JsonKey(name: 'resources')
  FluffyResources? resources;

  ///If specified, the pod's security context
  @JsonKey(name: 'securityContext')
  FluffySecurityContext? securityContext;

  ///If specified, the pod's service account
  @JsonKey(name: 'serviceAccountName')
  String? serviceAccountName;

  ///If specified, the pod's tolerations.
  @JsonKey(name: 'tolerations')
  List<FluffyToleration?>? tolerations;

  FluffySpec({
    this.affinity,
    this.imagePullSecrets,
    this.nodeSelector,
    this.priorityClassName,
    this.resources,
    this.securityContext,
    this.serviceAccountName,
    this.tolerations,
  });

  factory FluffySpec.fromJson(Map<String, dynamic> json) =>
      _$FluffySpecFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySpecToJson(this);
}

@JsonSerializable()
class FluffyAffinity {
  ///Describes node affinity scheduling rules for the pod.
  @JsonKey(name: 'nodeAffinity')
  FluffyNodeAffinity? nodeAffinity;

  ///Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone,
  ///etc. as some other pod(s)).
  @JsonKey(name: 'podAffinity')
  FluffyPodAffinity? podAffinity;

  ///Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same
  ///node, zone, etc. as some other pod(s)).
  @JsonKey(name: 'podAntiAffinity')
  FluffyPodAntiAffinity? podAntiAffinity;

  FluffyAffinity({this.nodeAffinity, this.podAffinity, this.podAntiAffinity});

  factory FluffyAffinity.fromJson(Map<String, dynamic> json) =>
      _$FluffyAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyAffinityToJson(this);
}

@JsonSerializable()
class FluffyNodeAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and adding
  ///"weight" to the sum if the node matches the corresponding matchExpressions; the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<StickyPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to an update), the system
  ///may or may not try to eventually evict the pod from its node.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  StickyRequiredDuringSchedulingIgnoredDuringExecution?
  requiredDuringSchedulingIgnoredDuringExecution;

  FluffyNodeAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory FluffyNodeAffinity.fromJson(Map<String, dynamic> json) =>
      _$FluffyNodeAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyNodeAffinityToJson(this);
}

@JsonSerializable()
class StickyPreferredDuringSchedulingIgnoredDuringExecution {
  ///A node selector term, associated with the corresponding weight.
  @JsonKey(name: 'preference')
  FluffyPreference preference;

  ///Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  StickyPreferredDuringSchedulingIgnoredDuringExecution({
    required this.preference,
    required this.weight,
  });

  factory StickyPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$StickyPreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StickyPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///A node selector term, associated with the corresponding weight.
@JsonSerializable()
class FluffyPreference {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<FriskyMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<TentacledMatchField?>? matchFields;

  FluffyPreference({this.matchExpressions, this.matchFields});

  factory FluffyPreference.fromJson(Map<String, dynamic> json) =>
      _$FluffyPreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPreferenceToJson(this);
}

@JsonSerializable()
class FriskyMatchExpression {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  FriskyMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory FriskyMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$FriskyMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$FriskyMatchExpressionToJson(this);
}

@JsonSerializable()
class TentacledMatchField {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  TentacledMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory TentacledMatchField.fromJson(Map<String, dynamic> json) =>
      _$TentacledMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledMatchFieldToJson(this);
}

@JsonSerializable()
class StickyRequiredDuringSchedulingIgnoredDuringExecution {
  ///Required. A list of node selector terms. The terms are ORed.
  @JsonKey(name: 'nodeSelectorTerms')
  List<FluffyNodeSelectorTerm?> nodeSelectorTerms;

  StickyRequiredDuringSchedulingIgnoredDuringExecution({
    required this.nodeSelectorTerms,
  });

  factory StickyRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$StickyRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StickyRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class FluffyNodeSelectorTerm {
  ///A list of node selector requirements by node's labels.
  @JsonKey(name: 'matchExpressions')
  List<MischievousMatchExpression?>? matchExpressions;

  ///A list of node selector requirements by node's fields.
  @JsonKey(name: 'matchFields')
  List<StickyMatchField?>? matchFields;

  FluffyNodeSelectorTerm({this.matchExpressions, this.matchFields});

  factory FluffyNodeSelectorTerm.fromJson(Map<String, dynamic> json) =>
      _$FluffyNodeSelectorTermFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyNodeSelectorTermToJson(this);
}

@JsonSerializable()
class MischievousMatchExpression {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  MischievousMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MischievousMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$MischievousMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$MischievousMatchExpressionToJson(this);
}

@JsonSerializable()
class StickyMatchField {
  ///The label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///Represents a key's relationship to a set of values.
  ///Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
  @JsonKey(name: 'operator')
  String matchFieldOperator;

  ///An array of string values. If the operator is In or NotIn,
  ///the values array must be non-empty. If the operator is Exists or DoesNotExist,
  ///the values array must be empty. If the operator is Gt or Lt, the values
  ///array must have a single element, which will be interpreted as an integer.
  ///This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  StickyMatchField({
    required this.key,
    required this.matchFieldOperator,
    this.values,
  });

  factory StickyMatchField.fromJson(Map<String, dynamic> json) =>
      _$StickyMatchFieldFromJson(json);

  Map<String, dynamic> toJson() => _$StickyMatchFieldToJson(this);
}

@JsonSerializable()
class FluffyPodAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and adding
  ///"weight" to the sum if the node has pods which matches the corresponding podAffinityTerm;
  ///the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<IndigoPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to a pod label update), the
  ///system may or may not try to eventually evict the pod from its node.
  ///When there are multiple elements, the lists of nodes corresponding to each
  ///podAffinityTerm are intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<IndigoRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  FluffyPodAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory FluffyPodAffinity.fromJson(Map<String, dynamic> json) =>
      _$FluffyPodAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPodAffinityToJson(this);
}

@JsonSerializable()
class IndigoPreferredDuringSchedulingIgnoredDuringExecution {
  ///Required. A pod affinity term, associated with the corresponding weight.
  @JsonKey(name: 'podAffinityTerm')
  TentacledPodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm,
  ///in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  IndigoPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory IndigoPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$IndigoPreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IndigoPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///Required. A pod affinity term, associated with the corresponding weight.
@JsonSerializable()
class TentacledPodAffinityTerm {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  IndigoLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  IndigoNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  TentacledPodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory TentacledPodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$TentacledPodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$TentacledPodAffinityTermToJson(this);
}

@JsonSerializable()
class IndigoLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<BraggadociousMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndigoLabelSelector({this.matchExpressions, this.matchLabels});

  factory IndigoLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$IndigoLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoLabelSelectorToJson(this);
}

@JsonSerializable()
class BraggadociousMatchExpression {
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

  BraggadociousMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory BraggadociousMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$BraggadociousMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$BraggadociousMatchExpressionToJson(this);
}

@JsonSerializable()
class IndigoNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression1?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndigoNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory IndigoNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$IndigoNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndigoNamespaceSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression1 {
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

  MatchExpression1({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression1.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression1FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression1ToJson(this);
}

@JsonSerializable()
class IndigoRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  IndecentLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  IndecentNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  IndigoRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory IndigoRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$IndigoRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IndigoRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class IndecentLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression2?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndecentLabelSelector({this.matchExpressions, this.matchLabels});

  factory IndecentLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$IndecentLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentLabelSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression2 {
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

  MatchExpression2({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression2.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression2FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression2ToJson(this);
}

@JsonSerializable()
class IndecentNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression3?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  IndecentNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory IndecentNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$IndecentNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$IndecentNamespaceSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression3 {
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

  MatchExpression3({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression3.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression3FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression3ToJson(this);
}

@JsonSerializable()
class FluffyPodAntiAffinity {
  ///The scheduler will prefer to schedule pods to nodes that satisfy
  ///the anti-affinity expressions specified by this field, but it may choose
  ///a node that violates one or more of the expressions. The node that is
  ///most preferred is the one with the greatest sum of weights, i.e.
  ///for each node that meets all of the scheduling requirements (resource
  ///request, requiredDuringScheduling anti-affinity expressions, etc.),
  ///compute a sum by iterating through the elements of this field and subtracting
  ///"weight" from the sum if the node has pods which matches the corresponding
  ///podAffinityTerm; the
  ///node(s) with the highest sum are the most preferred.
  @JsonKey(name: 'preferredDuringSchedulingIgnoredDuringExecution')
  List<IndecentPreferredDuringSchedulingIgnoredDuringExecution?>?
  preferredDuringSchedulingIgnoredDuringExecution;

  ///If the anti-affinity requirements specified by this field are not met at
  ///scheduling time, the pod will not be scheduled onto the node.
  ///If the anti-affinity requirements specified by this field cease to be met
  ///at some point during pod execution (e.g. due to a pod label update), the
  ///system may or may not try to eventually evict the pod from its node.
  ///When there are multiple elements, the lists of nodes corresponding to each
  ///podAffinityTerm are intersected, i.e. all terms must be satisfied.
  @JsonKey(name: 'requiredDuringSchedulingIgnoredDuringExecution')
  List<IndecentRequiredDuringSchedulingIgnoredDuringExecution?>?
  requiredDuringSchedulingIgnoredDuringExecution;

  FluffyPodAntiAffinity({
    this.preferredDuringSchedulingIgnoredDuringExecution,
    this.requiredDuringSchedulingIgnoredDuringExecution,
  });

  factory FluffyPodAntiAffinity.fromJson(Map<String, dynamic> json) =>
      _$FluffyPodAntiAffinityFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyPodAntiAffinityToJson(this);
}

@JsonSerializable()
class IndecentPreferredDuringSchedulingIgnoredDuringExecution {
  ///Required. A pod affinity term, associated with the corresponding weight.
  @JsonKey(name: 'podAffinityTerm')
  StickyPodAffinityTerm podAffinityTerm;

  ///weight associated with matching the corresponding podAffinityTerm,
  ///in the range 1-100.
  @JsonKey(name: 'weight')
  int weight;

  IndecentPreferredDuringSchedulingIgnoredDuringExecution({
    required this.podAffinityTerm,
    required this.weight,
  });

  factory IndecentPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$IndecentPreferredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IndecentPreferredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

///Required. A pod affinity term, associated with the corresponding weight.
@JsonSerializable()
class StickyPodAffinityTerm {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  HilariousLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  HilariousNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  StickyPodAffinityTerm({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory StickyPodAffinityTerm.fromJson(Map<String, dynamic> json) =>
      _$StickyPodAffinityTermFromJson(json);

  Map<String, dynamic> toJson() => _$StickyPodAffinityTermToJson(this);
}

@JsonSerializable()
class HilariousLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression4?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  HilariousLabelSelector({this.matchExpressions, this.matchLabels});

  factory HilariousLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$HilariousLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousLabelSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression4 {
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

  MatchExpression4({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression4.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression4FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression4ToJson(this);
}

@JsonSerializable()
class HilariousNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression5?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  HilariousNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory HilariousNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$HilariousNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$HilariousNamespaceSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression5 {
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

  MatchExpression5({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression5.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression5FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression5ToJson(this);
}

@JsonSerializable()
class IndecentRequiredDuringSchedulingIgnoredDuringExecution {
  ///A label query over a set of resources, in this case pods.
  ///If it's null, this PodAffinityTerm matches with no Pods.
  @JsonKey(name: 'labelSelector')
  AmbitiousLabelSelector? labelSelector;

  ///MatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key in
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both matchLabelKeys and labelSelector.
  ///Also, matchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'matchLabelKeys')
  List<String?>? matchLabelKeys;

  ///MismatchLabelKeys is a set of pod label keys to select which pods will
  ///be taken into consideration. The keys are used to lookup values from the
  ///incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin
  ///(value)`
  ///to select the group of existing pods which pods will be taken into consideration
  ///for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming
  ///pod labels will be ignored. The default value is empty.
  ///The same key is forbidden to exist in both mismatchLabelKeys and labelSelector.
  ///Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
  @JsonKey(name: 'mismatchLabelKeys')
  List<String?>? mismatchLabelKeys;

  ///namespaces specifies a static list of namespace names that the term applies to.
  ///The term is applied to the union of the namespaces listed in this field
  ///and the ones selected by namespaceSelector.
  ///null or empty namespaces list and null namespaceSelector means "this pod's namespace".
  @JsonKey(name: 'namespaces')
  List<String?>? namespaces;

  ///A label query over the set of namespaces that the term applies to.
  ///The term is applied to the union of the namespaces selected by this field
  ///and the ones listed in the namespaces field.
  ///null selector and null or empty namespaces list means "this pod's namespace".
  ///An empty selector ({}) matches all namespaces.
  @JsonKey(name: 'namespaceSelector')
  AmbitiousNamespaceSelector? namespaceSelector;

  ///This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods
  ///matching
  ///the labelSelector in the specified namespaces, where co-located is defined as running on
  ///a node
  ///whose value of the label with key topologyKey matches that of any node on which any of
  ///the
  ///selected pods is running.
  ///Empty topologyKey is not allowed.
  @JsonKey(name: 'topologyKey')
  String topologyKey;

  IndecentRequiredDuringSchedulingIgnoredDuringExecution({
    this.labelSelector,
    this.matchLabelKeys,
    this.mismatchLabelKeys,
    this.namespaces,
    this.namespaceSelector,
    required this.topologyKey,
  });

  factory IndecentRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
    Map<String, dynamic> json,
  ) => _$IndecentRequiredDuringSchedulingIgnoredDuringExecutionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IndecentRequiredDuringSchedulingIgnoredDuringExecutionToJson(this);
}

@JsonSerializable()
class AmbitiousLabelSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression6?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  AmbitiousLabelSelector({this.matchExpressions, this.matchLabels});

  factory AmbitiousLabelSelector.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousLabelSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousLabelSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression6 {
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

  MatchExpression6({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression6.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression6FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression6ToJson(this);
}

@JsonSerializable()
class AmbitiousNamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<MatchExpression7?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
  ///map is equivalent to an element of matchExpressions, whose key field is "key", the
  ///operator is "In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  AmbitiousNamespaceSelector({this.matchExpressions, this.matchLabels});

  factory AmbitiousNamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$AmbitiousNamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$AmbitiousNamespaceSelectorToJson(this);
}

@JsonSerializable()
class MatchExpression7 {
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

  MatchExpression7({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory MatchExpression7.fromJson(Map<String, dynamic> json) =>
      _$MatchExpression7FromJson(json);

  Map<String, dynamic> toJson() => _$MatchExpression7ToJson(this);
}

@JsonSerializable()
class FluffyImagePullSecret {
  ///Name of the referent.
  ///This field is effectively required, but due to backwards compatibility is
  ///allowed to be empty. Instances of this type with an empty value here are
  ///almost certainly wrong.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String? name;

  FluffyImagePullSecret({this.name});

  factory FluffyImagePullSecret.fromJson(Map<String, dynamic> json) =>
      _$FluffyImagePullSecretFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyImagePullSecretToJson(this);
}

@JsonSerializable()
class FluffyResources {
  ///Limits describes the maximum amount of compute resources allowed.
  ///More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'limits')
  Map<String, dynamic>? limits;

  ///Requests describes the minimum amount of compute resources required.
  ///If Requests is omitted for a container, it defaults to Limits if that is explicitly
  ///specified,
  ///otherwise to the global values configured via controller flags. Requests cannot exceed
  ///Limits.
  ///More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
  @JsonKey(name: 'requests')
  Map<String, dynamic>? requests;

  FluffyResources({this.limits, this.requests});

  factory FluffyResources.fromJson(Map<String, dynamic> json) =>
      _$FluffyResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyResourcesToJson(this);
}

@JsonSerializable()
class FluffySecurityContext {
  ///A special supplemental group that applies to all containers in a pod.
  ///Some volume types allow the Kubelet to change the ownership of that volume
  ///to be owned by the pod:
  ///
  ///1. The owning GID will be the FSGroup
  ///2. The setgid bit is set (new files created in the volume will be owned by FSGroup)
  ///3. The permission bits are OR'd with rw-rw----
  ///
  ///If unset, the Kubelet will not modify the ownership and permissions of any volume.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'fsGroup')
  int? fsGroup;

  ///fsGroupChangePolicy defines behavior of changing ownership and permission of the volume
  ///before being exposed inside Pod. This field will only apply to
  ///volume types which support fsGroup based ownership(and permissions).
  ///It will have no effect on ephemeral volume types such as: secret, configmaps
  ///and emptydir.
  ///Valid values are "OnRootMismatch" and "Always". If not specified, "Always" is used.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'fsGroupChangePolicy')
  String? fsGroupChangePolicy;

  ///The GID to run the entrypoint of the container process.
  ///Uses runtime default if unset.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence
  ///for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsGroup')
  int? runAsGroup;

  ///Indicates that the container must run as a non-root user.
  ///If true, the Kubelet will validate the image at runtime to ensure that it
  ///does not run as UID 0 (root) and fail to start the container if it does.
  ///If unset or false, no such validation will be performed.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence.
  @JsonKey(name: 'runAsNonRoot')
  bool? runAsNonRoot;

  ///The UID to run the entrypoint of the container process.
  ///Defaults to user specified in image metadata if unspecified.
  ///May also be set in SecurityContext.  If set in both SecurityContext and
  ///PodSecurityContext, the value specified in SecurityContext takes precedence
  ///for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'runAsUser')
  int? runAsUser;

  ///The seccomp options to use by the containers in this pod.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'seccompProfile')
  FluffySeccompProfile? seccompProfile;

  ///The SELinux context to be applied to all containers.
  ///If unspecified, the container runtime will allocate a random SELinux context for each
  ///container.  May also be set in SecurityContext.  If set in
  ///both SecurityContext and PodSecurityContext, the value specified in SecurityContext
  ///takes precedence for that container.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'seLinuxOptions')
  FluffySeLinuxOptions? seLinuxOptions;

  ///A list of groups applied to the first process run in each container, in addition
  ///to the container's primary GID, the fsGroup (if specified), and group memberships
  ///defined in the container image for the uid of the container process. If unspecified,
  ///no additional groups are added to any container. Note that group memberships
  ///defined in the container image for the uid of the container process are still effective,
  ///even if they are not included in this list.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'supplementalGroups')
  List<int?>? supplementalGroups;

  ///Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported
  ///sysctls (by the container runtime) might fail to launch.
  ///Note that this field cannot be set when spec.os.name is windows.
  @JsonKey(name: 'sysctls')
  List<FluffySysctl?>? sysctls;

  FluffySecurityContext({
    this.fsGroup,
    this.fsGroupChangePolicy,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seccompProfile,
    this.seLinuxOptions,
    this.supplementalGroups,
    this.sysctls,
  });

  factory FluffySecurityContext.fromJson(Map<String, dynamic> json) =>
      _$FluffySecurityContextFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySecurityContextToJson(this);
}

@JsonSerializable()
class FluffySeLinuxOptions {
  ///Level is SELinux level label that applies to the container.
  @JsonKey(name: 'level')
  String? level;

  ///Role is a SELinux role label that applies to the container.
  @JsonKey(name: 'role')
  String? role;

  ///Type is a SELinux type label that applies to the container.
  @JsonKey(name: 'type')
  String? type;

  ///User is a SELinux user label that applies to the container.
  @JsonKey(name: 'user')
  String? user;

  FluffySeLinuxOptions({this.level, this.role, this.type, this.user});

  factory FluffySeLinuxOptions.fromJson(Map<String, dynamic> json) =>
      _$FluffySeLinuxOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySeLinuxOptionsToJson(this);
}

@JsonSerializable()
class FluffySeccompProfile {
  ///localhostProfile indicates a profile defined in a file on the node should be used.
  ///The profile must be preconfigured on the node to work.
  ///Must be a descending path, relative to the kubelet's configured seccomp profile location.
  ///Must be set if type is "Localhost". Must NOT be set for any other type.
  @JsonKey(name: 'localhostProfile')
  String? localhostProfile;

  ///type indicates which kind of seccomp profile will be applied.
  ///Valid options are:
  ///
  ///Localhost - a profile defined in a file on the node should be used.
  ///RuntimeDefault - the container runtime default profile should be used.
  ///Unconfined - no profile should be applied.
  @JsonKey(name: 'type')
  String type;

  FluffySeccompProfile({this.localhostProfile, required this.type});

  factory FluffySeccompProfile.fromJson(Map<String, dynamic> json) =>
      _$FluffySeccompProfileFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySeccompProfileToJson(this);
}

@JsonSerializable()
class FluffySysctl {
  ///Name of a property to set
  @JsonKey(name: 'name')
  String name;

  ///Value of a property to set
  @JsonKey(name: 'value')
  String value;

  FluffySysctl({required this.name, required this.value});

  factory FluffySysctl.fromJson(Map<String, dynamic> json) =>
      _$FluffySysctlFromJson(json);

  Map<String, dynamic> toJson() => _$FluffySysctlToJson(this);
}

@JsonSerializable()
class FluffyToleration {
  ///Effect indicates the taint effect to match. Empty means match all taint effects.
  ///When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
  @JsonKey(name: 'effect')
  String? effect;

  ///Key is the taint key that the toleration applies to. Empty means match all taint keys.
  ///If the key is empty, operator must be Exists; this combination means to match all values
  ///and all keys.
  @JsonKey(name: 'key')
  String? key;

  ///Operator represents a key's relationship to the value.
  ///Valid operators are Exists and Equal. Defaults to Equal.
  ///Exists is equivalent to wildcard for value, so that a pod can
  ///tolerate all taints of a particular category.
  @JsonKey(name: 'operator')
  String? tolerationOperator;

  ///TolerationSeconds represents the period of time the toleration (which must be
  ///of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default,
  ///it is not set, which means tolerate the taint forever (do not evict). Zero and
  ///negative values will be treated as 0 (evict immediately) by the system.
  @JsonKey(name: 'tolerationSeconds')
  int? tolerationSeconds;

  ///Value is the taint value the toleration matches to.
  ///If the operator is Exists, the value should be empty, otherwise just a regular string.
  @JsonKey(name: 'value')
  String? value;

  FluffyToleration({
    this.effect,
    this.key,
    this.tolerationOperator,
    this.tolerationSeconds,
    this.value,
  });

  factory FluffyToleration.fromJson(Map<String, dynamic> json) =>
      _$FluffyTolerationFromJson(json);

  Map<String, dynamic> toJson() => _$FluffyTolerationToJson(this);
}

@JsonSerializable()
class Selector {
  ///List of DNSNames that this solver will be used to solve.
  ///If specified and a match is found, a dnsNames selector will take
  ///precedence over a dnsZones selector.
  ///If multiple solvers match with the same dnsNames value, the solver
  ///with the most matching labels in matchLabels will be selected.
  ///If neither has more matches, the solver defined earlier in the list
  ///will be selected.
  @JsonKey(name: 'dnsNames')
  List<String?>? dnsNames;

  ///List of DNSZones that this solver will be used to solve.
  ///The most specific DNS zone match specified here will take precedence
  ///over other DNS zone matches, so a solver specifying sys.example.com
  ///will be selected over one specifying example.com for the domain
  ///www.sys.example.com.
  ///If multiple solvers match with the same dnsZones value, the solver
  ///with the most matching labels in matchLabels will be selected.
  ///If neither has more matches, the solver defined earlier in the list
  ///will be selected.
  @JsonKey(name: 'dnsZones')
  List<String?>? dnsZones;

  ///A label selector that is used to refine the set of certificate's that
  ///this challenge solver will apply to.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  Selector({this.dnsNames, this.dnsZones, this.matchLabels});

  factory Selector.fromJson(Map<String, dynamic> json) =>
      _$SelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorToJson(this);
}

///The type of ACME challenge this resource represents.
///One of "HTTP-01" or "DNS-01".
enum Type {
  @JsonValue('DNS-01')
  DNS_01,
  @JsonValue('HTTP-01')
  HTTP_01,
}

final typeValues = EnumValues({'DNS-01': Type.DNS_01, 'HTTP-01': Type.HTTP_01});

@JsonSerializable()
class Status {
  ///presented will be set to true if the challenge values for this challenge
  ///are currently 'presented'.
  ///This *does not* imply the self check is passing. Only that the values
  ///have been 'submitted' for the appropriate challenge mechanism (i.e. the
  ///DNS01 TXT record has been presented, or the HTTP01 configuration has been
  ///configured).
  @JsonKey(name: 'presented')
  bool? presented;

  ///Used to denote whether this challenge should be processed or not.
  ///This field will only be set to true by the 'scheduling' component.
  ///It will only be set to false by the 'challenges' controller, after the
  ///challenge has reached a final state or timed out.
  ///If this field is set to false, the challenge controller will not take
  ///any more action.
  @JsonKey(name: 'processing')
  bool? processing;

  ///Contains human readable information on why the Challenge is in the
  ///current state.
  @JsonKey(name: 'reason')
  String? reason;

  ///Contains the current 'state' of the challenge.
  ///If not set, the state of the challenge is unknown.
  @JsonKey(name: 'state')
  State? state;

  Status({this.presented, this.processing, this.reason, this.state});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

///Contains the current 'state' of the challenge.
///If not set, the state of the challenge is unknown.
enum State {
  @JsonValue('errored')
  ERRORED,
  @JsonValue('expired')
  EXPIRED,
  @JsonValue('invalid')
  INVALID,
  @JsonValue('pending')
  PENDING,
  @JsonValue('processing')
  PROCESSING,
  @JsonValue('ready')
  READY,
  @JsonValue('valid')
  VALID,
}

final stateValues = EnumValues({
  'errored': State.ERRORED,
  'expired': State.EXPIRED,
  'invalid': State.INVALID,
  'pending': State.PENDING,
  'processing': State.PROCESSING,
  'ready': State.READY,
  'valid': State.VALID,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ChallengelistAcmeV1Kind {
  @JsonValue('ChallengeList')
  CHALLENGE_LIST,
}

final challengelistAcmeV1KindValues = EnumValues({
  'ChallengeList': ChallengelistAcmeV1Kind.CHALLENGE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ChallengelistAcmeV1Metadata {
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

  ChallengelistAcmeV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ChallengelistAcmeV1Metadata.fromJson(Map<String, dynamic> json) =>
      _$ChallengelistAcmeV1MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengelistAcmeV1MetadataToJson(this);
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
