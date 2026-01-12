// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicationlist_argoproj_v1alpha1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationlistArgoprojV1Alpha1 _$ApplicationlistArgoprojV1Alpha1FromJson(
  Map<String, dynamic> json,
) => ApplicationlistArgoprojV1Alpha1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ApplicationlistArgoprojV1Alpha1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ApplicationlistArgoprojV1Alpha1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ApplicationlistArgoprojV1Alpha1ToJson(
  ApplicationlistArgoprojV1Alpha1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ApplicationlistArgoprojV1Alpha1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ARGOPROJ_IO_V1_ALPHA1: 'argoproj.io/v1alpha1',
};

const _$ApplicationlistArgoprojV1Alpha1KindEnumMap = {
  ApplicationlistArgoprojV1Alpha1Kind.APPLICATION_LIST: 'ApplicationList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  operation: json['operation'] == null
      ? null
      : ItemOperation.fromJson(json['operation'] as Map<String, dynamic>),
  spec: Spec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'operation': instance.operation,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.APPLICATION: 'Application'};

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

ItemOperation _$ItemOperationFromJson(
  Map<String, dynamic> json,
) => ItemOperation(
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  initiatedBy: json['initiatedBy'] == null
      ? null
      : PurpleInitiatedBy.fromJson(json['initiatedBy'] as Map<String, dynamic>),
  retry: json['retry'] == null
      ? null
      : PurpleRetry.fromJson(json['retry'] as Map<String, dynamic>),
  sync: json['sync'] == null
      ? null
      : PurpleSync.fromJson(json['sync'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemOperationToJson(ItemOperation instance) =>
    <String, dynamic>{
      'info': instance.info,
      'initiatedBy': instance.initiatedBy,
      'retry': instance.retry,
      'sync': instance.sync,
    };

PurpleInfo _$PurpleInfoFromJson(Map<String, dynamic> json) =>
    PurpleInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$PurpleInfoToJson(PurpleInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

PurpleInitiatedBy _$PurpleInitiatedByFromJson(Map<String, dynamic> json) =>
    PurpleInitiatedBy(
      automated: json['automated'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$PurpleInitiatedByToJson(PurpleInitiatedBy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'username': instance.username,
    };

PurpleRetry _$PurpleRetryFromJson(Map<String, dynamic> json) => PurpleRetry(
  backoff: json['backoff'] == null
      ? null
      : PurpleBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$PurpleRetryToJson(PurpleRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

PurpleBackoff _$PurpleBackoffFromJson(Map<String, dynamic> json) =>
    PurpleBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$PurpleBackoffToJson(PurpleBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

PurpleSync _$PurpleSyncFromJson(Map<String, dynamic> json) => PurpleSync(
  autoHealAttemptsCount: (json['autoHealAttemptsCount'] as num?)?.toInt(),
  dryRun: json['dryRun'] as bool?,
  manifests: (json['manifests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  prune: json['prune'] as bool?,
  resources: (json['resources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleResource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  revision: json['revision'] as String?,
  revisions: (json['revisions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  source: json['source'] == null
      ? null
      : PurpleSource.fromJson(json['source'] as Map<String, dynamic>),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffySource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  syncStrategy: json['syncStrategy'] == null
      ? null
      : PurpleSyncStrategy.fromJson(
          json['syncStrategy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PurpleSyncToJson(PurpleSync instance) =>
    <String, dynamic>{
      'autoHealAttemptsCount': instance.autoHealAttemptsCount,
      'dryRun': instance.dryRun,
      'manifests': instance.manifests,
      'prune': instance.prune,
      'resources': instance.resources,
      'revision': instance.revision,
      'revisions': instance.revisions,
      'source': instance.source,
      'sources': instance.sources,
      'syncOptions': instance.syncOptions,
      'syncStrategy': instance.syncStrategy,
    };

PurpleResource _$PurpleResourceFromJson(Map<String, dynamic> json) =>
    PurpleResource(
      group: json['group'] as String?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$PurpleResourceToJson(PurpleResource instance) =>
    <String, dynamic>{
      'group': instance.group,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
    };

PurpleSource _$PurpleSourceFromJson(Map<String, dynamic> json) => PurpleSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : PurpleDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : PurpleHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : PurpleKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : PurplePlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$PurpleSourceToJson(PurpleSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

PurpleDirectory _$PurpleDirectoryFromJson(Map<String, dynamic> json) =>
    PurpleDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : PurpleJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$PurpleDirectoryToJson(PurpleDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

PurpleJsonnet _$PurpleJsonnetFromJson(
  Map<String, dynamic> json,
) => PurpleJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurpleJsonnetToJson(PurpleJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

PurpleExtVar _$PurpleExtVarFromJson(Map<String, dynamic> json) => PurpleExtVar(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$PurpleExtVarToJson(PurpleExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

PurpleTlas _$PurpleTlasFromJson(Map<String, dynamic> json) => PurpleTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$PurpleTlasToJson(PurpleTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

PurpleHelm _$PurpleHelmFromJson(Map<String, dynamic> json) => PurpleHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$PurpleHelmToJson(PurpleHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

PurpleFileParameter _$PurpleFileParameterFromJson(Map<String, dynamic> json) =>
    PurpleFileParameter(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$PurpleFileParameterToJson(
  PurpleFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

PurpleParameter _$PurpleParameterFromJson(Map<String, dynamic> json) =>
    PurpleParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PurpleParameterToJson(PurpleParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

PurpleKustomize _$PurpleKustomizeFromJson(
  Map<String, dynamic> json,
) => PurpleKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurplePatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$PurpleKustomizeToJson(PurpleKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

PurplePatch _$PurplePatchFromJson(Map<String, dynamic> json) => PurplePatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : PurpleTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurplePatchToJson(PurplePatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

PurpleTarget _$PurpleTargetFromJson(Map<String, dynamic> json) => PurpleTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$PurpleTargetToJson(PurpleTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

PurpleReplica _$PurpleReplicaFromJson(Map<String, dynamic> json) =>
    PurpleReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$PurpleReplicaToJson(PurpleReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

PurplePlugin _$PurplePluginFromJson(Map<String, dynamic> json) => PurplePlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : PurpleEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurplePluginToJson(PurplePlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

PurpleEnv _$PurpleEnvFromJson(Map<String, dynamic> json) =>
    PurpleEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$PurpleEnvToJson(PurpleEnv instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

FluffyParameter _$FluffyParameterFromJson(Map<String, dynamic> json) =>
    FluffyParameter(
      array: (json['array'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$FluffyParameterToJson(FluffyParameter instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

FluffySource _$FluffySourceFromJson(Map<String, dynamic> json) => FluffySource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : FluffyDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : FluffyHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : FluffyKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : FluffyPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$FluffySourceToJson(FluffySource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

FluffyDirectory _$FluffyDirectoryFromJson(Map<String, dynamic> json) =>
    FluffyDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : FluffyJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$FluffyDirectoryToJson(FluffyDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

FluffyJsonnet _$FluffyJsonnetFromJson(
  Map<String, dynamic> json,
) => FluffyJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffyJsonnetToJson(FluffyJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

FluffyExtVar _$FluffyExtVarFromJson(Map<String, dynamic> json) => FluffyExtVar(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$FluffyExtVarToJson(FluffyExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

FluffyTlas _$FluffyTlasFromJson(Map<String, dynamic> json) => FluffyTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$FluffyTlasToJson(FluffyTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

FluffyHelm _$FluffyHelmFromJson(Map<String, dynamic> json) => FluffyHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$FluffyHelmToJson(FluffyHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

FluffyFileParameter _$FluffyFileParameterFromJson(Map<String, dynamic> json) =>
    FluffyFileParameter(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FluffyFileParameterToJson(
  FluffyFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

TentacledParameter _$TentacledParameterFromJson(Map<String, dynamic> json) =>
    TentacledParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$TentacledParameterToJson(TentacledParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

FluffyKustomize _$FluffyKustomizeFromJson(
  Map<String, dynamic> json,
) => FluffyKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$FluffyKustomizeToJson(FluffyKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

FluffyPatch _$FluffyPatchFromJson(Map<String, dynamic> json) => FluffyPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : FluffyTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffyPatchToJson(FluffyPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

FluffyTarget _$FluffyTargetFromJson(Map<String, dynamic> json) => FluffyTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$FluffyTargetToJson(FluffyTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

FluffyReplica _$FluffyReplicaFromJson(Map<String, dynamic> json) =>
    FluffyReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$FluffyReplicaToJson(FluffyReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

FluffyPlugin _$FluffyPluginFromJson(Map<String, dynamic> json) => FluffyPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : FluffyEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffyPluginToJson(FluffyPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

FluffyEnv _$FluffyEnvFromJson(Map<String, dynamic> json) =>
    FluffyEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FluffyEnvToJson(FluffyEnv instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

StickyParameter _$StickyParameterFromJson(Map<String, dynamic> json) =>
    StickyParameter(
      array: (json['array'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$StickyParameterToJson(StickyParameter instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

PurpleSyncStrategy _$PurpleSyncStrategyFromJson(Map<String, dynamic> json) =>
    PurpleSyncStrategy(
      apply: json['apply'] == null
          ? null
          : PurpleApply.fromJson(json['apply'] as Map<String, dynamic>),
      hook: json['hook'] == null
          ? null
          : PurpleHook.fromJson(json['hook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurpleSyncStrategyToJson(PurpleSyncStrategy instance) =>
    <String, dynamic>{'apply': instance.apply, 'hook': instance.hook};

PurpleApply _$PurpleApplyFromJson(Map<String, dynamic> json) =>
    PurpleApply(force: json['force'] as bool?);

Map<String, dynamic> _$PurpleApplyToJson(PurpleApply instance) =>
    <String, dynamic>{'force': instance.force};

PurpleHook _$PurpleHookFromJson(Map<String, dynamic> json) =>
    PurpleHook(force: json['force'] as bool?);

Map<String, dynamic> _$PurpleHookToJson(PurpleHook instance) =>
    <String, dynamic>{'force': instance.force};

Spec _$SpecFromJson(Map<String, dynamic> json) => Spec(
  destination: SpecDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SpecIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : SpecInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : TentacledSource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SpecSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickySource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'destination': instance.destination,
  'ignoreDifferences': instance.ignoreDifferences,
  'info': instance.info,
  'project': instance.project,
  'revisionHistoryLimit': instance.revisionHistoryLimit,
  'source': instance.source,
  'sourceHydrator': instance.sourceHydrator,
  'sources': instance.sources,
  'syncPolicy': instance.syncPolicy,
};

SpecDestination _$SpecDestinationFromJson(Map<String, dynamic> json) =>
    SpecDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$SpecDestinationToJson(SpecDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

SpecIgnoreDifference _$SpecIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => SpecIgnoreDifference(
  group: json['group'] as String?,
  jqPathExpressions: (json['jqPathExpressions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  jsonPointers: (json['jsonPointers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  kind: json['kind'] as String,
  managedFieldsManagers: (json['managedFieldsManagers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$SpecIgnoreDifferenceToJson(
  SpecIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

SpecInfo _$SpecInfoFromJson(Map<String, dynamic> json) =>
    SpecInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$SpecInfoToJson(SpecInfo instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

TentacledSource _$TentacledSourceFromJson(
  Map<String, dynamic> json,
) => TentacledSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : TentacledDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : TentacledHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : TentacledKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : TentacledPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$TentacledSourceToJson(TentacledSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

TentacledDirectory _$TentacledDirectoryFromJson(Map<String, dynamic> json) =>
    TentacledDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : TentacledJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$TentacledDirectoryToJson(TentacledDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

TentacledJsonnet _$TentacledJsonnetFromJson(Map<String, dynamic> json) =>
    TentacledJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$TentacledJsonnetToJson(TentacledJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

TentacledExtVar _$TentacledExtVarFromJson(Map<String, dynamic> json) =>
    TentacledExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$TentacledExtVarToJson(TentacledExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

TentacledTlas _$TentacledTlasFromJson(Map<String, dynamic> json) =>
    TentacledTlas(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$TentacledTlasToJson(TentacledTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

TentacledHelm _$TentacledHelmFromJson(Map<String, dynamic> json) =>
    TentacledHelm(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      fileParameters: (json['fileParameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledFileParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
      kubeVersion: json['kubeVersion'] as String?,
      namespace: json['namespace'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      passCredentials: json['passCredentials'] as bool?,
      releaseName: json['releaseName'] as String?,
      skipCrds: json['skipCrds'] as bool?,
      skipSchemaValidation: json['skipSchemaValidation'] as bool?,
      skipTests: json['skipTests'] as bool?,
      valueFiles: (json['valueFiles'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      values: json['values'] as String?,
      valuesObject: json['valuesObject'],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$TentacledHelmToJson(TentacledHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

TentacledFileParameter _$TentacledFileParameterFromJson(
  Map<String, dynamic> json,
) => TentacledFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$TentacledFileParameterToJson(
  TentacledFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

IndigoParameter _$IndigoParameterFromJson(Map<String, dynamic> json) =>
    IndigoParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$IndigoParameterToJson(IndigoParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

TentacledKustomize _$TentacledKustomizeFromJson(Map<String, dynamic> json) =>
    TentacledKustomize(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String?)),
      commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
      commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
      forceCommonLabels: json['forceCommonLabels'] as bool?,
      ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kubeVersion: json['kubeVersion'] as String?,
      labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
      labelWithoutSelector: json['labelWithoutSelector'] as bool?,
      namePrefix: json['namePrefix'] as String?,
      namespace: json['namespace'] as String?,
      nameSuffix: json['nameSuffix'] as String?,
      patches: (json['patches'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledPatch.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      replicas: (json['replicas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledReplica.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$TentacledKustomizeToJson(TentacledKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

TentacledPatch _$TentacledPatchFromJson(Map<String, dynamic> json) =>
    TentacledPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : TentacledTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledPatchToJson(TentacledPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

TentacledTarget _$TentacledTargetFromJson(Map<String, dynamic> json) =>
    TentacledTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$TentacledTargetToJson(TentacledTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

TentacledReplica _$TentacledReplicaFromJson(Map<String, dynamic> json) =>
    TentacledReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$TentacledReplicaToJson(TentacledReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

TentacledPlugin _$TentacledPluginFromJson(
  Map<String, dynamic> json,
) => TentacledPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : TentacledEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TentacledPluginToJson(TentacledPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

TentacledEnv _$TentacledEnvFromJson(Map<String, dynamic> json) =>
    TentacledEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$TentacledEnvToJson(TentacledEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

IndecentParameter _$IndecentParameterFromJson(Map<String, dynamic> json) =>
    IndecentParameter(
      array: (json['array'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$IndecentParameterToJson(IndecentParameter instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SpecSourceHydrator _$SpecSourceHydratorFromJson(Map<String, dynamic> json) =>
    SpecSourceHydrator(
      drySource: PurpleDrySource.fromJson(
        json['drySource'] as Map<String, dynamic>,
      ),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : PurpleHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: PurpleSyncSource.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SpecSourceHydratorToJson(SpecSourceHydrator instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

PurpleDrySource _$PurpleDrySourceFromJson(Map<String, dynamic> json) =>
    PurpleDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$PurpleDrySourceToJson(PurpleDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

PurpleHydrateTo _$PurpleHydrateToFromJson(Map<String, dynamic> json) =>
    PurpleHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$PurpleHydrateToToJson(PurpleHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

PurpleSyncSource _$PurpleSyncSourceFromJson(Map<String, dynamic> json) =>
    PurpleSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$PurpleSyncSourceToJson(PurpleSyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

StickySource _$StickySourceFromJson(Map<String, dynamic> json) => StickySource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : StickyDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : StickyHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : StickyKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : StickyPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$StickySourceToJson(StickySource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

StickyDirectory _$StickyDirectoryFromJson(Map<String, dynamic> json) =>
    StickyDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : StickyJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$StickyDirectoryToJson(StickyDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

StickyJsonnet _$StickyJsonnetFromJson(
  Map<String, dynamic> json,
) => StickyJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickyExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickyTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StickyJsonnetToJson(StickyJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

StickyExtVar _$StickyExtVarFromJson(Map<String, dynamic> json) => StickyExtVar(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$StickyExtVarToJson(StickyExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

StickyTlas _$StickyTlasFromJson(Map<String, dynamic> json) => StickyTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$StickyTlasToJson(StickyTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

StickyHelm _$StickyHelmFromJson(Map<String, dynamic> json) => StickyHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : HilariousParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$StickyHelmToJson(StickyHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

StickyFileParameter _$StickyFileParameterFromJson(Map<String, dynamic> json) =>
    StickyFileParameter(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$StickyFileParameterToJson(
  StickyFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

HilariousParameter _$HilariousParameterFromJson(Map<String, dynamic> json) =>
    HilariousParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$HilariousParameterToJson(HilariousParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

StickyKustomize _$StickyKustomizeFromJson(
  Map<String, dynamic> json,
) => StickyKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickyPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$StickyKustomizeToJson(StickyKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

StickyPatch _$StickyPatchFromJson(Map<String, dynamic> json) => StickyPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : StickyTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StickyPatchToJson(StickyPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

StickyTarget _$StickyTargetFromJson(Map<String, dynamic> json) => StickyTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$StickyTargetToJson(StickyTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

StickyReplica _$StickyReplicaFromJson(Map<String, dynamic> json) =>
    StickyReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$StickyReplicaToJson(StickyReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

StickyPlugin _$StickyPluginFromJson(Map<String, dynamic> json) => StickyPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : StickyEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AmbitiousParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StickyPluginToJson(StickyPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

StickyEnv _$StickyEnvFromJson(Map<String, dynamic> json) =>
    StickyEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$StickyEnvToJson(StickyEnv instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

AmbitiousParameter _$AmbitiousParameterFromJson(Map<String, dynamic> json) =>
    AmbitiousParameter(
      array: (json['array'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$AmbitiousParameterToJson(AmbitiousParameter instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy _$SyncPolicyFromJson(Map<String, dynamic> json) => SyncPolicy(
  automated: json['automated'] == null
      ? null
      : Automated.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : SyncPolicyManagedNamespaceMetadata.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : SyncPolicyRetry.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicyToJson(SyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated _$AutomatedFromJson(Map<String, dynamic> json) => Automated(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$AutomatedToJson(Automated instance) => <String, dynamic>{
  'allowEmpty': instance.allowEmpty,
  'enabled': instance.enabled,
  'prune': instance.prune,
  'selfHeal': instance.selfHeal,
};

SyncPolicyManagedNamespaceMetadata _$SyncPolicyManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => SyncPolicyManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$SyncPolicyManagedNamespaceMetadataToJson(
  SyncPolicyManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

SyncPolicyRetry _$SyncPolicyRetryFromJson(Map<String, dynamic> json) =>
    SyncPolicyRetry(
      backoff: json['backoff'] == null
          ? null
          : FluffyBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$SyncPolicyRetryToJson(SyncPolicyRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

FluffyBackoff _$FluffyBackoffFromJson(Map<String, dynamic> json) =>
    FluffyBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$FluffyBackoffToJson(FluffyBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  controllerNamespace: json['controllerNamespace'] as String?,
  health: json['health'] == null
      ? null
      : StatusHealth.fromJson(json['health'] as Map<String, dynamic>),
  history: (json['history'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : History.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  observedAt: json['observedAt'] == null
      ? null
      : DateTime.parse(json['observedAt'] as String),
  operationState: json['operationState'] == null
      ? null
      : OperationState.fromJson(json['operationState'] as Map<String, dynamic>),
  reconciledAt: json['reconciledAt'] == null
      ? null
      : DateTime.parse(json['reconciledAt'] as String),
  resourceHealthSource: json['resourceHealthSource'] as String?,
  resources: (json['resources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StatusResource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : StatusSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sourceType: json['sourceType'] as String?,
  sourceTypes: (json['sourceTypes'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  summary: json['summary'] == null
      ? null
      : Summary.fromJson(json['summary'] as Map<String, dynamic>),
  sync: json['sync'] == null
      ? null
      : StatusSync.fromJson(json['sync'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'controllerNamespace': instance.controllerNamespace,
  'health': instance.health,
  'history': instance.history,
  'observedAt': instance.observedAt?.toIso8601String(),
  'operationState': instance.operationState,
  'reconciledAt': instance.reconciledAt?.toIso8601String(),
  'resourceHealthSource': instance.resourceHealthSource,
  'resources': instance.resources,
  'sourceHydrator': instance.sourceHydrator,
  'sourceType': instance.sourceType,
  'sourceTypes': instance.sourceTypes,
  'summary': instance.summary,
  'sync': instance.sync,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'type': instance.type,
};

StatusHealth _$StatusHealthFromJson(Map<String, dynamic> json) => StatusHealth(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$StatusHealthToJson(StatusHealth instance) =>
    <String, dynamic>{
      'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
    };

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  deployedAt: DateTime.parse(json['deployedAt'] as String),
  deployStartedAt: json['deployStartedAt'] == null
      ? null
      : DateTime.parse(json['deployStartedAt'] as String),
  id: (json['id'] as num).toInt(),
  initiatedBy: json['initiatedBy'] == null
      ? null
      : HistoryInitiatedBy.fromJson(
          json['initiatedBy'] as Map<String, dynamic>,
        ),
  revision: json['revision'] as String?,
  revisions: (json['revisions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  source: json['source'] == null
      ? null
      : IndigoSource.fromJson(json['source'] as Map<String, dynamic>),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'deployedAt': instance.deployedAt.toIso8601String(),
  'deployStartedAt': instance.deployStartedAt?.toIso8601String(),
  'id': instance.id,
  'initiatedBy': instance.initiatedBy,
  'revision': instance.revision,
  'revisions': instance.revisions,
  'source': instance.source,
  'sources': instance.sources,
};

HistoryInitiatedBy _$HistoryInitiatedByFromJson(Map<String, dynamic> json) =>
    HistoryInitiatedBy(
      automated: json['automated'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$HistoryInitiatedByToJson(HistoryInitiatedBy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'username': instance.username,
    };

IndigoSource _$IndigoSourceFromJson(Map<String, dynamic> json) => IndigoSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : IndigoDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : IndigoHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : IndigoKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : IndigoPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$IndigoSourceToJson(IndigoSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

IndigoDirectory _$IndigoDirectoryFromJson(Map<String, dynamic> json) =>
    IndigoDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : IndigoJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$IndigoDirectoryToJson(IndigoDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

IndigoJsonnet _$IndigoJsonnetFromJson(
  Map<String, dynamic> json,
) => IndigoJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$IndigoJsonnetToJson(IndigoJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

IndigoExtVar _$IndigoExtVarFromJson(Map<String, dynamic> json) => IndigoExtVar(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$IndigoExtVarToJson(IndigoExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

IndigoTlas _$IndigoTlasFromJson(Map<String, dynamic> json) => IndigoTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$IndigoTlasToJson(IndigoTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

IndigoHelm _$IndigoHelmFromJson(Map<String, dynamic> json) => IndigoHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndigoFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : CunningParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$IndigoHelmToJson(IndigoHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

IndigoFileParameter _$IndigoFileParameterFromJson(Map<String, dynamic> json) =>
    IndigoFileParameter(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$IndigoFileParameterToJson(
  IndigoFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

CunningParameter _$CunningParameterFromJson(Map<String, dynamic> json) =>
    CunningParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CunningParameterToJson(CunningParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

IndigoKustomize _$IndigoKustomizeFromJson(
  Map<String, dynamic> json,
) => IndigoKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndigoReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$IndigoKustomizeToJson(IndigoKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

IndigoPatch _$IndigoPatchFromJson(Map<String, dynamic> json) => IndigoPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : IndigoTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoPatchToJson(IndigoPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

IndigoTarget _$IndigoTargetFromJson(Map<String, dynamic> json) => IndigoTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$IndigoTargetToJson(IndigoTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

IndigoReplica _$IndigoReplicaFromJson(Map<String, dynamic> json) =>
    IndigoReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$IndigoReplicaToJson(IndigoReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

IndigoPlugin _$IndigoPluginFromJson(Map<String, dynamic> json) => IndigoPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : IndigoEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$IndigoPluginToJson(IndigoPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

IndigoEnv _$IndigoEnvFromJson(Map<String, dynamic> json) =>
    IndigoEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$IndigoEnvToJson(IndigoEnv instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

MagentaParameter _$MagentaParameterFromJson(Map<String, dynamic> json) =>
    MagentaParameter(
      array: (json['array'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      string: json['string'] as String?,
    );

Map<String, dynamic> _$MagentaParameterToJson(MagentaParameter instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

IndecentSource _$IndecentSourceFromJson(
  Map<String, dynamic> json,
) => IndecentSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : IndecentDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : IndecentHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : IndecentKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : IndecentPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$IndecentSourceToJson(IndecentSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

IndecentDirectory _$IndecentDirectoryFromJson(Map<String, dynamic> json) =>
    IndecentDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : IndecentJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$IndecentDirectoryToJson(IndecentDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

IndecentJsonnet _$IndecentJsonnetFromJson(Map<String, dynamic> json) =>
    IndecentJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$IndecentJsonnetToJson(IndecentJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

IndecentExtVar _$IndecentExtVarFromJson(Map<String, dynamic> json) =>
    IndecentExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$IndecentExtVarToJson(IndecentExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

IndecentTlas _$IndecentTlasFromJson(Map<String, dynamic> json) => IndecentTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$IndecentTlasToJson(IndecentTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

IndecentHelm _$IndecentHelmFromJson(Map<String, dynamic> json) => IndecentHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FriskyParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$IndecentHelmToJson(IndecentHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

IndecentFileParameter _$IndecentFileParameterFromJson(
  Map<String, dynamic> json,
) => IndecentFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$IndecentFileParameterToJson(
  IndecentFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

FriskyParameter _$FriskyParameterFromJson(Map<String, dynamic> json) =>
    FriskyParameter(
      forceString: json['forceString'] as bool?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FriskyParameterToJson(FriskyParameter instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

IndecentKustomize _$IndecentKustomizeFromJson(Map<String, dynamic> json) =>
    IndecentKustomize(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String?)),
      commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
      commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
      forceCommonLabels: json['forceCommonLabels'] as bool?,
      ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kubeVersion: json['kubeVersion'] as String?,
      labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
      labelWithoutSelector: json['labelWithoutSelector'] as bool?,
      namePrefix: json['namePrefix'] as String?,
      namespace: json['namespace'] as String?,
      nameSuffix: json['nameSuffix'] as String?,
      patches: (json['patches'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentPatch.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      replicas: (json['replicas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentReplica.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$IndecentKustomizeToJson(IndecentKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

IndecentPatch _$IndecentPatchFromJson(Map<String, dynamic> json) =>
    IndecentPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : IndecentTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentPatchToJson(IndecentPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

IndecentTarget _$IndecentTargetFromJson(Map<String, dynamic> json) =>
    IndecentTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$IndecentTargetToJson(IndecentTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

IndecentReplica _$IndecentReplicaFromJson(Map<String, dynamic> json) =>
    IndecentReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$IndecentReplicaToJson(IndecentReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

IndecentPlugin _$IndecentPluginFromJson(
  Map<String, dynamic> json,
) => IndecentPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndecentEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$IndecentPluginToJson(IndecentPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

IndecentEnv _$IndecentEnvFromJson(Map<String, dynamic> json) =>
    IndecentEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$IndecentEnvToJson(IndecentEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

MischievousParameter _$MischievousParameterFromJson(
  Map<String, dynamic> json,
) => MischievousParameter(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$MischievousParameterToJson(
  MischievousParameter instance,
) => <String, dynamic>{
  'array': instance.array,
  'map': instance.map,
  'name': instance.name,
  'string': instance.string,
};

OperationState _$OperationStateFromJson(Map<String, dynamic> json) =>
    OperationState(
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      message: json['message'] as String?,
      operation: OperationStateOperation.fromJson(
        json['operation'] as Map<String, dynamic>,
      ),
      phase: json['phase'] as String,
      retryCount: (json['retryCount'] as num?)?.toInt(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      syncResult: json['syncResult'] == null
          ? null
          : SyncResult.fromJson(json['syncResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationStateToJson(OperationState instance) =>
    <String, dynamic>{
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'message': instance.message,
      'operation': instance.operation,
      'phase': instance.phase,
      'retryCount': instance.retryCount,
      'startedAt': instance.startedAt.toIso8601String(),
      'syncResult': instance.syncResult,
    };

OperationStateOperation _$OperationStateOperationFromJson(
  Map<String, dynamic> json,
) => OperationStateOperation(
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  initiatedBy: json['initiatedBy'] == null
      ? null
      : FluffyInitiatedBy.fromJson(json['initiatedBy'] as Map<String, dynamic>),
  retry: json['retry'] == null
      ? null
      : FluffyRetry.fromJson(json['retry'] as Map<String, dynamic>),
  sync: json['sync'] == null
      ? null
      : FluffySync.fromJson(json['sync'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OperationStateOperationToJson(
  OperationStateOperation instance,
) => <String, dynamic>{
  'info': instance.info,
  'initiatedBy': instance.initiatedBy,
  'retry': instance.retry,
  'sync': instance.sync,
};

FluffyInfo _$FluffyInfoFromJson(Map<String, dynamic> json) =>
    FluffyInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FluffyInfoToJson(FluffyInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

FluffyInitiatedBy _$FluffyInitiatedByFromJson(Map<String, dynamic> json) =>
    FluffyInitiatedBy(
      automated: json['automated'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$FluffyInitiatedByToJson(FluffyInitiatedBy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'username': instance.username,
    };

FluffyRetry _$FluffyRetryFromJson(Map<String, dynamic> json) => FluffyRetry(
  backoff: json['backoff'] == null
      ? null
      : TentacledBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$FluffyRetryToJson(FluffyRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

TentacledBackoff _$TentacledBackoffFromJson(Map<String, dynamic> json) =>
    TentacledBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$TentacledBackoffToJson(TentacledBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

FluffySync _$FluffySyncFromJson(Map<String, dynamic> json) => FluffySync(
  autoHealAttemptsCount: (json['autoHealAttemptsCount'] as num?)?.toInt(),
  dryRun: json['dryRun'] as bool?,
  manifests: (json['manifests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  prune: json['prune'] as bool?,
  resources: (json['resources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyResource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  revision: json['revision'] as String?,
  revisions: (json['revisions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  source: json['source'] == null
      ? null
      : HilariousSource.fromJson(json['source'] as Map<String, dynamic>),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AmbitiousSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  syncStrategy: json['syncStrategy'] == null
      ? null
      : FluffySyncStrategy.fromJson(
          json['syncStrategy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FluffySyncToJson(FluffySync instance) =>
    <String, dynamic>{
      'autoHealAttemptsCount': instance.autoHealAttemptsCount,
      'dryRun': instance.dryRun,
      'manifests': instance.manifests,
      'prune': instance.prune,
      'resources': instance.resources,
      'revision': instance.revision,
      'revisions': instance.revisions,
      'source': instance.source,
      'sources': instance.sources,
      'syncOptions': instance.syncOptions,
      'syncStrategy': instance.syncStrategy,
    };

FluffyResource _$FluffyResourceFromJson(Map<String, dynamic> json) =>
    FluffyResource(
      group: json['group'] as String?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$FluffyResourceToJson(FluffyResource instance) =>
    <String, dynamic>{
      'group': instance.group,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
    };

HilariousSource _$HilariousSourceFromJson(
  Map<String, dynamic> json,
) => HilariousSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : HilariousDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : HilariousHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : HilariousKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : HilariousPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$HilariousSourceToJson(HilariousSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HilariousDirectory _$HilariousDirectoryFromJson(Map<String, dynamic> json) =>
    HilariousDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : HilariousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$HilariousDirectoryToJson(HilariousDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

HilariousJsonnet _$HilariousJsonnetFromJson(Map<String, dynamic> json) =>
    HilariousJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$HilariousJsonnetToJson(HilariousJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

HilariousExtVar _$HilariousExtVarFromJson(Map<String, dynamic> json) =>
    HilariousExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HilariousExtVarToJson(HilariousExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

HilariousTlas _$HilariousTlasFromJson(Map<String, dynamic> json) =>
    HilariousTlas(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HilariousTlasToJson(HilariousTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

HilariousHelm _$HilariousHelmFromJson(Map<String, dynamic> json) =>
    HilariousHelm(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      fileParameters: (json['fileParameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousFileParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
      kubeVersion: json['kubeVersion'] as String?,
      namespace: json['namespace'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : BraggadociousParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      passCredentials: json['passCredentials'] as bool?,
      releaseName: json['releaseName'] as String?,
      skipCrds: json['skipCrds'] as bool?,
      skipSchemaValidation: json['skipSchemaValidation'] as bool?,
      skipTests: json['skipTests'] as bool?,
      valueFiles: (json['valueFiles'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      values: json['values'] as String?,
      valuesObject: json['valuesObject'],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$HilariousHelmToJson(HilariousHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

HilariousFileParameter _$HilariousFileParameterFromJson(
  Map<String, dynamic> json,
) => HilariousFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$HilariousFileParameterToJson(
  HilariousFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

BraggadociousParameter _$BraggadociousParameterFromJson(
  Map<String, dynamic> json,
) => BraggadociousParameter(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$BraggadociousParameterToJson(
  BraggadociousParameter instance,
) => <String, dynamic>{
  'forceString': instance.forceString,
  'name': instance.name,
  'value': instance.value,
};

HilariousKustomize _$HilariousKustomizeFromJson(Map<String, dynamic> json) =>
    HilariousKustomize(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String?)),
      commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
      commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
      forceCommonLabels: json['forceCommonLabels'] as bool?,
      ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kubeVersion: json['kubeVersion'] as String?,
      labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
      labelWithoutSelector: json['labelWithoutSelector'] as bool?,
      namePrefix: json['namePrefix'] as String?,
      namespace: json['namespace'] as String?,
      nameSuffix: json['nameSuffix'] as String?,
      patches: (json['patches'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousPatch.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      replicas: (json['replicas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousReplica.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$HilariousKustomizeToJson(HilariousKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

HilariousPatch _$HilariousPatchFromJson(Map<String, dynamic> json) =>
    HilariousPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : HilariousTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HilariousPatchToJson(HilariousPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

HilariousTarget _$HilariousTargetFromJson(Map<String, dynamic> json) =>
    HilariousTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$HilariousTargetToJson(HilariousTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

HilariousReplica _$HilariousReplicaFromJson(Map<String, dynamic> json) =>
    HilariousReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$HilariousReplicaToJson(HilariousReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

HilariousPlugin _$HilariousPluginFromJson(
  Map<String, dynamic> json,
) => HilariousPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : HilariousEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$HilariousPluginToJson(HilariousPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

HilariousEnv _$HilariousEnvFromJson(Map<String, dynamic> json) =>
    HilariousEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$HilariousEnvToJson(HilariousEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter1 _$Parameter1FromJson(Map<String, dynamic> json) => Parameter1(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter1ToJson(Parameter1 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

AmbitiousSource _$AmbitiousSourceFromJson(
  Map<String, dynamic> json,
) => AmbitiousSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : AmbitiousDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : AmbitiousHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : AmbitiousKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : AmbitiousPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$AmbitiousSourceToJson(AmbitiousSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

AmbitiousDirectory _$AmbitiousDirectoryFromJson(Map<String, dynamic> json) =>
    AmbitiousDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : AmbitiousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$AmbitiousDirectoryToJson(AmbitiousDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

AmbitiousJsonnet _$AmbitiousJsonnetFromJson(Map<String, dynamic> json) =>
    AmbitiousJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$AmbitiousJsonnetToJson(AmbitiousJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

AmbitiousExtVar _$AmbitiousExtVarFromJson(Map<String, dynamic> json) =>
    AmbitiousExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AmbitiousExtVarToJson(AmbitiousExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

AmbitiousTlas _$AmbitiousTlasFromJson(Map<String, dynamic> json) =>
    AmbitiousTlas(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AmbitiousTlasToJson(AmbitiousTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

AmbitiousHelm _$AmbitiousHelmFromJson(Map<String, dynamic> json) =>
    AmbitiousHelm(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      fileParameters: (json['fileParameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousFileParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
      kubeVersion: json['kubeVersion'] as String?,
      namespace: json['namespace'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Parameter2.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      passCredentials: json['passCredentials'] as bool?,
      releaseName: json['releaseName'] as String?,
      skipCrds: json['skipCrds'] as bool?,
      skipSchemaValidation: json['skipSchemaValidation'] as bool?,
      skipTests: json['skipTests'] as bool?,
      valueFiles: (json['valueFiles'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      values: json['values'] as String?,
      valuesObject: json['valuesObject'],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$AmbitiousHelmToJson(AmbitiousHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

AmbitiousFileParameter _$AmbitiousFileParameterFromJson(
  Map<String, dynamic> json,
) => AmbitiousFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$AmbitiousFileParameterToJson(
  AmbitiousFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter2 _$Parameter2FromJson(Map<String, dynamic> json) => Parameter2(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter2ToJson(Parameter2 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

AmbitiousKustomize _$AmbitiousKustomizeFromJson(Map<String, dynamic> json) =>
    AmbitiousKustomize(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String?)),
      commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
      commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
      forceCommonLabels: json['forceCommonLabels'] as bool?,
      ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kubeVersion: json['kubeVersion'] as String?,
      labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
      labelWithoutSelector: json['labelWithoutSelector'] as bool?,
      namePrefix: json['namePrefix'] as String?,
      namespace: json['namespace'] as String?,
      nameSuffix: json['nameSuffix'] as String?,
      patches: (json['patches'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousPatch.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      replicas: (json['replicas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousReplica.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$AmbitiousKustomizeToJson(AmbitiousKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

AmbitiousPatch _$AmbitiousPatchFromJson(Map<String, dynamic> json) =>
    AmbitiousPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : AmbitiousTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmbitiousPatchToJson(AmbitiousPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

AmbitiousTarget _$AmbitiousTargetFromJson(Map<String, dynamic> json) =>
    AmbitiousTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$AmbitiousTargetToJson(AmbitiousTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

AmbitiousReplica _$AmbitiousReplicaFromJson(Map<String, dynamic> json) =>
    AmbitiousReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$AmbitiousReplicaToJson(AmbitiousReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

AmbitiousPlugin _$AmbitiousPluginFromJson(
  Map<String, dynamic> json,
) => AmbitiousPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : AmbitiousEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$AmbitiousPluginToJson(AmbitiousPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

AmbitiousEnv _$AmbitiousEnvFromJson(Map<String, dynamic> json) =>
    AmbitiousEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$AmbitiousEnvToJson(AmbitiousEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter3 _$Parameter3FromJson(Map<String, dynamic> json) => Parameter3(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter3ToJson(Parameter3 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

FluffySyncStrategy _$FluffySyncStrategyFromJson(Map<String, dynamic> json) =>
    FluffySyncStrategy(
      apply: json['apply'] == null
          ? null
          : FluffyApply.fromJson(json['apply'] as Map<String, dynamic>),
      hook: json['hook'] == null
          ? null
          : FluffyHook.fromJson(json['hook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FluffySyncStrategyToJson(FluffySyncStrategy instance) =>
    <String, dynamic>{'apply': instance.apply, 'hook': instance.hook};

FluffyApply _$FluffyApplyFromJson(Map<String, dynamic> json) =>
    FluffyApply(force: json['force'] as bool?);

Map<String, dynamic> _$FluffyApplyToJson(FluffyApply instance) =>
    <String, dynamic>{'force': instance.force};

FluffyHook _$FluffyHookFromJson(Map<String, dynamic> json) =>
    FluffyHook(force: json['force'] as bool?);

Map<String, dynamic> _$FluffyHookToJson(FluffyHook instance) =>
    <String, dynamic>{'force': instance.force};

SyncResult _$SyncResultFromJson(Map<String, dynamic> json) => SyncResult(
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : SyncResultManagedNamespaceMetadata.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  resources: (json['resources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SyncResultResource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  revision: json['revision'] as String,
  revisions: (json['revisions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  source: json['source'] == null
      ? null
      : CunningSource.fromJson(json['source'] as Map<String, dynamic>),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SyncResultToJson(SyncResult instance) =>
    <String, dynamic>{
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'resources': instance.resources,
      'revision': instance.revision,
      'revisions': instance.revisions,
      'source': instance.source,
      'sources': instance.sources,
    };

SyncResultManagedNamespaceMetadata _$SyncResultManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => SyncResultManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$SyncResultManagedNamespaceMetadataToJson(
  SyncResultManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

SyncResultResource _$SyncResultResourceFromJson(Map<String, dynamic> json) =>
    SyncResultResource(
      group: json['group'] as String,
      hookPhase: json['hookPhase'] as String?,
      hookType: json['hookType'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      kind: json['kind'] as String,
      message: json['message'] as String?,
      name: json['name'] as String,
      namespace: json['namespace'] as String,
      status: json['status'] as String?,
      syncPhase: json['syncPhase'] as String?,
      version: json['version'] as String,
    );

Map<String, dynamic> _$SyncResultResourceToJson(SyncResultResource instance) =>
    <String, dynamic>{
      'group': instance.group,
      'hookPhase': instance.hookPhase,
      'hookType': instance.hookType,
      'images': instance.images,
      'kind': instance.kind,
      'message': instance.message,
      'name': instance.name,
      'namespace': instance.namespace,
      'status': instance.status,
      'syncPhase': instance.syncPhase,
      'version': instance.version,
    };

CunningSource _$CunningSourceFromJson(
  Map<String, dynamic> json,
) => CunningSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : CunningDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : CunningHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : CunningKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : CunningPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$CunningSourceToJson(CunningSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

CunningDirectory _$CunningDirectoryFromJson(Map<String, dynamic> json) =>
    CunningDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : CunningJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$CunningDirectoryToJson(CunningDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

CunningJsonnet _$CunningJsonnetFromJson(Map<String, dynamic> json) =>
    CunningJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$CunningJsonnetToJson(CunningJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

CunningExtVar _$CunningExtVarFromJson(Map<String, dynamic> json) =>
    CunningExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$CunningExtVarToJson(CunningExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

CunningTlas _$CunningTlasFromJson(Map<String, dynamic> json) => CunningTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$CunningTlasToJson(CunningTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

CunningHelm _$CunningHelmFromJson(Map<String, dynamic> json) => CunningHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : CunningFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$CunningHelmToJson(CunningHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

CunningFileParameter _$CunningFileParameterFromJson(
  Map<String, dynamic> json,
) => CunningFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$CunningFileParameterToJson(
  CunningFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter4 _$Parameter4FromJson(Map<String, dynamic> json) => Parameter4(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter4ToJson(Parameter4 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

CunningKustomize _$CunningKustomizeFromJson(
  Map<String, dynamic> json,
) => CunningKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : CunningPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : CunningReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$CunningKustomizeToJson(CunningKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

CunningPatch _$CunningPatchFromJson(Map<String, dynamic> json) => CunningPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : CunningTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CunningPatchToJson(CunningPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

CunningTarget _$CunningTargetFromJson(Map<String, dynamic> json) =>
    CunningTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$CunningTargetToJson(CunningTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

CunningReplica _$CunningReplicaFromJson(Map<String, dynamic> json) =>
    CunningReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$CunningReplicaToJson(CunningReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

CunningPlugin _$CunningPluginFromJson(
  Map<String, dynamic> json,
) => CunningPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : CunningEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CunningPluginToJson(CunningPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

CunningEnv _$CunningEnvFromJson(Map<String, dynamic> json) =>
    CunningEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$CunningEnvToJson(CunningEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter5 _$Parameter5FromJson(Map<String, dynamic> json) => Parameter5(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter5ToJson(Parameter5 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MagentaSource _$MagentaSourceFromJson(
  Map<String, dynamic> json,
) => MagentaSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : MagentaDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : MagentaHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : MagentaKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : MagentaPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$MagentaSourceToJson(MagentaSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

MagentaDirectory _$MagentaDirectoryFromJson(Map<String, dynamic> json) =>
    MagentaDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : MagentaJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$MagentaDirectoryToJson(MagentaDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

MagentaJsonnet _$MagentaJsonnetFromJson(Map<String, dynamic> json) =>
    MagentaJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MagentaExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MagentaTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$MagentaJsonnetToJson(MagentaJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

MagentaExtVar _$MagentaExtVarFromJson(Map<String, dynamic> json) =>
    MagentaExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MagentaExtVarToJson(MagentaExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

MagentaTlas _$MagentaTlasFromJson(Map<String, dynamic> json) => MagentaTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$MagentaTlasToJson(MagentaTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

MagentaHelm _$MagentaHelmFromJson(Map<String, dynamic> json) => MagentaHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$MagentaHelmToJson(MagentaHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

MagentaFileParameter _$MagentaFileParameterFromJson(
  Map<String, dynamic> json,
) => MagentaFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$MagentaFileParameterToJson(
  MagentaFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter6 _$Parameter6FromJson(Map<String, dynamic> json) => Parameter6(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter6ToJson(Parameter6 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

MagentaKustomize _$MagentaKustomizeFromJson(
  Map<String, dynamic> json,
) => MagentaKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : MagentaPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$MagentaKustomizeToJson(MagentaKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

MagentaPatch _$MagentaPatchFromJson(Map<String, dynamic> json) => MagentaPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : MagentaTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MagentaPatchToJson(MagentaPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

MagentaTarget _$MagentaTargetFromJson(Map<String, dynamic> json) =>
    MagentaTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$MagentaTargetToJson(MagentaTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

MagentaReplica _$MagentaReplicaFromJson(Map<String, dynamic> json) =>
    MagentaReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$MagentaReplicaToJson(MagentaReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

MagentaPlugin _$MagentaPluginFromJson(
  Map<String, dynamic> json,
) => MagentaPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : MagentaEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$MagentaPluginToJson(MagentaPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

MagentaEnv _$MagentaEnvFromJson(Map<String, dynamic> json) =>
    MagentaEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$MagentaEnvToJson(MagentaEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter7 _$Parameter7FromJson(Map<String, dynamic> json) => Parameter7(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter7ToJson(Parameter7 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

StatusResource _$StatusResourceFromJson(Map<String, dynamic> json) =>
    StatusResource(
      group: json['group'] as String?,
      health: json['health'] == null
          ? null
          : ResourceHealth.fromJson(json['health'] as Map<String, dynamic>),
      hook: json['hook'] as bool?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      requiresDeletionConfirmation:
          json['requiresDeletionConfirmation'] as bool?,
      requiresPruning: json['requiresPruning'] as bool?,
      status: json['status'] as String?,
      syncWave: (json['syncWave'] as num?)?.toInt(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$StatusResourceToJson(StatusResource instance) =>
    <String, dynamic>{
      'group': instance.group,
      'health': instance.health,
      'hook': instance.hook,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
      'requiresDeletionConfirmation': instance.requiresDeletionConfirmation,
      'requiresPruning': instance.requiresPruning,
      'status': instance.status,
      'syncWave': instance.syncWave,
      'version': instance.version,
    };

ResourceHealth _$ResourceHealthFromJson(Map<String, dynamic> json) =>
    ResourceHealth(
      lastTransitionTime: json['lastTransitionTime'] == null
          ? null
          : DateTime.parse(json['lastTransitionTime'] as String),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResourceHealthToJson(ResourceHealth instance) =>
    <String, dynamic>{
      'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
    };

StatusSourceHydrator _$StatusSourceHydratorFromJson(
  Map<String, dynamic> json,
) => StatusSourceHydrator(
  currentOperation: json['currentOperation'] == null
      ? null
      : CurrentOperation.fromJson(
          json['currentOperation'] as Map<String, dynamic>,
        ),
  lastSuccessfulOperation: json['lastSuccessfulOperation'] == null
      ? null
      : LastSuccessfulOperation.fromJson(
          json['lastSuccessfulOperation'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StatusSourceHydratorToJson(
  StatusSourceHydrator instance,
) => <String, dynamic>{
  'currentOperation': instance.currentOperation,
  'lastSuccessfulOperation': instance.lastSuccessfulOperation,
};

CurrentOperation _$CurrentOperationFromJson(Map<String, dynamic> json) =>
    CurrentOperation(
      drySha: json['drySHA'] as String?,
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      hydratedSha: json['hydratedSHA'] as String?,
      message: json['message'] as String,
      phase: $enumDecode(_$PhaseEnumMap, json['phase']),
      sourceHydrator: json['sourceHydrator'] == null
          ? null
          : CurrentOperationSourceHydrator.fromJson(
              json['sourceHydrator'] as Map<String, dynamic>,
            ),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
    );

Map<String, dynamic> _$CurrentOperationToJson(CurrentOperation instance) =>
    <String, dynamic>{
      'drySHA': instance.drySha,
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'hydratedSHA': instance.hydratedSha,
      'message': instance.message,
      'phase': _$PhaseEnumMap[instance.phase]!,
      'sourceHydrator': instance.sourceHydrator,
      'startedAt': instance.startedAt?.toIso8601String(),
    };

const _$PhaseEnumMap = {
  Phase.FAILED: 'Failed',
  Phase.HYDRATED: 'Hydrated',
  Phase.HYDRATING: 'Hydrating',
};

CurrentOperationSourceHydrator _$CurrentOperationSourceHydratorFromJson(
  Map<String, dynamic> json,
) => CurrentOperationSourceHydrator(
  drySource: FluffyDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : FluffyHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: FluffySyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CurrentOperationSourceHydratorToJson(
  CurrentOperationSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

FluffyDrySource _$FluffyDrySourceFromJson(Map<String, dynamic> json) =>
    FluffyDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$FluffyDrySourceToJson(FluffyDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

FluffyHydrateTo _$FluffyHydrateToFromJson(Map<String, dynamic> json) =>
    FluffyHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$FluffyHydrateToToJson(FluffyHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

FluffySyncSource _$FluffySyncSourceFromJson(Map<String, dynamic> json) =>
    FluffySyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$FluffySyncSourceToJson(FluffySyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

LastSuccessfulOperation _$LastSuccessfulOperationFromJson(
  Map<String, dynamic> json,
) => LastSuccessfulOperation(
  drySha: json['drySHA'] as String?,
  hydratedSha: json['hydratedSHA'] as String?,
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : LastSuccessfulOperationSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$LastSuccessfulOperationToJson(
  LastSuccessfulOperation instance,
) => <String, dynamic>{
  'drySHA': instance.drySha,
  'hydratedSHA': instance.hydratedSha,
  'sourceHydrator': instance.sourceHydrator,
};

LastSuccessfulOperationSourceHydrator
_$LastSuccessfulOperationSourceHydratorFromJson(Map<String, dynamic> json) =>
    LastSuccessfulOperationSourceHydrator(
      drySource: TentacledDrySource.fromJson(
        json['drySource'] as Map<String, dynamic>,
      ),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : TentacledHydrateTo.fromJson(
              json['hydrateTo'] as Map<String, dynamic>,
            ),
      syncSource: TentacledSyncSource.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LastSuccessfulOperationSourceHydratorToJson(
  LastSuccessfulOperationSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

TentacledDrySource _$TentacledDrySourceFromJson(Map<String, dynamic> json) =>
    TentacledDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$TentacledDrySourceToJson(TentacledDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

TentacledHydrateTo _$TentacledHydrateToFromJson(Map<String, dynamic> json) =>
    TentacledHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$TentacledHydrateToToJson(TentacledHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

TentacledSyncSource _$TentacledSyncSourceFromJson(Map<String, dynamic> json) =>
    TentacledSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$TentacledSyncSourceToJson(
  TentacledSyncSource instance,
) => <String, dynamic>{
  'path': instance.path,
  'targetBranch': instance.targetBranch,
};

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  externalUrLs: (json['externalURLs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'externalURLs': instance.externalUrLs,
  'images': instance.images,
};

StatusSync _$StatusSyncFromJson(Map<String, dynamic> json) => StatusSync(
  comparedTo: json['comparedTo'] == null
      ? null
      : ComparedTo.fromJson(json['comparedTo'] as Map<String, dynamic>),
  revision: json['revision'] as String?,
  revisions: (json['revisions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  status: json['status'] as String,
);

Map<String, dynamic> _$StatusSyncToJson(StatusSync instance) =>
    <String, dynamic>{
      'comparedTo': instance.comparedTo,
      'revision': instance.revision,
      'revisions': instance.revisions,
      'status': instance.status,
    };

ComparedTo _$ComparedToFromJson(Map<String, dynamic> json) => ComparedTo(
  destination: ComparedToDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ComparedToIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  source: json['source'] == null
      ? null
      : FriskySource.fromJson(json['source'] as Map<String, dynamic>),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ComparedToToJson(ComparedTo instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'ignoreDifferences': instance.ignoreDifferences,
      'source': instance.source,
      'sources': instance.sources,
    };

ComparedToDestination _$ComparedToDestinationFromJson(
  Map<String, dynamic> json,
) => ComparedToDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$ComparedToDestinationToJson(
  ComparedToDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

ComparedToIgnoreDifference _$ComparedToIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => ComparedToIgnoreDifference(
  group: json['group'] as String?,
  jqPathExpressions: (json['jqPathExpressions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  jsonPointers: (json['jsonPointers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  kind: json['kind'] as String,
  managedFieldsManagers: (json['managedFieldsManagers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$ComparedToIgnoreDifferenceToJson(
  ComparedToIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

FriskySource _$FriskySourceFromJson(Map<String, dynamic> json) => FriskySource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : FriskyDirectory.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : FriskyHelm.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : FriskyKustomize.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : FriskyPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$FriskySourceToJson(FriskySource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

FriskyDirectory _$FriskyDirectoryFromJson(Map<String, dynamic> json) =>
    FriskyDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : FriskyJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$FriskyDirectoryToJson(FriskyDirectory instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

FriskyJsonnet _$FriskyJsonnetFromJson(
  Map<String, dynamic> json,
) => FriskyJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FriskyExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FriskyTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FriskyJsonnetToJson(FriskyJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

FriskyExtVar _$FriskyExtVarFromJson(Map<String, dynamic> json) => FriskyExtVar(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$FriskyExtVarToJson(FriskyExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

FriskyTlas _$FriskyTlasFromJson(Map<String, dynamic> json) => FriskyTlas(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$FriskyTlasToJson(FriskyTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

FriskyHelm _$FriskyHelmFromJson(Map<String, dynamic> json) => FriskyHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FriskyFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  passCredentials: json['passCredentials'] as bool?,
  releaseName: json['releaseName'] as String?,
  skipCrds: json['skipCrds'] as bool?,
  skipSchemaValidation: json['skipSchemaValidation'] as bool?,
  skipTests: json['skipTests'] as bool?,
  valueFiles: (json['valueFiles'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  values: json['values'] as String?,
  valuesObject: json['valuesObject'],
  version: json['version'] as String?,
);

Map<String, dynamic> _$FriskyHelmToJson(FriskyHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

FriskyFileParameter _$FriskyFileParameterFromJson(Map<String, dynamic> json) =>
    FriskyFileParameter(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FriskyFileParameterToJson(
  FriskyFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter8 _$Parameter8FromJson(Map<String, dynamic> json) => Parameter8(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter8ToJson(Parameter8 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

FriskyKustomize _$FriskyKustomizeFromJson(
  Map<String, dynamic> json,
) => FriskyKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FriskyPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FriskyReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$FriskyKustomizeToJson(FriskyKustomize instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'commonAnnotations': instance.commonAnnotations,
      'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
      'commonLabels': instance.commonLabels,
      'components': instance.components,
      'forceCommonAnnotations': instance.forceCommonAnnotations,
      'forceCommonLabels': instance.forceCommonLabels,
      'ignoreMissingComponents': instance.ignoreMissingComponents,
      'images': instance.images,
      'kubeVersion': instance.kubeVersion,
      'labelIncludeTemplates': instance.labelIncludeTemplates,
      'labelWithoutSelector': instance.labelWithoutSelector,
      'namePrefix': instance.namePrefix,
      'namespace': instance.namespace,
      'nameSuffix': instance.nameSuffix,
      'patches': instance.patches,
      'replicas': instance.replicas,
      'version': instance.version,
    };

FriskyPatch _$FriskyPatchFromJson(Map<String, dynamic> json) => FriskyPatch(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : FriskyTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FriskyPatchToJson(FriskyPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

FriskyTarget _$FriskyTargetFromJson(Map<String, dynamic> json) => FriskyTarget(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$FriskyTargetToJson(FriskyTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

FriskyReplica _$FriskyReplicaFromJson(Map<String, dynamic> json) =>
    FriskyReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$FriskyReplicaToJson(FriskyReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

FriskyPlugin _$FriskyPluginFromJson(Map<String, dynamic> json) => FriskyPlugin(
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : FriskyEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FriskyPluginToJson(FriskyPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

FriskyEnv _$FriskyEnvFromJson(Map<String, dynamic> json) =>
    FriskyEnv(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FriskyEnvToJson(FriskyEnv instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter9 _$Parameter9FromJson(Map<String, dynamic> json) => Parameter9(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter9ToJson(Parameter9 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MischievousSource _$MischievousSourceFromJson(Map<String, dynamic> json) =>
    MischievousSource(
      chart: json['chart'] as String?,
      directory: json['directory'] == null
          ? null
          : MischievousDirectory.fromJson(
              json['directory'] as Map<String, dynamic>,
            ),
      helm: json['helm'] == null
          ? null
          : MischievousHelm.fromJson(json['helm'] as Map<String, dynamic>),
      kustomize: json['kustomize'] == null
          ? null
          : MischievousKustomize.fromJson(
              json['kustomize'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      path: json['path'] as String?,
      plugin: json['plugin'] == null
          ? null
          : MischievousPlugin.fromJson(json['plugin'] as Map<String, dynamic>),
      ref: json['ref'] as String?,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String?,
    );

Map<String, dynamic> _$MischievousSourceToJson(MischievousSource instance) =>
    <String, dynamic>{
      'chart': instance.chart,
      'directory': instance.directory,
      'helm': instance.helm,
      'kustomize': instance.kustomize,
      'name': instance.name,
      'path': instance.path,
      'plugin': instance.plugin,
      'ref': instance.ref,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

MischievousDirectory _$MischievousDirectoryFromJson(
  Map<String, dynamic> json,
) => MischievousDirectory(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : MischievousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$MischievousDirectoryToJson(
  MischievousDirectory instance,
) => <String, dynamic>{
  'exclude': instance.exclude,
  'include': instance.include,
  'jsonnet': instance.jsonnet,
  'recurse': instance.recurse,
};

MischievousJsonnet _$MischievousJsonnetFromJson(Map<String, dynamic> json) =>
    MischievousJsonnet(
      extVars: (json['extVars'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousExtVar.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      tlas: (json['tlas'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousTlas.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$MischievousJsonnetToJson(MischievousJsonnet instance) =>
    <String, dynamic>{
      'extVars': instance.extVars,
      'libs': instance.libs,
      'tlas': instance.tlas,
    };

MischievousExtVar _$MischievousExtVarFromJson(Map<String, dynamic> json) =>
    MischievousExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MischievousExtVarToJson(MischievousExtVar instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

MischievousTlas _$MischievousTlasFromJson(Map<String, dynamic> json) =>
    MischievousTlas(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MischievousTlasToJson(MischievousTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

MischievousHelm _$MischievousHelmFromJson(Map<String, dynamic> json) =>
    MischievousHelm(
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      fileParameters: (json['fileParameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousFileParameter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
      kubeVersion: json['kubeVersion'] as String?,
      namespace: json['namespace'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Parameter10.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      passCredentials: json['passCredentials'] as bool?,
      releaseName: json['releaseName'] as String?,
      skipCrds: json['skipCrds'] as bool?,
      skipSchemaValidation: json['skipSchemaValidation'] as bool?,
      skipTests: json['skipTests'] as bool?,
      valueFiles: (json['valueFiles'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      values: json['values'] as String?,
      valuesObject: json['valuesObject'],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$MischievousHelmToJson(MischievousHelm instance) =>
    <String, dynamic>{
      'apiVersions': instance.apiVersions,
      'fileParameters': instance.fileParameters,
      'ignoreMissingValueFiles': instance.ignoreMissingValueFiles,
      'kubeVersion': instance.kubeVersion,
      'namespace': instance.namespace,
      'parameters': instance.parameters,
      'passCredentials': instance.passCredentials,
      'releaseName': instance.releaseName,
      'skipCrds': instance.skipCrds,
      'skipSchemaValidation': instance.skipSchemaValidation,
      'skipTests': instance.skipTests,
      'valueFiles': instance.valueFiles,
      'values': instance.values,
      'valuesObject': instance.valuesObject,
      'version': instance.version,
    };

MischievousFileParameter _$MischievousFileParameterFromJson(
  Map<String, dynamic> json,
) => MischievousFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$MischievousFileParameterToJson(
  MischievousFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter10 _$Parameter10FromJson(Map<String, dynamic> json) => Parameter10(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter10ToJson(Parameter10 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

MischievousKustomize _$MischievousKustomizeFromJson(
  Map<String, dynamic> json,
) => MischievousKustomize(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  commonAnnotations: (json['commonAnnotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  commonAnnotationsEnvsubst: json['commonAnnotationsEnvsubst'] as bool?,
  commonLabels: (json['commonLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  components: (json['components'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  forceCommonAnnotations: json['forceCommonAnnotations'] as bool?,
  forceCommonLabels: json['forceCommonLabels'] as bool?,
  ignoreMissingComponents: json['ignoreMissingComponents'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  kubeVersion: json['kubeVersion'] as String?,
  labelIncludeTemplates: json['labelIncludeTemplates'] as bool?,
  labelWithoutSelector: json['labelWithoutSelector'] as bool?,
  namePrefix: json['namePrefix'] as String?,
  namespace: json['namespace'] as String?,
  nameSuffix: json['nameSuffix'] as String?,
  patches: (json['patches'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$MischievousKustomizeToJson(
  MischievousKustomize instance,
) => <String, dynamic>{
  'apiVersions': instance.apiVersions,
  'commonAnnotations': instance.commonAnnotations,
  'commonAnnotationsEnvsubst': instance.commonAnnotationsEnvsubst,
  'commonLabels': instance.commonLabels,
  'components': instance.components,
  'forceCommonAnnotations': instance.forceCommonAnnotations,
  'forceCommonLabels': instance.forceCommonLabels,
  'ignoreMissingComponents': instance.ignoreMissingComponents,
  'images': instance.images,
  'kubeVersion': instance.kubeVersion,
  'labelIncludeTemplates': instance.labelIncludeTemplates,
  'labelWithoutSelector': instance.labelWithoutSelector,
  'namePrefix': instance.namePrefix,
  'namespace': instance.namespace,
  'nameSuffix': instance.nameSuffix,
  'patches': instance.patches,
  'replicas': instance.replicas,
  'version': instance.version,
};

MischievousPatch _$MischievousPatchFromJson(Map<String, dynamic> json) =>
    MischievousPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : MischievousTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MischievousPatchToJson(MischievousPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

MischievousTarget _$MischievousTargetFromJson(Map<String, dynamic> json) =>
    MischievousTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$MischievousTargetToJson(MischievousTarget instance) =>
    <String, dynamic>{
      'annotationSelector': instance.annotationSelector,
      'group': instance.group,
      'kind': instance.kind,
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'namespace': instance.namespace,
      'version': instance.version,
    };

MischievousReplica _$MischievousReplicaFromJson(Map<String, dynamic> json) =>
    MischievousReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$MischievousReplicaToJson(MischievousReplica instance) =>
    <String, dynamic>{'count': instance.count, 'name': instance.name};

MischievousPlugin _$MischievousPluginFromJson(Map<String, dynamic> json) =>
    MischievousPlugin(
      env: (json['env'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousEnv.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      name: json['name'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Parameter11.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$MischievousPluginToJson(MischievousPlugin instance) =>
    <String, dynamic>{
      'env': instance.env,
      'name': instance.name,
      'parameters': instance.parameters,
    };

MischievousEnv _$MischievousEnvFromJson(Map<String, dynamic> json) =>
    MischievousEnv(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MischievousEnvToJson(MischievousEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter11 _$Parameter11FromJson(Map<String, dynamic> json) => Parameter11(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter11ToJson(Parameter11 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

ApplicationlistArgoprojV1Alpha1Metadata
_$ApplicationlistArgoprojV1Alpha1MetadataFromJson(Map<String, dynamic> json) =>
    ApplicationlistArgoprojV1Alpha1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ApplicationlistArgoprojV1Alpha1MetadataToJson(
  ApplicationlistArgoprojV1Alpha1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
