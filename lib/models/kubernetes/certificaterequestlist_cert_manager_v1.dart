import 'package:json_annotation/json_annotation.dart';

part 'certificaterequestlist_cert_manager_v1.g.dart';

///CertificateRequestList is a list of CertificateRequest
@JsonSerializable()
class CertificaterequestlistCertManagerV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of certificaterequests. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  CertificaterequestlistCertManagerV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  CertificaterequestlistCertManagerV1Metadata? metadata;

  CertificaterequestlistCertManagerV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory CertificaterequestlistCertManagerV1.fromJson(
    Map<String, dynamic> json,
  ) => _$CertificaterequestlistCertManagerV1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$CertificaterequestlistCertManagerV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('cert-manager.io/v1')
  CERT_MANAGER_IO_V1,
}

final apiVersionValues = EnumValues({
  'cert-manager.io/v1': ApiVersion.CERT_MANAGER_IO_V1,
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

  ///Specification of the desired state of the CertificateRequest resource.
  ///
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
  @JsonKey(name: 'spec')
  Spec? spec;

  ///Status of the CertificateRequest.
  ///This is set and managed automatically.
  ///Read-only.
  ///More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
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
  @JsonValue('CertificateRequest')
  CERTIFICATE_REQUEST,
}

final itemKindValues = EnumValues({
  'CertificateRequest': ItemKind.CERTIFICATE_REQUEST,
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
  ///Requested 'duration' (i.e. lifetime) of the Certificate. Note that the
  ///issuer may choose to ignore the requested duration, just like any other
  ///requested attribute.
  @JsonKey(name: 'duration')
  String? duration;

  ///Extra contains extra attributes of the user that created the CertificateRequest.
  ///Populated by the cert-manager webhook on creation and immutable.
  @JsonKey(name: 'extra')
  Map<String, List<String?>?>? extra;

  ///Groups contains group membership of the user that created the CertificateRequest.
  ///Populated by the cert-manager webhook on creation and immutable.
  @JsonKey(name: 'groups')
  List<String?>? groups;

  ///Requested basic constraints isCA value. Note that the issuer may choose
  ///to ignore the requested isCA value, just like any other requested attribute.
  ///
  ///NOTE: If the CSR in the `Request` field has a BasicConstraints extension,
  ///it must have the same isCA value as specified here.
  ///
  ///If true, this will automatically add the `cert sign` usage to the list
  ///of requested `usages`.
  @JsonKey(name: 'isCA')
  bool? isCa;

  ///Reference to the issuer responsible for issuing the certificate.
  ///If the issuer is namespace-scoped, it must be in the same namespace
  ///as the Certificate. If the issuer is cluster-scoped, it can be used
  ///from any namespace.
  ///
  ///The `name` field of the reference must always be specified.
  @JsonKey(name: 'issuerRef')
  IssuerRef issuerRef;

  ///The PEM-encoded X.509 certificate signing request to be submitted to the
  ///issuer for signing.
  ///
  ///If the CSR has a BasicConstraints extension, its isCA attribute must
  ///match the `isCA` value of this CertificateRequest.
  ///If the CSR has a KeyUsage extension, its key usages must match the
  ///key usages in the `usages` field of this CertificateRequest.
  ///If the CSR has a ExtKeyUsage extension, its extended key usages
  ///must match the extended key usages in the `usages` field of this
  ///CertificateRequest.
  @JsonKey(name: 'request')
  String request;

  ///UID contains the uid of the user that created the CertificateRequest.
  ///Populated by the cert-manager webhook on creation and immutable.
  @JsonKey(name: 'uid')
  String? uid;

  ///Requested key usages and extended key usages.
  ///
  ///NOTE: If the CSR in the `Request` field has uses the KeyUsage or
  ///ExtKeyUsage extension, these extensions must have the same values
  ///as specified here without any additional values.
  ///
  ///If unset, defaults to `digital signature` and `key encipherment`.
  @JsonKey(name: 'usages')
  List<Usage>? usages;

  ///Username contains the name of the user that created the CertificateRequest.
  ///Populated by the cert-manager webhook on creation and immutable.
  @JsonKey(name: 'username')
  String? username;

  Spec({
    this.duration,
    this.extra,
    this.groups,
    this.isCa,
    required this.issuerRef,
    required this.request,
    this.uid,
    this.usages,
    this.username,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

///Reference to the issuer responsible for issuing the certificate.
///If the issuer is namespace-scoped, it must be in the same namespace
///as the Certificate. If the issuer is cluster-scoped, it can be used
///from any namespace.
///
///The `name` field of the reference must always be specified.
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

///KeyUsage specifies valid usage contexts for keys.
///See:
///https://tools.ietf.org/html/rfc5280#section-4.2.1.3
///https://tools.ietf.org/html/rfc5280#section-4.2.1.12
///
///Valid KeyUsage values are as follows:
///"signing",
///"digital signature",
///"content commitment",
///"key encipherment",
///"key agreement",
///"data encipherment",
///"cert sign",
///"crl sign",
///"encipher only",
///"decipher only",
///"any",
///"server auth",
///"client auth",
///"code signing",
///"email protection",
///"s/mime",
///"ipsec end system",
///"ipsec tunnel",
///"ipsec user",
///"timestamping",
///"ocsp signing",
///"microsoft sgc",
///"netscape sgc"
enum Usage {
  @JsonValue('any')
  ANY,
  @JsonValue('cert sign')
  CERT_SIGN,
  @JsonValue('client auth')
  CLIENT_AUTH,
  @JsonValue('code signing')
  CODE_SIGNING,
  @JsonValue('content commitment')
  CONTENT_COMMITMENT,
  @JsonValue('crl sign')
  CRL_SIGN,
  @JsonValue('data encipherment')
  DATA_ENCIPHERMENT,
  @JsonValue('decipher only')
  DECIPHER_ONLY,
  @JsonValue('digital signature')
  DIGITAL_SIGNATURE,
  @JsonValue('email protection')
  EMAIL_PROTECTION,
  @JsonValue('encipher only')
  ENCIPHER_ONLY,
  @JsonValue('ipsec end system')
  IPSEC_END_SYSTEM,
  @JsonValue('ipsec tunnel')
  IPSEC_TUNNEL,
  @JsonValue('ipsec user')
  IPSEC_USER,
  @JsonValue('key agreement')
  KEY_AGREEMENT,
  @JsonValue('key encipherment')
  KEY_ENCIPHERMENT,
  @JsonValue('microsoft sgc')
  MICROSOFT_SGC,
  @JsonValue('netscape sgc')
  NETSCAPE_SGC,
  @JsonValue('ocsp signing')
  OCSP_SIGNING,
  @JsonValue('server auth')
  SERVER_AUTH,
  @JsonValue('signing')
  SIGNING,
  @JsonValue('s/mime')
  S_MIME,
  @JsonValue('timestamping')
  TIMESTAMPING,
}

final usageValues = EnumValues({
  'any': Usage.ANY,
  'cert sign': Usage.CERT_SIGN,
  'client auth': Usage.CLIENT_AUTH,
  'code signing': Usage.CODE_SIGNING,
  'content commitment': Usage.CONTENT_COMMITMENT,
  'crl sign': Usage.CRL_SIGN,
  'data encipherment': Usage.DATA_ENCIPHERMENT,
  'decipher only': Usage.DECIPHER_ONLY,
  'digital signature': Usage.DIGITAL_SIGNATURE,
  'email protection': Usage.EMAIL_PROTECTION,
  'encipher only': Usage.ENCIPHER_ONLY,
  'ipsec end system': Usage.IPSEC_END_SYSTEM,
  'ipsec tunnel': Usage.IPSEC_TUNNEL,
  'ipsec user': Usage.IPSEC_USER,
  'key agreement': Usage.KEY_AGREEMENT,
  'key encipherment': Usage.KEY_ENCIPHERMENT,
  'microsoft sgc': Usage.MICROSOFT_SGC,
  'netscape sgc': Usage.NETSCAPE_SGC,
  'ocsp signing': Usage.OCSP_SIGNING,
  'server auth': Usage.SERVER_AUTH,
  'signing': Usage.SIGNING,
  's/mime': Usage.S_MIME,
  'timestamping': Usage.TIMESTAMPING,
});

@JsonSerializable()
class StatusClass {
  ///The PEM encoded X.509 certificate of the signer, also known as the CA
  ///(Certificate Authority).
  ///This is set on a best-effort basis by different issuers.
  ///If not set, the CA is assumed to be unknown/not available.
  @JsonKey(name: 'ca')
  String? ca;

  ///The PEM encoded X.509 certificate resulting from the certificate
  ///signing request.
  ///If not set, the CertificateRequest has either not been completed or has
  ///failed. More information on failure can be found by checking the
  ///`conditions` field.
  @JsonKey(name: 'certificate')
  String? certificate;

  ///List of status conditions to indicate the status of a CertificateRequest.
  ///Known condition types are `Ready`, `InvalidRequest`, `Approved` and `Denied`.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///FailureTime stores the time that this CertificateRequest failed. This is
  ///used to influence garbage collection and back-off.
  @JsonKey(name: 'failureTime')
  DateTime? failureTime;

  StatusClass({this.ca, this.certificate, this.conditions, this.failureTime});

  factory StatusClass.fromJson(Map<String, dynamic> json) =>
      _$StatusClassFromJson(json);

  Map<String, dynamic> toJson() => _$StatusClassToJson(this);
}

@JsonSerializable()
class Condition {
  ///LastTransitionTime is the timestamp corresponding to the last status
  ///change of this condition.
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  ///Message is a human readable description of the details of the last
  ///transition, complementing reason.
  @JsonKey(name: 'message')
  String? message;

  ///Reason is a brief machine readable explanation for the condition's last
  ///transition.
  @JsonKey(name: 'reason')
  String? reason;

  ///Status of the condition, one of (`True`, `False`, `Unknown`).
  @JsonKey(name: 'status')
  StatusEnum status;

  ///Type of the condition, known values are (`Ready`, `InvalidRequest`,
  ///`Approved`, `Denied`).
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

///Status of the condition, one of (`True`, `False`, `Unknown`).
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

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum CertificaterequestlistCertManagerV1Kind {
  @JsonValue('CertificateRequestList')
  CERTIFICATE_REQUEST_LIST,
}

final certificaterequestlistCertManagerV1KindValues = EnumValues({
  'CertificateRequestList':
      CertificaterequestlistCertManagerV1Kind.CERTIFICATE_REQUEST_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class CertificaterequestlistCertManagerV1Metadata {
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

  CertificaterequestlistCertManagerV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory CertificaterequestlistCertManagerV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$CertificaterequestlistCertManagerV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CertificaterequestlistCertManagerV1MetadataToJson(this);
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
