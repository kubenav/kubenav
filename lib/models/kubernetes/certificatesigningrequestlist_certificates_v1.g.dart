// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificatesigningrequestlist_certificates_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificatesigningrequestlistCertificatesV1
_$CertificatesigningrequestlistCertificatesV1FromJson(
  Map<String, dynamic> json,
) => CertificatesigningrequestlistCertificatesV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$CertificatesigningrequestlistCertificatesV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : CertificatesigningrequestlistCertificatesV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CertificatesigningrequestlistCertificatesV1ToJson(
  CertificatesigningrequestlistCertificatesV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind':
      _$CertificatesigningrequestlistCertificatesV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.CERTIFICATES_K8_S_IO_V1: 'certificates.k8s.io/v1',
};

const _$CertificatesigningrequestlistCertificatesV1KindEnumMap = {
  CertificatesigningrequestlistCertificatesV1Kind
          .CERTIFICATE_SIGNING_REQUEST_LIST:
      'CertificateSigningRequestList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {
  ItemKind.CERTIFICATE_SIGNING_REQUEST: 'CertificateSigningRequest',
};

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
  expirationSeconds: (json['expirationSeconds'] as num?)?.toInt(),
  extra: (json['extra'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>?)?.map((e) => e as String?).toList()),
  ),
  groups: (json['groups'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  request: json['request'] as String,
  signerName: json['signerName'] as String,
  uid: json['uid'] as String?,
  usages: (json['usages'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$UsageEnumMap, e))
      .toList(),
  username: json['username'] as String?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'expirationSeconds': instance.expirationSeconds,
  'extra': instance.extra,
  'groups': instance.groups,
  'request': instance.request,
  'signerName': instance.signerName,
  'uid': instance.uid,
  'usages': instance.usages?.map((e) => _$UsageEnumMap[e]!).toList(),
  'username': instance.username,
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

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  certificate: json['certificate'] as String?,
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'certificate': instance.certificate,
  'conditions': instance.conditions,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  lastUpdateTime: json['lastUpdateTime'] == null
      ? null
      : DateTime.parse(json['lastUpdateTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'lastUpdateTime': instance.lastUpdateTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

CertificatesigningrequestlistCertificatesV1Metadata
_$CertificatesigningrequestlistCertificatesV1MetadataFromJson(
  Map<String, dynamic> json,
) => CertificatesigningrequestlistCertificatesV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic>
_$CertificatesigningrequestlistCertificatesV1MetadataToJson(
  CertificatesigningrequestlistCertificatesV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
