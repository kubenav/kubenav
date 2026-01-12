// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kustomizationlist_kustomize_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KustomizationlistKustomizeV1 _$KustomizationlistKustomizeV1FromJson(
  Map<String, dynamic> json,
) => KustomizationlistKustomizeV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$KustomizationlistKustomizeV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : KustomizationlistKustomizeV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$KustomizationlistKustomizeV1ToJson(
  KustomizationlistKustomizeV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$KustomizationlistKustomizeV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.KUSTOMIZE_TOOLKIT_FLUXCD_IO_V1: 'kustomize.toolkit.fluxcd.io/v1',
};

const _$KustomizationlistKustomizeV1KindEnumMap = {
  KustomizationlistKustomizeV1Kind.KUSTOMIZATION_LIST: 'KustomizationList',
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

const _$ItemKindEnumMap = {ItemKind.KUSTOMIZATION: 'Kustomization'};

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
  commonMetadata: json['commonMetadata'] == null
      ? null
      : CommonMetadata.fromJson(json['commonMetadata'] as Map<String, dynamic>),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  decryption: json['decryption'] == null
      ? null
      : Decryption.fromJson(json['decryption'] as Map<String, dynamic>),
  deletionPolicy: $enumDecodeNullable(
    _$DeletionPolicyEnumMap,
    json['deletionPolicy'],
  ),
  dependsOn: (json['dependsOn'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : DependsOn.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  force: json['force'] as bool?,
  healthCheckExprs: (json['healthCheckExprs'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : HealthCheckExpr.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  healthChecks: (json['healthChecks'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : HealthCheck.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
      .toList(),
  interval: json['interval'] as String,
  kubeConfig: json['kubeConfig'] == null
      ? null
      : KubeConfig.fromJson(json['kubeConfig'] as Map<String, dynamic>),
  namePrefix: json['namePrefix'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Patch.fromJson(e as Map<String, dynamic>))
      .toList(),
  path: json['path'] as String?,
  postBuild: json['postBuild'] == null
      ? null
      : PostBuild.fromJson(json['postBuild'] as Map<String, dynamic>),
  prune: json['prune'] as bool,
  retryInterval: json['retryInterval'] as String?,
  serviceAccountName: json['serviceAccountName'] as String?,
  sourceRef: SourceRef.fromJson(json['sourceRef'] as Map<String, dynamic>),
  suspend: json['suspend'] as bool?,
  targetNamespace: json['targetNamespace'] as String?,
  timeout: json['timeout'] as String?,
  wait: json['wait'] as bool?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'commonMetadata': instance.commonMetadata,
  'components': instance.components,
  'decryption': instance.decryption,
  'deletionPolicy': _$DeletionPolicyEnumMap[instance.deletionPolicy],
  'dependsOn': instance.dependsOn,
  'force': instance.force,
  'healthCheckExprs': instance.healthCheckExprs,
  'healthChecks': instance.healthChecks,
  'ignoreMissingComponents': instance.ignoreMissingComponents,
  'images': instance.images,
  'interval': instance.interval,
  'kubeConfig': instance.kubeConfig,
  'namePrefix': instance.namePrefix,
  'nameSuffix': instance.nameSuffix,
  'patches': instance.patches,
  'path': instance.path,
  'postBuild': instance.postBuild,
  'prune': instance.prune,
  'retryInterval': instance.retryInterval,
  'serviceAccountName': instance.serviceAccountName,
  'sourceRef': instance.sourceRef,
  'suspend': instance.suspend,
  'targetNamespace': instance.targetNamespace,
  'timeout': instance.timeout,
  'wait': instance.wait,
};

const _$DeletionPolicyEnumMap = {
  DeletionPolicy.DELETE: 'Delete',
  DeletionPolicy.MIRROR_PRUNE: 'MirrorPrune',
  DeletionPolicy.ORPHAN: 'Orphan',
  DeletionPolicy.WAIT_FOR_TERMINATION: 'WaitForTermination',
};

CommonMetadata _$CommonMetadataFromJson(Map<String, dynamic> json) =>
    CommonMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$CommonMetadataToJson(CommonMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

Decryption _$DecryptionFromJson(Map<String, dynamic> json) => Decryption(
  provider: $enumDecode(_$ProviderEnumMap, json['provider']),
  secretRef: json['secretRef'] == null
      ? null
      : DecryptionSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  serviceAccountName: json['serviceAccountName'] as String?,
);

Map<String, dynamic> _$DecryptionToJson(Decryption instance) =>
    <String, dynamic>{
      'provider': _$ProviderEnumMap[instance.provider]!,
      'secretRef': instance.secretRef,
      'serviceAccountName': instance.serviceAccountName,
    };

const _$ProviderEnumMap = {Provider.SOPS: 'sops'};

DecryptionSecretRef _$DecryptionSecretRefFromJson(Map<String, dynamic> json) =>
    DecryptionSecretRef(name: json['name'] as String);

Map<String, dynamic> _$DecryptionSecretRefToJson(
  DecryptionSecretRef instance,
) => <String, dynamic>{'name': instance.name};

DependsOn _$DependsOnFromJson(Map<String, dynamic> json) => DependsOn(
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
  readyExpr: json['readyExpr'] as String?,
);

Map<String, dynamic> _$DependsOnToJson(DependsOn instance) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'readyExpr': instance.readyExpr,
};

HealthCheckExpr _$HealthCheckExprFromJson(Map<String, dynamic> json) =>
    HealthCheckExpr(
      apiVersion: json['apiVersion'] as String,
      current: json['current'] as String,
      failed: json['failed'] as String?,
      inProgress: json['inProgress'] as String?,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$HealthCheckExprToJson(HealthCheckExpr instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'current': instance.current,
      'failed': instance.failed,
      'inProgress': instance.inProgress,
      'kind': instance.kind,
    };

HealthCheck _$HealthCheckFromJson(Map<String, dynamic> json) => HealthCheck(
  apiVersion: json['apiVersion'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$HealthCheckToJson(HealthCheck instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  digest: json['digest'] as String?,
  name: json['name'] as String,
  newName: json['newName'] as String?,
  newTag: json['newTag'] as String?,
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'digest': instance.digest,
  'name': instance.name,
  'newName': instance.newName,
  'newTag': instance.newTag,
};

KubeConfig _$KubeConfigFromJson(Map<String, dynamic> json) => KubeConfig(
  configMapRef: json['configMapRef'] == null
      ? null
      : ConfigMapRef.fromJson(json['configMapRef'] as Map<String, dynamic>),
  secretRef: json['secretRef'] == null
      ? null
      : KubeConfigSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$KubeConfigToJson(KubeConfig instance) =>
    <String, dynamic>{
      'configMapRef': instance.configMapRef,
      'secretRef': instance.secretRef,
    };

ConfigMapRef _$ConfigMapRefFromJson(Map<String, dynamic> json) =>
    ConfigMapRef(name: json['name'] as String);

Map<String, dynamic> _$ConfigMapRefToJson(ConfigMapRef instance) =>
    <String, dynamic>{'name': instance.name};

KubeConfigSecretRef _$KubeConfigSecretRefFromJson(Map<String, dynamic> json) =>
    KubeConfigSecretRef(
      key: json['key'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$KubeConfigSecretRefToJson(
  KubeConfigSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
  patch: json['patch'] as String,
  target: json['target'] == null
      ? null
      : Target.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PatchToJson(Patch instance) => <String, dynamic>{
  'patch': instance.patch,
  'target': instance.target,
};

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

PostBuild _$PostBuildFromJson(Map<String, dynamic> json) => PostBuild(
  substitute: (json['substitute'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  substituteFrom: (json['substituteFrom'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SubstituteFrom.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PostBuildToJson(PostBuild instance) => <String, dynamic>{
  'substitute': instance.substitute,
  'substituteFrom': instance.substituteFrom,
};

SubstituteFrom _$SubstituteFromFromJson(Map<String, dynamic> json) =>
    SubstituteFrom(
      kind: $enumDecode(_$SubstituteFromKindEnumMap, json['kind']),
      name: json['name'] as String,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$SubstituteFromToJson(SubstituteFrom instance) =>
    <String, dynamic>{
      'kind': _$SubstituteFromKindEnumMap[instance.kind]!,
      'name': instance.name,
      'optional': instance.optional,
    };

const _$SubstituteFromKindEnumMap = {
  SubstituteFromKind.CONFIG_MAP: 'ConfigMap',
  SubstituteFromKind.SECRET: 'Secret',
};

SourceRef _$SourceRefFromJson(Map<String, dynamic> json) => SourceRef(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$SourceRefKindEnumMap, json['kind']),
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$SourceRefToJson(SourceRef instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': _$SourceRefKindEnumMap[instance.kind]!,
  'name': instance.name,
  'namespace': instance.namespace,
};

const _$SourceRefKindEnumMap = {
  SourceRefKind.BUCKET: 'Bucket',
  SourceRefKind.EXTERNAL_ARTIFACT: 'ExternalArtifact',
  SourceRefKind.GIT_REPOSITORY: 'GitRepository',
  SourceRefKind.OCI_REPOSITORY: 'OCIRepository',
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  history: (json['history'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : History.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  inventory: json['inventory'] == null
      ? null
      : Inventory.fromJson(json['inventory'] as Map<String, dynamic>),
  lastAppliedOriginRevision: json['lastAppliedOriginRevision'] as String?,
  lastAppliedRevision: json['lastAppliedRevision'] as String?,
  lastAttemptedRevision: json['lastAttemptedRevision'] as String?,
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'history': instance.history,
      'inventory': instance.inventory,
      'lastAppliedOriginRevision': instance.lastAppliedOriginRevision,
      'lastAppliedRevision': instance.lastAppliedRevision,
      'lastAttemptedRevision': instance.lastAttemptedRevision,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
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

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  digest: json['digest'] as String,
  firstReconciled: DateTime.parse(json['firstReconciled'] as String),
  lastReconciled: DateTime.parse(json['lastReconciled'] as String),
  lastReconciledDuration: json['lastReconciledDuration'] as String,
  lastReconciledStatus: json['lastReconciledStatus'] as String,
  metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  totalReconciliations: (json['totalReconciliations'] as num).toInt(),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'digest': instance.digest,
  'firstReconciled': instance.firstReconciled.toIso8601String(),
  'lastReconciled': instance.lastReconciled.toIso8601String(),
  'lastReconciledDuration': instance.lastReconciledDuration,
  'lastReconciledStatus': instance.lastReconciledStatus,
  'metadata': instance.metadata,
  'totalReconciliations': instance.totalReconciliations,
};

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory(
  entries: (json['entries'] as List<dynamic>)
      .map((e) => e == null ? null : Entry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
  'entries': instance.entries,
};

Entry _$EntryFromJson(Map<String, dynamic> json) =>
    Entry(id: json['id'] as String, v: json['v'] as String);

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
  'id': instance.id,
  'v': instance.v,
};

KustomizationlistKustomizeV1Metadata
_$KustomizationlistKustomizeV1MetadataFromJson(Map<String, dynamic> json) =>
    KustomizationlistKustomizeV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$KustomizationlistKustomizeV1MetadataToJson(
  KustomizationlistKustomizeV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
