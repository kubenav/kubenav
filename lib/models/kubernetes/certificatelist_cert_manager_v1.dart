import 'package:json_annotation/json_annotation.dart';

part 'certificatelist_cert_manager_v1.g.dart';

///CertificateList is a list of Certificate
@JsonSerializable()
class CertificatelistCertManagerV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of certificates. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  CertificatelistCertManagerV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  CertificatelistCertManagerV1Metadata? metadata;

  CertificatelistCertManagerV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory CertificatelistCertManagerV1.fromJson(Map<String, dynamic> json) =>
      _$CertificatelistCertManagerV1FromJson(json);

  Map<String, dynamic> toJson() => _$CertificatelistCertManagerV1ToJson(this);
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

  ///Specification of the desired state of the Certificate resource.
  ///
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
  @JsonKey(name: 'spec')
  Spec? spec;

  ///Status of the Certificate.
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
  @JsonValue('Certificate')
  CERTIFICATE,
}

final itemKindValues = EnumValues({'Certificate': ItemKind.CERTIFICATE});

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
  ///Defines extra output formats of the private key and signed certificate chain
  ///to be written to this Certificate's target Secret.
  @JsonKey(name: 'additionalOutputFormats')
  List<AdditionalOutputFormat?>? additionalOutputFormats;

  ///Requested common name X509 certificate subject attribute.
  ///More info: https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6
  ///NOTE: TLS clients will ignore this value when any subject alternative name is
  ///set (see https://tools.ietf.org/html/rfc6125#section-6.4.4).
  ///
  ///Should have a length of 64 characters or fewer to avoid generating invalid CSRs.
  ///Cannot be set if the `literalSubject` field is set.
  @JsonKey(name: 'commonName')
  String? commonName;

  ///Requested DNS subject alternative names.
  @JsonKey(name: 'dnsNames')
  List<String?>? dnsNames;

  ///Requested 'duration' (i.e. lifetime) of the Certificate. Note that the
  ///issuer may choose to ignore the requested duration, just like any other
  ///requested attribute.
  ///
  ///If unset, this defaults to 90 days.
  ///Minimum accepted duration is 1 hour.
  ///Value must be in units accepted by Go time.ParseDuration
  ///https://golang.org/pkg/time/#ParseDuration.
  @JsonKey(name: 'duration')
  String? duration;

  ///Requested email subject alternative names.
  @JsonKey(name: 'emailAddresses')
  List<String?>? emailAddresses;

  ///Whether the KeyUsage and ExtKeyUsage extensions should be set in the encoded CSR.
  ///
  ///This option defaults to true, and should only be disabled if the target
  ///issuer does not support CSRs with these X509 KeyUsage/ ExtKeyUsage extensions.
  @JsonKey(name: 'encodeUsagesInRequest')
  bool? encodeUsagesInRequest;

  ///Requested IP address subject alternative names.
  @JsonKey(name: 'ipAddresses')
  List<String?>? ipAddresses;

  ///Requested basic constraints isCA value.
  ///The isCA value is used to set the `isCA` field on the created CertificateRequest
  ///resources. Note that the issuer may choose to ignore the requested isCA value, just
  ///like any other requested attribute.
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

  ///Additional keystore output formats to be stored in the Certificate's Secret.
  @JsonKey(name: 'keystores')
  Keystores? keystores;

  ///Requested X.509 certificate subject, represented using the LDAP "String
  ///Representation of a Distinguished Name" [1].
  ///Important: the LDAP string format also specifies the order of the attributes
  ///in the subject, this is important when issuing certs for LDAP authentication.
  ///Example: `CN=foo,DC=corp,DC=example,DC=com`
  ///More info [1]: https://datatracker.ietf.org/doc/html/rfc4514
  ///More info: https://github.com/cert-manager/cert-manager/issues/3203
  ///More info: https://github.com/cert-manager/cert-manager/issues/4424
  ///
  ///Cannot be set if the `subject` or `commonName` field is set.
  @JsonKey(name: 'literalSubject')
  String? literalSubject;

  ///x.509 certificate NameConstraint extension which MUST NOT be used in a non-CA
  ///certificate.
  ///More Info: https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.10
  ///
  ///This is an Alpha Feature and is only enabled with the
  ///`--feature-gates=NameConstraints=true` option set on both
  ///the controller and webhook components.
  @JsonKey(name: 'nameConstraints')
  NameConstraints? nameConstraints;

  ///`otherNames` is an escape hatch for SAN that allows any type. We currently restrict the
  ///support to string like otherNames, cf RFC 5280 p 37
  ///Any UTF8 String valued otherName can be passed with by setting the keys oid: x.x.x.x and
  ///UTF8Value: somevalue for `otherName`.
  ///Most commonly this would be UPN set with oid: 1.3.6.1.4.1.311.20.2.3
  ///You should ensure that any OID passed is valid for the UTF8String type as we do not
  ///explicitly validate this.
  @JsonKey(name: 'otherNames')
  List<OtherName?>? otherNames;

  ///Private key options. These include the key algorithm and size, the used
  ///encoding and the rotation policy.
  @JsonKey(name: 'privateKey')
  PrivateKey? privateKey;

  ///How long before the currently issued certificate's expiry cert-manager should
  ///renew the certificate. For example, if a certificate is valid for 60 minutes,
  ///and `renewBefore=10m`, cert-manager will begin to attempt to renew the certificate
  ///50 minutes after it was issued (i.e. when there are 10 minutes remaining until
  ///the certificate is no longer valid).
  ///
  ///NOTE: The actual lifetime of the issued certificate is used to determine the
  ///renewal time. If an issuer returns a certificate with a different lifetime than
  ///the one requested, cert-manager will use the lifetime of the issued certificate.
  ///
  ///If unset, this defaults to 1/3 of the issued certificate's lifetime.
  ///Minimum accepted value is 5 minutes.
  ///Value must be in units accepted by Go time.ParseDuration
  ///https://golang.org/pkg/time/#ParseDuration.
  ///Cannot be set if the `renewBeforePercentage` field is set.
  @JsonKey(name: 'renewBefore')
  String? renewBefore;

  ///`renewBeforePercentage` is like `renewBefore`, except it is a relative percentage
  ///rather than an absolute duration. For example, if a certificate is valid for 60
  ///minutes, and  `renewBeforePercentage=25`, cert-manager will begin to attempt to
  ///renew the certificate 45 minutes after it was issued (i.e. when there are 15
  ///minutes (25%) remaining until the certificate is no longer valid).
  ///
  ///NOTE: The actual lifetime of the issued certificate is used to determine the
  ///renewal time. If an issuer returns a certificate with a different lifetime than
  ///the one requested, cert-manager will use the lifetime of the issued certificate.
  ///
  ///Value must be an integer in the range (0,100). The minimum effective
  ///`renewBefore` derived from the `renewBeforePercentage` and `duration` fields is 5
  ///minutes.
  ///Cannot be set if the `renewBefore` field is set.
  @JsonKey(name: 'renewBeforePercentage')
  int? renewBeforePercentage;

  ///The maximum number of CertificateRequest revisions that are maintained in
  ///the Certificate's history. Each revision represents a single `CertificateRequest`
  ///created by this Certificate, either when it was created, renewed, or Spec
  ///was changed. Revisions will be removed by oldest first if the number of
  ///revisions exceeds this number.
  ///
  ///If set, revisionHistoryLimit must be a value of `1` or greater.
  ///Default value is `1`.
  @JsonKey(name: 'revisionHistoryLimit')
  int? revisionHistoryLimit;

  ///Name of the Secret resource that will be automatically created and
  ///managed by this Certificate resource. It will be populated with a
  ///private key and certificate, signed by the denoted issuer. The Secret
  ///resource lives in the same namespace as the Certificate resource.
  @JsonKey(name: 'secretName')
  String secretName;

  ///Defines annotations and labels to be copied to the Certificate's Secret.
  ///Labels and annotations on the Secret will be changed as they appear on the
  ///SecretTemplate when added or removed. SecretTemplate annotations are added
  ///in conjunction with, and cannot overwrite, the base set of annotations
  ///cert-manager sets on the Certificate's Secret.
  @JsonKey(name: 'secretTemplate')
  SecretTemplate? secretTemplate;

  ///Signature algorithm to use.
  ///Allowed values for RSA keys: SHA256WithRSA, SHA384WithRSA, SHA512WithRSA.
  ///Allowed values for ECDSA keys: ECDSAWithSHA256, ECDSAWithSHA384, ECDSAWithSHA512.
  ///Allowed values for Ed25519 keys: PureEd25519.
  @JsonKey(name: 'signatureAlgorithm')
  SignatureAlgorithm? signatureAlgorithm;

  ///Requested set of X509 certificate subject attributes.
  ///More info: https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6
  ///
  ///The common name attribute is specified separately in the `commonName` field.
  ///Cannot be set if the `literalSubject` field is set.
  @JsonKey(name: 'subject')
  Subject? subject;

  ///Requested URI subject alternative names.
  @JsonKey(name: 'uris')
  List<String?>? uris;

  ///Requested key usages and extended key usages.
  ///These usages are used to set the `usages` field on the created CertificateRequest
  ///resources. If `encodeUsagesInRequest` is unset or set to `true`, the usages
  ///will additionally be encoded in the `request` field which contains the CSR blob.
  ///
  ///If unset, defaults to `digital signature` and `key encipherment`.
  @JsonKey(name: 'usages')
  List<Usage>? usages;

  Spec({
    this.additionalOutputFormats,
    this.commonName,
    this.dnsNames,
    this.duration,
    this.emailAddresses,
    this.encodeUsagesInRequest,
    this.ipAddresses,
    this.isCa,
    required this.issuerRef,
    this.keystores,
    this.literalSubject,
    this.nameConstraints,
    this.otherNames,
    this.privateKey,
    this.renewBefore,
    this.renewBeforePercentage,
    this.revisionHistoryLimit,
    required this.secretName,
    this.secretTemplate,
    this.signatureAlgorithm,
    this.subject,
    this.uris,
    this.usages,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class AdditionalOutputFormat {
  ///Type is the name of the format type that should be written to the
  ///Certificate's target Secret.
  @JsonKey(name: 'type')
  Type type;

  AdditionalOutputFormat({required this.type});

  factory AdditionalOutputFormat.fromJson(Map<String, dynamic> json) =>
      _$AdditionalOutputFormatFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalOutputFormatToJson(this);
}

///Type is the name of the format type that should be written to the
///Certificate's target Secret.
enum Type {
  @JsonValue('CombinedPEM')
  COMBINED_PEM,
  @JsonValue('DER')
  DER,
}

final typeValues = EnumValues({
  'CombinedPEM': Type.COMBINED_PEM,
  'DER': Type.DER,
});

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

@JsonSerializable()
class Keystores {
  ///JKS configures options for storing a JKS keystore in the
  ///`spec.secretName` Secret resource.
  @JsonKey(name: 'jks')
  Jks? jks;

  ///PKCS12 configures options for storing a PKCS12 keystore in the
  ///`spec.secretName` Secret resource.
  @JsonKey(name: 'pkcs12')
  Pkcs12? pkcs12;

  Keystores({this.jks, this.pkcs12});

  factory Keystores.fromJson(Map<String, dynamic> json) =>
      _$KeystoresFromJson(json);

  Map<String, dynamic> toJson() => _$KeystoresToJson(this);
}

@JsonSerializable()
class Jks {
  ///Alias specifies the alias of the key in the keystore, required by the JKS format.
  ///If not provided, the default alias `certificate` will be used.
  @JsonKey(name: 'alias')
  String? alias;

  ///Create enables JKS keystore creation for the Certificate.
  ///If true, a file named `keystore.jks` will be created in the target
  ///Secret resource, encrypted using the password stored in
  ///`passwordSecretRef` or `password`.
  ///The keystore file will be updated immediately.
  ///If the issuer provided a CA certificate, a file named `truststore.jks`
  ///will also be created in the target Secret resource, encrypted using the
  ///password stored in `passwordSecretRef`
  ///containing the issuing Certificate Authority
  @JsonKey(name: 'create')
  bool create;

  ///Password provides a literal password used to encrypt the JKS keystore.
  ///Mutually exclusive with passwordSecretRef.
  ///One of password or passwordSecretRef must provide a password with a non-zero length.
  @JsonKey(name: 'password')
  String? password;

  ///PasswordSecretRef is a reference to a non-empty key in a Secret resource
  ///containing the password used to encrypt the JKS keystore.
  ///Mutually exclusive with password.
  ///One of password or passwordSecretRef must provide a password with a non-zero length.
  @JsonKey(name: 'passwordSecretRef')
  JksPasswordSecretRef? passwordSecretRef;

  Jks({
    this.alias,
    required this.create,
    this.password,
    this.passwordSecretRef,
  });

  factory Jks.fromJson(Map<String, dynamic> json) => _$JksFromJson(json);

  Map<String, dynamic> toJson() => _$JksToJson(this);
}

@JsonSerializable()
class JksPasswordSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  JksPasswordSecretRef({this.key, required this.name});

  factory JksPasswordSecretRef.fromJson(Map<String, dynamic> json) =>
      _$JksPasswordSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$JksPasswordSecretRefToJson(this);
}

@JsonSerializable()
class Pkcs12 {
  ///Create enables PKCS12 keystore creation for the Certificate.
  ///If true, a file named `keystore.p12` will be created in the target
  ///Secret resource, encrypted using the password stored in
  ///`passwordSecretRef` or in `password`.
  ///The keystore file will be updated immediately.
  ///If the issuer provided a CA certificate, a file named `truststore.p12` will
  ///also be created in the target Secret resource, encrypted using the
  ///password stored in `passwordSecretRef` containing the issuing Certificate
  ///Authority
  @JsonKey(name: 'create')
  bool create;

  ///Password provides a literal password used to encrypt the PKCS#12 keystore.
  ///Mutually exclusive with passwordSecretRef.
  ///One of password or passwordSecretRef must provide a password with a non-zero length.
  @JsonKey(name: 'password')
  String? password;

  ///PasswordSecretRef is a reference to a non-empty key in a Secret resource
  ///containing the password used to encrypt the PKCS#12 keystore.
  ///Mutually exclusive with password.
  ///One of password or passwordSecretRef must provide a password with a non-zero length.
  @JsonKey(name: 'passwordSecretRef')
  Pkcs12PasswordSecretRef? passwordSecretRef;

  ///Profile specifies the key and certificate encryption algorithms and the HMAC algorithm
  ///used to create the PKCS12 keystore. Default value is `LegacyRC2` for backward
  ///compatibility.
  ///
  ///If provided, allowed values are:
  ///`LegacyRC2`: Deprecated. Not supported by default in OpenSSL 3 or Java 20.
  ///`LegacyDES`: Less secure algorithm. Use this option for maximal compatibility.
  ///`Modern2023`: Secure algorithm. Use this option in case you have to always use secure
  ///algorithms
  ///(e.g., because of company policy). Please note that the security of the algorithm is not
  ///that important
  ///in reality, because the unencrypted certificate and private key are also stored in the
  ///Secret.
  @JsonKey(name: 'profile')
  Profile? profile;

  Pkcs12({
    required this.create,
    this.password,
    this.passwordSecretRef,
    this.profile,
  });

  factory Pkcs12.fromJson(Map<String, dynamic> json) => _$Pkcs12FromJson(json);

  Map<String, dynamic> toJson() => _$Pkcs12ToJson(this);
}

@JsonSerializable()
class Pkcs12PasswordSecretRef {
  ///The key of the entry in the Secret resource's `data` field to be used.
  ///Some instances of this field may be defaulted, in others it may be
  ///required.
  @JsonKey(name: 'key')
  String? key;

  ///Name of the resource being referred to.
  ///More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  @JsonKey(name: 'name')
  String name;

  Pkcs12PasswordSecretRef({this.key, required this.name});

  factory Pkcs12PasswordSecretRef.fromJson(Map<String, dynamic> json) =>
      _$Pkcs12PasswordSecretRefFromJson(json);

  Map<String, dynamic> toJson() => _$Pkcs12PasswordSecretRefToJson(this);
}

///Profile specifies the key and certificate encryption algorithms and the HMAC algorithm
///used to create the PKCS12 keystore. Default value is `LegacyRC2` for backward
///compatibility.
///
///If provided, allowed values are:
///`LegacyRC2`: Deprecated. Not supported by default in OpenSSL 3 or Java 20.
///`LegacyDES`: Less secure algorithm. Use this option for maximal compatibility.
///`Modern2023`: Secure algorithm. Use this option in case you have to always use secure
///algorithms
///(e.g., because of company policy). Please note that the security of the algorithm is not
///that important
///in reality, because the unencrypted certificate and private key are also stored in the
///Secret.
enum Profile {
  @JsonValue('LegacyDES')
  LEGACY_DES,
  @JsonValue('LegacyRC2')
  LEGACY_RC2,
  @JsonValue('Modern2023')
  MODERN2023,
}

final profileValues = EnumValues({
  'LegacyDES': Profile.LEGACY_DES,
  'LegacyRC2': Profile.LEGACY_RC2,
  'Modern2023': Profile.MODERN2023,
});

@JsonSerializable()
class NameConstraints {
  ///if true then the name constraints are marked critical.
  @JsonKey(name: 'critical')
  bool? critical;

  ///Excluded contains the constraints which must be disallowed. Any name matching a
  ///restriction in the excluded field is invalid regardless
  ///of information appearing in the permitted
  @JsonKey(name: 'excluded')
  Excluded? excluded;

  ///Permitted contains the constraints in which the names must be located.
  @JsonKey(name: 'permitted')
  Permitted? permitted;

  NameConstraints({this.critical, this.excluded, this.permitted});

  factory NameConstraints.fromJson(Map<String, dynamic> json) =>
      _$NameConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$NameConstraintsToJson(this);
}

@JsonSerializable()
class Excluded {
  ///DNSDomains is a list of DNS domains that are permitted or excluded.
  @JsonKey(name: 'dnsDomains')
  List<String?>? dnsDomains;

  ///EmailAddresses is a list of Email Addresses that are permitted or excluded.
  @JsonKey(name: 'emailAddresses')
  List<String?>? emailAddresses;

  ///IPRanges is a list of IP Ranges that are permitted or excluded.
  ///This should be a valid CIDR notation.
  @JsonKey(name: 'ipRanges')
  List<String?>? ipRanges;

  ///URIDomains is a list of URI domains that are permitted or excluded.
  @JsonKey(name: 'uriDomains')
  List<String?>? uriDomains;

  Excluded({
    this.dnsDomains,
    this.emailAddresses,
    this.ipRanges,
    this.uriDomains,
  });

  factory Excluded.fromJson(Map<String, dynamic> json) =>
      _$ExcludedFromJson(json);

  Map<String, dynamic> toJson() => _$ExcludedToJson(this);
}

@JsonSerializable()
class Permitted {
  ///DNSDomains is a list of DNS domains that are permitted or excluded.
  @JsonKey(name: 'dnsDomains')
  List<String?>? dnsDomains;

  ///EmailAddresses is a list of Email Addresses that are permitted or excluded.
  @JsonKey(name: 'emailAddresses')
  List<String?>? emailAddresses;

  ///IPRanges is a list of IP Ranges that are permitted or excluded.
  ///This should be a valid CIDR notation.
  @JsonKey(name: 'ipRanges')
  List<String?>? ipRanges;

  ///URIDomains is a list of URI domains that are permitted or excluded.
  @JsonKey(name: 'uriDomains')
  List<String?>? uriDomains;

  Permitted({
    this.dnsDomains,
    this.emailAddresses,
    this.ipRanges,
    this.uriDomains,
  });

  factory Permitted.fromJson(Map<String, dynamic> json) =>
      _$PermittedFromJson(json);

  Map<String, dynamic> toJson() => _$PermittedToJson(this);
}

@JsonSerializable()
class OtherName {
  ///OID is the object identifier for the otherName SAN.
  ///The object identifier must be expressed as a dotted string, for
  ///example, "1.2.840.113556.1.4.221".
  @JsonKey(name: 'oid')
  String? oid;

  ///utf8Value is the string value of the otherName SAN.
  ///The utf8Value accepts any valid UTF8 string to set as value for the otherName SAN.
  @JsonKey(name: 'utf8Value')
  String? utf8Value;

  OtherName({this.oid, this.utf8Value});

  factory OtherName.fromJson(Map<String, dynamic> json) =>
      _$OtherNameFromJson(json);

  Map<String, dynamic> toJson() => _$OtherNameToJson(this);
}

@JsonSerializable()
class PrivateKey {
  ///Algorithm is the private key algorithm of the corresponding private key
  ///for this certificate.
  ///
  ///If provided, allowed values are either `RSA`, `ECDSA` or `Ed25519`.
  ///If `algorithm` is specified and `size` is not provided,
  ///key size of 2048 will be used for `RSA` key algorithm and
  ///key size of 256 will be used for `ECDSA` key algorithm.
  ///key size is ignored when using the `Ed25519` key algorithm.
  @JsonKey(name: 'algorithm')
  Algorithm? algorithm;

  ///The private key cryptography standards (PKCS) encoding for this
  ///certificate's private key to be encoded in.
  ///
  ///If provided, allowed values are `PKCS1` and `PKCS8` standing for PKCS#1
  ///and PKCS#8, respectively.
  ///Defaults to `PKCS1` if not specified.
  @JsonKey(name: 'encoding')
  Encoding? encoding;

  ///RotationPolicy controls how private keys should be regenerated when a
  ///re-issuance is being processed.
  ///
  ///If set to `Never`, a private key will only be generated if one does not
  ///already exist in the target `spec.secretName`. If one does exist but it
  ///does not have the correct algorithm or size, a warning will be raised
  ///to await user intervention.
  ///If set to `Always`, a private key matching the specified requirements
  ///will be generated whenever a re-issuance occurs.
  ///Default is `Always`.
  ///The default was changed from `Never` to `Always` in cert-manager >=v1.18.0.
  ///The new default can be disabled by setting the
  ///`--feature-gates=DefaultPrivateKeyRotationPolicyAlways=false` option on
  ///the controller component.
  @JsonKey(name: 'rotationPolicy')
  RotationPolicy? rotationPolicy;

  ///Size is the key bit size of the corresponding private key for this certificate.
  ///
  ///If `algorithm` is set to `RSA`, valid values are `2048`, `4096` or `8192`,
  ///and will default to `2048` if not specified.
  ///If `algorithm` is set to `ECDSA`, valid values are `256`, `384` or `521`,
  ///and will default to `256` if not specified.
  ///If `algorithm` is set to `Ed25519`, Size is ignored.
  ///No other values are allowed.
  @JsonKey(name: 'size')
  int? size;

  PrivateKey({this.algorithm, this.encoding, this.rotationPolicy, this.size});

  factory PrivateKey.fromJson(Map<String, dynamic> json) =>
      _$PrivateKeyFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateKeyToJson(this);
}

///Algorithm is the private key algorithm of the corresponding private key
///for this certificate.
///
///If provided, allowed values are either `RSA`, `ECDSA` or `Ed25519`.
///If `algorithm` is specified and `size` is not provided,
///key size of 2048 will be used for `RSA` key algorithm and
///key size of 256 will be used for `ECDSA` key algorithm.
///key size is ignored when using the `Ed25519` key algorithm.
enum Algorithm {
  @JsonValue('ECDSA')
  ECDSA,
  @JsonValue('Ed25519')
  ED25519,
  @JsonValue('RSA')
  RSA,
}

final algorithmValues = EnumValues({
  'ECDSA': Algorithm.ECDSA,
  'Ed25519': Algorithm.ED25519,
  'RSA': Algorithm.RSA,
});

///The private key cryptography standards (PKCS) encoding for this
///certificate's private key to be encoded in.
///
///If provided, allowed values are `PKCS1` and `PKCS8` standing for PKCS#1
///and PKCS#8, respectively.
///Defaults to `PKCS1` if not specified.
enum Encoding {
  @JsonValue('PKCS1')
  PKCS1,
  @JsonValue('PKCS8')
  PKCS8,
}

final encodingValues = EnumValues({
  'PKCS1': Encoding.PKCS1,
  'PKCS8': Encoding.PKCS8,
});

///RotationPolicy controls how private keys should be regenerated when a
///re-issuance is being processed.
///
///If set to `Never`, a private key will only be generated if one does not
///already exist in the target `spec.secretName`. If one does exist but it
///does not have the correct algorithm or size, a warning will be raised
///to await user intervention.
///If set to `Always`, a private key matching the specified requirements
///will be generated whenever a re-issuance occurs.
///Default is `Always`.
///The default was changed from `Never` to `Always` in cert-manager >=v1.18.0.
///The new default can be disabled by setting the
///`--feature-gates=DefaultPrivateKeyRotationPolicyAlways=false` option on
///the controller component.
enum RotationPolicy {
  @JsonValue('Always')
  ALWAYS,
  @JsonValue('Never')
  NEVER,
}

final rotationPolicyValues = EnumValues({
  'Always': RotationPolicy.ALWAYS,
  'Never': RotationPolicy.NEVER,
});

@JsonSerializable()
class SecretTemplate {
  ///Annotations is a key value map to be copied to the target Kubernetes Secret.
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Labels is a key value map to be copied to the target Kubernetes Secret.
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  SecretTemplate({this.annotations, this.labels});

  factory SecretTemplate.fromJson(Map<String, dynamic> json) =>
      _$SecretTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SecretTemplateToJson(this);
}

///Signature algorithm to use.
///Allowed values for RSA keys: SHA256WithRSA, SHA384WithRSA, SHA512WithRSA.
///Allowed values for ECDSA keys: ECDSAWithSHA256, ECDSAWithSHA384, ECDSAWithSHA512.
///Allowed values for Ed25519 keys: PureEd25519.
enum SignatureAlgorithm {
  @JsonValue('ECDSAWithSHA256')
  ECDSA_WITH_SHA256,
  @JsonValue('ECDSAWithSHA384')
  ECDSA_WITH_SHA384,
  @JsonValue('ECDSAWithSHA512')
  ECDSA_WITH_SHA512,
  @JsonValue('PureEd25519')
  PURE_ED25519,
  @JsonValue('SHA256WithRSA')
  SHA256_WITH_RSA,
  @JsonValue('SHA384WithRSA')
  SHA384_WITH_RSA,
  @JsonValue('SHA512WithRSA')
  SHA512_WITH_RSA,
}

final signatureAlgorithmValues = EnumValues({
  'ECDSAWithSHA256': SignatureAlgorithm.ECDSA_WITH_SHA256,
  'ECDSAWithSHA384': SignatureAlgorithm.ECDSA_WITH_SHA384,
  'ECDSAWithSHA512': SignatureAlgorithm.ECDSA_WITH_SHA512,
  'PureEd25519': SignatureAlgorithm.PURE_ED25519,
  'SHA256WithRSA': SignatureAlgorithm.SHA256_WITH_RSA,
  'SHA384WithRSA': SignatureAlgorithm.SHA384_WITH_RSA,
  'SHA512WithRSA': SignatureAlgorithm.SHA512_WITH_RSA,
});

@JsonSerializable()
class Subject {
  ///Countries to be used on the Certificate.
  @JsonKey(name: 'countries')
  List<String?>? countries;

  ///Cities to be used on the Certificate.
  @JsonKey(name: 'localities')
  List<String?>? localities;

  ///Organizational Units to be used on the Certificate.
  @JsonKey(name: 'organizationalUnits')
  List<String?>? organizationalUnits;

  ///Organizations to be used on the Certificate.
  @JsonKey(name: 'organizations')
  List<String?>? organizations;

  ///Postal codes to be used on the Certificate.
  @JsonKey(name: 'postalCodes')
  List<String?>? postalCodes;

  ///State/Provinces to be used on the Certificate.
  @JsonKey(name: 'provinces')
  List<String?>? provinces;

  ///Serial number to be used on the Certificate.
  @JsonKey(name: 'serialNumber')
  String? serialNumber;

  ///Street addresses to be used on the Certificate.
  @JsonKey(name: 'streetAddresses')
  List<String?>? streetAddresses;

  Subject({
    this.countries,
    this.localities,
    this.organizationalUnits,
    this.organizations,
    this.postalCodes,
    this.provinces,
    this.serialNumber,
    this.streetAddresses,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
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
  ///List of status conditions to indicate the status of certificates.
  ///Known condition types are `Ready` and `Issuing`.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///The number of continuous failed issuance attempts up till now. This
  ///field gets removed (if set) on a successful issuance and gets set to
  ///1 if unset and an issuance has failed. If an issuance has failed, the
  ///delay till the next issuance will be calculated using formula
  ///time.Hour * 2 ^ (failedIssuanceAttempts - 1).
  @JsonKey(name: 'failedIssuanceAttempts')
  int? failedIssuanceAttempts;

  ///LastFailureTime is set only if the latest issuance for this
  ///Certificate failed and contains the time of the failure. If an
  ///issuance has failed, the delay till the next issuance will be
  ///calculated using formula time.Hour * 2 ^ (failedIssuanceAttempts -
  ///1). If the latest issuance has succeeded this field will be unset.
  @JsonKey(name: 'lastFailureTime')
  DateTime? lastFailureTime;

  ///The name of the Secret resource containing the private key to be used
  ///for the next certificate iteration.
  ///The keymanager controller will automatically set this field if the
  ///`Issuing` condition is set to `True`.
  ///It will automatically unset this field when the Issuing condition is
  ///not set or False.
  @JsonKey(name: 'nextPrivateKeySecretName')
  String? nextPrivateKeySecretName;

  ///The expiration time of the certificate stored in the secret named
  ///by this resource in `spec.secretName`.
  @JsonKey(name: 'notAfter')
  DateTime? notAfter;

  ///The time after which the certificate stored in the secret named
  ///by this resource in `spec.secretName` is valid.
  @JsonKey(name: 'notBefore')
  DateTime? notBefore;

  ///RenewalTime is the time at which the certificate will be next
  ///renewed.
  ///If not set, no upcoming renewal is scheduled.
  @JsonKey(name: 'renewalTime')
  DateTime? renewalTime;

  ///The current 'revision' of the certificate as issued.
  ///
  ///When a CertificateRequest resource is created, it will have the
  ///`cert-manager.io/certificate-revision` set to one greater than the
  ///current value of this field.
  ///
  ///Upon issuance, this field will be set to the value of the annotation
  ///on the CertificateRequest resource used to issue the certificate.
  ///
  ///Persisting the value on the CertificateRequest resource allows the
  ///certificates controller to know whether a request is part of an old
  ///issuance or if it is part of the ongoing revision's issuance by
  ///checking if the revision value in the annotation is greater than this
  ///field.
  @JsonKey(name: 'revision')
  int? revision;

  StatusClass({
    this.conditions,
    this.failedIssuanceAttempts,
    this.lastFailureTime,
    this.nextPrivateKeySecretName,
    this.notAfter,
    this.notBefore,
    this.renewalTime,
    this.revision,
  });

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

  ///If set, this represents the .metadata.generation that the condition was
  ///set based upon.
  ///For instance, if .metadata.generation is currently 12, but the
  ///.status.condition[x].observedGeneration is 9, the condition is out of date
  ///with respect to the current state of the Certificate.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///Reason is a brief machine readable explanation for the condition's last
  ///transition.
  @JsonKey(name: 'reason')
  String? reason;

  ///Status of the condition, one of (`True`, `False`, `Unknown`).
  @JsonKey(name: 'status')
  StatusEnum status;

  ///Type of the condition, known values are (`Ready`, `Issuing`).
  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastTransitionTime,
    this.message,
    this.observedGeneration,
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
enum CertificatelistCertManagerV1Kind {
  @JsonValue('CertificateList')
  CERTIFICATE_LIST,
}

final certificatelistCertManagerV1KindValues = EnumValues({
  'CertificateList': CertificatelistCertManagerV1Kind.CERTIFICATE_LIST,
});

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class CertificatelistCertManagerV1Metadata {
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

  CertificatelistCertManagerV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory CertificatelistCertManagerV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$CertificatelistCertManagerV1MetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CertificatelistCertManagerV1MetadataToJson(this);
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
