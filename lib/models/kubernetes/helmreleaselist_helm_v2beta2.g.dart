// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helmreleaselist_helm_v2beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelmreleaselistHelmV2Beta2 _$HelmreleaselistHelmV2Beta2FromJson(
  Map<String, dynamic> json,
) => HelmreleaselistHelmV2Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$HelmreleaselistHelmV2Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : HelmreleaselistHelmV2Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HelmreleaselistHelmV2Beta2ToJson(
  HelmreleaselistHelmV2Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$HelmreleaselistHelmV2Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.HELM_TOOLKIT_FLUXCD_IO_V2_BETA2: 'helm.toolkit.fluxcd.io/v2beta2',
};

const _$HelmreleaselistHelmV2Beta2KindEnumMap = {
  HelmreleaselistHelmV2Beta2Kind.HELM_RELEASE_LIST: 'HelmReleaseList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : ItemSpec.fromJson(json['spec'] as Map<String, dynamic>),
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

const _$ItemKindEnumMap = {ItemKind.HELM_RELEASE: 'HelmRelease'};

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

ItemSpec _$ItemSpecFromJson(Map<String, dynamic> json) => ItemSpec(
  chart: json['chart'] == null
      ? null
      : Chart.fromJson(json['chart'] as Map<String, dynamic>),
  chartRef: json['chartRef'] == null
      ? null
      : ChartRef.fromJson(json['chartRef'] as Map<String, dynamic>),
  dependsOn: (json['dependsOn'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : DependsOn.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  driftDetection: json['driftDetection'] == null
      ? null
      : DriftDetection.fromJson(json['driftDetection'] as Map<String, dynamic>),
  install: json['install'] == null
      ? null
      : Install.fromJson(json['install'] as Map<String, dynamic>),
  interval: json['interval'] as String,
  kubeConfig: json['kubeConfig'] == null
      ? null
      : KubeConfig.fromJson(json['kubeConfig'] as Map<String, dynamic>),
  maxHistory: (json['maxHistory'] as num?)?.toInt(),
  persistentClient: json['persistentClient'] as bool?,
  postRenderers: (json['postRenderers'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PostRenderer.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  releaseName: json['releaseName'] as String?,
  rollback: json['rollback'] == null
      ? null
      : Rollback.fromJson(json['rollback'] as Map<String, dynamic>),
  serviceAccountName: json['serviceAccountName'] as String?,
  storageNamespace: json['storageNamespace'] as String?,
  suspend: json['suspend'] as bool?,
  targetNamespace: json['targetNamespace'] as String?,
  test: json['test'] == null
      ? null
      : Test.fromJson(json['test'] as Map<String, dynamic>),
  timeout: json['timeout'] as String?,
  uninstall: json['uninstall'] == null
      ? null
      : Uninstall.fromJson(json['uninstall'] as Map<String, dynamic>),
  upgrade: json['upgrade'] == null
      ? null
      : Upgrade.fromJson(json['upgrade'] as Map<String, dynamic>),
  values: json['values'],
  valuesFrom: (json['valuesFrom'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ValuesFrom.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ItemSpecToJson(ItemSpec instance) => <String, dynamic>{
  'chart': instance.chart,
  'chartRef': instance.chartRef,
  'dependsOn': instance.dependsOn,
  'driftDetection': instance.driftDetection,
  'install': instance.install,
  'interval': instance.interval,
  'kubeConfig': instance.kubeConfig,
  'maxHistory': instance.maxHistory,
  'persistentClient': instance.persistentClient,
  'postRenderers': instance.postRenderers,
  'releaseName': instance.releaseName,
  'rollback': instance.rollback,
  'serviceAccountName': instance.serviceAccountName,
  'storageNamespace': instance.storageNamespace,
  'suspend': instance.suspend,
  'targetNamespace': instance.targetNamespace,
  'test': instance.test,
  'timeout': instance.timeout,
  'uninstall': instance.uninstall,
  'upgrade': instance.upgrade,
  'values': instance.values,
  'valuesFrom': instance.valuesFrom,
};

Chart _$ChartFromJson(Map<String, dynamic> json) => Chart(
  metadata: json['metadata'] == null
      ? null
      : ChartMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: ChartSpec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChartToJson(Chart instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

ChartMetadata _$ChartMetadataFromJson(Map<String, dynamic> json) =>
    ChartMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$ChartMetadataToJson(ChartMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

ChartSpec _$ChartSpecFromJson(Map<String, dynamic> json) => ChartSpec(
  chart: json['chart'] as String,
  ignoreMissingValuesFiles: json['ignoreMissingValuesFiles'] as bool?,
  interval: json['interval'] as String?,
  reconcileStrategy: $enumDecodeNullable(
    _$ReconcileStrategyEnumMap,
    json['reconcileStrategy'],
  ),
  sourceRef: SourceRef.fromJson(json['sourceRef'] as Map<String, dynamic>),
  valuesFile: json['valuesFile'] as String?,
  valuesFiles: (json['valuesFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  verify: json['verify'] == null
      ? null
      : Verify.fromJson(json['verify'] as Map<String, dynamic>),
  version: json['version'] as String?,
);

Map<String, dynamic> _$ChartSpecToJson(ChartSpec instance) => <String, dynamic>{
  'chart': instance.chart,
  'ignoreMissingValuesFiles': instance.ignoreMissingValuesFiles,
  'interval': instance.interval,
  'reconcileStrategy': _$ReconcileStrategyEnumMap[instance.reconcileStrategy],
  'sourceRef': instance.sourceRef,
  'valuesFile': instance.valuesFile,
  'valuesFiles': instance.valuesFiles,
  'verify': instance.verify,
  'version': instance.version,
};

const _$ReconcileStrategyEnumMap = {
  ReconcileStrategy.CHART_VERSION: 'ChartVersion',
  ReconcileStrategy.REVISION: 'Revision',
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
  SourceRefKind.HELM_REPOSITORY: 'HelmRepository',
};

Verify _$VerifyFromJson(Map<String, dynamic> json) => Verify(
  provider: $enumDecode(_$ProviderEnumMap, json['provider']),
  secretRef: json['secretRef'] == null
      ? null
      : VerifySecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyToJson(Verify instance) => <String, dynamic>{
  'provider': _$ProviderEnumMap[instance.provider]!,
  'secretRef': instance.secretRef,
};

const _$ProviderEnumMap = {
  Provider.COSIGN: 'cosign',
  Provider.NOTATION: 'notation',
};

VerifySecretRef _$VerifySecretRefFromJson(Map<String, dynamic> json) =>
    VerifySecretRef(name: json['name'] as String);

Map<String, dynamic> _$VerifySecretRefToJson(VerifySecretRef instance) =>
    <String, dynamic>{'name': instance.name};

ChartRef _$ChartRefFromJson(Map<String, dynamic> json) => ChartRef(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$ChartRefKindEnumMap, json['kind']),
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$ChartRefToJson(ChartRef instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': _$ChartRefKindEnumMap[instance.kind]!,
  'name': instance.name,
  'namespace': instance.namespace,
};

const _$ChartRefKindEnumMap = {
  ChartRefKind.HELM_CHART: 'HelmChart',
  ChartRefKind.OCI_REPOSITORY: 'OCIRepository',
};

DependsOn _$DependsOnFromJson(Map<String, dynamic> json) => DependsOn(
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$DependsOnToJson(DependsOn instance) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
};

DriftDetection _$DriftDetectionFromJson(Map<String, dynamic> json) =>
    DriftDetection(
      ignore: (json['ignore'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Ignore.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      mode: $enumDecodeNullable(_$ModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$DriftDetectionToJson(DriftDetection instance) =>
    <String, dynamic>{
      'ignore': instance.ignore,
      'mode': _$ModeEnumMap[instance.mode],
    };

const _$ModeEnumMap = {
  Mode.DISABLED: 'disabled',
  Mode.ENABLED: 'enabled',
  Mode.WARN: 'warn',
};

Ignore _$IgnoreFromJson(Map<String, dynamic> json) => Ignore(
  paths: (json['paths'] as List<dynamic>).map((e) => e as String?).toList(),
  target: json['target'] == null
      ? null
      : IgnoreTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IgnoreToJson(Ignore instance) => <String, dynamic>{
  'paths': instance.paths,
  'target': instance.target,
};

IgnoreTarget _$IgnoreTargetFromJson(Map<String, dynamic> json) => IgnoreTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$IgnoreTargetToJson(IgnoreTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

Install _$InstallFromJson(Map<String, dynamic> json) => Install(
  crds: $enumDecodeNullable(_$CrdsEnumMap, json['crds']),
  createNamespace: json['createNamespace'] as bool?,
  disableHooks: json['disableHooks'] as bool?,
  disableOpenApiValidation: json['disableOpenAPIValidation'] as bool?,
  disableWait: json['disableWait'] as bool?,
  disableWaitForJobs: json['disableWaitForJobs'] as bool?,
  remediation: json['remediation'] == null
      ? null
      : InstallRemediation.fromJson(
          json['remediation'] as Map<String, dynamic>,
        ),
  replace: json['replace'] as bool?,
  skipCrDs: json['skipCRDs'] as bool?,
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$InstallToJson(Install instance) => <String, dynamic>{
  'crds': _$CrdsEnumMap[instance.crds],
  'createNamespace': instance.createNamespace,
  'disableHooks': instance.disableHooks,
  'disableOpenAPIValidation': instance.disableOpenApiValidation,
  'disableWait': instance.disableWait,
  'disableWaitForJobs': instance.disableWaitForJobs,
  'remediation': instance.remediation,
  'replace': instance.replace,
  'skipCRDs': instance.skipCrDs,
  'timeout': instance.timeout,
};

const _$CrdsEnumMap = {
  Crds.CREATE: 'Create',
  Crds.CREATE_REPLACE: 'CreateReplace',
  Crds.SKIP: 'Skip',
};

InstallRemediation _$InstallRemediationFromJson(Map<String, dynamic> json) =>
    InstallRemediation(
      ignoreTestFailures: json['ignoreTestFailures'] as bool?,
      remediateLastFailure: json['remediateLastFailure'] as bool?,
      retries: (json['retries'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InstallRemediationToJson(InstallRemediation instance) =>
    <String, dynamic>{
      'ignoreTestFailures': instance.ignoreTestFailures,
      'remediateLastFailure': instance.remediateLastFailure,
      'retries': instance.retries,
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

PostRenderer _$PostRendererFromJson(Map<String, dynamic> json) => PostRenderer(
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostRendererToJson(PostRenderer instance) =>
    <String, dynamic>{'kustomize': instance.kustomize};

Kustomize _$KustomizeFromJson(Map<String, dynamic> json) => Kustomize(
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
      .toList(),
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : KustomizePatch.fromJson(e as Map<String, dynamic>),
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
);

Map<String, dynamic> _$KustomizeToJson(Kustomize instance) => <String, dynamic>{
  'images': instance.images,
  'patches': instance.patches,
  'patchesJson6902': instance.patchesJson6902,
  'patchesStrategicMerge': instance.patchesStrategicMerge,
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

KustomizePatch _$KustomizePatchFromJson(Map<String, dynamic> json) =>
    KustomizePatch(
      patch: json['patch'] as String,
      target: json['target'] == null
          ? null
          : PatchTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KustomizePatchToJson(KustomizePatch instance) =>
    <String, dynamic>{'patch': instance.patch, 'target': instance.target};

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

Rollback _$RollbackFromJson(Map<String, dynamic> json) => Rollback(
  cleanupOnFail: json['cleanupOnFail'] as bool?,
  disableHooks: json['disableHooks'] as bool?,
  disableWait: json['disableWait'] as bool?,
  disableWaitForJobs: json['disableWaitForJobs'] as bool?,
  force: json['force'] as bool?,
  recreate: json['recreate'] as bool?,
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$RollbackToJson(Rollback instance) => <String, dynamic>{
  'cleanupOnFail': instance.cleanupOnFail,
  'disableHooks': instance.disableHooks,
  'disableWait': instance.disableWait,
  'disableWaitForJobs': instance.disableWaitForJobs,
  'force': instance.force,
  'recreate': instance.recreate,
  'timeout': instance.timeout,
};

Test _$TestFromJson(Map<String, dynamic> json) => Test(
  enable: json['enable'] as bool?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Filter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreFailures: json['ignoreFailures'] as bool?,
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
  'enable': instance.enable,
  'filters': instance.filters,
  'ignoreFailures': instance.ignoreFailures,
  'timeout': instance.timeout,
};

Filter _$FilterFromJson(Map<String, dynamic> json) =>
    Filter(exclude: json['exclude'] as bool?, name: json['name'] as String);

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
  'exclude': instance.exclude,
  'name': instance.name,
};

Uninstall _$UninstallFromJson(Map<String, dynamic> json) => Uninstall(
  deletionPropagation: $enumDecodeNullable(
    _$DeletionPropagationEnumMap,
    json['deletionPropagation'],
  ),
  disableHooks: json['disableHooks'] as bool?,
  disableWait: json['disableWait'] as bool?,
  keepHistory: json['keepHistory'] as bool?,
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$UninstallToJson(Uninstall instance) => <String, dynamic>{
  'deletionPropagation':
      _$DeletionPropagationEnumMap[instance.deletionPropagation],
  'disableHooks': instance.disableHooks,
  'disableWait': instance.disableWait,
  'keepHistory': instance.keepHistory,
  'timeout': instance.timeout,
};

const _$DeletionPropagationEnumMap = {
  DeletionPropagation.BACKGROUND: 'background',
  DeletionPropagation.FOREGROUND: 'foreground',
  DeletionPropagation.ORPHAN: 'orphan',
};

Upgrade _$UpgradeFromJson(Map<String, dynamic> json) => Upgrade(
  cleanupOnFail: json['cleanupOnFail'] as bool?,
  crds: $enumDecodeNullable(_$CrdsEnumMap, json['crds']),
  disableHooks: json['disableHooks'] as bool?,
  disableOpenApiValidation: json['disableOpenAPIValidation'] as bool?,
  disableWait: json['disableWait'] as bool?,
  disableWaitForJobs: json['disableWaitForJobs'] as bool?,
  force: json['force'] as bool?,
  preserveValues: json['preserveValues'] as bool?,
  remediation: json['remediation'] == null
      ? null
      : UpgradeRemediation.fromJson(
          json['remediation'] as Map<String, dynamic>,
        ),
  timeout: json['timeout'] as String?,
);

Map<String, dynamic> _$UpgradeToJson(Upgrade instance) => <String, dynamic>{
  'cleanupOnFail': instance.cleanupOnFail,
  'crds': _$CrdsEnumMap[instance.crds],
  'disableHooks': instance.disableHooks,
  'disableOpenAPIValidation': instance.disableOpenApiValidation,
  'disableWait': instance.disableWait,
  'disableWaitForJobs': instance.disableWaitForJobs,
  'force': instance.force,
  'preserveValues': instance.preserveValues,
  'remediation': instance.remediation,
  'timeout': instance.timeout,
};

UpgradeRemediation _$UpgradeRemediationFromJson(Map<String, dynamic> json) =>
    UpgradeRemediation(
      ignoreTestFailures: json['ignoreTestFailures'] as bool?,
      remediateLastFailure: json['remediateLastFailure'] as bool?,
      retries: (json['retries'] as num?)?.toInt(),
      strategy: $enumDecodeNullable(_$StrategyEnumMap, json['strategy']),
    );

Map<String, dynamic> _$UpgradeRemediationToJson(UpgradeRemediation instance) =>
    <String, dynamic>{
      'ignoreTestFailures': instance.ignoreTestFailures,
      'remediateLastFailure': instance.remediateLastFailure,
      'retries': instance.retries,
      'strategy': _$StrategyEnumMap[instance.strategy],
    };

const _$StrategyEnumMap = {
  Strategy.ROLLBACK: 'rollback',
  Strategy.UNINSTALL: 'uninstall',
};

ValuesFrom _$ValuesFromFromJson(Map<String, dynamic> json) => ValuesFrom(
  kind: $enumDecode(_$ValuesFromKindEnumMap, json['kind']),
  name: json['name'] as String,
  optional: json['optional'] as bool?,
  targetPath: json['targetPath'] as String?,
  valuesKey: json['valuesKey'] as String?,
);

Map<String, dynamic> _$ValuesFromToJson(ValuesFrom instance) =>
    <String, dynamic>{
      'kind': _$ValuesFromKindEnumMap[instance.kind]!,
      'name': instance.name,
      'optional': instance.optional,
      'targetPath': instance.targetPath,
      'valuesKey': instance.valuesKey,
    };

const _$ValuesFromKindEnumMap = {
  ValuesFromKind.CONFIG_MAP: 'ConfigMap',
  ValuesFromKind.SECRET: 'Secret',
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  failures: (json['failures'] as num?)?.toInt(),
  helmChart: json['helmChart'] as String?,
  history: (json['history'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : History.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  installFailures: (json['installFailures'] as num?)?.toInt(),
  lastAppliedRevision: json['lastAppliedRevision'] as String?,
  lastAttemptedConfigDigest: json['lastAttemptedConfigDigest'] as String?,
  lastAttemptedGeneration: (json['lastAttemptedGeneration'] as num?)?.toInt(),
  lastAttemptedReleaseAction: $enumDecodeNullable(
    _$LastAttemptedReleaseActionEnumMap,
    json['lastAttemptedReleaseAction'],
  ),
  lastAttemptedRevision: json['lastAttemptedRevision'] as String?,
  lastAttemptedRevisionDigest: json['lastAttemptedRevisionDigest'] as String?,
  lastAttemptedValuesChecksum: json['lastAttemptedValuesChecksum'] as String?,
  lastHandledForceAt: json['lastHandledForceAt'] as String?,
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  lastHandledResetAt: json['lastHandledResetAt'] as String?,
  lastReleaseRevision: (json['lastReleaseRevision'] as num?)?.toInt(),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  observedPostRenderersDigest: json['observedPostRenderersDigest'] as String?,
  storageNamespace: json['storageNamespace'] as String?,
  upgradeFailures: (json['upgradeFailures'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(
  StatusClass instance,
) => <String, dynamic>{
  'conditions': instance.conditions,
  'failures': instance.failures,
  'helmChart': instance.helmChart,
  'history': instance.history,
  'installFailures': instance.installFailures,
  'lastAppliedRevision': instance.lastAppliedRevision,
  'lastAttemptedConfigDigest': instance.lastAttemptedConfigDigest,
  'lastAttemptedGeneration': instance.lastAttemptedGeneration,
  'lastAttemptedReleaseAction':
      _$LastAttemptedReleaseActionEnumMap[instance.lastAttemptedReleaseAction],
  'lastAttemptedRevision': instance.lastAttemptedRevision,
  'lastAttemptedRevisionDigest': instance.lastAttemptedRevisionDigest,
  'lastAttemptedValuesChecksum': instance.lastAttemptedValuesChecksum,
  'lastHandledForceAt': instance.lastHandledForceAt,
  'lastHandledReconcileAt': instance.lastHandledReconcileAt,
  'lastHandledResetAt': instance.lastHandledResetAt,
  'lastReleaseRevision': instance.lastReleaseRevision,
  'observedGeneration': instance.observedGeneration,
  'observedPostRenderersDigest': instance.observedPostRenderersDigest,
  'storageNamespace': instance.storageNamespace,
  'upgradeFailures': instance.upgradeFailures,
};

const _$LastAttemptedReleaseActionEnumMap = {
  LastAttemptedReleaseAction.INSTALL: 'install',
  LastAttemptedReleaseAction.UPGRADE: 'upgrade',
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
  apiVersion: json['apiVersion'] as String?,
  appVersion: json['appVersion'] as String?,
  chartName: json['chartName'] as String,
  chartVersion: json['chartVersion'] as String,
  configDigest: json['configDigest'] as String,
  deleted: json['deleted'] == null
      ? null
      : DateTime.parse(json['deleted'] as String),
  digest: json['digest'] as String,
  firstDeployed: DateTime.parse(json['firstDeployed'] as String),
  lastDeployed: DateTime.parse(json['lastDeployed'] as String),
  name: json['name'] as String,
  namespace: json['namespace'] as String,
  ociDigest: json['ociDigest'] as String?,
  status: json['status'] as String,
  testHooks: (json['testHooks'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      e == null ? null : TestHook.fromJson(e as Map<String, dynamic>),
    ),
  ),
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'appVersion': instance.appVersion,
  'chartName': instance.chartName,
  'chartVersion': instance.chartVersion,
  'configDigest': instance.configDigest,
  'deleted': instance.deleted?.toIso8601String(),
  'digest': instance.digest,
  'firstDeployed': instance.firstDeployed.toIso8601String(),
  'lastDeployed': instance.lastDeployed.toIso8601String(),
  'name': instance.name,
  'namespace': instance.namespace,
  'ociDigest': instance.ociDigest,
  'status': instance.status,
  'testHooks': instance.testHooks,
  'version': instance.version,
};

TestHook _$TestHookFromJson(Map<String, dynamic> json) => TestHook(
  lastCompleted: json['lastCompleted'] == null
      ? null
      : DateTime.parse(json['lastCompleted'] as String),
  lastStarted: json['lastStarted'] == null
      ? null
      : DateTime.parse(json['lastStarted'] as String),
  phase: json['phase'] as String?,
);

Map<String, dynamic> _$TestHookToJson(TestHook instance) => <String, dynamic>{
  'lastCompleted': instance.lastCompleted?.toIso8601String(),
  'lastStarted': instance.lastStarted?.toIso8601String(),
  'phase': instance.phase,
};

HelmreleaselistHelmV2Beta2Metadata _$HelmreleaselistHelmV2Beta2MetadataFromJson(
  Map<String, dynamic> json,
) => HelmreleaselistHelmV2Beta2Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$HelmreleaselistHelmV2Beta2MetadataToJson(
  HelmreleaselistHelmV2Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
