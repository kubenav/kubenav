// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocirepositorylist_source_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcirepositorylistSourceV1 _$OcirepositorylistSourceV1FromJson(
  Map<String, dynamic> json,
) => OcirepositorylistSourceV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$OcirepositorylistSourceV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : OcirepositorylistSourceV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OcirepositorylistSourceV1ToJson(
  OcirepositorylistSourceV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$OcirepositorylistSourceV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.SOURCE_TOOLKIT_FLUXCD_IO_V1: 'source.toolkit.fluxcd.io/v1',
};

const _$OcirepositorylistSourceV1KindEnumMap = {
  OcirepositorylistSourceV1Kind.OCI_REPOSITORY_LIST: 'OCIRepositoryList',
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

const _$ItemKindEnumMap = {ItemKind.OCI_REPOSITORY: 'OCIRepository'};

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
  certSecretRef: json['certSecretRef'] == null
      ? null
      : CertSecretRef.fromJson(json['certSecretRef'] as Map<String, dynamic>),
  ignore: json['ignore'] as String?,
  insecure: json['insecure'] as bool?,
  interval: json['interval'] as String,
  layerSelector: json['layerSelector'] == null
      ? null
      : LayerSelector.fromJson(json['layerSelector'] as Map<String, dynamic>),
  provider: $enumDecodeNullable(_$SpecProviderEnumMap, json['provider']),
  proxySecretRef: json['proxySecretRef'] == null
      ? null
      : ProxySecretRef.fromJson(json['proxySecretRef'] as Map<String, dynamic>),
  ref: json['ref'] == null
      ? null
      : Ref.fromJson(json['ref'] as Map<String, dynamic>),
  secretRef: json['secretRef'] == null
      ? null
      : SpecSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  serviceAccountName: json['serviceAccountName'] as String?,
  suspend: json['suspend'] as bool?,
  timeout: json['timeout'] as String?,
  url: json['url'] as String,
  verify: json['verify'] == null
      ? null
      : Verify.fromJson(json['verify'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'certSecretRef': instance.certSecretRef,
  'ignore': instance.ignore,
  'insecure': instance.insecure,
  'interval': instance.interval,
  'layerSelector': instance.layerSelector,
  'provider': _$SpecProviderEnumMap[instance.provider],
  'proxySecretRef': instance.proxySecretRef,
  'ref': instance.ref,
  'secretRef': instance.secretRef,
  'serviceAccountName': instance.serviceAccountName,
  'suspend': instance.suspend,
  'timeout': instance.timeout,
  'url': instance.url,
  'verify': instance.verify,
};

const _$SpecProviderEnumMap = {
  SpecProvider.AWS: 'aws',
  SpecProvider.AZURE: 'azure',
  SpecProvider.GCP: 'gcp',
  SpecProvider.GENERIC: 'generic',
};

CertSecretRef _$CertSecretRefFromJson(Map<String, dynamic> json) =>
    CertSecretRef(name: json['name'] as String);

Map<String, dynamic> _$CertSecretRefToJson(CertSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

LayerSelector _$LayerSelectorFromJson(Map<String, dynamic> json) =>
    LayerSelector(
      mediaType: json['mediaType'] as String?,
      operation: $enumDecodeNullable(_$OperationEnumMap, json['operation']),
    );

Map<String, dynamic> _$LayerSelectorToJson(LayerSelector instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'operation': _$OperationEnumMap[instance.operation],
    };

const _$OperationEnumMap = {
  Operation.COPY: 'copy',
  Operation.EXTRACT: 'extract',
};

ProxySecretRef _$ProxySecretRefFromJson(Map<String, dynamic> json) =>
    ProxySecretRef(name: json['name'] as String);

Map<String, dynamic> _$ProxySecretRefToJson(ProxySecretRef instance) =>
    <String, dynamic>{'name': instance.name};

Ref _$RefFromJson(Map<String, dynamic> json) => Ref(
  digest: json['digest'] as String?,
  semver: json['semver'] as String?,
  semverFilter: json['semverFilter'] as String?,
  tag: json['tag'] as String?,
);

Map<String, dynamic> _$RefToJson(Ref instance) => <String, dynamic>{
  'digest': instance.digest,
  'semver': instance.semver,
  'semverFilter': instance.semverFilter,
  'tag': instance.tag,
};

SpecSecretRef _$SpecSecretRefFromJson(Map<String, dynamic> json) =>
    SpecSecretRef(name: json['name'] as String);

Map<String, dynamic> _$SpecSecretRefToJson(SpecSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

Verify _$VerifyFromJson(Map<String, dynamic> json) => Verify(
  matchOidcIdentity: (json['matchOIDCIdentity'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchOidcIdentity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  provider: $enumDecode(_$VerifyProviderEnumMap, json['provider']),
  secretRef: json['secretRef'] == null
      ? null
      : VerifySecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyToJson(Verify instance) => <String, dynamic>{
  'matchOIDCIdentity': instance.matchOidcIdentity,
  'provider': _$VerifyProviderEnumMap[instance.provider]!,
  'secretRef': instance.secretRef,
};

const _$VerifyProviderEnumMap = {
  VerifyProvider.COSIGN: 'cosign',
  VerifyProvider.NOTATION: 'notation',
};

MatchOidcIdentity _$MatchOidcIdentityFromJson(Map<String, dynamic> json) =>
    MatchOidcIdentity(
      issuer: json['issuer'] as String,
      subject: json['subject'] as String,
    );

Map<String, dynamic> _$MatchOidcIdentityToJson(MatchOidcIdentity instance) =>
    <String, dynamic>{'issuer': instance.issuer, 'subject': instance.subject};

VerifySecretRef _$VerifySecretRefFromJson(Map<String, dynamic> json) =>
    VerifySecretRef(name: json['name'] as String);

Map<String, dynamic> _$VerifySecretRefToJson(VerifySecretRef instance) =>
    <String, dynamic>{'name': instance.name};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  artifact: json['artifact'] == null
      ? null
      : Artifact.fromJson(json['artifact'] as Map<String, dynamic>),
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  observedIgnore: json['observedIgnore'] as String?,
  observedLayerSelector: json['observedLayerSelector'] == null
      ? null
      : ObservedLayerSelector.fromJson(
          json['observedLayerSelector'] as Map<String, dynamic>,
        ),
  url: json['url'] as String?,
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'artifact': instance.artifact,
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'observedGeneration': instance.observedGeneration,
      'observedIgnore': instance.observedIgnore,
      'observedLayerSelector': instance.observedLayerSelector,
      'url': instance.url,
    };

Artifact _$ArtifactFromJson(Map<String, dynamic> json) => Artifact(
  digest: json['digest'] as String,
  lastUpdateTime: DateTime.parse(json['lastUpdateTime'] as String),
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  path: json['path'] as String,
  revision: json['revision'] as String,
  size: (json['size'] as num?)?.toInt(),
  url: json['url'] as String,
);

Map<String, dynamic> _$ArtifactToJson(Artifact instance) => <String, dynamic>{
  'digest': instance.digest,
  'lastUpdateTime': instance.lastUpdateTime.toIso8601String(),
  'metadata': instance.metadata,
  'path': instance.path,
  'revision': instance.revision,
  'size': instance.size,
  'url': instance.url,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  reason: json['reason'] as String,
  status: $enumDecode(_$StatusEnumEnumMap, json['status']),
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime.toIso8601String(),
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

ObservedLayerSelector _$ObservedLayerSelectorFromJson(
  Map<String, dynamic> json,
) => ObservedLayerSelector(
  mediaType: json['mediaType'] as String?,
  operation: $enumDecodeNullable(_$OperationEnumMap, json['operation']),
);

Map<String, dynamic> _$ObservedLayerSelectorToJson(
  ObservedLayerSelector instance,
) => <String, dynamic>{
  'mediaType': instance.mediaType,
  'operation': _$OperationEnumMap[instance.operation],
};

OcirepositorylistSourceV1Metadata _$OcirepositorylistSourceV1MetadataFromJson(
  Map<String, dynamic> json,
) => OcirepositorylistSourceV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$OcirepositorylistSourceV1MetadataToJson(
  OcirepositorylistSourceV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
