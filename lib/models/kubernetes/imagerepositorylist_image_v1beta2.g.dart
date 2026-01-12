// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagerepositorylist_image_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagerepositorylistImageV1Beta2 _$ImagerepositorylistImageV1Beta2FromJson(
  Map<String, dynamic> json,
) => ImagerepositorylistImageV1Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ImagerepositorylistImageV1Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ImagerepositorylistImageV1Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImagerepositorylistImageV1Beta2ToJson(
  ImagerepositorylistImageV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ImagerepositorylistImageV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.IMAGE_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'image.toolkit.fluxcd.io/v1beta2',
};

const _$ImagerepositorylistImageV1Beta2KindEnumMap = {
  ImagerepositorylistImageV1Beta2Kind.IMAGE_REPOSITORY_LIST:
      'ImageRepositoryList',
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

const _$ItemKindEnumMap = {ItemKind.IMAGE_REPOSITORY: 'ImageRepository'};

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
  accessFrom: json['accessFrom'] == null
      ? null
      : AccessFrom.fromJson(json['accessFrom'] as Map<String, dynamic>),
  certSecretRef: json['certSecretRef'] == null
      ? null
      : CertSecretRef.fromJson(json['certSecretRef'] as Map<String, dynamic>),
  exclusionList: (json['exclusionList'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  image: json['image'] as String,
  insecure: json['insecure'] as bool?,
  interval: json['interval'] as String,
  provider: $enumDecodeNullable(_$ProviderEnumMap, json['provider']),
  proxySecretRef: json['proxySecretRef'] == null
      ? null
      : ProxySecretRef.fromJson(json['proxySecretRef'] as Map<String, dynamic>),
  secretRef: json['secretRef'] == null
      ? null
      : SecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  serviceAccountName: json['serviceAccountName'] as String?,
  suspend: json['suspend'] as bool?,
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'accessFrom': instance.accessFrom,
  'certSecretRef': instance.certSecretRef,
  'exclusionList': instance.exclusionList,
  'image': instance.image,
  'insecure': instance.insecure,
  'interval': instance.interval,
  'provider': _$ProviderEnumMap[instance.provider],
  'proxySecretRef': instance.proxySecretRef,
  'secretRef': instance.secretRef,
  'serviceAccountName': instance.serviceAccountName,
  'suspend': instance.suspend,
  'timeout': instance.timeout,
};

const _$ProviderEnumMap = {
  Provider.AWS: 'aws',
  Provider.AZURE: 'azure',
  Provider.GCP: 'gcp',
  Provider.GENERIC: 'generic',
};

AccessFrom _$AccessFromFromJson(Map<String, dynamic> json) => AccessFrom(
  namespaceSelectors: (json['namespaceSelectors'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : NamespaceSelector.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AccessFromToJson(AccessFrom instance) =>
    <String, dynamic>{'namespaceSelectors': instance.namespaceSelectors};

NamespaceSelector _$NamespaceSelectorFromJson(Map<String, dynamic> json) =>
    NamespaceSelector(
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$NamespaceSelectorToJson(NamespaceSelector instance) =>
    <String, dynamic>{'matchLabels': instance.matchLabels};

CertSecretRef _$CertSecretRefFromJson(Map<String, dynamic> json) =>
    CertSecretRef(name: json['name'] as String);

Map<String, dynamic> _$CertSecretRefToJson(CertSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

ProxySecretRef _$ProxySecretRefFromJson(Map<String, dynamic> json) =>
    ProxySecretRef(name: json['name'] as String);

Map<String, dynamic> _$ProxySecretRefToJson(ProxySecretRef instance) =>
    <String, dynamic>{'name': instance.name};

SecretRef _$SecretRefFromJson(Map<String, dynamic> json) =>
    SecretRef(name: json['name'] as String);

Map<String, dynamic> _$SecretRefToJson(SecretRef instance) => <String, dynamic>{
  'name': instance.name,
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  canonicalImageName: json['canonicalImageName'] as String?,
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  lastScanResult: json['lastScanResult'] == null
      ? null
      : LastScanResult.fromJson(json['lastScanResult'] as Map<String, dynamic>),
  observedExclusionList: (json['observedExclusionList'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'canonicalImageName': instance.canonicalImageName,
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'lastScanResult': instance.lastScanResult,
      'observedExclusionList': instance.observedExclusionList,
      'observedGeneration': instance.observedGeneration,
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

LastScanResult _$LastScanResultFromJson(Map<String, dynamic> json) =>
    LastScanResult(
      latestTags: (json['latestTags'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      revision: json['revision'] as String?,
      scanTime: json['scanTime'] == null
          ? null
          : DateTime.parse(json['scanTime'] as String),
      tagCount: (json['tagCount'] as num).toInt(),
    );

Map<String, dynamic> _$LastScanResultToJson(LastScanResult instance) =>
    <String, dynamic>{
      'latestTags': instance.latestTags,
      'revision': instance.revision,
      'scanTime': instance.scanTime?.toIso8601String(),
      'tagCount': instance.tagCount,
    };

ImagerepositorylistImageV1Beta2Metadata
_$ImagerepositorylistImageV1Beta2MetadataFromJson(Map<String, dynamic> json) =>
    ImagerepositorylistImageV1Beta2Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ImagerepositorylistImageV1Beta2MetadataToJson(
  ImagerepositorylistImageV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
