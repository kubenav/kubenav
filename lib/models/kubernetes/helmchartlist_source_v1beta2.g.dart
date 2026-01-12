// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helmchartlist_source_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelmchartlistSourceV1Beta2 _$HelmchartlistSourceV1Beta2FromJson(
  Map<String, dynamic> json,
) => HelmchartlistSourceV1Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$HelmchartlistSourceV1Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : HelmchartlistSourceV1Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HelmchartlistSourceV1Beta2ToJson(
  HelmchartlistSourceV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$HelmchartlistSourceV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.SOURCE_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'source.toolkit.fluxcd.io/v1beta2',
};

const _$HelmchartlistSourceV1Beta2KindEnumMap = {
  HelmchartlistSourceV1Beta2Kind.HELM_CHART_LIST: 'HelmChartList',
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

const _$ItemKindEnumMap = {ItemKind.HELM_CHART: 'HelmChart'};

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
  chart: json['chart'] as String,
  ignoreMissingValuesFiles: json['ignoreMissingValuesFiles'] as bool?,
  interval: json['interval'] as String,
  reconcileStrategy: $enumDecodeNullable(
    _$ReconcileStrategyEnumMap,
    json['reconcileStrategy'],
  ),
  sourceRef: SourceRef.fromJson(json['sourceRef'] as Map<String, dynamic>),
  suspend: json['suspend'] as bool?,
  valuesFile: json['valuesFile'] as String?,
  valuesFiles: (json['valuesFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  verify: json['verify'] == null
      ? null
      : Verify.fromJson(json['verify'] as Map<String, dynamic>),
  version: json['version'] as String?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'accessFrom': instance.accessFrom,
  'chart': instance.chart,
  'ignoreMissingValuesFiles': instance.ignoreMissingValuesFiles,
  'interval': instance.interval,
  'reconcileStrategy': _$ReconcileStrategyEnumMap[instance.reconcileStrategy],
  'sourceRef': instance.sourceRef,
  'suspend': instance.suspend,
  'valuesFile': instance.valuesFile,
  'valuesFiles': instance.valuesFiles,
  'verify': instance.verify,
  'version': instance.version,
};

const _$ReconcileStrategyEnumMap = {
  ReconcileStrategy.CHART_VERSION: 'ChartVersion',
  ReconcileStrategy.REVISION: 'Revision',
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

SourceRef _$SourceRefFromJson(Map<String, dynamic> json) => SourceRef(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$SourceRefKindEnumMap, json['kind']),
  name: json['name'] as String,
);

Map<String, dynamic> _$SourceRefToJson(SourceRef instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': _$SourceRefKindEnumMap[instance.kind]!,
  'name': instance.name,
};

const _$SourceRefKindEnumMap = {
  SourceRefKind.BUCKET: 'Bucket',
  SourceRefKind.GIT_REPOSITORY: 'GitRepository',
  SourceRefKind.HELM_REPOSITORY: 'HelmRepository',
};

Verify _$VerifyFromJson(Map<String, dynamic> json) => Verify(
  matchOidcIdentity: (json['matchOIDCIdentity'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchOidcIdentity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  provider: $enumDecode(_$ProviderEnumMap, json['provider']),
  secretRef: json['secretRef'] == null
      ? null
      : SecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyToJson(Verify instance) => <String, dynamic>{
  'matchOIDCIdentity': instance.matchOidcIdentity,
  'provider': _$ProviderEnumMap[instance.provider]!,
  'secretRef': instance.secretRef,
};

const _$ProviderEnumMap = {
  Provider.COSIGN: 'cosign',
  Provider.NOTATION: 'notation',
};

MatchOidcIdentity _$MatchOidcIdentityFromJson(Map<String, dynamic> json) =>
    MatchOidcIdentity(
      issuer: json['issuer'] as String,
      subject: json['subject'] as String,
    );

Map<String, dynamic> _$MatchOidcIdentityToJson(MatchOidcIdentity instance) =>
    <String, dynamic>{'issuer': instance.issuer, 'subject': instance.subject};

SecretRef _$SecretRefFromJson(Map<String, dynamic> json) =>
    SecretRef(name: json['name'] as String);

Map<String, dynamic> _$SecretRefToJson(SecretRef instance) => <String, dynamic>{
  'name': instance.name,
};

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
  observedChartName: json['observedChartName'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  observedSourceArtifactRevision:
      json['observedSourceArtifactRevision'] as String?,
  observedValuesFiles: (json['observedValuesFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  url: json['url'] as String?,
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'artifact': instance.artifact,
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'observedChartName': instance.observedChartName,
      'observedGeneration': instance.observedGeneration,
      'observedSourceArtifactRevision': instance.observedSourceArtifactRevision,
      'observedValuesFiles': instance.observedValuesFiles,
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

HelmchartlistSourceV1Beta2Metadata _$HelmchartlistSourceV1Beta2MetadataFromJson(
  Map<String, dynamic> json,
) => HelmchartlistSourceV1Beta2Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$HelmchartlistSourceV1Beta2MetadataToJson(
  HelmchartlistSourceV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
