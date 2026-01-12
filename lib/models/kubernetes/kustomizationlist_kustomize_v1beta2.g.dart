// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kustomizationlist_kustomize_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KustomizationlistKustomizeV1Beta2 _$KustomizationlistKustomizeV1Beta2FromJson(
  Map<String, dynamic> json,
) => KustomizationlistKustomizeV1Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$KustomizationlistKustomizeV1Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : KustomizationlistKustomizeV1Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$KustomizationlistKustomizeV1Beta2ToJson(
  KustomizationlistKustomizeV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$KustomizationlistKustomizeV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.KUSTOMIZE_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'kustomize.toolkit.fluxcd.io/v1beta2',
};

const _$KustomizationlistKustomizeV1Beta2KindEnumMap = {
  KustomizationlistKustomizeV1Beta2Kind.KUSTOMIZATION_LIST: 'KustomizationList',
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
  dependsOn: (json['dependsOn'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : DependsOn.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  force: json['force'] as bool?,
  healthChecks: (json['healthChecks'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : HealthCheck.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
      .toList(),
  interval: json['interval'] as String,
  kubeConfig: json['kubeConfig'] == null
      ? null
      : KubeConfig.fromJson(json['kubeConfig'] as Map<String, dynamic>),
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : SpecPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  patchesJson6902: (json['patchesJson6902'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PatchesJson6902.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  patchesStrategicMerge: json['patchesStrategicMerge'] as List<dynamic>?,
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
  validation: $enumDecodeNullable(_$ValidationEnumMap, json['validation']),
  wait: json['wait'] as bool?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'commonMetadata': instance.commonMetadata,
  'components': instance.components,
  'decryption': instance.decryption,
  'dependsOn': instance.dependsOn,
  'force': instance.force,
  'healthChecks': instance.healthChecks,
  'images': instance.images,
  'interval': instance.interval,
  'kubeConfig': instance.kubeConfig,
  'patches': instance.patches,
  'patchesJson6902': instance.patchesJson6902,
  'patchesStrategicMerge': instance.patchesStrategicMerge,
  'path': instance.path,
  'postBuild': instance.postBuild,
  'prune': instance.prune,
  'retryInterval': instance.retryInterval,
  'serviceAccountName': instance.serviceAccountName,
  'sourceRef': instance.sourceRef,
  'suspend': instance.suspend,
  'targetNamespace': instance.targetNamespace,
  'timeout': instance.timeout,
  'validation': _$ValidationEnumMap[instance.validation],
  'wait': instance.wait,
};

const _$ValidationEnumMap = {
  Validation.CLIENT: 'client',
  Validation.NONE: 'none',
  Validation.SERVER: 'server',
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
);

Map<String, dynamic> _$DecryptionToJson(Decryption instance) =>
    <String, dynamic>{
      'provider': _$ProviderEnumMap[instance.provider]!,
      'secretRef': instance.secretRef,
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
);

Map<String, dynamic> _$DependsOnToJson(DependsOn instance) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
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

SpecPatch _$SpecPatchFromJson(Map<String, dynamic> json) => SpecPatch(
  patch: json['patch'] as String,
  target: json['target'] == null
      ? null
      : PatchTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecPatchToJson(SpecPatch instance) => <String, dynamic>{
  'patch': instance.patch,
  'target': instance.target,
};

PatchTarget _$PatchTargetFromJson(Map<String, dynamic> json) => PatchTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$PatchTargetToJson(PatchTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

PatchesJson6902 _$PatchesJson6902FromJson(Map<String, dynamic> json) =>
    PatchesJson6902(
      patch: (json['patch'] as List<dynamic>)
          .map(
            (e) => e == null
                ? null
                : PatchesJson6902Patch.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      target: PatchesJson6902Target.fromJson(
        json['target'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PatchesJson6902ToJson(PatchesJson6902 instance) =>
    <String, dynamic>{'patch': instance.patch, 'target': instance.target};

PatchesJson6902Patch _$PatchesJson6902PatchFromJson(
  Map<String, dynamic> json,
) => PatchesJson6902Patch(
  from: json['from'] as String?,
  op: $enumDecode(_$OpEnumMap, json['op']),
  path: json['path'] as String,
  value: json['value'],
);

Map<String, dynamic> _$PatchesJson6902PatchToJson(
  PatchesJson6902Patch instance,
) => <String, dynamic>{
  'from': instance.from,
  'op': _$OpEnumMap[instance.op]!,
  'path': instance.path,
  'value': instance.value,
};

const _$OpEnumMap = {
  Op.ADD: 'add',
  Op.COPY: 'copy',
  Op.MOVE: 'move',
  Op.REMOVE: 'remove',
  Op.REPLACE: 'replace',
  Op.TEST: 'test',
};

PatchesJson6902Target _$PatchesJson6902TargetFromJson(
  Map<String, dynamic> json,
) => PatchesJson6902Target(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$PatchesJson6902TargetToJson(
  PatchesJson6902Target instance,
) => <String, dynamic>{
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
  SourceRefKind.GIT_REPOSITORY: 'GitRepository',
  SourceRefKind.OCI_REPOSITORY: 'OCIRepository',
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  inventory: json['inventory'] == null
      ? null
      : Inventory.fromJson(json['inventory'] as Map<String, dynamic>),
  lastAppliedRevision: json['lastAppliedRevision'] as String?,
  lastAttemptedRevision: json['lastAttemptedRevision'] as String?,
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'inventory': instance.inventory,
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

KustomizationlistKustomizeV1Beta2Metadata
_$KustomizationlistKustomizeV1Beta2MetadataFromJson(
  Map<String, dynamic> json,
) => KustomizationlistKustomizeV1Beta2Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$KustomizationlistKustomizeV1Beta2MetadataToJson(
  KustomizationlistKustomizeV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
