// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderlist_acme_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderlistAcmeV1 _$OrderlistAcmeV1FromJson(Map<String, dynamic> json) =>
    OrderlistAcmeV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$OrderlistAcmeV1KindEnumMap, json['kind']),
      metadata: json['metadata'] == null
          ? null
          : OrderlistAcmeV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$OrderlistAcmeV1ToJson(OrderlistAcmeV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$OrderlistAcmeV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {
  ApiVersion.ACME_CERT_MANAGER_IO_V1: 'acme.cert-manager.io/v1',
};

const _$OrderlistAcmeV1KindEnumMap = {
  OrderlistAcmeV1Kind.ORDER_LIST: 'OrderList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
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

const _$ItemKindEnumMap = {ItemKind.ORDER: 'Order'};

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
  commonName: json['commonName'] as String?,
  dnsNames: (json['dnsNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  duration: json['duration'] as String?,
  ipAddresses: (json['ipAddresses'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  issuerRef: IssuerRef.fromJson(json['issuerRef'] as Map<String, dynamic>),
  profile: json['profile'] as String?,
  request: json['request'] as String,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'commonName': instance.commonName,
  'dnsNames': instance.dnsNames,
  'duration': instance.duration,
  'ipAddresses': instance.ipAddresses,
  'issuerRef': instance.issuerRef,
  'profile': instance.profile,
  'request': instance.request,
};

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

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  authorizations: (json['authorizations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : Authorization.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  certificate: json['certificate'] as String?,
  failureTime: json['failureTime'] == null
      ? null
      : DateTime.parse(json['failureTime'] as String),
  finalizeUrl: json['finalizeURL'] as String?,
  reason: json['reason'] as String?,
  state: $enumDecodeNullable(_$StateEnumMap, json['state']),
  url: json['url'] as String?,
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'authorizations': instance.authorizations,
  'certificate': instance.certificate,
  'failureTime': instance.failureTime?.toIso8601String(),
  'finalizeURL': instance.finalizeUrl,
  'reason': instance.reason,
  'state': _$StateEnumMap[instance.state],
  'url': instance.url,
};

const _$StateEnumMap = {
  State.ERRORED: 'errored',
  State.EXPIRED: 'expired',
  State.INVALID: 'invalid',
  State.PENDING: 'pending',
  State.PROCESSING: 'processing',
  State.READY: 'ready',
  State.VALID: 'valid',
};

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization(
      challenges: (json['challenges'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Challenge.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      identifier: json['identifier'] as String?,
      initialState: $enumDecodeNullable(_$StateEnumMap, json['initialState']),
      url: json['url'] as String,
      wildcard: json['wildcard'] as bool?,
    );

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'challenges': instance.challenges,
      'identifier': instance.identifier,
      'initialState': _$StateEnumMap[instance.initialState],
      'url': instance.url,
      'wildcard': instance.wildcard,
    };

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
  token: json['token'] as String,
  type: json['type'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
  'token': instance.token,
  'type': instance.type,
  'url': instance.url,
};

OrderlistAcmeV1Metadata _$OrderlistAcmeV1MetadataFromJson(
  Map<String, dynamic> json,
) => OrderlistAcmeV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$OrderlistAcmeV1MetadataToJson(
  OrderlistAcmeV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
