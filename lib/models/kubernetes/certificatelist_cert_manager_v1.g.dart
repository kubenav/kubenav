// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificatelist_cert_manager_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatelistCertManagerV1 _$CertificatelistCertManagerV1FromJson(
  Map<String, dynamic> json,
) => CertificatelistCertManagerV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$CertificatelistCertManagerV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : CertificatelistCertManagerV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CertificatelistCertManagerV1ToJson(
  CertificatelistCertManagerV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$CertificatelistCertManagerV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.CERT_MANAGER_IO_V1: 'cert-manager.io/v1',
};

const _$CertificatelistCertManagerV1KindEnumMap = {
  CertificatelistCertManagerV1Kind.CERTIFICATE_LIST: 'CertificateList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : Spec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : StatusClass.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.CERTIFICATE: 'Certificate'};

ItemMetadata _$ItemMetadataFromJson(Map<String, dynamic> json) => ItemMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  creationTimestamp: json['creationTimestamp'] == null
      ? null
      : DateTime.parse(json['creationTimestamp'] as String),
  deletionGracePeriodSeconds: (json['deletionGracePeriodSeconds'] as num?)
      ?.toInt(),
  deletionTimestamp: json['deletionTimestamp'] == null
      ? null
      : DateTime.parse(json['deletionTimestamp'] as String),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  generateName: json['generateName'] as String?,
  generation: (json['generation'] as num?)?.toInt(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  managedFields: (json['managedFields'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : OwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$ItemMetadataToJson(ItemMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'creationTimestamp': instance.creationTimestamp?.toIso8601String(),
      'deletionGracePeriodSeconds': instance.deletionGracePeriodSeconds,
      'deletionTimestamp': instance.deletionTimestamp?.toIso8601String(),
      'finalizers': instance.finalizers,
      'generateName': instance.generateName,
      'generation': instance.generation,
      'labels': instance.labels,
      'managedFields': instance.managedFields,
      'name': instance.name,
      'namespace': instance.namespace,
      'ownerReferences': instance.ownerReferences,
      'resourceVersion': instance.resourceVersion,
      'selfLink': instance.selfLink,
      'uid': instance.uid,
    };

ManagedField _$ManagedFieldFromJson(Map<String, dynamic> json) => ManagedField(
  apiVersion: json['apiVersion'] as String?,
  fieldsType: json['fieldsType'] as String?,
  fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
  manager: json['manager'] as String?,
  operation: json['operation'] as String?,
  subresource: json['subresource'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ManagedFieldToJson(ManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

OwnerReference _$OwnerReferenceFromJson(Map<String, dynamic> json) =>
    OwnerReference(
      apiVersion: json['apiVersion'] as String,
      blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
      controller: json['controller'] as bool?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$OwnerReferenceToJson(OwnerReference instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'blockOwnerDeletion': instance.blockOwnerDeletion,
      'controller': instance.controller,
      'kind': instance.kind,
      'name': instance.name,
      'uid': instance.uid,
    };

Spec _$SpecFromJson(Map<String, dynamic> json) => Spec(
  additionalOutputFormats: (json['additionalOutputFormats'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AdditionalOutputFormat.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  commonName: json['commonName'] as String?,
  dnsNames: (json['dnsNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  duration: json['duration'] as String?,
  emailAddresses: (json['emailAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  encodeUsagesInRequest: json['encodeUsagesInRequest'] as bool?,
  ipAddresses: (json['ipAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  isCa: json['isCA'] as bool?,
  issuerRef: IssuerRef.fromJson(json['issuerRef'] as Map<String, dynamic>),
  keystores: json['keystores'] == null
      ? null
      : Keystores.fromJson(json['keystores'] as Map<String, dynamic>),
  literalSubject: json['literalSubject'] as String?,
  nameConstraints: json['nameConstraints'] == null
      ? null
      : NameConstraints.fromJson(
          json['nameConstraints'] as Map<String, dynamic>,
        ),
  otherNames: (json['otherNames'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : OtherName.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  privateKey: json['privateKey'] == null
      ? null
      : PrivateKey.fromJson(json['privateKey'] as Map<String, dynamic>),
  renewBefore: json['renewBefore'] as String?,
  renewBeforePercentage: (json['renewBeforePercentage'] as num?)?.toInt(),
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  secretName: json['secretName'] as String,
  secretTemplate: json['secretTemplate'] == null
      ? null
      : SecretTemplate.fromJson(json['secretTemplate'] as Map<String, dynamic>),
  signatureAlgorithm: $enumDecodeNullable(
    _$SignatureAlgorithmEnumMap,
    json['signatureAlgorithm'],
  ),
  subject: json['subject'] == null
      ? null
      : Subject.fromJson(json['subject'] as Map<String, dynamic>),
  uris: (json['uris'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  usages: (json['usages'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$UsageEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'additionalOutputFormats': instance.additionalOutputFormats,
  'commonName': instance.commonName,
  'dnsNames': instance.dnsNames,
  'duration': instance.duration,
  'emailAddresses': instance.emailAddresses,
  'encodeUsagesInRequest': instance.encodeUsagesInRequest,
  'ipAddresses': instance.ipAddresses,
  'isCA': instance.isCa,
  'issuerRef': instance.issuerRef,
  'keystores': instance.keystores,
  'literalSubject': instance.literalSubject,
  'nameConstraints': instance.nameConstraints,
  'otherNames': instance.otherNames,
  'privateKey': instance.privateKey,
  'renewBefore': instance.renewBefore,
  'renewBeforePercentage': instance.renewBeforePercentage,
  'revisionHistoryLimit': instance.revisionHistoryLimit,
  'secretName': instance.secretName,
  'secretTemplate': instance.secretTemplate,
  'signatureAlgorithm':
      _$SignatureAlgorithmEnumMap[instance.signatureAlgorithm],
  'subject': instance.subject,
  'uris': instance.uris,
  'usages': instance.usages?.map((e) => _$UsageEnumMap[e]!).toList(),
};

const _$SignatureAlgorithmEnumMap = {
  SignatureAlgorithm.ECDSA_WITH_SHA256: 'ECDSAWithSHA256',
  SignatureAlgorithm.ECDSA_WITH_SHA384: 'ECDSAWithSHA384',
  SignatureAlgorithm.ECDSA_WITH_SHA512: 'ECDSAWithSHA512',
  SignatureAlgorithm.PURE_ED25519: 'PureEd25519',
  SignatureAlgorithm.SHA256_WITH_RSA: 'SHA256WithRSA',
  SignatureAlgorithm.SHA384_WITH_RSA: 'SHA384WithRSA',
  SignatureAlgorithm.SHA512_WITH_RSA: 'SHA512WithRSA',
};

const _$UsageEnumMap = {
  Usage.ANY: 'any',
  Usage.CERT_SIGN: 'cert sign',
  Usage.CLIENT_AUTH: 'client auth',
  Usage.CODE_SIGNING: 'code signing',
  Usage.CONTENT_COMMITMENT: 'content commitment',
  Usage.CRL_SIGN: 'crl sign',
  Usage.DATA_ENCIPHERMENT: 'data encipherment',
  Usage.DECIPHER_ONLY: 'decipher only',
  Usage.DIGITAL_SIGNATURE: 'digital signature',
  Usage.EMAIL_PROTECTION: 'email protection',
  Usage.ENCIPHER_ONLY: 'encipher only',
  Usage.IPSEC_END_SYSTEM: 'ipsec end system',
  Usage.IPSEC_TUNNEL: 'ipsec tunnel',
  Usage.IPSEC_USER: 'ipsec user',
  Usage.KEY_AGREEMENT: 'key agreement',
  Usage.KEY_ENCIPHERMENT: 'key encipherment',
  Usage.MICROSOFT_SGC: 'microsoft sgc',
  Usage.NETSCAPE_SGC: 'netscape sgc',
  Usage.OCSP_SIGNING: 'ocsp signing',
  Usage.SERVER_AUTH: 'server auth',
  Usage.SIGNING: 'signing',
  Usage.S_MIME: 's/mime',
  Usage.TIMESTAMPING: 'timestamping',
};

AdditionalOutputFormat _$AdditionalOutputFormatFromJson(
  Map<String, dynamic> json,
) => AdditionalOutputFormat(type: $enumDecode(_$TypeEnumMap, json['type']));

Map<String, dynamic> _$AdditionalOutputFormatToJson(
  AdditionalOutputFormat instance,
) => <String, dynamic>{'type': _$TypeEnumMap[instance.type]!};

const _$TypeEnumMap = {Type.COMBINED_PEM: 'CombinedPEM', Type.DER: 'DER'};

IssuerRef _$IssuerRefFromJson(Map<String, dynamic> json) => IssuerRef(
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$IssuerRefToJson(IssuerRef instance) => <String, dynamic>{
  'group': instance.group,
  'kind': instance.kind,
  'name': instance.name,
};

Keystores _$KeystoresFromJson(Map<String, dynamic> json) => Keystores(
  jks: json['jks'] == null
      ? null
      : Jks.fromJson(json['jks'] as Map<String, dynamic>),
  pkcs12: json['pkcs12'] == null
      ? null
      : Pkcs12.fromJson(json['pkcs12'] as Map<String, dynamic>),
);

Map<String, dynamic> _$KeystoresToJson(Keystores instance) => <String, dynamic>{
  'jks': instance.jks,
  'pkcs12': instance.pkcs12,
};

Jks _$JksFromJson(Map<String, dynamic> json) => Jks(
  alias: json['alias'] as String?,
  create: json['create'] as bool,
  password: json['password'] as String?,
  passwordSecretRef: json['passwordSecretRef'] == null
      ? null
      : JksPasswordSecretRef.fromJson(
          json['passwordSecretRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$JksToJson(Jks instance) => <String, dynamic>{
  'alias': instance.alias,
  'create': instance.create,
  'password': instance.password,
  'passwordSecretRef': instance.passwordSecretRef,
};

JksPasswordSecretRef _$JksPasswordSecretRefFromJson(
  Map<String, dynamic> json,
) => JksPasswordSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$JksPasswordSecretRefToJson(
  JksPasswordSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Pkcs12 _$Pkcs12FromJson(Map<String, dynamic> json) => Pkcs12(
  create: json['create'] as bool,
  password: json['password'] as String?,
  passwordSecretRef: json['passwordSecretRef'] == null
      ? null
      : Pkcs12PasswordSecretRef.fromJson(
          json['passwordSecretRef'] as Map<String, dynamic>,
        ),
  profile: $enumDecodeNullable(_$ProfileEnumMap, json['profile']),
);

Map<String, dynamic> _$Pkcs12ToJson(Pkcs12 instance) => <String, dynamic>{
  'create': instance.create,
  'password': instance.password,
  'passwordSecretRef': instance.passwordSecretRef,
  'profile': _$ProfileEnumMap[instance.profile],
};

const _$ProfileEnumMap = {
  Profile.LEGACY_DES: 'LegacyDES',
  Profile.LEGACY_RC2: 'LegacyRC2',
  Profile.MODERN2023: 'Modern2023',
};

Pkcs12PasswordSecretRef _$Pkcs12PasswordSecretRefFromJson(
  Map<String, dynamic> json,
) => Pkcs12PasswordSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$Pkcs12PasswordSecretRefToJson(
  Pkcs12PasswordSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

NameConstraints _$NameConstraintsFromJson(Map<String, dynamic> json) =>
    NameConstraints(
      critical: json['critical'] as bool?,
      excluded: json['excluded'] == null
          ? null
          : Excluded.fromJson(json['excluded'] as Map<String, dynamic>),
      permitted: json['permitted'] == null
          ? null
          : Permitted.fromJson(json['permitted'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NameConstraintsToJson(NameConstraints instance) =>
    <String, dynamic>{
      'critical': instance.critical,
      'excluded': instance.excluded,
      'permitted': instance.permitted,
    };

Excluded _$ExcludedFromJson(Map<String, dynamic> json) => Excluded(
  dnsDomains: (json['dnsDomains'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  emailAddresses: (json['emailAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  ipRanges: (json['ipRanges'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  uriDomains: (json['uriDomains'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$ExcludedToJson(Excluded instance) => <String, dynamic>{
  'dnsDomains': instance.dnsDomains,
  'emailAddresses': instance.emailAddresses,
  'ipRanges': instance.ipRanges,
  'uriDomains': instance.uriDomains,
};

Permitted _$PermittedFromJson(Map<String, dynamic> json) => Permitted(
  dnsDomains: (json['dnsDomains'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  emailAddresses: (json['emailAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  ipRanges: (json['ipRanges'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  uriDomains: (json['uriDomains'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$PermittedToJson(Permitted instance) => <String, dynamic>{
  'dnsDomains': instance.dnsDomains,
  'emailAddresses': instance.emailAddresses,
  'ipRanges': instance.ipRanges,
  'uriDomains': instance.uriDomains,
};

OtherName _$OtherNameFromJson(Map<String, dynamic> json) => OtherName(
  oid: json['oid'] as String?,
  utf8Value: json['utf8Value'] as String?,
);

Map<String, dynamic> _$OtherNameToJson(OtherName instance) => <String, dynamic>{
  'oid': instance.oid,
  'utf8Value': instance.utf8Value,
};

PrivateKey _$PrivateKeyFromJson(Map<String, dynamic> json) => PrivateKey(
  algorithm: $enumDecodeNullable(_$AlgorithmEnumMap, json['algorithm']),
  encoding: $enumDecodeNullable(_$EncodingEnumMap, json['encoding']),
  rotationPolicy: $enumDecodeNullable(
    _$RotationPolicyEnumMap,
    json['rotationPolicy'],
  ),
  size: (json['size'] as num?)?.toInt(),
);

Map<String, dynamic> _$PrivateKeyToJson(PrivateKey instance) =>
    <String, dynamic>{
      'algorithm': _$AlgorithmEnumMap[instance.algorithm],
      'encoding': _$EncodingEnumMap[instance.encoding],
      'rotationPolicy': _$RotationPolicyEnumMap[instance.rotationPolicy],
      'size': instance.size,
    };

const _$AlgorithmEnumMap = {
  Algorithm.ECDSA: 'ECDSA',
  Algorithm.ED25519: 'Ed25519',
  Algorithm.RSA: 'RSA',
};

const _$EncodingEnumMap = {Encoding.PKCS1: 'PKCS1', Encoding.PKCS8: 'PKCS8'};

const _$RotationPolicyEnumMap = {
  RotationPolicy.ALWAYS: 'Always',
  RotationPolicy.NEVER: 'Never',
};

SecretTemplate _$SecretTemplateFromJson(Map<String, dynamic> json) =>
    SecretTemplate(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$SecretTemplateToJson(SecretTemplate instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  countries: (json['countries'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  localities: (json['localities'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  organizationalUnits: (json['organizationalUnits'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  organizations: (json['organizations'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  postalCodes: (json['postalCodes'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  provinces: (json['provinces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  serialNumber: json['serialNumber'] as String?,
  streetAddresses: (json['streetAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'countries': instance.countries,
  'localities': instance.localities,
  'organizationalUnits': instance.organizationalUnits,
  'organizations': instance.organizations,
  'postalCodes': instance.postalCodes,
  'provinces': instance.provinces,
  'serialNumber': instance.serialNumber,
  'streetAddresses': instance.streetAddresses,
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  failedIssuanceAttempts: (json['failedIssuanceAttempts'] as num?)?.toInt(),
  lastFailureTime: json['lastFailureTime'] == null
      ? null
      : DateTime.parse(json['lastFailureTime'] as String),
  nextPrivateKeySecretName: json['nextPrivateKeySecretName'] as String?,
  notAfter: json['notAfter'] == null
      ? null
      : DateTime.parse(json['notAfter'] as String),
  notBefore: json['notBefore'] == null
      ? null
      : DateTime.parse(json['notBefore'] as String),
  renewalTime: json['renewalTime'] == null
      ? null
      : DateTime.parse(json['renewalTime'] as String),
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'failedIssuanceAttempts': instance.failedIssuanceAttempts,
      'lastFailureTime': instance.lastFailureTime?.toIso8601String(),
      'nextPrivateKeySecretName': instance.nextPrivateKeySecretName,
      'notAfter': instance.notAfter?.toIso8601String(),
      'notBefore': instance.notBefore?.toIso8601String(),
      'renewalTime': instance.renewalTime?.toIso8601String(),
      'revision': instance.revision,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  reason: json['reason'] as String?,
  status: $enumDecode(_$StatusEnumEnumMap, json['status']),
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'observedGeneration': instance.observedGeneration,
  'reason': instance.reason,
  'status': _$StatusEnumEnumMap[instance.status]!,
  'type': instance.type,
};

const _$StatusEnumEnumMap = {
  StatusEnum.FALSE: 'False',
  StatusEnum.TRUE: 'True',
  StatusEnum.UNKNOWN: 'Unknown',
};

CertificatelistCertManagerV1Metadata
_$CertificatelistCertManagerV1MetadataFromJson(Map<String, dynamic> json) =>
    CertificatelistCertManagerV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$CertificatelistCertManagerV1MetadataToJson(
  CertificatelistCertManagerV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
