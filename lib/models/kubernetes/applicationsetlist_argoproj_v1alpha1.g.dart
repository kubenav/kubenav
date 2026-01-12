// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicationsetlist_argoproj_v1alpha1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationsetlistArgoprojV1Alpha1 _$ApplicationsetlistArgoprojV1Alpha1FromJson(
  Map<String, dynamic> json,
) => ApplicationsetlistArgoprojV1Alpha1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ApplicationsetlistArgoprojV1Alpha1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ApplicationsetlistArgoprojV1Alpha1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ApplicationsetlistArgoprojV1Alpha1ToJson(
  ApplicationsetlistArgoprojV1Alpha1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ApplicationsetlistArgoprojV1Alpha1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ARGOPROJ_IO_V1_ALPHA1: 'argoproj.io/v1alpha1',
};

const _$ApplicationsetlistArgoprojV1Alpha1KindEnumMap = {
  ApplicationsetlistArgoprojV1Alpha1Kind.APPLICATION_SET_LIST:
      'ApplicationSetList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: ItemSpec.fromJson(json['spec'] as Map<String, dynamic>),
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

const _$ItemKindEnumMap = {ItemKind.APPLICATION_SET: 'ApplicationSet'};

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
  applyNestedSelectors: json['applyNestedSelectors'] as bool?,
  generators: (json['generators'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : SpecGenerator.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  goTemplate: json['goTemplate'] as bool?,
  goTemplateOptions: (json['goTemplateOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  ignoreApplicationDifferences:
      (json['ignoreApplicationDifferences'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IgnoreApplicationDifference.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  preservedFields: json['preservedFields'] == null
      ? null
      : PreservedFields.fromJson(
          json['preservedFields'] as Map<String, dynamic>,
        ),
  strategy: json['strategy'] == null
      ? null
      : Strategy.fromJson(json['strategy'] as Map<String, dynamic>),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy11.fromJson(json['syncPolicy'] as Map<String, dynamic>),
  template: SpecTemplate.fromJson(json['template'] as Map<String, dynamic>),
  templatePatch: json['templatePatch'] as String?,
);

Map<String, dynamic> _$ItemSpecToJson(ItemSpec instance) => <String, dynamic>{
  'applyNestedSelectors': instance.applyNestedSelectors,
  'generators': instance.generators,
  'goTemplate': instance.goTemplate,
  'goTemplateOptions': instance.goTemplateOptions,
  'ignoreApplicationDifferences': instance.ignoreApplicationDifferences,
  'preservedFields': instance.preservedFields,
  'strategy': instance.strategy,
  'syncPolicy': instance.syncPolicy,
  'template': instance.template,
  'templatePatch': instance.templatePatch,
};

SpecGenerator _$SpecGeneratorFromJson(Map<String, dynamic> json) =>
    SpecGenerator(
      clusterDecisionResource: json['clusterDecisionResource'] == null
          ? null
          : PurpleClusterDecisionResource.fromJson(
              json['clusterDecisionResource'] as Map<String, dynamic>,
            ),
      clusters: json['clusters'] == null
          ? null
          : PurpleClusters.fromJson(json['clusters'] as Map<String, dynamic>),
      git: json['git'] == null
          ? null
          : PurpleGit.fromJson(json['git'] as Map<String, dynamic>),
      list: json['list'] == null
          ? null
          : PurpleList.fromJson(json['list'] as Map<String, dynamic>),
      matrix: json['matrix'] == null
          ? null
          : Matrix.fromJson(json['matrix'] as Map<String, dynamic>),
      merge: json['merge'] == null
          ? null
          : Merge.fromJson(json['merge'] as Map<String, dynamic>),
      plugin: json['plugin'] == null
          ? null
          : Plugin30.fromJson(json['plugin'] as Map<String, dynamic>),
      pullRequest: json['pullRequest'] == null
          ? null
          : TentacledPullRequest.fromJson(
              json['pullRequest'] as Map<String, dynamic>,
            ),
      scmProvider: json['scmProvider'] == null
          ? null
          : TentacledScmProvider.fromJson(
              json['scmProvider'] as Map<String, dynamic>,
            ),
      selector: json['selector'] == null
          ? null
          : IndecentSelector.fromJson(json['selector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecGeneratorToJson(SpecGenerator instance) =>
    <String, dynamic>{
      'clusterDecisionResource': instance.clusterDecisionResource,
      'clusters': instance.clusters,
      'git': instance.git,
      'list': instance.list,
      'matrix': instance.matrix,
      'merge': instance.merge,
      'plugin': instance.plugin,
      'pullRequest': instance.pullRequest,
      'scmProvider': instance.scmProvider,
      'selector': instance.selector,
    };

PurpleClusterDecisionResource _$PurpleClusterDecisionResourceFromJson(
  Map<String, dynamic> json,
) => PurpleClusterDecisionResource(
  configMapRef: json['configMapRef'] as String,
  labelSelector: json['labelSelector'] == null
      ? null
      : PurpleLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  name: json['name'] as String?,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : PurpleTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurpleClusterDecisionResourceToJson(
  PurpleClusterDecisionResource instance,
) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

PurpleLabelSelector _$PurpleLabelSelectorFromJson(Map<String, dynamic> json) =>
    PurpleLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PurpleLabelSelectorToJson(
  PurpleLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

PurpleMatchExpression _$PurpleMatchExpressionFromJson(
  Map<String, dynamic> json,
) => PurpleMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PurpleMatchExpressionToJson(
  PurpleMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PurpleTemplate _$PurpleTemplateFromJson(Map<String, dynamic> json) =>
    PurpleTemplate(
      metadata: PurpleMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: PurpleSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurpleTemplateToJson(PurpleTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

PurpleMetadata _$PurpleMetadataFromJson(Map<String, dynamic> json) =>
    PurpleMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$PurpleMetadataToJson(PurpleMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

PurpleSpec _$PurpleSpecFromJson(Map<String, dynamic> json) => PurpleSpec(
  destination: PurpleDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : PurpleSource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : PurpleSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffySource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : PurpleSyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleSpecToJson(PurpleSpec instance) =>
    <String, dynamic>{
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

PurpleDestination _$PurpleDestinationFromJson(Map<String, dynamic> json) =>
    PurpleDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$PurpleDestinationToJson(PurpleDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

PurpleIgnoreDifference _$PurpleIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => PurpleIgnoreDifference(
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

Map<String, dynamic> _$PurpleIgnoreDifferenceToJson(
  PurpleIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

PurpleInfo _$PurpleInfoFromJson(Map<String, dynamic> json) =>
    PurpleInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$PurpleInfoToJson(PurpleInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

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

PurpleSourceHydrator _$PurpleSourceHydratorFromJson(
  Map<String, dynamic> json,
) => PurpleSourceHydrator(
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

Map<String, dynamic> _$PurpleSourceHydratorToJson(
  PurpleSourceHydrator instance,
) => <String, dynamic>{
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

PurpleSyncPolicy _$PurpleSyncPolicyFromJson(Map<String, dynamic> json) =>
    PurpleSyncPolicy(
      automated: json['automated'] == null
          ? null
          : PurpleAutomated.fromJson(json['automated'] as Map<String, dynamic>),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : PurpleManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : PurpleRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$PurpleSyncPolicyToJson(PurpleSyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

PurpleAutomated _$PurpleAutomatedFromJson(Map<String, dynamic> json) =>
    PurpleAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$PurpleAutomatedToJson(PurpleAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

PurpleManagedNamespaceMetadata _$PurpleManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => PurpleManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurpleManagedNamespaceMetadataToJson(
  PurpleManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
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

PurpleClusters _$PurpleClustersFromJson(Map<String, dynamic> json) =>
    PurpleClusters(
      flatList: json['flatList'] as bool?,
      selector: json['selector'] == null
          ? null
          : PurpleSelector.fromJson(json['selector'] as Map<String, dynamic>),
      template: json['template'] == null
          ? null
          : FluffyTemplate.fromJson(json['template'] as Map<String, dynamic>),
      values: (json['values'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PurpleClustersToJson(PurpleClusters instance) =>
    <String, dynamic>{
      'flatList': instance.flatList,
      'selector': instance.selector,
      'template': instance.template,
      'values': instance.values,
    };

PurpleSelector _$PurpleSelectorFromJson(Map<String, dynamic> json) =>
    PurpleSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PurpleSelectorToJson(PurpleSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

FluffyMatchExpression _$FluffyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => FluffyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FluffyMatchExpressionToJson(
  FluffyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

FluffyTemplate _$FluffyTemplateFromJson(Map<String, dynamic> json) =>
    FluffyTemplate(
      metadata: FluffyMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: FluffySpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FluffyTemplateToJson(FluffyTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

FluffyMetadata _$FluffyMetadataFromJson(Map<String, dynamic> json) =>
    FluffyMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$FluffyMetadataToJson(FluffyMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

FluffySpec _$FluffySpecFromJson(Map<String, dynamic> json) => FluffySpec(
  destination: FluffyDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : TentacledSource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : FluffySourceHydrator.fromJson(
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
      : FluffySyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffySpecToJson(FluffySpec instance) =>
    <String, dynamic>{
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

FluffyDestination _$FluffyDestinationFromJson(Map<String, dynamic> json) =>
    FluffyDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$FluffyDestinationToJson(FluffyDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

FluffyIgnoreDifference _$FluffyIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => FluffyIgnoreDifference(
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

Map<String, dynamic> _$FluffyIgnoreDifferenceToJson(
  FluffyIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

FluffyInfo _$FluffyInfoFromJson(Map<String, dynamic> json) =>
    FluffyInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FluffyInfoToJson(FluffyInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

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

FluffySourceHydrator _$FluffySourceHydratorFromJson(
  Map<String, dynamic> json,
) => FluffySourceHydrator(
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

Map<String, dynamic> _$FluffySourceHydratorToJson(
  FluffySourceHydrator instance,
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

FluffySyncPolicy _$FluffySyncPolicyFromJson(Map<String, dynamic> json) =>
    FluffySyncPolicy(
      automated: json['automated'] == null
          ? null
          : FluffyAutomated.fromJson(json['automated'] as Map<String, dynamic>),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : FluffyManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : FluffyRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FluffySyncPolicyToJson(FluffySyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

FluffyAutomated _$FluffyAutomatedFromJson(Map<String, dynamic> json) =>
    FluffyAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$FluffyAutomatedToJson(FluffyAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

FluffyManagedNamespaceMetadata _$FluffyManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => FluffyManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyManagedNamespaceMetadataToJson(
  FluffyManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

FluffyRetry _$FluffyRetryFromJson(Map<String, dynamic> json) => FluffyRetry(
  backoff: json['backoff'] == null
      ? null
      : FluffyBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$FluffyRetryToJson(FluffyRetry instance) =>
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

PurpleGit _$PurpleGitFromJson(Map<String, dynamic> json) => PurpleGit(
  directories: (json['directories'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndigoDirectory.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  files: (json['files'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleFile.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  pathParamPrefix: json['pathParamPrefix'] as String?,
  repoUrl: json['repoURL'] as String,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  revision: json['revision'] as String,
  template: json['template'] == null
      ? null
      : TentacledTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurpleGitToJson(PurpleGit instance) => <String, dynamic>{
  'directories': instance.directories,
  'files': instance.files,
  'pathParamPrefix': instance.pathParamPrefix,
  'repoURL': instance.repoUrl,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'revision': instance.revision,
  'template': instance.template,
  'values': instance.values,
};

IndigoDirectory _$IndigoDirectoryFromJson(Map<String, dynamic> json) =>
    IndigoDirectory(
      exclude: json['exclude'] as bool?,
      path: json['path'] as String,
    );

Map<String, dynamic> _$IndigoDirectoryToJson(IndigoDirectory instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

PurpleFile _$PurpleFileFromJson(Map<String, dynamic> json) =>
    PurpleFile(exclude: json['exclude'] as bool?, path: json['path'] as String);

Map<String, dynamic> _$PurpleFileToJson(PurpleFile instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

TentacledTemplate _$TentacledTemplateFromJson(Map<String, dynamic> json) =>
    TentacledTemplate(
      metadata: TentacledMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: TentacledSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledTemplateToJson(TentacledTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

TentacledMetadata _$TentacledMetadataFromJson(Map<String, dynamic> json) =>
    TentacledMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$TentacledMetadataToJson(TentacledMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

TentacledSpec _$TentacledSpecFromJson(Map<String, dynamic> json) =>
    TentacledSpec(
      destination: TentacledDestination.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledIgnoreDifference.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      info: (json['info'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      project: json['project'] as String,
      revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
      source: json['source'] == null
          ? null
          : IndigoSource.fromJson(json['source'] as Map<String, dynamic>),
      sourceHydrator: json['sourceHydrator'] == null
          ? null
          : TentacledSourceHydrator.fromJson(
              json['sourceHydrator'] as Map<String, dynamic>,
            ),
      sources: (json['sources'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentSource.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      syncPolicy: json['syncPolicy'] == null
          ? null
          : TentacledSyncPolicy.fromJson(
              json['syncPolicy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TentacledSpecToJson(TentacledSpec instance) =>
    <String, dynamic>{
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

TentacledDestination _$TentacledDestinationFromJson(
  Map<String, dynamic> json,
) => TentacledDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$TentacledDestinationToJson(
  TentacledDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

TentacledIgnoreDifference _$TentacledIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => TentacledIgnoreDifference(
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

Map<String, dynamic> _$TentacledIgnoreDifferenceToJson(
  TentacledIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

TentacledInfo _$TentacledInfoFromJson(Map<String, dynamic> json) =>
    TentacledInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$TentacledInfoToJson(TentacledInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

IndigoSource _$IndigoSourceFromJson(Map<String, dynamic> json) => IndigoSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : IndecentDirectory.fromJson(json['directory'] as Map<String, dynamic>),
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

IndecentDirectory _$IndecentDirectoryFromJson(Map<String, dynamic> json) =>
    IndecentDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : IndigoJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$IndecentDirectoryToJson(IndecentDirectory instance) =>
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

TentacledSourceHydrator _$TentacledSourceHydratorFromJson(
  Map<String, dynamic> json,
) => TentacledSourceHydrator(
  drySource: TentacledDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : TentacledHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: TentacledSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TentacledSourceHydratorToJson(
  TentacledSourceHydrator instance,
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

IndecentSource _$IndecentSourceFromJson(
  Map<String, dynamic> json,
) => IndecentSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : HilariousDirectory.fromJson(json['directory'] as Map<String, dynamic>),
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

HilariousDirectory _$HilariousDirectoryFromJson(Map<String, dynamic> json) =>
    HilariousDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : IndecentJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$HilariousDirectoryToJson(HilariousDirectory instance) =>
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

TentacledSyncPolicy _$TentacledSyncPolicyFromJson(Map<String, dynamic> json) =>
    TentacledSyncPolicy(
      automated: json['automated'] == null
          ? null
          : TentacledAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : TentacledManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : TentacledRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$TentacledSyncPolicyToJson(
  TentacledSyncPolicy instance,
) => <String, dynamic>{
  'automated': instance.automated,
  'managedNamespaceMetadata': instance.managedNamespaceMetadata,
  'retry': instance.retry,
  'syncOptions': instance.syncOptions,
};

TentacledAutomated _$TentacledAutomatedFromJson(Map<String, dynamic> json) =>
    TentacledAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$TentacledAutomatedToJson(TentacledAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

TentacledManagedNamespaceMetadata _$TentacledManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => TentacledManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledManagedNamespaceMetadataToJson(
  TentacledManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

TentacledRetry _$TentacledRetryFromJson(Map<String, dynamic> json) =>
    TentacledRetry(
      backoff: json['backoff'] == null
          ? null
          : TentacledBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$TentacledRetryToJson(TentacledRetry instance) =>
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

PurpleList _$PurpleListFromJson(Map<String, dynamic> json) => PurpleList(
  elements: json['elements'] as List<dynamic>?,
  elementsYaml: json['elementsYaml'] as String?,
  template: json['template'] == null
      ? null
      : StickyTemplate.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleListToJson(PurpleList instance) =>
    <String, dynamic>{
      'elements': instance.elements,
      'elementsYaml': instance.elementsYaml,
      'template': instance.template,
    };

StickyTemplate _$StickyTemplateFromJson(Map<String, dynamic> json) =>
    StickyTemplate(
      metadata: StickyMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: StickySpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StickyTemplateToJson(StickyTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

StickyMetadata _$StickyMetadataFromJson(Map<String, dynamic> json) =>
    StickyMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$StickyMetadataToJson(StickyMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

StickySpec _$StickySpecFromJson(Map<String, dynamic> json) => StickySpec(
  destination: StickyDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickyInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : HilariousSource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : StickySourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AmbitiousSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : StickySyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StickySpecToJson(StickySpec instance) =>
    <String, dynamic>{
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

StickyDestination _$StickyDestinationFromJson(Map<String, dynamic> json) =>
    StickyDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$StickyDestinationToJson(StickyDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

StickyIgnoreDifference _$StickyIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => StickyIgnoreDifference(
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

Map<String, dynamic> _$StickyIgnoreDifferenceToJson(
  StickyIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

StickyInfo _$StickyInfoFromJson(Map<String, dynamic> json) =>
    StickyInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$StickyInfoToJson(StickyInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

HilariousSource _$HilariousSourceFromJson(
  Map<String, dynamic> json,
) => HilariousSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : AmbitiousDirectory.fromJson(json['directory'] as Map<String, dynamic>),
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

AmbitiousDirectory _$AmbitiousDirectoryFromJson(Map<String, dynamic> json) =>
    AmbitiousDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : HilariousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$AmbitiousDirectoryToJson(AmbitiousDirectory instance) =>
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

StickySourceHydrator _$StickySourceHydratorFromJson(
  Map<String, dynamic> json,
) => StickySourceHydrator(
  drySource: StickyDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : StickyHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: StickySyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StickySourceHydratorToJson(
  StickySourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

StickyDrySource _$StickyDrySourceFromJson(Map<String, dynamic> json) =>
    StickyDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$StickyDrySourceToJson(StickyDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

StickyHydrateTo _$StickyHydrateToFromJson(Map<String, dynamic> json) =>
    StickyHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$StickyHydrateToToJson(StickyHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

StickySyncSource _$StickySyncSourceFromJson(Map<String, dynamic> json) =>
    StickySyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$StickySyncSourceToJson(StickySyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

AmbitiousSource _$AmbitiousSourceFromJson(
  Map<String, dynamic> json,
) => AmbitiousSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : CunningDirectory.fromJson(json['directory'] as Map<String, dynamic>),
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

CunningDirectory _$CunningDirectoryFromJson(Map<String, dynamic> json) =>
    CunningDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : AmbitiousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$CunningDirectoryToJson(CunningDirectory instance) =>
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

StickySyncPolicy _$StickySyncPolicyFromJson(Map<String, dynamic> json) =>
    StickySyncPolicy(
      automated: json['automated'] == null
          ? null
          : StickyAutomated.fromJson(json['automated'] as Map<String, dynamic>),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : StickyManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : StickyRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$StickySyncPolicyToJson(StickySyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

StickyAutomated _$StickyAutomatedFromJson(Map<String, dynamic> json) =>
    StickyAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$StickyAutomatedToJson(StickyAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

StickyManagedNamespaceMetadata _$StickyManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => StickyManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$StickyManagedNamespaceMetadataToJson(
  StickyManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

StickyRetry _$StickyRetryFromJson(Map<String, dynamic> json) => StickyRetry(
  backoff: json['backoff'] == null
      ? null
      : StickyBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$StickyRetryToJson(StickyRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

StickyBackoff _$StickyBackoffFromJson(Map<String, dynamic> json) =>
    StickyBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$StickyBackoffToJson(StickyBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

Matrix _$MatrixFromJson(Map<String, dynamic> json) => Matrix(
  generators: (json['generators'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : MatrixGenerator.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  template: json['template'] == null
      ? null
      : MatrixTemplate.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatrixToJson(Matrix instance) => <String, dynamic>{
  'generators': instance.generators,
  'template': instance.template,
};

MatrixGenerator _$MatrixGeneratorFromJson(
  Map<String, dynamic> json,
) => MatrixGenerator(
  clusterDecisionResource: json['clusterDecisionResource'] == null
      ? null
      : FluffyClusterDecisionResource.fromJson(
          json['clusterDecisionResource'] as Map<String, dynamic>,
        ),
  clusters: json['clusters'] == null
      ? null
      : FluffyClusters.fromJson(json['clusters'] as Map<String, dynamic>),
  git: json['git'] == null
      ? null
      : FluffyGit.fromJson(json['git'] as Map<String, dynamic>),
  list: json['list'] == null
      ? null
      : FluffyList.fromJson(json['list'] as Map<String, dynamic>),
  matrix: json['matrix'],
  merge: json['merge'],
  plugin: json['plugin'] == null
      ? null
      : Plugin4.fromJson(json['plugin'] as Map<String, dynamic>),
  pullRequest: json['pullRequest'] == null
      ? null
      : PurplePullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  scmProvider: json['scmProvider'] == null
      ? null
      : PurpleScmProvider.fromJson(json['scmProvider'] as Map<String, dynamic>),
  selector: json['selector'] == null
      ? null
      : TentacledSelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatrixGeneratorToJson(MatrixGenerator instance) =>
    <String, dynamic>{
      'clusterDecisionResource': instance.clusterDecisionResource,
      'clusters': instance.clusters,
      'git': instance.git,
      'list': instance.list,
      'matrix': instance.matrix,
      'merge': instance.merge,
      'plugin': instance.plugin,
      'pullRequest': instance.pullRequest,
      'scmProvider': instance.scmProvider,
      'selector': instance.selector,
    };

FluffyClusterDecisionResource _$FluffyClusterDecisionResourceFromJson(
  Map<String, dynamic> json,
) => FluffyClusterDecisionResource(
  configMapRef: json['configMapRef'] as String,
  labelSelector: json['labelSelector'] == null
      ? null
      : FluffyLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  name: json['name'] as String?,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : IndigoTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyClusterDecisionResourceToJson(
  FluffyClusterDecisionResource instance,
) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

FluffyLabelSelector _$FluffyLabelSelectorFromJson(Map<String, dynamic> json) =>
    FluffyLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FluffyLabelSelectorToJson(
  FluffyLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

TentacledMatchExpression _$TentacledMatchExpressionFromJson(
  Map<String, dynamic> json,
) => TentacledMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$TentacledMatchExpressionToJson(
  TentacledMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

IndigoTemplate _$IndigoTemplateFromJson(Map<String, dynamic> json) =>
    IndigoTemplate(
      metadata: IndigoMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: IndigoSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndigoTemplateToJson(IndigoTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

IndigoMetadata _$IndigoMetadataFromJson(Map<String, dynamic> json) =>
    IndigoMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$IndigoMetadataToJson(IndigoMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

IndigoSpec _$IndigoSpecFromJson(Map<String, dynamic> json) => IndigoSpec(
  destination: IndigoDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndigoIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : CunningSource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : IndigoSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : IndigoSyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoSpecToJson(IndigoSpec instance) =>
    <String, dynamic>{
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

IndigoDestination _$IndigoDestinationFromJson(Map<String, dynamic> json) =>
    IndigoDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$IndigoDestinationToJson(IndigoDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IndigoIgnoreDifference _$IndigoIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => IndigoIgnoreDifference(
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

Map<String, dynamic> _$IndigoIgnoreDifferenceToJson(
  IndigoIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

IndigoInfo _$IndigoInfoFromJson(Map<String, dynamic> json) =>
    IndigoInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$IndigoInfoToJson(IndigoInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

CunningSource _$CunningSourceFromJson(
  Map<String, dynamic> json,
) => CunningSource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : MagentaDirectory.fromJson(json['directory'] as Map<String, dynamic>),
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

MagentaDirectory _$MagentaDirectoryFromJson(Map<String, dynamic> json) =>
    MagentaDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : CunningJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$MagentaDirectoryToJson(MagentaDirectory instance) =>
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

IndigoSourceHydrator _$IndigoSourceHydratorFromJson(
  Map<String, dynamic> json,
) => IndigoSourceHydrator(
  drySource: IndigoDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : IndigoHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: IndigoSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$IndigoSourceHydratorToJson(
  IndigoSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

IndigoDrySource _$IndigoDrySourceFromJson(Map<String, dynamic> json) =>
    IndigoDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$IndigoDrySourceToJson(IndigoDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

IndigoHydrateTo _$IndigoHydrateToFromJson(Map<String, dynamic> json) =>
    IndigoHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$IndigoHydrateToToJson(IndigoHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

IndigoSyncSource _$IndigoSyncSourceFromJson(Map<String, dynamic> json) =>
    IndigoSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$IndigoSyncSourceToJson(IndigoSyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

MagentaSource _$MagentaSourceFromJson(Map<String, dynamic> json) =>
    MagentaSource(
      chart: json['chart'] as String?,
      directory: json['directory'] == null
          ? null
          : FriskyDirectory.fromJson(json['directory'] as Map<String, dynamic>),
      helm: json['helm'] == null
          ? null
          : MagentaHelm.fromJson(json['helm'] as Map<String, dynamic>),
      kustomize: json['kustomize'] == null
          ? null
          : MagentaKustomize.fromJson(
              json['kustomize'] as Map<String, dynamic>,
            ),
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

FriskyDirectory _$FriskyDirectoryFromJson(Map<String, dynamic> json) =>
    FriskyDirectory(
      exclude: json['exclude'] as String?,
      include: json['include'] as String?,
      jsonnet: json['jsonnet'] == null
          ? null
          : MagentaJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
      recurse: json['recurse'] as bool?,
    );

Map<String, dynamic> _$FriskyDirectoryToJson(FriskyDirectory instance) =>
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

IndigoSyncPolicy _$IndigoSyncPolicyFromJson(Map<String, dynamic> json) =>
    IndigoSyncPolicy(
      automated: json['automated'] == null
          ? null
          : IndigoAutomated.fromJson(json['automated'] as Map<String, dynamic>),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : IndigoManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : IndigoRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$IndigoSyncPolicyToJson(IndigoSyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

IndigoAutomated _$IndigoAutomatedFromJson(Map<String, dynamic> json) =>
    IndigoAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$IndigoAutomatedToJson(IndigoAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

IndigoManagedNamespaceMetadata _$IndigoManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => IndigoManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IndigoManagedNamespaceMetadataToJson(
  IndigoManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

IndigoRetry _$IndigoRetryFromJson(Map<String, dynamic> json) => IndigoRetry(
  backoff: json['backoff'] == null
      ? null
      : IndigoBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$IndigoRetryToJson(IndigoRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

IndigoBackoff _$IndigoBackoffFromJson(Map<String, dynamic> json) =>
    IndigoBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$IndigoBackoffToJson(IndigoBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

FluffyClusters _$FluffyClustersFromJson(Map<String, dynamic> json) =>
    FluffyClusters(
      flatList: json['flatList'] as bool?,
      selector: json['selector'] == null
          ? null
          : FluffySelector.fromJson(json['selector'] as Map<String, dynamic>),
      template: json['template'] == null
          ? null
          : IndecentTemplate.fromJson(json['template'] as Map<String, dynamic>),
      values: (json['values'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FluffyClustersToJson(FluffyClusters instance) =>
    <String, dynamic>{
      'flatList': instance.flatList,
      'selector': instance.selector,
      'template': instance.template,
      'values': instance.values,
    };

FluffySelector _$FluffySelectorFromJson(Map<String, dynamic> json) =>
    FluffySelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FluffySelectorToJson(FluffySelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

StickyMatchExpression _$StickyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => StickyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$StickyMatchExpressionToJson(
  StickyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

IndecentTemplate _$IndecentTemplateFromJson(Map<String, dynamic> json) =>
    IndecentTemplate(
      metadata: IndecentMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: IndecentSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentTemplateToJson(IndecentTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

IndecentMetadata _$IndecentMetadataFromJson(Map<String, dynamic> json) =>
    IndecentMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$IndecentMetadataToJson(IndecentMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

IndecentSpec _$IndecentSpecFromJson(Map<String, dynamic> json) => IndecentSpec(
  destination: IndecentDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndecentInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : FriskySource.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : IndecentSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : IndecentSyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndecentSpecToJson(IndecentSpec instance) =>
    <String, dynamic>{
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

IndecentDestination _$IndecentDestinationFromJson(Map<String, dynamic> json) =>
    IndecentDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$IndecentDestinationToJson(
  IndecentDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

IndecentIgnoreDifference _$IndecentIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => IndecentIgnoreDifference(
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

Map<String, dynamic> _$IndecentIgnoreDifferenceToJson(
  IndecentIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

IndecentInfo _$IndecentInfoFromJson(Map<String, dynamic> json) =>
    IndecentInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$IndecentInfoToJson(IndecentInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

FriskySource _$FriskySourceFromJson(Map<String, dynamic> json) => FriskySource(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : MischievousDirectory.fromJson(
          json['directory'] as Map<String, dynamic>,
        ),
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

MischievousDirectory _$MischievousDirectoryFromJson(
  Map<String, dynamic> json,
) => MischievousDirectory(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : FriskyJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
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

IndecentSourceHydrator _$IndecentSourceHydratorFromJson(
  Map<String, dynamic> json,
) => IndecentSourceHydrator(
  drySource: IndecentDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : IndecentHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: IndecentSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$IndecentSourceHydratorToJson(
  IndecentSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

IndecentDrySource _$IndecentDrySourceFromJson(Map<String, dynamic> json) =>
    IndecentDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$IndecentDrySourceToJson(IndecentDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

IndecentHydrateTo _$IndecentHydrateToFromJson(Map<String, dynamic> json) =>
    IndecentHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$IndecentHydrateToToJson(IndecentHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

IndecentSyncSource _$IndecentSyncSourceFromJson(Map<String, dynamic> json) =>
    IndecentSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$IndecentSyncSourceToJson(IndecentSyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

MischievousSource _$MischievousSourceFromJson(Map<String, dynamic> json) =>
    MischievousSource(
      chart: json['chart'] as String?,
      directory: json['directory'] == null
          ? null
          : BraggadociousDirectory.fromJson(
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

BraggadociousDirectory _$BraggadociousDirectoryFromJson(
  Map<String, dynamic> json,
) => BraggadociousDirectory(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : MischievousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$BraggadociousDirectoryToJson(
  BraggadociousDirectory instance,
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

IndecentSyncPolicy _$IndecentSyncPolicyFromJson(Map<String, dynamic> json) =>
    IndecentSyncPolicy(
      automated: json['automated'] == null
          ? null
          : IndecentAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : IndecentManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : IndecentRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$IndecentSyncPolicyToJson(IndecentSyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

IndecentAutomated _$IndecentAutomatedFromJson(Map<String, dynamic> json) =>
    IndecentAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$IndecentAutomatedToJson(IndecentAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

IndecentManagedNamespaceMetadata _$IndecentManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => IndecentManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IndecentManagedNamespaceMetadataToJson(
  IndecentManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

IndecentRetry _$IndecentRetryFromJson(Map<String, dynamic> json) =>
    IndecentRetry(
      backoff: json['backoff'] == null
          ? null
          : IndecentBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$IndecentRetryToJson(IndecentRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

IndecentBackoff _$IndecentBackoffFromJson(Map<String, dynamic> json) =>
    IndecentBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$IndecentBackoffToJson(IndecentBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

FluffyGit _$FluffyGitFromJson(Map<String, dynamic> json) => FluffyGit(
  directories: (json['directories'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Directory1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  files: (json['files'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyFile.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  pathParamPrefix: json['pathParamPrefix'] as String?,
  repoUrl: json['repoURL'] as String,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  revision: json['revision'] as String,
  template: json['template'] == null
      ? null
      : HilariousTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyGitToJson(FluffyGit instance) => <String, dynamic>{
  'directories': instance.directories,
  'files': instance.files,
  'pathParamPrefix': instance.pathParamPrefix,
  'repoURL': instance.repoUrl,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'revision': instance.revision,
  'template': instance.template,
  'values': instance.values,
};

Directory1 _$Directory1FromJson(Map<String, dynamic> json) =>
    Directory1(exclude: json['exclude'] as bool?, path: json['path'] as String);

Map<String, dynamic> _$Directory1ToJson(Directory1 instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

FluffyFile _$FluffyFileFromJson(Map<String, dynamic> json) =>
    FluffyFile(exclude: json['exclude'] as bool?, path: json['path'] as String);

Map<String, dynamic> _$FluffyFileToJson(FluffyFile instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

HilariousTemplate _$HilariousTemplateFromJson(Map<String, dynamic> json) =>
    HilariousTemplate(
      metadata: HilariousMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: HilariousSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HilariousTemplateToJson(HilariousTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

HilariousMetadata _$HilariousMetadataFromJson(Map<String, dynamic> json) =>
    HilariousMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$HilariousMetadataToJson(HilariousMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

HilariousSpec _$HilariousSpecFromJson(Map<String, dynamic> json) =>
    HilariousSpec(
      destination: HilariousDestination.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousIgnoreDifference.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      info: (json['info'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      project: json['project'] as String,
      revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
      source: json['source'] == null
          ? null
          : BraggadociousSource.fromJson(
              json['source'] as Map<String, dynamic>,
            ),
      sourceHydrator: json['sourceHydrator'] == null
          ? null
          : HilariousSourceHydrator.fromJson(
              json['sourceHydrator'] as Map<String, dynamic>,
            ),
      sources: (json['sources'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Source1.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      syncPolicy: json['syncPolicy'] == null
          ? null
          : HilariousSyncPolicy.fromJson(
              json['syncPolicy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HilariousSpecToJson(HilariousSpec instance) =>
    <String, dynamic>{
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

HilariousDestination _$HilariousDestinationFromJson(
  Map<String, dynamic> json,
) => HilariousDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$HilariousDestinationToJson(
  HilariousDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

HilariousIgnoreDifference _$HilariousIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => HilariousIgnoreDifference(
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

Map<String, dynamic> _$HilariousIgnoreDifferenceToJson(
  HilariousIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

HilariousInfo _$HilariousInfoFromJson(Map<String, dynamic> json) =>
    HilariousInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$HilariousInfoToJson(HilariousInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

BraggadociousSource _$BraggadociousSourceFromJson(Map<String, dynamic> json) =>
    BraggadociousSource(
      chart: json['chart'] as String?,
      directory: json['directory'] == null
          ? null
          : Directory2.fromJson(json['directory'] as Map<String, dynamic>),
      helm: json['helm'] == null
          ? null
          : BraggadociousHelm.fromJson(json['helm'] as Map<String, dynamic>),
      kustomize: json['kustomize'] == null
          ? null
          : BraggadociousKustomize.fromJson(
              json['kustomize'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      path: json['path'] as String?,
      plugin: json['plugin'] == null
          ? null
          : BraggadociousPlugin.fromJson(
              json['plugin'] as Map<String, dynamic>,
            ),
      ref: json['ref'] as String?,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String?,
    );

Map<String, dynamic> _$BraggadociousSourceToJson(
  BraggadociousSource instance,
) => <String, dynamic>{
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

Directory2 _$Directory2FromJson(Map<String, dynamic> json) => Directory2(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : BraggadociousJsonnet.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory2ToJson(Directory2 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

BraggadociousJsonnet _$BraggadociousJsonnetFromJson(
  Map<String, dynamic> json,
) => BraggadociousJsonnet(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousExtVar.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousTlas.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$BraggadociousJsonnetToJson(
  BraggadociousJsonnet instance,
) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

BraggadociousExtVar _$BraggadociousExtVarFromJson(Map<String, dynamic> json) =>
    BraggadociousExtVar(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$BraggadociousExtVarToJson(
  BraggadociousExtVar instance,
) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

BraggadociousTlas _$BraggadociousTlasFromJson(Map<String, dynamic> json) =>
    BraggadociousTlas(
      code: json['code'] as bool?,
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$BraggadociousTlasToJson(BraggadociousTlas instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
    };

BraggadociousHelm _$BraggadociousHelmFromJson(
  Map<String, dynamic> json,
) => BraggadociousHelm(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousFileParameter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter12.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$BraggadociousHelmToJson(BraggadociousHelm instance) =>
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

BraggadociousFileParameter _$BraggadociousFileParameterFromJson(
  Map<String, dynamic> json,
) => BraggadociousFileParameter(
  name: json['name'] as String?,
  path: json['path'] as String?,
);

Map<String, dynamic> _$BraggadociousFileParameterToJson(
  BraggadociousFileParameter instance,
) => <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter12 _$Parameter12FromJson(Map<String, dynamic> json) => Parameter12(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter12ToJson(Parameter12 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

BraggadociousKustomize _$BraggadociousKustomizeFromJson(
  Map<String, dynamic> json,
) => BraggadociousKustomize(
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
            : BraggadociousPatch.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousReplica.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$BraggadociousKustomizeToJson(
  BraggadociousKustomize instance,
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

BraggadociousPatch _$BraggadociousPatchFromJson(Map<String, dynamic> json) =>
    BraggadociousPatch(
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool?),
      ),
      patch: json['patch'] as String?,
      path: json['path'] as String?,
      target: json['target'] == null
          ? null
          : BraggadociousTarget.fromJson(
              json['target'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$BraggadociousPatchToJson(BraggadociousPatch instance) =>
    <String, dynamic>{
      'options': instance.options,
      'patch': instance.patch,
      'path': instance.path,
      'target': instance.target,
    };

BraggadociousTarget _$BraggadociousTargetFromJson(Map<String, dynamic> json) =>
    BraggadociousTarget(
      annotationSelector: json['annotationSelector'] as String?,
      group: json['group'] as String?,
      kind: json['kind'] as String?,
      labelSelector: json['labelSelector'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$BraggadociousTargetToJson(
  BraggadociousTarget instance,
) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

BraggadociousReplica _$BraggadociousReplicaFromJson(
  Map<String, dynamic> json,
) => BraggadociousReplica(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$BraggadociousReplicaToJson(
  BraggadociousReplica instance,
) => <String, dynamic>{'count': instance.count, 'name': instance.name};

BraggadociousPlugin _$BraggadociousPluginFromJson(Map<String, dynamic> json) =>
    BraggadociousPlugin(
      env: (json['env'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : BraggadociousEnv.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      name: json['name'] as String?,
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Parameter13.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$BraggadociousPluginToJson(
  BraggadociousPlugin instance,
) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

BraggadociousEnv _$BraggadociousEnvFromJson(Map<String, dynamic> json) =>
    BraggadociousEnv(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$BraggadociousEnvToJson(BraggadociousEnv instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Parameter13 _$Parameter13FromJson(Map<String, dynamic> json) => Parameter13(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter13ToJson(Parameter13 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

HilariousSourceHydrator _$HilariousSourceHydratorFromJson(
  Map<String, dynamic> json,
) => HilariousSourceHydrator(
  drySource: HilariousDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : HilariousHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: HilariousSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$HilariousSourceHydratorToJson(
  HilariousSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

HilariousDrySource _$HilariousDrySourceFromJson(Map<String, dynamic> json) =>
    HilariousDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$HilariousDrySourceToJson(HilariousDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HilariousHydrateTo _$HilariousHydrateToFromJson(Map<String, dynamic> json) =>
    HilariousHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HilariousHydrateToToJson(HilariousHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

HilariousSyncSource _$HilariousSyncSourceFromJson(Map<String, dynamic> json) =>
    HilariousSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$HilariousSyncSourceToJson(
  HilariousSyncSource instance,
) => <String, dynamic>{
  'path': instance.path,
  'targetBranch': instance.targetBranch,
};

Source1 _$Source1FromJson(Map<String, dynamic> json) => Source1(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory3.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm1.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize1.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin1.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source1ToJson(Source1 instance) => <String, dynamic>{
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

Directory3 _$Directory3FromJson(Map<String, dynamic> json) => Directory3(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet1.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory3ToJson(Directory3 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet1 _$Jsonnet1FromJson(Map<String, dynamic> json) => Jsonnet1(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas1.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet1ToJson(Jsonnet1 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar1 _$ExtVar1FromJson(Map<String, dynamic> json) => ExtVar1(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar1ToJson(ExtVar1 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas1 _$Tlas1FromJson(Map<String, dynamic> json) => Tlas1(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas1ToJson(Tlas1 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm1 _$Helm1FromJson(Map<String, dynamic> json) => Helm1(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter14.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm1ToJson(Helm1 instance) => <String, dynamic>{
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

FileParameter1 _$FileParameter1FromJson(Map<String, dynamic> json) =>
    FileParameter1(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter1ToJson(FileParameter1 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter14 _$Parameter14FromJson(Map<String, dynamic> json) => Parameter14(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter14ToJson(Parameter14 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize1 _$Kustomize1FromJson(Map<String, dynamic> json) => Kustomize1(
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
        (e) => e == null ? null : Patch1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize1ToJson(Kustomize1 instance) =>
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

Patch1 _$Patch1FromJson(Map<String, dynamic> json) => Patch1(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target1.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch1ToJson(Patch1 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target1 _$Target1FromJson(Map<String, dynamic> json) => Target1(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target1ToJson(Target1 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica1 _$Replica1FromJson(Map<String, dynamic> json) =>
    Replica1(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica1ToJson(Replica1 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin1 _$Plugin1FromJson(Map<String, dynamic> json) => Plugin1(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env1.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin1ToJson(Plugin1 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env1 _$Env1FromJson(Map<String, dynamic> json) =>
    Env1(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env1ToJson(Env1 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter15 _$Parameter15FromJson(Map<String, dynamic> json) => Parameter15(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter15ToJson(Parameter15 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

HilariousSyncPolicy _$HilariousSyncPolicyFromJson(Map<String, dynamic> json) =>
    HilariousSyncPolicy(
      automated: json['automated'] == null
          ? null
          : HilariousAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : HilariousManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : HilariousRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$HilariousSyncPolicyToJson(
  HilariousSyncPolicy instance,
) => <String, dynamic>{
  'automated': instance.automated,
  'managedNamespaceMetadata': instance.managedNamespaceMetadata,
  'retry': instance.retry,
  'syncOptions': instance.syncOptions,
};

HilariousAutomated _$HilariousAutomatedFromJson(Map<String, dynamic> json) =>
    HilariousAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$HilariousAutomatedToJson(HilariousAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

HilariousManagedNamespaceMetadata _$HilariousManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => HilariousManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$HilariousManagedNamespaceMetadataToJson(
  HilariousManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

HilariousRetry _$HilariousRetryFromJson(Map<String, dynamic> json) =>
    HilariousRetry(
      backoff: json['backoff'] == null
          ? null
          : HilariousBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$HilariousRetryToJson(HilariousRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

HilariousBackoff _$HilariousBackoffFromJson(Map<String, dynamic> json) =>
    HilariousBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$HilariousBackoffToJson(HilariousBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

FluffyList _$FluffyListFromJson(Map<String, dynamic> json) => FluffyList(
  elements: json['elements'] as List<dynamic>?,
  elementsYaml: json['elementsYaml'] as String?,
  template: json['template'] == null
      ? null
      : AmbitiousTemplate.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffyListToJson(FluffyList instance) =>
    <String, dynamic>{
      'elements': instance.elements,
      'elementsYaml': instance.elementsYaml,
      'template': instance.template,
    };

AmbitiousTemplate _$AmbitiousTemplateFromJson(Map<String, dynamic> json) =>
    AmbitiousTemplate(
      metadata: AmbitiousMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: AmbitiousSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmbitiousTemplateToJson(AmbitiousTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

AmbitiousMetadata _$AmbitiousMetadataFromJson(Map<String, dynamic> json) =>
    AmbitiousMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$AmbitiousMetadataToJson(AmbitiousMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

AmbitiousSpec _$AmbitiousSpecFromJson(Map<String, dynamic> json) =>
    AmbitiousSpec(
      destination: AmbitiousDestination.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousIgnoreDifference.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      info: (json['info'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      project: json['project'] as String,
      revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
      source: json['source'] == null
          ? null
          : Source2.fromJson(json['source'] as Map<String, dynamic>),
      sourceHydrator: json['sourceHydrator'] == null
          ? null
          : AmbitiousSourceHydrator.fromJson(
              json['sourceHydrator'] as Map<String, dynamic>,
            ),
      sources: (json['sources'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Source3.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      syncPolicy: json['syncPolicy'] == null
          ? null
          : AmbitiousSyncPolicy.fromJson(
              json['syncPolicy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AmbitiousSpecToJson(AmbitiousSpec instance) =>
    <String, dynamic>{
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

AmbitiousDestination _$AmbitiousDestinationFromJson(
  Map<String, dynamic> json,
) => AmbitiousDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$AmbitiousDestinationToJson(
  AmbitiousDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

AmbitiousIgnoreDifference _$AmbitiousIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => AmbitiousIgnoreDifference(
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

Map<String, dynamic> _$AmbitiousIgnoreDifferenceToJson(
  AmbitiousIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

AmbitiousInfo _$AmbitiousInfoFromJson(Map<String, dynamic> json) =>
    AmbitiousInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$AmbitiousInfoToJson(AmbitiousInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source2 _$Source2FromJson(Map<String, dynamic> json) => Source2(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory4.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm2.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize2.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin2.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source2ToJson(Source2 instance) => <String, dynamic>{
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

Directory4 _$Directory4FromJson(Map<String, dynamic> json) => Directory4(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet2.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory4ToJson(Directory4 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet2 _$Jsonnet2FromJson(Map<String, dynamic> json) => Jsonnet2(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas2.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet2ToJson(Jsonnet2 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar2 _$ExtVar2FromJson(Map<String, dynamic> json) => ExtVar2(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar2ToJson(ExtVar2 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas2 _$Tlas2FromJson(Map<String, dynamic> json) => Tlas2(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas2ToJson(Tlas2 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm2 _$Helm2FromJson(Map<String, dynamic> json) => Helm2(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter16.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm2ToJson(Helm2 instance) => <String, dynamic>{
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

FileParameter2 _$FileParameter2FromJson(Map<String, dynamic> json) =>
    FileParameter2(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter2ToJson(FileParameter2 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter16 _$Parameter16FromJson(Map<String, dynamic> json) => Parameter16(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter16ToJson(Parameter16 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize2 _$Kustomize2FromJson(Map<String, dynamic> json) => Kustomize2(
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
        (e) => e == null ? null : Patch2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize2ToJson(Kustomize2 instance) =>
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

Patch2 _$Patch2FromJson(Map<String, dynamic> json) => Patch2(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target2.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch2ToJson(Patch2 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target2 _$Target2FromJson(Map<String, dynamic> json) => Target2(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target2ToJson(Target2 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica2 _$Replica2FromJson(Map<String, dynamic> json) =>
    Replica2(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica2ToJson(Replica2 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin2 _$Plugin2FromJson(Map<String, dynamic> json) => Plugin2(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env2.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin2ToJson(Plugin2 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env2 _$Env2FromJson(Map<String, dynamic> json) =>
    Env2(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env2ToJson(Env2 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter17 _$Parameter17FromJson(Map<String, dynamic> json) => Parameter17(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter17ToJson(Parameter17 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

AmbitiousSourceHydrator _$AmbitiousSourceHydratorFromJson(
  Map<String, dynamic> json,
) => AmbitiousSourceHydrator(
  drySource: AmbitiousDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : AmbitiousHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: AmbitiousSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AmbitiousSourceHydratorToJson(
  AmbitiousSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

AmbitiousDrySource _$AmbitiousDrySourceFromJson(Map<String, dynamic> json) =>
    AmbitiousDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$AmbitiousDrySourceToJson(AmbitiousDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

AmbitiousHydrateTo _$AmbitiousHydrateToFromJson(Map<String, dynamic> json) =>
    AmbitiousHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$AmbitiousHydrateToToJson(AmbitiousHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

AmbitiousSyncSource _$AmbitiousSyncSourceFromJson(Map<String, dynamic> json) =>
    AmbitiousSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$AmbitiousSyncSourceToJson(
  AmbitiousSyncSource instance,
) => <String, dynamic>{
  'path': instance.path,
  'targetBranch': instance.targetBranch,
};

Source3 _$Source3FromJson(Map<String, dynamic> json) => Source3(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory5.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm3.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize3.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin3.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source3ToJson(Source3 instance) => <String, dynamic>{
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

Directory5 _$Directory5FromJson(Map<String, dynamic> json) => Directory5(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet3.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory5ToJson(Directory5 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet3 _$Jsonnet3FromJson(Map<String, dynamic> json) => Jsonnet3(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas3.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet3ToJson(Jsonnet3 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar3 _$ExtVar3FromJson(Map<String, dynamic> json) => ExtVar3(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar3ToJson(ExtVar3 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas3 _$Tlas3FromJson(Map<String, dynamic> json) => Tlas3(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas3ToJson(Tlas3 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm3 _$Helm3FromJson(Map<String, dynamic> json) => Helm3(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter18.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm3ToJson(Helm3 instance) => <String, dynamic>{
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

FileParameter3 _$FileParameter3FromJson(Map<String, dynamic> json) =>
    FileParameter3(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter3ToJson(FileParameter3 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter18 _$Parameter18FromJson(Map<String, dynamic> json) => Parameter18(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter18ToJson(Parameter18 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize3 _$Kustomize3FromJson(Map<String, dynamic> json) => Kustomize3(
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
        (e) => e == null ? null : Patch3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize3ToJson(Kustomize3 instance) =>
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

Patch3 _$Patch3FromJson(Map<String, dynamic> json) => Patch3(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target3.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch3ToJson(Patch3 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target3 _$Target3FromJson(Map<String, dynamic> json) => Target3(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target3ToJson(Target3 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica3 _$Replica3FromJson(Map<String, dynamic> json) =>
    Replica3(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica3ToJson(Replica3 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin3 _$Plugin3FromJson(Map<String, dynamic> json) => Plugin3(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env3.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin3ToJson(Plugin3 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env3 _$Env3FromJson(Map<String, dynamic> json) =>
    Env3(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env3ToJson(Env3 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter19 _$Parameter19FromJson(Map<String, dynamic> json) => Parameter19(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter19ToJson(Parameter19 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

AmbitiousSyncPolicy _$AmbitiousSyncPolicyFromJson(Map<String, dynamic> json) =>
    AmbitiousSyncPolicy(
      automated: json['automated'] == null
          ? null
          : AmbitiousAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : AmbitiousManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : AmbitiousRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$AmbitiousSyncPolicyToJson(
  AmbitiousSyncPolicy instance,
) => <String, dynamic>{
  'automated': instance.automated,
  'managedNamespaceMetadata': instance.managedNamespaceMetadata,
  'retry': instance.retry,
  'syncOptions': instance.syncOptions,
};

AmbitiousAutomated _$AmbitiousAutomatedFromJson(Map<String, dynamic> json) =>
    AmbitiousAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$AmbitiousAutomatedToJson(AmbitiousAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

AmbitiousManagedNamespaceMetadata _$AmbitiousManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => AmbitiousManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$AmbitiousManagedNamespaceMetadataToJson(
  AmbitiousManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

AmbitiousRetry _$AmbitiousRetryFromJson(Map<String, dynamic> json) =>
    AmbitiousRetry(
      backoff: json['backoff'] == null
          ? null
          : AmbitiousBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$AmbitiousRetryToJson(AmbitiousRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

AmbitiousBackoff _$AmbitiousBackoffFromJson(Map<String, dynamic> json) =>
    AmbitiousBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$AmbitiousBackoffToJson(AmbitiousBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

Plugin4 _$Plugin4FromJson(Map<String, dynamic> json) => Plugin4(
  configMapRef: PurpleConfigMapRef.fromJson(
    json['configMapRef'] as Map<String, dynamic>,
  ),
  input: json['input'] == null
      ? null
      : PurpleInput.fromJson(json['input'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : CunningTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$Plugin4ToJson(Plugin4 instance) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'input': instance.input,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

PurpleConfigMapRef _$PurpleConfigMapRefFromJson(Map<String, dynamic> json) =>
    PurpleConfigMapRef(name: json['name'] as String);

Map<String, dynamic> _$PurpleConfigMapRefToJson(PurpleConfigMapRef instance) =>
    <String, dynamic>{'name': instance.name};

PurpleInput _$PurpleInputFromJson(Map<String, dynamic> json) =>
    PurpleInput(parameters: json['parameters'] as Map<String, dynamic>?);

Map<String, dynamic> _$PurpleInputToJson(PurpleInput instance) =>
    <String, dynamic>{'parameters': instance.parameters};

CunningTemplate _$CunningTemplateFromJson(Map<String, dynamic> json) =>
    CunningTemplate(
      metadata: CunningMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: CunningSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CunningTemplateToJson(CunningTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

CunningMetadata _$CunningMetadataFromJson(Map<String, dynamic> json) =>
    CunningMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$CunningMetadataToJson(CunningMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

CunningSpec _$CunningSpecFromJson(Map<String, dynamic> json) => CunningSpec(
  destination: CunningDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : CunningIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : CunningInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source4.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : CunningSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : CunningSyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CunningSpecToJson(CunningSpec instance) =>
    <String, dynamic>{
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

CunningDestination _$CunningDestinationFromJson(Map<String, dynamic> json) =>
    CunningDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$CunningDestinationToJson(CunningDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

CunningIgnoreDifference _$CunningIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => CunningIgnoreDifference(
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

Map<String, dynamic> _$CunningIgnoreDifferenceToJson(
  CunningIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

CunningInfo _$CunningInfoFromJson(Map<String, dynamic> json) =>
    CunningInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$CunningInfoToJson(CunningInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source4 _$Source4FromJson(Map<String, dynamic> json) => Source4(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory6.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm4.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize4.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin5.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source4ToJson(Source4 instance) => <String, dynamic>{
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

Directory6 _$Directory6FromJson(Map<String, dynamic> json) => Directory6(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet4.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory6ToJson(Directory6 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet4 _$Jsonnet4FromJson(Map<String, dynamic> json) => Jsonnet4(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas4.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet4ToJson(Jsonnet4 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar4 _$ExtVar4FromJson(Map<String, dynamic> json) => ExtVar4(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar4ToJson(ExtVar4 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas4 _$Tlas4FromJson(Map<String, dynamic> json) => Tlas4(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas4ToJson(Tlas4 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm4 _$Helm4FromJson(Map<String, dynamic> json) => Helm4(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter20.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm4ToJson(Helm4 instance) => <String, dynamic>{
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

FileParameter4 _$FileParameter4FromJson(Map<String, dynamic> json) =>
    FileParameter4(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter4ToJson(FileParameter4 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter20 _$Parameter20FromJson(Map<String, dynamic> json) => Parameter20(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter20ToJson(Parameter20 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize4 _$Kustomize4FromJson(Map<String, dynamic> json) => Kustomize4(
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
        (e) => e == null ? null : Patch4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize4ToJson(Kustomize4 instance) =>
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

Patch4 _$Patch4FromJson(Map<String, dynamic> json) => Patch4(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target4.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch4ToJson(Patch4 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target4 _$Target4FromJson(Map<String, dynamic> json) => Target4(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target4ToJson(Target4 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica4 _$Replica4FromJson(Map<String, dynamic> json) =>
    Replica4(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica4ToJson(Replica4 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin5 _$Plugin5FromJson(Map<String, dynamic> json) => Plugin5(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env4.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin5ToJson(Plugin5 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env4 _$Env4FromJson(Map<String, dynamic> json) =>
    Env4(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env4ToJson(Env4 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter21 _$Parameter21FromJson(Map<String, dynamic> json) => Parameter21(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter21ToJson(Parameter21 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

CunningSourceHydrator _$CunningSourceHydratorFromJson(
  Map<String, dynamic> json,
) => CunningSourceHydrator(
  drySource: CunningDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : CunningHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: CunningSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CunningSourceHydratorToJson(
  CunningSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

CunningDrySource _$CunningDrySourceFromJson(Map<String, dynamic> json) =>
    CunningDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$CunningDrySourceToJson(CunningDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

CunningHydrateTo _$CunningHydrateToFromJson(Map<String, dynamic> json) =>
    CunningHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$CunningHydrateToToJson(CunningHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

CunningSyncSource _$CunningSyncSourceFromJson(Map<String, dynamic> json) =>
    CunningSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$CunningSyncSourceToJson(CunningSyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source5 _$Source5FromJson(Map<String, dynamic> json) => Source5(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory7.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm5.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize5.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin6.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source5ToJson(Source5 instance) => <String, dynamic>{
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

Directory7 _$Directory7FromJson(Map<String, dynamic> json) => Directory7(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet5.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory7ToJson(Directory7 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet5 _$Jsonnet5FromJson(Map<String, dynamic> json) => Jsonnet5(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas5.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet5ToJson(Jsonnet5 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar5 _$ExtVar5FromJson(Map<String, dynamic> json) => ExtVar5(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar5ToJson(ExtVar5 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas5 _$Tlas5FromJson(Map<String, dynamic> json) => Tlas5(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas5ToJson(Tlas5 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm5 _$Helm5FromJson(Map<String, dynamic> json) => Helm5(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter22.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm5ToJson(Helm5 instance) => <String, dynamic>{
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

FileParameter5 _$FileParameter5FromJson(Map<String, dynamic> json) =>
    FileParameter5(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter5ToJson(FileParameter5 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter22 _$Parameter22FromJson(Map<String, dynamic> json) => Parameter22(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter22ToJson(Parameter22 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize5 _$Kustomize5FromJson(Map<String, dynamic> json) => Kustomize5(
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
        (e) => e == null ? null : Patch5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize5ToJson(Kustomize5 instance) =>
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

Patch5 _$Patch5FromJson(Map<String, dynamic> json) => Patch5(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target5.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch5ToJson(Patch5 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target5 _$Target5FromJson(Map<String, dynamic> json) => Target5(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target5ToJson(Target5 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica5 _$Replica5FromJson(Map<String, dynamic> json) =>
    Replica5(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica5ToJson(Replica5 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin6 _$Plugin6FromJson(Map<String, dynamic> json) => Plugin6(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env5.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin6ToJson(Plugin6 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env5 _$Env5FromJson(Map<String, dynamic> json) =>
    Env5(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env5ToJson(Env5 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter23 _$Parameter23FromJson(Map<String, dynamic> json) => Parameter23(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter23ToJson(Parameter23 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

CunningSyncPolicy _$CunningSyncPolicyFromJson(Map<String, dynamic> json) =>
    CunningSyncPolicy(
      automated: json['automated'] == null
          ? null
          : CunningAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : CunningManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : CunningRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$CunningSyncPolicyToJson(CunningSyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

CunningAutomated _$CunningAutomatedFromJson(Map<String, dynamic> json) =>
    CunningAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$CunningAutomatedToJson(CunningAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

CunningManagedNamespaceMetadata _$CunningManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => CunningManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$CunningManagedNamespaceMetadataToJson(
  CunningManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

CunningRetry _$CunningRetryFromJson(Map<String, dynamic> json) => CunningRetry(
  backoff: json['backoff'] == null
      ? null
      : CunningBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$CunningRetryToJson(CunningRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

CunningBackoff _$CunningBackoffFromJson(Map<String, dynamic> json) =>
    CunningBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$CunningBackoffToJson(CunningBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

PurplePullRequest _$PurplePullRequestFromJson(
  Map<String, dynamic> json,
) => PurplePullRequest(
  azuredevops: json['azuredevops'] == null
      ? null
      : PurpleAzuredevops.fromJson(json['azuredevops'] as Map<String, dynamic>),
  bitbucket: json['bitbucket'] == null
      ? null
      : PurpleBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : PurpleBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  continueOnRepoNotFoundError: json['continueOnRepoNotFoundError'] as bool?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : PurpleGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : PurpleGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : PurpleGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : MagentaTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurplePullRequestToJson(PurplePullRequest instance) =>
    <String, dynamic>{
      'azuredevops': instance.azuredevops,
      'bitbucket': instance.bitbucket,
      'bitbucketServer': instance.bitbucketServer,
      'continueOnRepoNotFoundError': instance.continueOnRepoNotFoundError,
      'filters': instance.filters,
      'gitea': instance.gitea,
      'github': instance.github,
      'gitlab': instance.gitlab,
      'requeueAfterSeconds': instance.requeueAfterSeconds,
      'template': instance.template,
      'values': instance.values,
    };

PurpleAzuredevops _$PurpleAzuredevopsFromJson(Map<String, dynamic> json) =>
    PurpleAzuredevops(
      api: json['api'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      organization: json['organization'] as String,
      project: json['project'] as String,
      repo: json['repo'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : PurpleTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurpleAzuredevopsToJson(PurpleAzuredevops instance) =>
    <String, dynamic>{
      'api': instance.api,
      'labels': instance.labels,
      'organization': instance.organization,
      'project': instance.project,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

PurpleTokenRef _$PurpleTokenRefFromJson(Map<String, dynamic> json) =>
    PurpleTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$PurpleTokenRefToJson(PurpleTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleBitbucket _$PurpleBitbucketFromJson(Map<String, dynamic> json) =>
    PurpleBitbucket(
      api: json['api'] as String?,
      basicAuth: json['basicAuth'] == null
          ? null
          : PurpleBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
      bearerToken: json['bearerToken'] == null
          ? null
          : PurpleBearerToken.fromJson(
              json['bearerToken'] as Map<String, dynamic>,
            ),
      owner: json['owner'] as String,
      repo: json['repo'] as String,
    );

Map<String, dynamic> _$PurpleBitbucketToJson(PurpleBitbucket instance) =>
    <String, dynamic>{
      'api': instance.api,
      'basicAuth': instance.basicAuth,
      'bearerToken': instance.bearerToken,
      'owner': instance.owner,
      'repo': instance.repo,
    };

PurpleBasicAuth _$PurpleBasicAuthFromJson(Map<String, dynamic> json) =>
    PurpleBasicAuth(
      passwordRef: PurplePasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$PurpleBasicAuthToJson(PurpleBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

PurplePasswordRef _$PurplePasswordRefFromJson(Map<String, dynamic> json) =>
    PurplePasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$PurplePasswordRefToJson(PurplePasswordRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleBearerToken _$PurpleBearerTokenFromJson(Map<String, dynamic> json) =>
    PurpleBearerToken(
      tokenRef: FluffyTokenRef.fromJson(
        json['tokenRef'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PurpleBearerTokenToJson(PurpleBearerToken instance) =>
    <String, dynamic>{'tokenRef': instance.tokenRef};

FluffyTokenRef _$FluffyTokenRefFromJson(Map<String, dynamic> json) =>
    FluffyTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$FluffyTokenRefToJson(FluffyTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleBitbucketServer _$PurpleBitbucketServerFromJson(
  Map<String, dynamic> json,
) => PurpleBitbucketServer(
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : FluffyBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : FluffyBearerToken.fromJson(json['bearerToken'] as Map<String, dynamic>),
  caRef: json['caRef'] == null
      ? null
      : PurpleCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
  repo: json['repo'] as String,
);

Map<String, dynamic> _$PurpleBitbucketServerToJson(
  PurpleBitbucketServer instance,
) => <String, dynamic>{
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
  'repo': instance.repo,
};

FluffyBasicAuth _$FluffyBasicAuthFromJson(Map<String, dynamic> json) =>
    FluffyBasicAuth(
      passwordRef: FluffyPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$FluffyBasicAuthToJson(FluffyBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

FluffyPasswordRef _$FluffyPasswordRefFromJson(Map<String, dynamic> json) =>
    FluffyPasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$FluffyPasswordRefToJson(FluffyPasswordRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FluffyBearerToken _$FluffyBearerTokenFromJson(Map<String, dynamic> json) =>
    FluffyBearerToken(
      tokenRef: TentacledTokenRef.fromJson(
        json['tokenRef'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FluffyBearerTokenToJson(FluffyBearerToken instance) =>
    <String, dynamic>{'tokenRef': instance.tokenRef};

TentacledTokenRef _$TentacledTokenRefFromJson(Map<String, dynamic> json) =>
    TentacledTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$TentacledTokenRefToJson(TentacledTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleCaRef _$PurpleCaRefFromJson(Map<String, dynamic> json) => PurpleCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$PurpleCaRefToJson(PurpleCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

PurpleFilter _$PurpleFilterFromJson(Map<String, dynamic> json) => PurpleFilter(
  branchMatch: json['branchMatch'] as String?,
  targetBranchMatch: json['targetBranchMatch'] as String?,
  titleMatch: json['titleMatch'] as String?,
);

Map<String, dynamic> _$PurpleFilterToJson(PurpleFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'targetBranchMatch': instance.targetBranchMatch,
      'titleMatch': instance.titleMatch,
    };

PurpleGitea _$PurpleGiteaFromJson(Map<String, dynamic> json) => PurpleGitea(
  api: json['api'] as String,
  insecure: json['insecure'] as bool?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  owner: json['owner'] as String,
  repo: json['repo'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : StickyTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleGiteaToJson(PurpleGitea instance) =>
    <String, dynamic>{
      'api': instance.api,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

StickyTokenRef _$StickyTokenRefFromJson(Map<String, dynamic> json) =>
    StickyTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$StickyTokenRefToJson(StickyTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleGithub _$PurpleGithubFromJson(Map<String, dynamic> json) => PurpleGithub(
  api: json['api'] as String?,
  appSecretName: json['appSecretName'] as String?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  owner: json['owner'] as String,
  repo: json['repo'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : IndigoTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleGithubToJson(PurpleGithub instance) =>
    <String, dynamic>{
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

IndigoTokenRef _$IndigoTokenRefFromJson(Map<String, dynamic> json) =>
    IndigoTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$IndigoTokenRefToJson(IndigoTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

PurpleGitlab _$PurpleGitlabFromJson(Map<String, dynamic> json) => PurpleGitlab(
  api: json['api'] as String?,
  caRef: json['caRef'] == null
      ? null
      : FluffyCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  project: json['project'] as String,
  pullRequestState: json['pullRequestState'] as String?,
  tokenRef: json['tokenRef'] == null
      ? null
      : IndecentTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleGitlabToJson(PurpleGitlab instance) =>
    <String, dynamic>{
      'api': instance.api,
      'caRef': instance.caRef,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'project': instance.project,
      'pullRequestState': instance.pullRequestState,
      'tokenRef': instance.tokenRef,
    };

FluffyCaRef _$FluffyCaRefFromJson(Map<String, dynamic> json) => FluffyCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$FluffyCaRefToJson(FluffyCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

IndecentTokenRef _$IndecentTokenRefFromJson(Map<String, dynamic> json) =>
    IndecentTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$IndecentTokenRefToJson(IndecentTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

MagentaTemplate _$MagentaTemplateFromJson(Map<String, dynamic> json) =>
    MagentaTemplate(
      metadata: MagentaMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: MagentaSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MagentaTemplateToJson(MagentaTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

MagentaMetadata _$MagentaMetadataFromJson(Map<String, dynamic> json) =>
    MagentaMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$MagentaMetadataToJson(MagentaMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

MagentaSpec _$MagentaSpecFromJson(Map<String, dynamic> json) => MagentaSpec(
  destination: MagentaDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : MagentaInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source6.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : MagentaSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : MagentaSyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MagentaSpecToJson(MagentaSpec instance) =>
    <String, dynamic>{
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

MagentaDestination _$MagentaDestinationFromJson(Map<String, dynamic> json) =>
    MagentaDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$MagentaDestinationToJson(MagentaDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

MagentaIgnoreDifference _$MagentaIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => MagentaIgnoreDifference(
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

Map<String, dynamic> _$MagentaIgnoreDifferenceToJson(
  MagentaIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

MagentaInfo _$MagentaInfoFromJson(Map<String, dynamic> json) =>
    MagentaInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$MagentaInfoToJson(MagentaInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source6 _$Source6FromJson(Map<String, dynamic> json) => Source6(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory8.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm6.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize6.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin7.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source6ToJson(Source6 instance) => <String, dynamic>{
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

Directory8 _$Directory8FromJson(Map<String, dynamic> json) => Directory8(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet6.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory8ToJson(Directory8 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet6 _$Jsonnet6FromJson(Map<String, dynamic> json) => Jsonnet6(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas6.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet6ToJson(Jsonnet6 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar6 _$ExtVar6FromJson(Map<String, dynamic> json) => ExtVar6(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar6ToJson(ExtVar6 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas6 _$Tlas6FromJson(Map<String, dynamic> json) => Tlas6(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas6ToJson(Tlas6 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm6 _$Helm6FromJson(Map<String, dynamic> json) => Helm6(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter24.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm6ToJson(Helm6 instance) => <String, dynamic>{
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

FileParameter6 _$FileParameter6FromJson(Map<String, dynamic> json) =>
    FileParameter6(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter6ToJson(FileParameter6 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter24 _$Parameter24FromJson(Map<String, dynamic> json) => Parameter24(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter24ToJson(Parameter24 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize6 _$Kustomize6FromJson(Map<String, dynamic> json) => Kustomize6(
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
        (e) => e == null ? null : Patch6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize6ToJson(Kustomize6 instance) =>
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

Patch6 _$Patch6FromJson(Map<String, dynamic> json) => Patch6(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target6.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch6ToJson(Patch6 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target6 _$Target6FromJson(Map<String, dynamic> json) => Target6(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target6ToJson(Target6 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica6 _$Replica6FromJson(Map<String, dynamic> json) =>
    Replica6(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica6ToJson(Replica6 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin7 _$Plugin7FromJson(Map<String, dynamic> json) => Plugin7(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env6.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin7ToJson(Plugin7 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env6 _$Env6FromJson(Map<String, dynamic> json) =>
    Env6(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env6ToJson(Env6 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter25 _$Parameter25FromJson(Map<String, dynamic> json) => Parameter25(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter25ToJson(Parameter25 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MagentaSourceHydrator _$MagentaSourceHydratorFromJson(
  Map<String, dynamic> json,
) => MagentaSourceHydrator(
  drySource: MagentaDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : MagentaHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: MagentaSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MagentaSourceHydratorToJson(
  MagentaSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

MagentaDrySource _$MagentaDrySourceFromJson(Map<String, dynamic> json) =>
    MagentaDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$MagentaDrySourceToJson(MagentaDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

MagentaHydrateTo _$MagentaHydrateToFromJson(Map<String, dynamic> json) =>
    MagentaHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$MagentaHydrateToToJson(MagentaHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

MagentaSyncSource _$MagentaSyncSourceFromJson(Map<String, dynamic> json) =>
    MagentaSyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$MagentaSyncSourceToJson(MagentaSyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source7 _$Source7FromJson(Map<String, dynamic> json) => Source7(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory9.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm7.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize7.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin8.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source7ToJson(Source7 instance) => <String, dynamic>{
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

Directory9 _$Directory9FromJson(Map<String, dynamic> json) => Directory9(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet7.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory9ToJson(Directory9 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet7 _$Jsonnet7FromJson(Map<String, dynamic> json) => Jsonnet7(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas7.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet7ToJson(Jsonnet7 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar7 _$ExtVar7FromJson(Map<String, dynamic> json) => ExtVar7(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar7ToJson(ExtVar7 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas7 _$Tlas7FromJson(Map<String, dynamic> json) => Tlas7(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas7ToJson(Tlas7 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm7 _$Helm7FromJson(Map<String, dynamic> json) => Helm7(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter26.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm7ToJson(Helm7 instance) => <String, dynamic>{
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

FileParameter7 _$FileParameter7FromJson(Map<String, dynamic> json) =>
    FileParameter7(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter7ToJson(FileParameter7 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter26 _$Parameter26FromJson(Map<String, dynamic> json) => Parameter26(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter26ToJson(Parameter26 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize7 _$Kustomize7FromJson(Map<String, dynamic> json) => Kustomize7(
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
        (e) => e == null ? null : Patch7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize7ToJson(Kustomize7 instance) =>
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

Patch7 _$Patch7FromJson(Map<String, dynamic> json) => Patch7(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target7.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch7ToJson(Patch7 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target7 _$Target7FromJson(Map<String, dynamic> json) => Target7(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target7ToJson(Target7 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica7 _$Replica7FromJson(Map<String, dynamic> json) =>
    Replica7(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica7ToJson(Replica7 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin8 _$Plugin8FromJson(Map<String, dynamic> json) => Plugin8(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env7.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin8ToJson(Plugin8 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env7 _$Env7FromJson(Map<String, dynamic> json) =>
    Env7(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env7ToJson(Env7 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter27 _$Parameter27FromJson(Map<String, dynamic> json) => Parameter27(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter27ToJson(Parameter27 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MagentaSyncPolicy _$MagentaSyncPolicyFromJson(Map<String, dynamic> json) =>
    MagentaSyncPolicy(
      automated: json['automated'] == null
          ? null
          : MagentaAutomated.fromJson(
              json['automated'] as Map<String, dynamic>,
            ),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : MagentaManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : MagentaRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MagentaSyncPolicyToJson(MagentaSyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

MagentaAutomated _$MagentaAutomatedFromJson(Map<String, dynamic> json) =>
    MagentaAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$MagentaAutomatedToJson(MagentaAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

MagentaManagedNamespaceMetadata _$MagentaManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => MagentaManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$MagentaManagedNamespaceMetadataToJson(
  MagentaManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

MagentaRetry _$MagentaRetryFromJson(Map<String, dynamic> json) => MagentaRetry(
  backoff: json['backoff'] == null
      ? null
      : MagentaBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$MagentaRetryToJson(MagentaRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

MagentaBackoff _$MagentaBackoffFromJson(Map<String, dynamic> json) =>
    MagentaBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$MagentaBackoffToJson(MagentaBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

PurpleScmProvider _$PurpleScmProviderFromJson(
  Map<String, dynamic> json,
) => PurpleScmProvider(
  awsCodeCommit: json['awsCodeCommit'] == null
      ? null
      : PurpleAwsCodeCommit.fromJson(
          json['awsCodeCommit'] as Map<String, dynamic>,
        ),
  azureDevOps: json['azureDevOps'] == null
      ? null
      : PurpleAzureDevOps.fromJson(json['azureDevOps'] as Map<String, dynamic>),
  bitbucket: json['bitbucket'] == null
      ? null
      : FluffyBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : FluffyBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  cloneProtocol: json['cloneProtocol'] as String?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : FluffyGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : FluffyGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : FluffyGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : FriskyTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurpleScmProviderToJson(PurpleScmProvider instance) =>
    <String, dynamic>{
      'awsCodeCommit': instance.awsCodeCommit,
      'azureDevOps': instance.azureDevOps,
      'bitbucket': instance.bitbucket,
      'bitbucketServer': instance.bitbucketServer,
      'cloneProtocol': instance.cloneProtocol,
      'filters': instance.filters,
      'gitea': instance.gitea,
      'github': instance.github,
      'gitlab': instance.gitlab,
      'requeueAfterSeconds': instance.requeueAfterSeconds,
      'template': instance.template,
      'values': instance.values,
    };

PurpleAwsCodeCommit _$PurpleAwsCodeCommitFromJson(Map<String, dynamic> json) =>
    PurpleAwsCodeCommit(
      allBranches: json['allBranches'] as bool?,
      region: json['region'] as String?,
      role: json['role'] as String?,
      tagFilters: (json['tagFilters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleTagFilter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$PurpleAwsCodeCommitToJson(
  PurpleAwsCodeCommit instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'region': instance.region,
  'role': instance.role,
  'tagFilters': instance.tagFilters,
};

PurpleTagFilter _$PurpleTagFilterFromJson(Map<String, dynamic> json) =>
    PurpleTagFilter(
      key: json['key'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PurpleTagFilterToJson(PurpleTagFilter instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.value};

PurpleAzureDevOps _$PurpleAzureDevOpsFromJson(Map<String, dynamic> json) =>
    PurpleAzureDevOps(
      accessTokenRef: PurpleAccessTokenRef.fromJson(
        json['accessTokenRef'] as Map<String, dynamic>,
      ),
      allBranches: json['allBranches'] as bool?,
      api: json['api'] as String?,
      organization: json['organization'] as String,
      teamProject: json['teamProject'] as String,
    );

Map<String, dynamic> _$PurpleAzureDevOpsToJson(PurpleAzureDevOps instance) =>
    <String, dynamic>{
      'accessTokenRef': instance.accessTokenRef,
      'allBranches': instance.allBranches,
      'api': instance.api,
      'organization': instance.organization,
      'teamProject': instance.teamProject,
    };

PurpleAccessTokenRef _$PurpleAccessTokenRefFromJson(
  Map<String, dynamic> json,
) => PurpleAccessTokenRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$PurpleAccessTokenRefToJson(
  PurpleAccessTokenRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FluffyBitbucket _$FluffyBitbucketFromJson(Map<String, dynamic> json) =>
    FluffyBitbucket(
      allBranches: json['allBranches'] as bool?,
      appPasswordRef: PurpleAppPasswordRef.fromJson(
        json['appPasswordRef'] as Map<String, dynamic>,
      ),
      owner: json['owner'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$FluffyBitbucketToJson(FluffyBitbucket instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'appPasswordRef': instance.appPasswordRef,
      'owner': instance.owner,
      'user': instance.user,
    };

PurpleAppPasswordRef _$PurpleAppPasswordRefFromJson(
  Map<String, dynamic> json,
) => PurpleAppPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$PurpleAppPasswordRefToJson(
  PurpleAppPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FluffyBitbucketServer _$FluffyBitbucketServerFromJson(
  Map<String, dynamic> json,
) => FluffyBitbucketServer(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : TentacledBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : TentacledBearerToken.fromJson(
          json['bearerToken'] as Map<String, dynamic>,
        ),
  caRef: json['caRef'] == null
      ? null
      : TentacledCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
);

Map<String, dynamic> _$FluffyBitbucketServerToJson(
  FluffyBitbucketServer instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
};

TentacledBasicAuth _$TentacledBasicAuthFromJson(Map<String, dynamic> json) =>
    TentacledBasicAuth(
      passwordRef: TentacledPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$TentacledBasicAuthToJson(TentacledBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

TentacledPasswordRef _$TentacledPasswordRefFromJson(
  Map<String, dynamic> json,
) => TentacledPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TentacledPasswordRefToJson(
  TentacledPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

TentacledBearerToken _$TentacledBearerTokenFromJson(
  Map<String, dynamic> json,
) => TentacledBearerToken(
  tokenRef: HilariousTokenRef.fromJson(
    json['tokenRef'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TentacledBearerTokenToJson(
  TentacledBearerToken instance,
) => <String, dynamic>{'tokenRef': instance.tokenRef};

HilariousTokenRef _$HilariousTokenRefFromJson(Map<String, dynamic> json) =>
    HilariousTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$HilariousTokenRefToJson(HilariousTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

TentacledCaRef _$TentacledCaRefFromJson(Map<String, dynamic> json) =>
    TentacledCaRef(
      configMapName: json['configMapName'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$TentacledCaRefToJson(TentacledCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

FluffyFilter _$FluffyFilterFromJson(Map<String, dynamic> json) => FluffyFilter(
  branchMatch: json['branchMatch'] as String?,
  labelMatch: json['labelMatch'] as String?,
  pathsDoNotExist: (json['pathsDoNotExist'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  pathsExist: (json['pathsExist'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  repositoryMatch: json['repositoryMatch'] as String?,
);

Map<String, dynamic> _$FluffyFilterToJson(FluffyFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'labelMatch': instance.labelMatch,
      'pathsDoNotExist': instance.pathsDoNotExist,
      'pathsExist': instance.pathsExist,
      'repositoryMatch': instance.repositoryMatch,
    };

FluffyGitea _$FluffyGiteaFromJson(Map<String, dynamic> json) => FluffyGitea(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String,
  insecure: json['insecure'] as bool?,
  owner: json['owner'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : AmbitiousTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffyGiteaToJson(FluffyGitea instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'insecure': instance.insecure,
      'owner': instance.owner,
      'tokenRef': instance.tokenRef,
    };

AmbitiousTokenRef _$AmbitiousTokenRefFromJson(Map<String, dynamic> json) =>
    AmbitiousTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$AmbitiousTokenRefToJson(AmbitiousTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FluffyGithub _$FluffyGithubFromJson(Map<String, dynamic> json) => FluffyGithub(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String?,
  appSecretName: json['appSecretName'] as String?,
  organization: json['organization'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : CunningTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffyGithubToJson(FluffyGithub instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'organization': instance.organization,
      'tokenRef': instance.tokenRef,
    };

CunningTokenRef _$CunningTokenRefFromJson(Map<String, dynamic> json) =>
    CunningTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$CunningTokenRefToJson(CunningTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FluffyGitlab _$FluffyGitlabFromJson(Map<String, dynamic> json) => FluffyGitlab(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String?,
  caRef: json['caRef'] == null
      ? null
      : StickyCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  group: json['group'] as String,
  includeSharedProjects: json['includeSharedProjects'] as bool?,
  includeSubgroups: json['includeSubgroups'] as bool?,
  insecure: json['insecure'] as bool?,
  tokenRef: json['tokenRef'] == null
      ? null
      : MagentaTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
  topic: json['topic'] as String?,
);

Map<String, dynamic> _$FluffyGitlabToJson(FluffyGitlab instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'caRef': instance.caRef,
      'group': instance.group,
      'includeSharedProjects': instance.includeSharedProjects,
      'includeSubgroups': instance.includeSubgroups,
      'insecure': instance.insecure,
      'tokenRef': instance.tokenRef,
      'topic': instance.topic,
    };

StickyCaRef _$StickyCaRefFromJson(Map<String, dynamic> json) => StickyCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$StickyCaRefToJson(StickyCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

MagentaTokenRef _$MagentaTokenRefFromJson(Map<String, dynamic> json) =>
    MagentaTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$MagentaTokenRefToJson(MagentaTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FriskyTemplate _$FriskyTemplateFromJson(Map<String, dynamic> json) =>
    FriskyTemplate(
      metadata: FriskyMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: FriskySpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriskyTemplateToJson(FriskyTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

FriskyMetadata _$FriskyMetadataFromJson(Map<String, dynamic> json) =>
    FriskyMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$FriskyMetadataToJson(FriskyMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

FriskySpec _$FriskySpecFromJson(Map<String, dynamic> json) => FriskySpec(
  destination: FriskyDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FriskyIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FriskyInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source8.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : FriskySourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : FriskySyncPolicy.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FriskySpecToJson(FriskySpec instance) =>
    <String, dynamic>{
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

FriskyDestination _$FriskyDestinationFromJson(Map<String, dynamic> json) =>
    FriskyDestination(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$FriskyDestinationToJson(FriskyDestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

FriskyIgnoreDifference _$FriskyIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => FriskyIgnoreDifference(
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

Map<String, dynamic> _$FriskyIgnoreDifferenceToJson(
  FriskyIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

FriskyInfo _$FriskyInfoFromJson(Map<String, dynamic> json) =>
    FriskyInfo(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FriskyInfoToJson(FriskyInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source8 _$Source8FromJson(Map<String, dynamic> json) => Source8(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory10.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm8.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize8.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin9.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source8ToJson(Source8 instance) => <String, dynamic>{
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

Directory10 _$Directory10FromJson(Map<String, dynamic> json) => Directory10(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet8.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory10ToJson(Directory10 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet8 _$Jsonnet8FromJson(Map<String, dynamic> json) => Jsonnet8(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas8.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet8ToJson(Jsonnet8 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar8 _$ExtVar8FromJson(Map<String, dynamic> json) => ExtVar8(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar8ToJson(ExtVar8 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas8 _$Tlas8FromJson(Map<String, dynamic> json) => Tlas8(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas8ToJson(Tlas8 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm8 _$Helm8FromJson(Map<String, dynamic> json) => Helm8(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter28.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm8ToJson(Helm8 instance) => <String, dynamic>{
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

FileParameter8 _$FileParameter8FromJson(Map<String, dynamic> json) =>
    FileParameter8(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter8ToJson(FileParameter8 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter28 _$Parameter28FromJson(Map<String, dynamic> json) => Parameter28(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter28ToJson(Parameter28 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize8 _$Kustomize8FromJson(Map<String, dynamic> json) => Kustomize8(
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
        (e) => e == null ? null : Patch8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize8ToJson(Kustomize8 instance) =>
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

Patch8 _$Patch8FromJson(Map<String, dynamic> json) => Patch8(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target8.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch8ToJson(Patch8 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target8 _$Target8FromJson(Map<String, dynamic> json) => Target8(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target8ToJson(Target8 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica8 _$Replica8FromJson(Map<String, dynamic> json) =>
    Replica8(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica8ToJson(Replica8 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin9 _$Plugin9FromJson(Map<String, dynamic> json) => Plugin9(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env8.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin9ToJson(Plugin9 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env8 _$Env8FromJson(Map<String, dynamic> json) =>
    Env8(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env8ToJson(Env8 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter29 _$Parameter29FromJson(Map<String, dynamic> json) => Parameter29(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter29ToJson(Parameter29 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

FriskySourceHydrator _$FriskySourceHydratorFromJson(
  Map<String, dynamic> json,
) => FriskySourceHydrator(
  drySource: FriskyDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : FriskyHydrateTo.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: FriskySyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$FriskySourceHydratorToJson(
  FriskySourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

FriskyDrySource _$FriskyDrySourceFromJson(Map<String, dynamic> json) =>
    FriskyDrySource(
      path: json['path'] as String,
      repoUrl: json['repoURL'] as String,
      targetRevision: json['targetRevision'] as String,
    );

Map<String, dynamic> _$FriskyDrySourceToJson(FriskyDrySource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

FriskyHydrateTo _$FriskyHydrateToFromJson(Map<String, dynamic> json) =>
    FriskyHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$FriskyHydrateToToJson(FriskyHydrateTo instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

FriskySyncSource _$FriskySyncSourceFromJson(Map<String, dynamic> json) =>
    FriskySyncSource(
      path: json['path'] as String,
      targetBranch: json['targetBranch'] as String,
    );

Map<String, dynamic> _$FriskySyncSourceToJson(FriskySyncSource instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source9 _$Source9FromJson(Map<String, dynamic> json) => Source9(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory11.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm9.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize9.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin10.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source9ToJson(Source9 instance) => <String, dynamic>{
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

Directory11 _$Directory11FromJson(Map<String, dynamic> json) => Directory11(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet9.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory11ToJson(Directory11 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet9 _$Jsonnet9FromJson(Map<String, dynamic> json) => Jsonnet9(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tlas9.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Jsonnet9ToJson(Jsonnet9 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar9 _$ExtVar9FromJson(Map<String, dynamic> json) => ExtVar9(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar9ToJson(ExtVar9 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas9 _$Tlas9FromJson(Map<String, dynamic> json) => Tlas9(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas9ToJson(Tlas9 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm9 _$Helm9FromJson(Map<String, dynamic> json) => Helm9(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter30.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm9ToJson(Helm9 instance) => <String, dynamic>{
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

FileParameter9 _$FileParameter9FromJson(Map<String, dynamic> json) =>
    FileParameter9(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter9ToJson(FileParameter9 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter30 _$Parameter30FromJson(Map<String, dynamic> json) => Parameter30(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter30ToJson(Parameter30 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize9 _$Kustomize9FromJson(Map<String, dynamic> json) => Kustomize9(
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
        (e) => e == null ? null : Patch9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize9ToJson(Kustomize9 instance) =>
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

Patch9 _$Patch9FromJson(Map<String, dynamic> json) => Patch9(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target9.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch9ToJson(Patch9 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target9 _$Target9FromJson(Map<String, dynamic> json) => Target9(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target9ToJson(Target9 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica9 _$Replica9FromJson(Map<String, dynamic> json) =>
    Replica9(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica9ToJson(Replica9 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin10 _$Plugin10FromJson(Map<String, dynamic> json) => Plugin10(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env9.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin10ToJson(Plugin10 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env9 _$Env9FromJson(Map<String, dynamic> json) =>
    Env9(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env9ToJson(Env9 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter31 _$Parameter31FromJson(Map<String, dynamic> json) => Parameter31(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter31ToJson(Parameter31 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

FriskySyncPolicy _$FriskySyncPolicyFromJson(Map<String, dynamic> json) =>
    FriskySyncPolicy(
      automated: json['automated'] == null
          ? null
          : FriskyAutomated.fromJson(json['automated'] as Map<String, dynamic>),
      managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
          ? null
          : FriskyManagedNamespaceMetadata.fromJson(
              json['managedNamespaceMetadata'] as Map<String, dynamic>,
            ),
      retry: json['retry'] == null
          ? null
          : FriskyRetry.fromJson(json['retry'] as Map<String, dynamic>),
      syncOptions: (json['syncOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FriskySyncPolicyToJson(FriskySyncPolicy instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

FriskyAutomated _$FriskyAutomatedFromJson(Map<String, dynamic> json) =>
    FriskyAutomated(
      allowEmpty: json['allowEmpty'] as bool?,
      enabled: json['enabled'] as bool?,
      prune: json['prune'] as bool?,
      selfHeal: json['selfHeal'] as bool?,
    );

Map<String, dynamic> _$FriskyAutomatedToJson(FriskyAutomated instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

FriskyManagedNamespaceMetadata _$FriskyManagedNamespaceMetadataFromJson(
  Map<String, dynamic> json,
) => FriskyManagedNamespaceMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FriskyManagedNamespaceMetadataToJson(
  FriskyManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

FriskyRetry _$FriskyRetryFromJson(Map<String, dynamic> json) => FriskyRetry(
  backoff: json['backoff'] == null
      ? null
      : FriskyBackoff.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$FriskyRetryToJson(FriskyRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

FriskyBackoff _$FriskyBackoffFromJson(Map<String, dynamic> json) =>
    FriskyBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$FriskyBackoffToJson(FriskyBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

TentacledSelector _$TentacledSelectorFromJson(Map<String, dynamic> json) =>
    TentacledSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$TentacledSelectorToJson(TentacledSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

IndigoMatchExpression _$IndigoMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndigoMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndigoMatchExpressionToJson(
  IndigoMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

MatrixTemplate _$MatrixTemplateFromJson(Map<String, dynamic> json) =>
    MatrixTemplate(
      metadata: MischievousMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: MischievousSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatrixTemplateToJson(MatrixTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

MischievousMetadata _$MischievousMetadataFromJson(Map<String, dynamic> json) =>
    MischievousMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      finalizers: (json['finalizers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$MischievousMetadataToJson(
  MischievousMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

MischievousSpec _$MischievousSpecFromJson(Map<String, dynamic> json) =>
    MischievousSpec(
      destination: MischievousDestination.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousIgnoreDifference.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      info: (json['info'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousInfo.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      project: json['project'] as String,
      revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
      source: json['source'] == null
          ? null
          : Source10.fromJson(json['source'] as Map<String, dynamic>),
      sourceHydrator: json['sourceHydrator'] == null
          ? null
          : MischievousSourceHydrator.fromJson(
              json['sourceHydrator'] as Map<String, dynamic>,
            ),
      sources: (json['sources'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Source11.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      syncPolicy: json['syncPolicy'] == null
          ? null
          : MischievousSyncPolicy.fromJson(
              json['syncPolicy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MischievousSpecToJson(MischievousSpec instance) =>
    <String, dynamic>{
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

MischievousDestination _$MischievousDestinationFromJson(
  Map<String, dynamic> json,
) => MischievousDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$MischievousDestinationToJson(
  MischievousDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

MischievousIgnoreDifference _$MischievousIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => MischievousIgnoreDifference(
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

Map<String, dynamic> _$MischievousIgnoreDifferenceToJson(
  MischievousIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

MischievousInfo _$MischievousInfoFromJson(Map<String, dynamic> json) =>
    MischievousInfo(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MischievousInfoToJson(MischievousInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source10 _$Source10FromJson(Map<String, dynamic> json) => Source10(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory12.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm10.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize10.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin11.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source10ToJson(Source10 instance) => <String, dynamic>{
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

Directory12 _$Directory12FromJson(Map<String, dynamic> json) => Directory12(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet10.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory12ToJson(Directory12 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet10 _$Jsonnet10FromJson(Map<String, dynamic> json) => Jsonnet10(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet10ToJson(Jsonnet10 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar10 _$ExtVar10FromJson(Map<String, dynamic> json) => ExtVar10(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar10ToJson(ExtVar10 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas10 _$Tlas10FromJson(Map<String, dynamic> json) => Tlas10(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas10ToJson(Tlas10 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm10 _$Helm10FromJson(Map<String, dynamic> json) => Helm10(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter32.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm10ToJson(Helm10 instance) => <String, dynamic>{
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

FileParameter10 _$FileParameter10FromJson(Map<String, dynamic> json) =>
    FileParameter10(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter10ToJson(FileParameter10 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter32 _$Parameter32FromJson(Map<String, dynamic> json) => Parameter32(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter32ToJson(Parameter32 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize10 _$Kustomize10FromJson(Map<String, dynamic> json) => Kustomize10(
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
        (e) => e == null ? null : Patch10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize10ToJson(Kustomize10 instance) =>
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

Patch10 _$Patch10FromJson(Map<String, dynamic> json) => Patch10(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target10.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch10ToJson(Patch10 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target10 _$Target10FromJson(Map<String, dynamic> json) => Target10(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target10ToJson(Target10 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica10 _$Replica10FromJson(Map<String, dynamic> json) =>
    Replica10(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica10ToJson(Replica10 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin11 _$Plugin11FromJson(Map<String, dynamic> json) => Plugin11(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env10.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin11ToJson(Plugin11 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env10 _$Env10FromJson(Map<String, dynamic> json) =>
    Env10(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env10ToJson(Env10 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter33 _$Parameter33FromJson(Map<String, dynamic> json) => Parameter33(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter33ToJson(Parameter33 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MischievousSourceHydrator _$MischievousSourceHydratorFromJson(
  Map<String, dynamic> json,
) => MischievousSourceHydrator(
  drySource: MischievousDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : MischievousHydrateTo.fromJson(
          json['hydrateTo'] as Map<String, dynamic>,
        ),
  syncSource: MischievousSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MischievousSourceHydratorToJson(
  MischievousSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

MischievousDrySource _$MischievousDrySourceFromJson(
  Map<String, dynamic> json,
) => MischievousDrySource(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$MischievousDrySourceToJson(
  MischievousDrySource instance,
) => <String, dynamic>{
  'path': instance.path,
  'repoURL': instance.repoUrl,
  'targetRevision': instance.targetRevision,
};

MischievousHydrateTo _$MischievousHydrateToFromJson(
  Map<String, dynamic> json,
) => MischievousHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$MischievousHydrateToToJson(
  MischievousHydrateTo instance,
) => <String, dynamic>{'targetBranch': instance.targetBranch};

MischievousSyncSource _$MischievousSyncSourceFromJson(
  Map<String, dynamic> json,
) => MischievousSyncSource(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$MischievousSyncSourceToJson(
  MischievousSyncSource instance,
) => <String, dynamic>{
  'path': instance.path,
  'targetBranch': instance.targetBranch,
};

Source11 _$Source11FromJson(Map<String, dynamic> json) => Source11(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory13.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm11.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize11.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin12.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source11ToJson(Source11 instance) => <String, dynamic>{
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

Directory13 _$Directory13FromJson(Map<String, dynamic> json) => Directory13(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet11.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory13ToJson(Directory13 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet11 _$Jsonnet11FromJson(Map<String, dynamic> json) => Jsonnet11(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet11ToJson(Jsonnet11 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar11 _$ExtVar11FromJson(Map<String, dynamic> json) => ExtVar11(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar11ToJson(ExtVar11 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas11 _$Tlas11FromJson(Map<String, dynamic> json) => Tlas11(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas11ToJson(Tlas11 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm11 _$Helm11FromJson(Map<String, dynamic> json) => Helm11(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter34.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm11ToJson(Helm11 instance) => <String, dynamic>{
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

FileParameter11 _$FileParameter11FromJson(Map<String, dynamic> json) =>
    FileParameter11(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter11ToJson(FileParameter11 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter34 _$Parameter34FromJson(Map<String, dynamic> json) => Parameter34(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter34ToJson(Parameter34 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize11 _$Kustomize11FromJson(Map<String, dynamic> json) => Kustomize11(
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
        (e) => e == null ? null : Patch11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize11ToJson(Kustomize11 instance) =>
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

Patch11 _$Patch11FromJson(Map<String, dynamic> json) => Patch11(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target11.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch11ToJson(Patch11 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target11 _$Target11FromJson(Map<String, dynamic> json) => Target11(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target11ToJson(Target11 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica11 _$Replica11FromJson(Map<String, dynamic> json) =>
    Replica11(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica11ToJson(Replica11 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin12 _$Plugin12FromJson(Map<String, dynamic> json) => Plugin12(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env11.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin12ToJson(Plugin12 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env11 _$Env11FromJson(Map<String, dynamic> json) =>
    Env11(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env11ToJson(Env11 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter35 _$Parameter35FromJson(Map<String, dynamic> json) => Parameter35(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter35ToJson(Parameter35 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

MischievousSyncPolicy _$MischievousSyncPolicyFromJson(
  Map<String, dynamic> json,
) => MischievousSyncPolicy(
  automated: json['automated'] == null
      ? null
      : MischievousAutomated.fromJson(
          json['automated'] as Map<String, dynamic>,
        ),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : MischievousManagedNamespaceMetadata.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : MischievousRetry.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$MischievousSyncPolicyToJson(
  MischievousSyncPolicy instance,
) => <String, dynamic>{
  'automated': instance.automated,
  'managedNamespaceMetadata': instance.managedNamespaceMetadata,
  'retry': instance.retry,
  'syncOptions': instance.syncOptions,
};

MischievousAutomated _$MischievousAutomatedFromJson(
  Map<String, dynamic> json,
) => MischievousAutomated(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$MischievousAutomatedToJson(
  MischievousAutomated instance,
) => <String, dynamic>{
  'allowEmpty': instance.allowEmpty,
  'enabled': instance.enabled,
  'prune': instance.prune,
  'selfHeal': instance.selfHeal,
};

MischievousManagedNamespaceMetadata
_$MischievousManagedNamespaceMetadataFromJson(Map<String, dynamic> json) =>
    MischievousManagedNamespaceMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$MischievousManagedNamespaceMetadataToJson(
  MischievousManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

MischievousRetry _$MischievousRetryFromJson(Map<String, dynamic> json) =>
    MischievousRetry(
      backoff: json['backoff'] == null
          ? null
          : MischievousBackoff.fromJson(
              json['backoff'] as Map<String, dynamic>,
            ),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$MischievousRetryToJson(MischievousRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

MischievousBackoff _$MischievousBackoffFromJson(Map<String, dynamic> json) =>
    MischievousBackoff(
      duration: json['duration'] as String?,
      factor: (json['factor'] as num?)?.toInt(),
      maxDuration: json['maxDuration'] as String?,
    );

Map<String, dynamic> _$MischievousBackoffToJson(MischievousBackoff instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'factor': instance.factor,
      'maxDuration': instance.maxDuration,
    };

Merge _$MergeFromJson(Map<String, dynamic> json) => Merge(
  generators: (json['generators'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : MergeGenerator.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  mergeKeys: (json['mergeKeys'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  template: json['template'] == null
      ? null
      : MergeTemplate.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MergeToJson(Merge instance) => <String, dynamic>{
  'generators': instance.generators,
  'mergeKeys': instance.mergeKeys,
  'template': instance.template,
};

MergeGenerator _$MergeGeneratorFromJson(
  Map<String, dynamic> json,
) => MergeGenerator(
  clusterDecisionResource: json['clusterDecisionResource'] == null
      ? null
      : TentacledClusterDecisionResource.fromJson(
          json['clusterDecisionResource'] as Map<String, dynamic>,
        ),
  clusters: json['clusters'] == null
      ? null
      : TentacledClusters.fromJson(json['clusters'] as Map<String, dynamic>),
  git: json['git'] == null
      ? null
      : TentacledGit.fromJson(json['git'] as Map<String, dynamic>),
  list: json['list'] == null
      ? null
      : TentacledList.fromJson(json['list'] as Map<String, dynamic>),
  matrix: json['matrix'],
  merge: json['merge'],
  plugin: json['plugin'] == null
      ? null
      : Plugin21.fromJson(json['plugin'] as Map<String, dynamic>),
  pullRequest: json['pullRequest'] == null
      ? null
      : FluffyPullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>),
  scmProvider: json['scmProvider'] == null
      ? null
      : FluffyScmProvider.fromJson(json['scmProvider'] as Map<String, dynamic>),
  selector: json['selector'] == null
      ? null
      : IndigoSelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MergeGeneratorToJson(MergeGenerator instance) =>
    <String, dynamic>{
      'clusterDecisionResource': instance.clusterDecisionResource,
      'clusters': instance.clusters,
      'git': instance.git,
      'list': instance.list,
      'matrix': instance.matrix,
      'merge': instance.merge,
      'plugin': instance.plugin,
      'pullRequest': instance.pullRequest,
      'scmProvider': instance.scmProvider,
      'selector': instance.selector,
    };

TentacledClusterDecisionResource _$TentacledClusterDecisionResourceFromJson(
  Map<String, dynamic> json,
) => TentacledClusterDecisionResource(
  configMapRef: json['configMapRef'] as String,
  labelSelector: json['labelSelector'] == null
      ? null
      : TentacledLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  name: json['name'] as String?,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : MischievousTemplate.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledClusterDecisionResourceToJson(
  TentacledClusterDecisionResource instance,
) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

TentacledLabelSelector _$TentacledLabelSelectorFromJson(
  Map<String, dynamic> json,
) => TentacledLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledLabelSelectorToJson(
  TentacledLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

IndecentMatchExpression _$IndecentMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndecentMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndecentMatchExpressionToJson(
  IndecentMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

MischievousTemplate _$MischievousTemplateFromJson(Map<String, dynamic> json) =>
    MischievousTemplate(
      metadata: BraggadociousMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      spec: BraggadociousSpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MischievousTemplateToJson(
  MischievousTemplate instance,
) => <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

BraggadociousMetadata _$BraggadociousMetadataFromJson(
  Map<String, dynamic> json,
) => BraggadociousMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$BraggadociousMetadataToJson(
  BraggadociousMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

BraggadociousSpec _$BraggadociousSpecFromJson(
  Map<String, dynamic> json,
) => BraggadociousSpec(
  destination: BraggadociousDestination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousIgnoreDifference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source12.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : BraggadociousSourceHydrator.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : BraggadociousSyncPolicy.fromJson(
          json['syncPolicy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$BraggadociousSpecToJson(BraggadociousSpec instance) =>
    <String, dynamic>{
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

BraggadociousDestination _$BraggadociousDestinationFromJson(
  Map<String, dynamic> json,
) => BraggadociousDestination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$BraggadociousDestinationToJson(
  BraggadociousDestination instance,
) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'server': instance.server,
};

BraggadociousIgnoreDifference _$BraggadociousIgnoreDifferenceFromJson(
  Map<String, dynamic> json,
) => BraggadociousIgnoreDifference(
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

Map<String, dynamic> _$BraggadociousIgnoreDifferenceToJson(
  BraggadociousIgnoreDifference instance,
) => <String, dynamic>{
  'group': instance.group,
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'kind': instance.kind,
  'managedFieldsManagers': instance.managedFieldsManagers,
  'name': instance.name,
  'namespace': instance.namespace,
};

BraggadociousInfo _$BraggadociousInfoFromJson(Map<String, dynamic> json) =>
    BraggadociousInfo(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$BraggadociousInfoToJson(BraggadociousInfo instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

Source12 _$Source12FromJson(Map<String, dynamic> json) => Source12(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory14.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm12.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize12.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin13.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source12ToJson(Source12 instance) => <String, dynamic>{
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

Directory14 _$Directory14FromJson(Map<String, dynamic> json) => Directory14(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet12.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory14ToJson(Directory14 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet12 _$Jsonnet12FromJson(Map<String, dynamic> json) => Jsonnet12(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar12.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas12.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet12ToJson(Jsonnet12 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar12 _$ExtVar12FromJson(Map<String, dynamic> json) => ExtVar12(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar12ToJson(ExtVar12 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas12 _$Tlas12FromJson(Map<String, dynamic> json) => Tlas12(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas12ToJson(Tlas12 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm12 _$Helm12FromJson(Map<String, dynamic> json) => Helm12(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter12.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter36.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm12ToJson(Helm12 instance) => <String, dynamic>{
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

FileParameter12 _$FileParameter12FromJson(Map<String, dynamic> json) =>
    FileParameter12(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter12ToJson(FileParameter12 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter36 _$Parameter36FromJson(Map<String, dynamic> json) => Parameter36(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter36ToJson(Parameter36 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize12 _$Kustomize12FromJson(Map<String, dynamic> json) => Kustomize12(
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
        (e) => e == null ? null : Patch12.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica12.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize12ToJson(Kustomize12 instance) =>
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

Patch12 _$Patch12FromJson(Map<String, dynamic> json) => Patch12(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target12.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch12ToJson(Patch12 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target12 _$Target12FromJson(Map<String, dynamic> json) => Target12(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target12ToJson(Target12 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica12 _$Replica12FromJson(Map<String, dynamic> json) =>
    Replica12(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica12ToJson(Replica12 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin13 _$Plugin13FromJson(Map<String, dynamic> json) => Plugin13(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env12.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter37.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin13ToJson(Plugin13 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env12 _$Env12FromJson(Map<String, dynamic> json) =>
    Env12(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env12ToJson(Env12 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter37 _$Parameter37FromJson(Map<String, dynamic> json) => Parameter37(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter37ToJson(Parameter37 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

BraggadociousSourceHydrator _$BraggadociousSourceHydratorFromJson(
  Map<String, dynamic> json,
) => BraggadociousSourceHydrator(
  drySource: BraggadociousDrySource.fromJson(
    json['drySource'] as Map<String, dynamic>,
  ),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : BraggadociousHydrateTo.fromJson(
          json['hydrateTo'] as Map<String, dynamic>,
        ),
  syncSource: BraggadociousSyncSource.fromJson(
    json['syncSource'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$BraggadociousSourceHydratorToJson(
  BraggadociousSourceHydrator instance,
) => <String, dynamic>{
  'drySource': instance.drySource,
  'hydrateTo': instance.hydrateTo,
  'syncSource': instance.syncSource,
};

BraggadociousDrySource _$BraggadociousDrySourceFromJson(
  Map<String, dynamic> json,
) => BraggadociousDrySource(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$BraggadociousDrySourceToJson(
  BraggadociousDrySource instance,
) => <String, dynamic>{
  'path': instance.path,
  'repoURL': instance.repoUrl,
  'targetRevision': instance.targetRevision,
};

BraggadociousHydrateTo _$BraggadociousHydrateToFromJson(
  Map<String, dynamic> json,
) => BraggadociousHydrateTo(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$BraggadociousHydrateToToJson(
  BraggadociousHydrateTo instance,
) => <String, dynamic>{'targetBranch': instance.targetBranch};

BraggadociousSyncSource _$BraggadociousSyncSourceFromJson(
  Map<String, dynamic> json,
) => BraggadociousSyncSource(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$BraggadociousSyncSourceToJson(
  BraggadociousSyncSource instance,
) => <String, dynamic>{
  'path': instance.path,
  'targetBranch': instance.targetBranch,
};

Source13 _$Source13FromJson(Map<String, dynamic> json) => Source13(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory15.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm13.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize13.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin14.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source13ToJson(Source13 instance) => <String, dynamic>{
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

Directory15 _$Directory15FromJson(Map<String, dynamic> json) => Directory15(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet13.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory15ToJson(Directory15 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet13 _$Jsonnet13FromJson(Map<String, dynamic> json) => Jsonnet13(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet13ToJson(Jsonnet13 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar13 _$ExtVar13FromJson(Map<String, dynamic> json) => ExtVar13(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar13ToJson(ExtVar13 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas13 _$Tlas13FromJson(Map<String, dynamic> json) => Tlas13(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas13ToJson(Tlas13 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm13 _$Helm13FromJson(Map<String, dynamic> json) => Helm13(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter38.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm13ToJson(Helm13 instance) => <String, dynamic>{
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

FileParameter13 _$FileParameter13FromJson(Map<String, dynamic> json) =>
    FileParameter13(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter13ToJson(FileParameter13 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter38 _$Parameter38FromJson(Map<String, dynamic> json) => Parameter38(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter38ToJson(Parameter38 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize13 _$Kustomize13FromJson(Map<String, dynamic> json) => Kustomize13(
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
        (e) => e == null ? null : Patch13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica13.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize13ToJson(Kustomize13 instance) =>
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

Patch13 _$Patch13FromJson(Map<String, dynamic> json) => Patch13(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target13.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch13ToJson(Patch13 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target13 _$Target13FromJson(Map<String, dynamic> json) => Target13(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target13ToJson(Target13 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica13 _$Replica13FromJson(Map<String, dynamic> json) =>
    Replica13(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica13ToJson(Replica13 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin14 _$Plugin14FromJson(Map<String, dynamic> json) => Plugin14(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env13.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter39.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin14ToJson(Plugin14 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env13 _$Env13FromJson(Map<String, dynamic> json) =>
    Env13(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env13ToJson(Env13 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter39 _$Parameter39FromJson(Map<String, dynamic> json) => Parameter39(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter39ToJson(Parameter39 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

BraggadociousSyncPolicy _$BraggadociousSyncPolicyFromJson(
  Map<String, dynamic> json,
) => BraggadociousSyncPolicy(
  automated: json['automated'] == null
      ? null
      : BraggadociousAutomated.fromJson(
          json['automated'] as Map<String, dynamic>,
        ),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : BraggadociousManagedNamespaceMetadata.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : BraggadociousRetry.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$BraggadociousSyncPolicyToJson(
  BraggadociousSyncPolicy instance,
) => <String, dynamic>{
  'automated': instance.automated,
  'managedNamespaceMetadata': instance.managedNamespaceMetadata,
  'retry': instance.retry,
  'syncOptions': instance.syncOptions,
};

BraggadociousAutomated _$BraggadociousAutomatedFromJson(
  Map<String, dynamic> json,
) => BraggadociousAutomated(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$BraggadociousAutomatedToJson(
  BraggadociousAutomated instance,
) => <String, dynamic>{
  'allowEmpty': instance.allowEmpty,
  'enabled': instance.enabled,
  'prune': instance.prune,
  'selfHeal': instance.selfHeal,
};

BraggadociousManagedNamespaceMetadata
_$BraggadociousManagedNamespaceMetadataFromJson(Map<String, dynamic> json) =>
    BraggadociousManagedNamespaceMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$BraggadociousManagedNamespaceMetadataToJson(
  BraggadociousManagedNamespaceMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

BraggadociousRetry _$BraggadociousRetryFromJson(Map<String, dynamic> json) =>
    BraggadociousRetry(
      backoff: json['backoff'] == null
          ? null
          : BraggadociousBackoff.fromJson(
              json['backoff'] as Map<String, dynamic>,
            ),
      limit: (json['limit'] as num?)?.toInt(),
      refresh: json['refresh'] as bool?,
    );

Map<String, dynamic> _$BraggadociousRetryToJson(BraggadociousRetry instance) =>
    <String, dynamic>{
      'backoff': instance.backoff,
      'limit': instance.limit,
      'refresh': instance.refresh,
    };

BraggadociousBackoff _$BraggadociousBackoffFromJson(
  Map<String, dynamic> json,
) => BraggadociousBackoff(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$BraggadociousBackoffToJson(
  BraggadociousBackoff instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

TentacledClusters _$TentacledClustersFromJson(Map<String, dynamic> json) =>
    TentacledClusters(
      flatList: json['flatList'] as bool?,
      selector: json['selector'] == null
          ? null
          : StickySelector.fromJson(json['selector'] as Map<String, dynamic>),
      template: json['template'] == null
          ? null
          : BraggadociousTemplate.fromJson(
              json['template'] as Map<String, dynamic>,
            ),
      values: (json['values'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$TentacledClustersToJson(TentacledClusters instance) =>
    <String, dynamic>{
      'flatList': instance.flatList,
      'selector': instance.selector,
      'template': instance.template,
      'values': instance.values,
    };

StickySelector _$StickySelectorFromJson(Map<String, dynamic> json) =>
    StickySelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$StickySelectorToJson(StickySelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

HilariousMatchExpression _$HilariousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => HilariousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$HilariousMatchExpressionToJson(
  HilariousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

BraggadociousTemplate _$BraggadociousTemplateFromJson(
  Map<String, dynamic> json,
) => BraggadociousTemplate(
  metadata: Metadata1.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec1.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BraggadociousTemplateToJson(
  BraggadociousTemplate instance,
) => <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

Metadata1 _$Metadata1FromJson(Map<String, dynamic> json) => Metadata1(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata1ToJson(Metadata1 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec1 _$Spec1FromJson(Map<String, dynamic> json) => Spec1(
  destination: Destination1.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info1.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source14.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator1.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy1.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec1ToJson(Spec1 instance) => <String, dynamic>{
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

Destination1 _$Destination1FromJson(Map<String, dynamic> json) => Destination1(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination1ToJson(Destination1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference1 _$IgnoreDifference1FromJson(Map<String, dynamic> json) =>
    IgnoreDifference1(
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

Map<String, dynamic> _$IgnoreDifference1ToJson(IgnoreDifference1 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info1 _$Info1FromJson(Map<String, dynamic> json) =>
    Info1(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info1ToJson(Info1 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source14 _$Source14FromJson(Map<String, dynamic> json) => Source14(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory16.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm14.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize14.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin15.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source14ToJson(Source14 instance) => <String, dynamic>{
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

Directory16 _$Directory16FromJson(Map<String, dynamic> json) => Directory16(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet14.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory16ToJson(Directory16 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet14 _$Jsonnet14FromJson(Map<String, dynamic> json) => Jsonnet14(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar14.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas14.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet14ToJson(Jsonnet14 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar14 _$ExtVar14FromJson(Map<String, dynamic> json) => ExtVar14(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar14ToJson(ExtVar14 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas14 _$Tlas14FromJson(Map<String, dynamic> json) => Tlas14(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas14ToJson(Tlas14 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm14 _$Helm14FromJson(Map<String, dynamic> json) => Helm14(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter14.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter40.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm14ToJson(Helm14 instance) => <String, dynamic>{
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

FileParameter14 _$FileParameter14FromJson(Map<String, dynamic> json) =>
    FileParameter14(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter14ToJson(FileParameter14 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter40 _$Parameter40FromJson(Map<String, dynamic> json) => Parameter40(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter40ToJson(Parameter40 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize14 _$Kustomize14FromJson(Map<String, dynamic> json) => Kustomize14(
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
        (e) => e == null ? null : Patch14.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica14.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize14ToJson(Kustomize14 instance) =>
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

Patch14 _$Patch14FromJson(Map<String, dynamic> json) => Patch14(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target14.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch14ToJson(Patch14 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target14 _$Target14FromJson(Map<String, dynamic> json) => Target14(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target14ToJson(Target14 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica14 _$Replica14FromJson(Map<String, dynamic> json) =>
    Replica14(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica14ToJson(Replica14 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin15 _$Plugin15FromJson(Map<String, dynamic> json) => Plugin15(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env14.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter41.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin15ToJson(Plugin15 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env14 _$Env14FromJson(Map<String, dynamic> json) =>
    Env14(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env14ToJson(Env14 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter41 _$Parameter41FromJson(Map<String, dynamic> json) => Parameter41(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter41ToJson(Parameter41 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator1 _$SourceHydrator1FromJson(Map<String, dynamic> json) =>
    SourceHydrator1(
      drySource: DrySource1.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo1.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource1.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator1ToJson(SourceHydrator1 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource1 _$DrySource1FromJson(Map<String, dynamic> json) => DrySource1(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource1ToJson(DrySource1 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo1 _$HydrateTo1FromJson(Map<String, dynamic> json) =>
    HydrateTo1(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo1ToJson(HydrateTo1 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource1 _$SyncSource1FromJson(Map<String, dynamic> json) => SyncSource1(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource1ToJson(SyncSource1 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source15 _$Source15FromJson(Map<String, dynamic> json) => Source15(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory17.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm15.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize15.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin16.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source15ToJson(Source15 instance) => <String, dynamic>{
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

Directory17 _$Directory17FromJson(Map<String, dynamic> json) => Directory17(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet15.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory17ToJson(Directory17 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet15 _$Jsonnet15FromJson(Map<String, dynamic> json) => Jsonnet15(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet15ToJson(Jsonnet15 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar15 _$ExtVar15FromJson(Map<String, dynamic> json) => ExtVar15(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar15ToJson(ExtVar15 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas15 _$Tlas15FromJson(Map<String, dynamic> json) => Tlas15(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas15ToJson(Tlas15 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm15 _$Helm15FromJson(Map<String, dynamic> json) => Helm15(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter42.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm15ToJson(Helm15 instance) => <String, dynamic>{
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

FileParameter15 _$FileParameter15FromJson(Map<String, dynamic> json) =>
    FileParameter15(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter15ToJson(FileParameter15 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter42 _$Parameter42FromJson(Map<String, dynamic> json) => Parameter42(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter42ToJson(Parameter42 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize15 _$Kustomize15FromJson(Map<String, dynamic> json) => Kustomize15(
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
        (e) => e == null ? null : Patch15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica15.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize15ToJson(Kustomize15 instance) =>
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

Patch15 _$Patch15FromJson(Map<String, dynamic> json) => Patch15(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target15.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch15ToJson(Patch15 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target15 _$Target15FromJson(Map<String, dynamic> json) => Target15(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target15ToJson(Target15 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica15 _$Replica15FromJson(Map<String, dynamic> json) =>
    Replica15(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica15ToJson(Replica15 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin16 _$Plugin16FromJson(Map<String, dynamic> json) => Plugin16(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env15.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter43.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin16ToJson(Plugin16 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env15 _$Env15FromJson(Map<String, dynamic> json) =>
    Env15(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env15ToJson(Env15 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter43 _$Parameter43FromJson(Map<String, dynamic> json) => Parameter43(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter43ToJson(Parameter43 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy1 _$SyncPolicy1FromJson(Map<String, dynamic> json) => SyncPolicy1(
  automated: json['automated'] == null
      ? null
      : Automated1.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata1.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry1.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy1ToJson(SyncPolicy1 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated1 _$Automated1FromJson(Map<String, dynamic> json) => Automated1(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated1ToJson(Automated1 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata1 _$ManagedNamespaceMetadata1FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata1(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata1ToJson(
  ManagedNamespaceMetadata1 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry1 _$Retry1FromJson(Map<String, dynamic> json) => Retry1(
  backoff: json['backoff'] == null
      ? null
      : Backoff1.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry1ToJson(Retry1 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff1 _$Backoff1FromJson(Map<String, dynamic> json) => Backoff1(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff1ToJson(Backoff1 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

TentacledGit _$TentacledGitFromJson(Map<String, dynamic> json) => TentacledGit(
  directories: (json['directories'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Directory18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  files: (json['files'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledFile.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  pathParamPrefix: json['pathParamPrefix'] as String?,
  repoUrl: json['repoURL'] as String,
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  revision: json['revision'] as String,
  template: json['template'] == null
      ? null
      : Template1.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledGitToJson(TentacledGit instance) =>
    <String, dynamic>{
      'directories': instance.directories,
      'files': instance.files,
      'pathParamPrefix': instance.pathParamPrefix,
      'repoURL': instance.repoUrl,
      'requeueAfterSeconds': instance.requeueAfterSeconds,
      'revision': instance.revision,
      'template': instance.template,
      'values': instance.values,
    };

Directory18 _$Directory18FromJson(Map<String, dynamic> json) => Directory18(
  exclude: json['exclude'] as bool?,
  path: json['path'] as String,
);

Map<String, dynamic> _$Directory18ToJson(Directory18 instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

TentacledFile _$TentacledFileFromJson(Map<String, dynamic> json) =>
    TentacledFile(
      exclude: json['exclude'] as bool?,
      path: json['path'] as String,
    );

Map<String, dynamic> _$TentacledFileToJson(TentacledFile instance) =>
    <String, dynamic>{'exclude': instance.exclude, 'path': instance.path};

Template1 _$Template1FromJson(Map<String, dynamic> json) => Template1(
  metadata: Metadata2.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec2.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template1ToJson(Template1 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata2 _$Metadata2FromJson(Map<String, dynamic> json) => Metadata2(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata2ToJson(Metadata2 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec2 _$Spec2FromJson(Map<String, dynamic> json) => Spec2(
  destination: Destination2.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info2.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source16.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator2.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy2.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec2ToJson(Spec2 instance) => <String, dynamic>{
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

Destination2 _$Destination2FromJson(Map<String, dynamic> json) => Destination2(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination2ToJson(Destination2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference2 _$IgnoreDifference2FromJson(Map<String, dynamic> json) =>
    IgnoreDifference2(
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

Map<String, dynamic> _$IgnoreDifference2ToJson(IgnoreDifference2 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info2 _$Info2FromJson(Map<String, dynamic> json) =>
    Info2(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info2ToJson(Info2 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source16 _$Source16FromJson(Map<String, dynamic> json) => Source16(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory19.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm16.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize16.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin17.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source16ToJson(Source16 instance) => <String, dynamic>{
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

Directory19 _$Directory19FromJson(Map<String, dynamic> json) => Directory19(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet16.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory19ToJson(Directory19 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet16 _$Jsonnet16FromJson(Map<String, dynamic> json) => Jsonnet16(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar16.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas16.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet16ToJson(Jsonnet16 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar16 _$ExtVar16FromJson(Map<String, dynamic> json) => ExtVar16(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar16ToJson(ExtVar16 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas16 _$Tlas16FromJson(Map<String, dynamic> json) => Tlas16(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas16ToJson(Tlas16 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm16 _$Helm16FromJson(Map<String, dynamic> json) => Helm16(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter16.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter44.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm16ToJson(Helm16 instance) => <String, dynamic>{
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

FileParameter16 _$FileParameter16FromJson(Map<String, dynamic> json) =>
    FileParameter16(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter16ToJson(FileParameter16 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter44 _$Parameter44FromJson(Map<String, dynamic> json) => Parameter44(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter44ToJson(Parameter44 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize16 _$Kustomize16FromJson(Map<String, dynamic> json) => Kustomize16(
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
        (e) => e == null ? null : Patch16.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica16.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize16ToJson(Kustomize16 instance) =>
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

Patch16 _$Patch16FromJson(Map<String, dynamic> json) => Patch16(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target16.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch16ToJson(Patch16 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target16 _$Target16FromJson(Map<String, dynamic> json) => Target16(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target16ToJson(Target16 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica16 _$Replica16FromJson(Map<String, dynamic> json) =>
    Replica16(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica16ToJson(Replica16 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin17 _$Plugin17FromJson(Map<String, dynamic> json) => Plugin17(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env16.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter45.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin17ToJson(Plugin17 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env16 _$Env16FromJson(Map<String, dynamic> json) =>
    Env16(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env16ToJson(Env16 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter45 _$Parameter45FromJson(Map<String, dynamic> json) => Parameter45(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter45ToJson(Parameter45 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator2 _$SourceHydrator2FromJson(Map<String, dynamic> json) =>
    SourceHydrator2(
      drySource: DrySource2.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo2.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource2.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator2ToJson(SourceHydrator2 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource2 _$DrySource2FromJson(Map<String, dynamic> json) => DrySource2(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource2ToJson(DrySource2 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo2 _$HydrateTo2FromJson(Map<String, dynamic> json) =>
    HydrateTo2(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo2ToJson(HydrateTo2 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource2 _$SyncSource2FromJson(Map<String, dynamic> json) => SyncSource2(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource2ToJson(SyncSource2 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source17 _$Source17FromJson(Map<String, dynamic> json) => Source17(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory20.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm17.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize17.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin18.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source17ToJson(Source17 instance) => <String, dynamic>{
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

Directory20 _$Directory20FromJson(Map<String, dynamic> json) => Directory20(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet17.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory20ToJson(Directory20 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet17 _$Jsonnet17FromJson(Map<String, dynamic> json) => Jsonnet17(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet17ToJson(Jsonnet17 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar17 _$ExtVar17FromJson(Map<String, dynamic> json) => ExtVar17(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar17ToJson(ExtVar17 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas17 _$Tlas17FromJson(Map<String, dynamic> json) => Tlas17(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas17ToJson(Tlas17 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm17 _$Helm17FromJson(Map<String, dynamic> json) => Helm17(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter46.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm17ToJson(Helm17 instance) => <String, dynamic>{
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

FileParameter17 _$FileParameter17FromJson(Map<String, dynamic> json) =>
    FileParameter17(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter17ToJson(FileParameter17 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter46 _$Parameter46FromJson(Map<String, dynamic> json) => Parameter46(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter46ToJson(Parameter46 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize17 _$Kustomize17FromJson(Map<String, dynamic> json) => Kustomize17(
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
        (e) => e == null ? null : Patch17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica17.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize17ToJson(Kustomize17 instance) =>
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

Patch17 _$Patch17FromJson(Map<String, dynamic> json) => Patch17(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target17.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch17ToJson(Patch17 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target17 _$Target17FromJson(Map<String, dynamic> json) => Target17(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target17ToJson(Target17 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica17 _$Replica17FromJson(Map<String, dynamic> json) =>
    Replica17(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica17ToJson(Replica17 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin18 _$Plugin18FromJson(Map<String, dynamic> json) => Plugin18(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env17.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter47.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin18ToJson(Plugin18 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env17 _$Env17FromJson(Map<String, dynamic> json) =>
    Env17(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env17ToJson(Env17 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter47 _$Parameter47FromJson(Map<String, dynamic> json) => Parameter47(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter47ToJson(Parameter47 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy2 _$SyncPolicy2FromJson(Map<String, dynamic> json) => SyncPolicy2(
  automated: json['automated'] == null
      ? null
      : Automated2.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata2.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry2.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy2ToJson(SyncPolicy2 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated2 _$Automated2FromJson(Map<String, dynamic> json) => Automated2(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated2ToJson(Automated2 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata2 _$ManagedNamespaceMetadata2FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata2(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata2ToJson(
  ManagedNamespaceMetadata2 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry2 _$Retry2FromJson(Map<String, dynamic> json) => Retry2(
  backoff: json['backoff'] == null
      ? null
      : Backoff2.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry2ToJson(Retry2 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff2 _$Backoff2FromJson(Map<String, dynamic> json) => Backoff2(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff2ToJson(Backoff2 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

TentacledList _$TentacledListFromJson(Map<String, dynamic> json) =>
    TentacledList(
      elements: json['elements'] as List<dynamic>?,
      elementsYaml: json['elementsYaml'] as String?,
      template: json['template'] == null
          ? null
          : Template2.fromJson(json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledListToJson(TentacledList instance) =>
    <String, dynamic>{
      'elements': instance.elements,
      'elementsYaml': instance.elementsYaml,
      'template': instance.template,
    };

Template2 _$Template2FromJson(Map<String, dynamic> json) => Template2(
  metadata: Metadata3.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec3.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template2ToJson(Template2 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata3 _$Metadata3FromJson(Map<String, dynamic> json) => Metadata3(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata3ToJson(Metadata3 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec3 _$Spec3FromJson(Map<String, dynamic> json) => Spec3(
  destination: Destination3.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info3.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source18.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator3.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy3.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec3ToJson(Spec3 instance) => <String, dynamic>{
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

Destination3 _$Destination3FromJson(Map<String, dynamic> json) => Destination3(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination3ToJson(Destination3 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference3 _$IgnoreDifference3FromJson(Map<String, dynamic> json) =>
    IgnoreDifference3(
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

Map<String, dynamic> _$IgnoreDifference3ToJson(IgnoreDifference3 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info3 _$Info3FromJson(Map<String, dynamic> json) =>
    Info3(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info3ToJson(Info3 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source18 _$Source18FromJson(Map<String, dynamic> json) => Source18(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory21.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm18.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize18.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin19.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source18ToJson(Source18 instance) => <String, dynamic>{
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

Directory21 _$Directory21FromJson(Map<String, dynamic> json) => Directory21(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet18.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory21ToJson(Directory21 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet18 _$Jsonnet18FromJson(Map<String, dynamic> json) => Jsonnet18(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet18ToJson(Jsonnet18 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar18 _$ExtVar18FromJson(Map<String, dynamic> json) => ExtVar18(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar18ToJson(ExtVar18 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas18 _$Tlas18FromJson(Map<String, dynamic> json) => Tlas18(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas18ToJson(Tlas18 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm18 _$Helm18FromJson(Map<String, dynamic> json) => Helm18(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter48.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm18ToJson(Helm18 instance) => <String, dynamic>{
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

FileParameter18 _$FileParameter18FromJson(Map<String, dynamic> json) =>
    FileParameter18(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter18ToJson(FileParameter18 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter48 _$Parameter48FromJson(Map<String, dynamic> json) => Parameter48(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter48ToJson(Parameter48 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize18 _$Kustomize18FromJson(Map<String, dynamic> json) => Kustomize18(
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
        (e) => e == null ? null : Patch18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica18.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize18ToJson(Kustomize18 instance) =>
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

Patch18 _$Patch18FromJson(Map<String, dynamic> json) => Patch18(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target18.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch18ToJson(Patch18 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target18 _$Target18FromJson(Map<String, dynamic> json) => Target18(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target18ToJson(Target18 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica18 _$Replica18FromJson(Map<String, dynamic> json) =>
    Replica18(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica18ToJson(Replica18 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin19 _$Plugin19FromJson(Map<String, dynamic> json) => Plugin19(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env18.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter49.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin19ToJson(Plugin19 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env18 _$Env18FromJson(Map<String, dynamic> json) =>
    Env18(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env18ToJson(Env18 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter49 _$Parameter49FromJson(Map<String, dynamic> json) => Parameter49(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter49ToJson(Parameter49 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator3 _$SourceHydrator3FromJson(Map<String, dynamic> json) =>
    SourceHydrator3(
      drySource: DrySource3.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo3.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource3.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator3ToJson(SourceHydrator3 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource3 _$DrySource3FromJson(Map<String, dynamic> json) => DrySource3(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource3ToJson(DrySource3 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo3 _$HydrateTo3FromJson(Map<String, dynamic> json) =>
    HydrateTo3(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo3ToJson(HydrateTo3 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource3 _$SyncSource3FromJson(Map<String, dynamic> json) => SyncSource3(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource3ToJson(SyncSource3 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source19 _$Source19FromJson(Map<String, dynamic> json) => Source19(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory22.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm19.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize19.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin20.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source19ToJson(Source19 instance) => <String, dynamic>{
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

Directory22 _$Directory22FromJson(Map<String, dynamic> json) => Directory22(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet19.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory22ToJson(Directory22 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet19 _$Jsonnet19FromJson(Map<String, dynamic> json) => Jsonnet19(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet19ToJson(Jsonnet19 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar19 _$ExtVar19FromJson(Map<String, dynamic> json) => ExtVar19(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar19ToJson(ExtVar19 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas19 _$Tlas19FromJson(Map<String, dynamic> json) => Tlas19(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas19ToJson(Tlas19 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm19 _$Helm19FromJson(Map<String, dynamic> json) => Helm19(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter50.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm19ToJson(Helm19 instance) => <String, dynamic>{
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

FileParameter19 _$FileParameter19FromJson(Map<String, dynamic> json) =>
    FileParameter19(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter19ToJson(FileParameter19 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter50 _$Parameter50FromJson(Map<String, dynamic> json) => Parameter50(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter50ToJson(Parameter50 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize19 _$Kustomize19FromJson(Map<String, dynamic> json) => Kustomize19(
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
        (e) => e == null ? null : Patch19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica19.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize19ToJson(Kustomize19 instance) =>
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

Patch19 _$Patch19FromJson(Map<String, dynamic> json) => Patch19(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target19.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch19ToJson(Patch19 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target19 _$Target19FromJson(Map<String, dynamic> json) => Target19(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target19ToJson(Target19 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica19 _$Replica19FromJson(Map<String, dynamic> json) =>
    Replica19(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica19ToJson(Replica19 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin20 _$Plugin20FromJson(Map<String, dynamic> json) => Plugin20(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env19.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter51.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin20ToJson(Plugin20 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env19 _$Env19FromJson(Map<String, dynamic> json) =>
    Env19(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env19ToJson(Env19 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter51 _$Parameter51FromJson(Map<String, dynamic> json) => Parameter51(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter51ToJson(Parameter51 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy3 _$SyncPolicy3FromJson(Map<String, dynamic> json) => SyncPolicy3(
  automated: json['automated'] == null
      ? null
      : Automated3.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata3.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry3.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy3ToJson(SyncPolicy3 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated3 _$Automated3FromJson(Map<String, dynamic> json) => Automated3(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated3ToJson(Automated3 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata3 _$ManagedNamespaceMetadata3FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata3(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata3ToJson(
  ManagedNamespaceMetadata3 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry3 _$Retry3FromJson(Map<String, dynamic> json) => Retry3(
  backoff: json['backoff'] == null
      ? null
      : Backoff3.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry3ToJson(Retry3 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff3 _$Backoff3FromJson(Map<String, dynamic> json) => Backoff3(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff3ToJson(Backoff3 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

Plugin21 _$Plugin21FromJson(Map<String, dynamic> json) => Plugin21(
  configMapRef: FluffyConfigMapRef.fromJson(
    json['configMapRef'] as Map<String, dynamic>,
  ),
  input: json['input'] == null
      ? null
      : FluffyInput.fromJson(json['input'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template3.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$Plugin21ToJson(Plugin21 instance) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'input': instance.input,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

FluffyConfigMapRef _$FluffyConfigMapRefFromJson(Map<String, dynamic> json) =>
    FluffyConfigMapRef(name: json['name'] as String);

Map<String, dynamic> _$FluffyConfigMapRefToJson(FluffyConfigMapRef instance) =>
    <String, dynamic>{'name': instance.name};

FluffyInput _$FluffyInputFromJson(Map<String, dynamic> json) =>
    FluffyInput(parameters: json['parameters'] as Map<String, dynamic>?);

Map<String, dynamic> _$FluffyInputToJson(FluffyInput instance) =>
    <String, dynamic>{'parameters': instance.parameters};

Template3 _$Template3FromJson(Map<String, dynamic> json) => Template3(
  metadata: Metadata4.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec4.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template3ToJson(Template3 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata4 _$Metadata4FromJson(Map<String, dynamic> json) => Metadata4(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata4ToJson(Metadata4 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec4 _$Spec4FromJson(Map<String, dynamic> json) => Spec4(
  destination: Destination4.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info4.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source20.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator4.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy4.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec4ToJson(Spec4 instance) => <String, dynamic>{
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

Destination4 _$Destination4FromJson(Map<String, dynamic> json) => Destination4(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination4ToJson(Destination4 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference4 _$IgnoreDifference4FromJson(Map<String, dynamic> json) =>
    IgnoreDifference4(
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

Map<String, dynamic> _$IgnoreDifference4ToJson(IgnoreDifference4 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info4 _$Info4FromJson(Map<String, dynamic> json) =>
    Info4(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info4ToJson(Info4 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source20 _$Source20FromJson(Map<String, dynamic> json) => Source20(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory23.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm20.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize20.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin22.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source20ToJson(Source20 instance) => <String, dynamic>{
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

Directory23 _$Directory23FromJson(Map<String, dynamic> json) => Directory23(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet20.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory23ToJson(Directory23 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet20 _$Jsonnet20FromJson(Map<String, dynamic> json) => Jsonnet20(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar20.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas20.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet20ToJson(Jsonnet20 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar20 _$ExtVar20FromJson(Map<String, dynamic> json) => ExtVar20(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar20ToJson(ExtVar20 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas20 _$Tlas20FromJson(Map<String, dynamic> json) => Tlas20(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas20ToJson(Tlas20 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm20 _$Helm20FromJson(Map<String, dynamic> json) => Helm20(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter20.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter52.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm20ToJson(Helm20 instance) => <String, dynamic>{
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

FileParameter20 _$FileParameter20FromJson(Map<String, dynamic> json) =>
    FileParameter20(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter20ToJson(FileParameter20 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter52 _$Parameter52FromJson(Map<String, dynamic> json) => Parameter52(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter52ToJson(Parameter52 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize20 _$Kustomize20FromJson(Map<String, dynamic> json) => Kustomize20(
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
        (e) => e == null ? null : Patch20.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica20.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize20ToJson(Kustomize20 instance) =>
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

Patch20 _$Patch20FromJson(Map<String, dynamic> json) => Patch20(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target20.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch20ToJson(Patch20 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target20 _$Target20FromJson(Map<String, dynamic> json) => Target20(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target20ToJson(Target20 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica20 _$Replica20FromJson(Map<String, dynamic> json) =>
    Replica20(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica20ToJson(Replica20 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin22 _$Plugin22FromJson(Map<String, dynamic> json) => Plugin22(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env20.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter53.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin22ToJson(Plugin22 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env20 _$Env20FromJson(Map<String, dynamic> json) =>
    Env20(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env20ToJson(Env20 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter53 _$Parameter53FromJson(Map<String, dynamic> json) => Parameter53(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter53ToJson(Parameter53 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator4 _$SourceHydrator4FromJson(Map<String, dynamic> json) =>
    SourceHydrator4(
      drySource: DrySource4.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo4.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource4.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator4ToJson(SourceHydrator4 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource4 _$DrySource4FromJson(Map<String, dynamic> json) => DrySource4(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource4ToJson(DrySource4 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo4 _$HydrateTo4FromJson(Map<String, dynamic> json) =>
    HydrateTo4(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo4ToJson(HydrateTo4 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource4 _$SyncSource4FromJson(Map<String, dynamic> json) => SyncSource4(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource4ToJson(SyncSource4 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source21 _$Source21FromJson(Map<String, dynamic> json) => Source21(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory24.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm21.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize21.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin23.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source21ToJson(Source21 instance) => <String, dynamic>{
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

Directory24 _$Directory24FromJson(Map<String, dynamic> json) => Directory24(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet21.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory24ToJson(Directory24 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet21 _$Jsonnet21FromJson(Map<String, dynamic> json) => Jsonnet21(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet21ToJson(Jsonnet21 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar21 _$ExtVar21FromJson(Map<String, dynamic> json) => ExtVar21(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar21ToJson(ExtVar21 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas21 _$Tlas21FromJson(Map<String, dynamic> json) => Tlas21(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas21ToJson(Tlas21 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm21 _$Helm21FromJson(Map<String, dynamic> json) => Helm21(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter54.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm21ToJson(Helm21 instance) => <String, dynamic>{
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

FileParameter21 _$FileParameter21FromJson(Map<String, dynamic> json) =>
    FileParameter21(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter21ToJson(FileParameter21 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter54 _$Parameter54FromJson(Map<String, dynamic> json) => Parameter54(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter54ToJson(Parameter54 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize21 _$Kustomize21FromJson(Map<String, dynamic> json) => Kustomize21(
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
        (e) => e == null ? null : Patch21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica21.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize21ToJson(Kustomize21 instance) =>
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

Patch21 _$Patch21FromJson(Map<String, dynamic> json) => Patch21(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target21.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch21ToJson(Patch21 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target21 _$Target21FromJson(Map<String, dynamic> json) => Target21(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target21ToJson(Target21 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica21 _$Replica21FromJson(Map<String, dynamic> json) =>
    Replica21(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica21ToJson(Replica21 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin23 _$Plugin23FromJson(Map<String, dynamic> json) => Plugin23(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env21.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter55.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin23ToJson(Plugin23 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env21 _$Env21FromJson(Map<String, dynamic> json) =>
    Env21(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env21ToJson(Env21 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter55 _$Parameter55FromJson(Map<String, dynamic> json) => Parameter55(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter55ToJson(Parameter55 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy4 _$SyncPolicy4FromJson(Map<String, dynamic> json) => SyncPolicy4(
  automated: json['automated'] == null
      ? null
      : Automated4.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata4.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry4.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy4ToJson(SyncPolicy4 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated4 _$Automated4FromJson(Map<String, dynamic> json) => Automated4(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated4ToJson(Automated4 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata4 _$ManagedNamespaceMetadata4FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata4(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata4ToJson(
  ManagedNamespaceMetadata4 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry4 _$Retry4FromJson(Map<String, dynamic> json) => Retry4(
  backoff: json['backoff'] == null
      ? null
      : Backoff4.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry4ToJson(Retry4 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff4 _$Backoff4FromJson(Map<String, dynamic> json) => Backoff4(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff4ToJson(Backoff4 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

FluffyPullRequest _$FluffyPullRequestFromJson(
  Map<String, dynamic> json,
) => FluffyPullRequest(
  azuredevops: json['azuredevops'] == null
      ? null
      : FluffyAzuredevops.fromJson(json['azuredevops'] as Map<String, dynamic>),
  bitbucket: json['bitbucket'] == null
      ? null
      : TentacledBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : TentacledBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  continueOnRepoNotFoundError: json['continueOnRepoNotFoundError'] as bool?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : TentacledGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : TentacledGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : TentacledGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template4.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyPullRequestToJson(FluffyPullRequest instance) =>
    <String, dynamic>{
      'azuredevops': instance.azuredevops,
      'bitbucket': instance.bitbucket,
      'bitbucketServer': instance.bitbucketServer,
      'continueOnRepoNotFoundError': instance.continueOnRepoNotFoundError,
      'filters': instance.filters,
      'gitea': instance.gitea,
      'github': instance.github,
      'gitlab': instance.gitlab,
      'requeueAfterSeconds': instance.requeueAfterSeconds,
      'template': instance.template,
      'values': instance.values,
    };

FluffyAzuredevops _$FluffyAzuredevopsFromJson(Map<String, dynamic> json) =>
    FluffyAzuredevops(
      api: json['api'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      organization: json['organization'] as String,
      project: json['project'] as String,
      repo: json['repo'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : FriskyTokenRef.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FluffyAzuredevopsToJson(FluffyAzuredevops instance) =>
    <String, dynamic>{
      'api': instance.api,
      'labels': instance.labels,
      'organization': instance.organization,
      'project': instance.project,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

FriskyTokenRef _$FriskyTokenRefFromJson(Map<String, dynamic> json) =>
    FriskyTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$FriskyTokenRefToJson(FriskyTokenRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

TentacledBitbucket _$TentacledBitbucketFromJson(Map<String, dynamic> json) =>
    TentacledBitbucket(
      api: json['api'] as String?,
      basicAuth: json['basicAuth'] == null
          ? null
          : StickyBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
      bearerToken: json['bearerToken'] == null
          ? null
          : StickyBearerToken.fromJson(
              json['bearerToken'] as Map<String, dynamic>,
            ),
      owner: json['owner'] as String,
      repo: json['repo'] as String,
    );

Map<String, dynamic> _$TentacledBitbucketToJson(TentacledBitbucket instance) =>
    <String, dynamic>{
      'api': instance.api,
      'basicAuth': instance.basicAuth,
      'bearerToken': instance.bearerToken,
      'owner': instance.owner,
      'repo': instance.repo,
    };

StickyBasicAuth _$StickyBasicAuthFromJson(Map<String, dynamic> json) =>
    StickyBasicAuth(
      passwordRef: StickyPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$StickyBasicAuthToJson(StickyBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

StickyPasswordRef _$StickyPasswordRefFromJson(Map<String, dynamic> json) =>
    StickyPasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$StickyPasswordRefToJson(StickyPasswordRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

StickyBearerToken _$StickyBearerTokenFromJson(Map<String, dynamic> json) =>
    StickyBearerToken(
      tokenRef: MischievousTokenRef.fromJson(
        json['tokenRef'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$StickyBearerTokenToJson(StickyBearerToken instance) =>
    <String, dynamic>{'tokenRef': instance.tokenRef};

MischievousTokenRef _$MischievousTokenRefFromJson(Map<String, dynamic> json) =>
    MischievousTokenRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$MischievousTokenRefToJson(
  MischievousTokenRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

TentacledBitbucketServer _$TentacledBitbucketServerFromJson(
  Map<String, dynamic> json,
) => TentacledBitbucketServer(
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : IndigoBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : IndigoBearerToken.fromJson(json['bearerToken'] as Map<String, dynamic>),
  caRef: json['caRef'] == null
      ? null
      : IndigoCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
  repo: json['repo'] as String,
);

Map<String, dynamic> _$TentacledBitbucketServerToJson(
  TentacledBitbucketServer instance,
) => <String, dynamic>{
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
  'repo': instance.repo,
};

IndigoBasicAuth _$IndigoBasicAuthFromJson(Map<String, dynamic> json) =>
    IndigoBasicAuth(
      passwordRef: IndigoPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$IndigoBasicAuthToJson(IndigoBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

IndigoPasswordRef _$IndigoPasswordRefFromJson(Map<String, dynamic> json) =>
    IndigoPasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$IndigoPasswordRefToJson(IndigoPasswordRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndigoBearerToken _$IndigoBearerTokenFromJson(Map<String, dynamic> json) =>
    IndigoBearerToken(
      tokenRef: BraggadociousTokenRef.fromJson(
        json['tokenRef'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$IndigoBearerTokenToJson(IndigoBearerToken instance) =>
    <String, dynamic>{'tokenRef': instance.tokenRef};

BraggadociousTokenRef _$BraggadociousTokenRefFromJson(
  Map<String, dynamic> json,
) => BraggadociousTokenRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$BraggadociousTokenRefToJson(
  BraggadociousTokenRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndigoCaRef _$IndigoCaRefFromJson(Map<String, dynamic> json) => IndigoCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$IndigoCaRefToJson(IndigoCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

TentacledFilter _$TentacledFilterFromJson(Map<String, dynamic> json) =>
    TentacledFilter(
      branchMatch: json['branchMatch'] as String?,
      targetBranchMatch: json['targetBranchMatch'] as String?,
      titleMatch: json['titleMatch'] as String?,
    );

Map<String, dynamic> _$TentacledFilterToJson(TentacledFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'targetBranchMatch': instance.targetBranchMatch,
      'titleMatch': instance.titleMatch,
    };

TentacledGitea _$TentacledGiteaFromJson(Map<String, dynamic> json) =>
    TentacledGitea(
      api: json['api'] as String,
      insecure: json['insecure'] as bool?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      owner: json['owner'] as String,
      repo: json['repo'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef1.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledGiteaToJson(TentacledGitea instance) =>
    <String, dynamic>{
      'api': instance.api,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

TokenRef1 _$TokenRef1FromJson(Map<String, dynamic> json) => TokenRef1(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef1ToJson(TokenRef1 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

TentacledGithub _$TentacledGithubFromJson(Map<String, dynamic> json) =>
    TentacledGithub(
      api: json['api'] as String?,
      appSecretName: json['appSecretName'] as String?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      owner: json['owner'] as String,
      repo: json['repo'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef2.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledGithubToJson(TentacledGithub instance) =>
    <String, dynamic>{
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

TokenRef2 _$TokenRef2FromJson(Map<String, dynamic> json) => TokenRef2(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef2ToJson(TokenRef2 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

TentacledGitlab _$TentacledGitlabFromJson(Map<String, dynamic> json) =>
    TentacledGitlab(
      api: json['api'] as String?,
      caRef: json['caRef'] == null
          ? null
          : IndecentCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
      insecure: json['insecure'] as bool?,
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      project: json['project'] as String,
      pullRequestState: json['pullRequestState'] as String?,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef3.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledGitlabToJson(TentacledGitlab instance) =>
    <String, dynamic>{
      'api': instance.api,
      'caRef': instance.caRef,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'project': instance.project,
      'pullRequestState': instance.pullRequestState,
      'tokenRef': instance.tokenRef,
    };

IndecentCaRef _$IndecentCaRefFromJson(Map<String, dynamic> json) =>
    IndecentCaRef(
      configMapName: json['configMapName'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$IndecentCaRefToJson(IndecentCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

TokenRef3 _$TokenRef3FromJson(Map<String, dynamic> json) => TokenRef3(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef3ToJson(TokenRef3 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

Template4 _$Template4FromJson(Map<String, dynamic> json) => Template4(
  metadata: Metadata5.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec5.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template4ToJson(Template4 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata5 _$Metadata5FromJson(Map<String, dynamic> json) => Metadata5(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata5ToJson(Metadata5 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec5 _$Spec5FromJson(Map<String, dynamic> json) => Spec5(
  destination: Destination5.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info5.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source22.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator5.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy5.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec5ToJson(Spec5 instance) => <String, dynamic>{
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

Destination5 _$Destination5FromJson(Map<String, dynamic> json) => Destination5(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination5ToJson(Destination5 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference5 _$IgnoreDifference5FromJson(Map<String, dynamic> json) =>
    IgnoreDifference5(
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

Map<String, dynamic> _$IgnoreDifference5ToJson(IgnoreDifference5 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info5 _$Info5FromJson(Map<String, dynamic> json) =>
    Info5(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info5ToJson(Info5 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source22 _$Source22FromJson(Map<String, dynamic> json) => Source22(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory25.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm22.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize22.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin24.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source22ToJson(Source22 instance) => <String, dynamic>{
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

Directory25 _$Directory25FromJson(Map<String, dynamic> json) => Directory25(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet22.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory25ToJson(Directory25 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet22 _$Jsonnet22FromJson(Map<String, dynamic> json) => Jsonnet22(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar22.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas22.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet22ToJson(Jsonnet22 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar22 _$ExtVar22FromJson(Map<String, dynamic> json) => ExtVar22(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar22ToJson(ExtVar22 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas22 _$Tlas22FromJson(Map<String, dynamic> json) => Tlas22(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas22ToJson(Tlas22 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm22 _$Helm22FromJson(Map<String, dynamic> json) => Helm22(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter22.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter56.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm22ToJson(Helm22 instance) => <String, dynamic>{
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

FileParameter22 _$FileParameter22FromJson(Map<String, dynamic> json) =>
    FileParameter22(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter22ToJson(FileParameter22 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter56 _$Parameter56FromJson(Map<String, dynamic> json) => Parameter56(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter56ToJson(Parameter56 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize22 _$Kustomize22FromJson(Map<String, dynamic> json) => Kustomize22(
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
        (e) => e == null ? null : Patch22.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica22.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize22ToJson(Kustomize22 instance) =>
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

Patch22 _$Patch22FromJson(Map<String, dynamic> json) => Patch22(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target22.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch22ToJson(Patch22 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target22 _$Target22FromJson(Map<String, dynamic> json) => Target22(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target22ToJson(Target22 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica22 _$Replica22FromJson(Map<String, dynamic> json) =>
    Replica22(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica22ToJson(Replica22 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin24 _$Plugin24FromJson(Map<String, dynamic> json) => Plugin24(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env22.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter57.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin24ToJson(Plugin24 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env22 _$Env22FromJson(Map<String, dynamic> json) =>
    Env22(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env22ToJson(Env22 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter57 _$Parameter57FromJson(Map<String, dynamic> json) => Parameter57(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter57ToJson(Parameter57 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator5 _$SourceHydrator5FromJson(Map<String, dynamic> json) =>
    SourceHydrator5(
      drySource: DrySource5.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo5.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource5.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator5ToJson(SourceHydrator5 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource5 _$DrySource5FromJson(Map<String, dynamic> json) => DrySource5(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource5ToJson(DrySource5 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo5 _$HydrateTo5FromJson(Map<String, dynamic> json) =>
    HydrateTo5(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo5ToJson(HydrateTo5 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource5 _$SyncSource5FromJson(Map<String, dynamic> json) => SyncSource5(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource5ToJson(SyncSource5 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source23 _$Source23FromJson(Map<String, dynamic> json) => Source23(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory26.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm23.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize23.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin25.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source23ToJson(Source23 instance) => <String, dynamic>{
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

Directory26 _$Directory26FromJson(Map<String, dynamic> json) => Directory26(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet23.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory26ToJson(Directory26 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet23 _$Jsonnet23FromJson(Map<String, dynamic> json) => Jsonnet23(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet23ToJson(Jsonnet23 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar23 _$ExtVar23FromJson(Map<String, dynamic> json) => ExtVar23(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar23ToJson(ExtVar23 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas23 _$Tlas23FromJson(Map<String, dynamic> json) => Tlas23(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas23ToJson(Tlas23 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm23 _$Helm23FromJson(Map<String, dynamic> json) => Helm23(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter58.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm23ToJson(Helm23 instance) => <String, dynamic>{
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

FileParameter23 _$FileParameter23FromJson(Map<String, dynamic> json) =>
    FileParameter23(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter23ToJson(FileParameter23 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter58 _$Parameter58FromJson(Map<String, dynamic> json) => Parameter58(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter58ToJson(Parameter58 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize23 _$Kustomize23FromJson(Map<String, dynamic> json) => Kustomize23(
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
        (e) => e == null ? null : Patch23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica23.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize23ToJson(Kustomize23 instance) =>
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

Patch23 _$Patch23FromJson(Map<String, dynamic> json) => Patch23(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target23.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch23ToJson(Patch23 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target23 _$Target23FromJson(Map<String, dynamic> json) => Target23(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target23ToJson(Target23 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica23 _$Replica23FromJson(Map<String, dynamic> json) =>
    Replica23(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica23ToJson(Replica23 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin25 _$Plugin25FromJson(Map<String, dynamic> json) => Plugin25(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env23.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter59.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin25ToJson(Plugin25 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env23 _$Env23FromJson(Map<String, dynamic> json) =>
    Env23(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env23ToJson(Env23 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter59 _$Parameter59FromJson(Map<String, dynamic> json) => Parameter59(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter59ToJson(Parameter59 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy5 _$SyncPolicy5FromJson(Map<String, dynamic> json) => SyncPolicy5(
  automated: json['automated'] == null
      ? null
      : Automated5.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata5.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry5.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy5ToJson(SyncPolicy5 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated5 _$Automated5FromJson(Map<String, dynamic> json) => Automated5(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated5ToJson(Automated5 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata5 _$ManagedNamespaceMetadata5FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata5(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata5ToJson(
  ManagedNamespaceMetadata5 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry5 _$Retry5FromJson(Map<String, dynamic> json) => Retry5(
  backoff: json['backoff'] == null
      ? null
      : Backoff5.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry5ToJson(Retry5 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff5 _$Backoff5FromJson(Map<String, dynamic> json) => Backoff5(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff5ToJson(Backoff5 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

FluffyScmProvider _$FluffyScmProviderFromJson(
  Map<String, dynamic> json,
) => FluffyScmProvider(
  awsCodeCommit: json['awsCodeCommit'] == null
      ? null
      : FluffyAwsCodeCommit.fromJson(
          json['awsCodeCommit'] as Map<String, dynamic>,
        ),
  azureDevOps: json['azureDevOps'] == null
      ? null
      : FluffyAzureDevOps.fromJson(json['azureDevOps'] as Map<String, dynamic>),
  bitbucket: json['bitbucket'] == null
      ? null
      : StickyBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : StickyBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  cloneProtocol: json['cloneProtocol'] as String?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : StickyFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : StickyGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : StickyGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : StickyGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template5.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyScmProviderToJson(FluffyScmProvider instance) =>
    <String, dynamic>{
      'awsCodeCommit': instance.awsCodeCommit,
      'azureDevOps': instance.azureDevOps,
      'bitbucket': instance.bitbucket,
      'bitbucketServer': instance.bitbucketServer,
      'cloneProtocol': instance.cloneProtocol,
      'filters': instance.filters,
      'gitea': instance.gitea,
      'github': instance.github,
      'gitlab': instance.gitlab,
      'requeueAfterSeconds': instance.requeueAfterSeconds,
      'template': instance.template,
      'values': instance.values,
    };

FluffyAwsCodeCommit _$FluffyAwsCodeCommitFromJson(Map<String, dynamic> json) =>
    FluffyAwsCodeCommit(
      allBranches: json['allBranches'] as bool?,
      region: json['region'] as String?,
      role: json['role'] as String?,
      tagFilters: (json['tagFilters'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyTagFilter.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$FluffyAwsCodeCommitToJson(
  FluffyAwsCodeCommit instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'region': instance.region,
  'role': instance.role,
  'tagFilters': instance.tagFilters,
};

FluffyTagFilter _$FluffyTagFilterFromJson(Map<String, dynamic> json) =>
    FluffyTagFilter(
      key: json['key'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FluffyTagFilterToJson(FluffyTagFilter instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.value};

FluffyAzureDevOps _$FluffyAzureDevOpsFromJson(Map<String, dynamic> json) =>
    FluffyAzureDevOps(
      accessTokenRef: FluffyAccessTokenRef.fromJson(
        json['accessTokenRef'] as Map<String, dynamic>,
      ),
      allBranches: json['allBranches'] as bool?,
      api: json['api'] as String?,
      organization: json['organization'] as String,
      teamProject: json['teamProject'] as String,
    );

Map<String, dynamic> _$FluffyAzureDevOpsToJson(FluffyAzureDevOps instance) =>
    <String, dynamic>{
      'accessTokenRef': instance.accessTokenRef,
      'allBranches': instance.allBranches,
      'api': instance.api,
      'organization': instance.organization,
      'teamProject': instance.teamProject,
    };

FluffyAccessTokenRef _$FluffyAccessTokenRefFromJson(
  Map<String, dynamic> json,
) => FluffyAccessTokenRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$FluffyAccessTokenRefToJson(
  FluffyAccessTokenRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

StickyBitbucket _$StickyBitbucketFromJson(Map<String, dynamic> json) =>
    StickyBitbucket(
      allBranches: json['allBranches'] as bool?,
      appPasswordRef: FluffyAppPasswordRef.fromJson(
        json['appPasswordRef'] as Map<String, dynamic>,
      ),
      owner: json['owner'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$StickyBitbucketToJson(StickyBitbucket instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'appPasswordRef': instance.appPasswordRef,
      'owner': instance.owner,
      'user': instance.user,
    };

FluffyAppPasswordRef _$FluffyAppPasswordRefFromJson(
  Map<String, dynamic> json,
) => FluffyAppPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$FluffyAppPasswordRefToJson(
  FluffyAppPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

StickyBitbucketServer _$StickyBitbucketServerFromJson(
  Map<String, dynamic> json,
) => StickyBitbucketServer(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : IndecentBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : IndecentBearerToken.fromJson(
          json['bearerToken'] as Map<String, dynamic>,
        ),
  caRef: json['caRef'] == null
      ? null
      : HilariousCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
);

Map<String, dynamic> _$StickyBitbucketServerToJson(
  StickyBitbucketServer instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
};

IndecentBasicAuth _$IndecentBasicAuthFromJson(Map<String, dynamic> json) =>
    IndecentBasicAuth(
      passwordRef: IndecentPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$IndecentBasicAuthToJson(IndecentBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

IndecentPasswordRef _$IndecentPasswordRefFromJson(Map<String, dynamic> json) =>
    IndecentPasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$IndecentPasswordRefToJson(
  IndecentPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndecentBearerToken _$IndecentBearerTokenFromJson(Map<String, dynamic> json) =>
    IndecentBearerToken(
      tokenRef: TokenRef4.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentBearerTokenToJson(
  IndecentBearerToken instance,
) => <String, dynamic>{'tokenRef': instance.tokenRef};

TokenRef4 _$TokenRef4FromJson(Map<String, dynamic> json) => TokenRef4(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef4ToJson(TokenRef4 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

HilariousCaRef _$HilariousCaRefFromJson(Map<String, dynamic> json) =>
    HilariousCaRef(
      configMapName: json['configMapName'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$HilariousCaRefToJson(HilariousCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

StickyFilter _$StickyFilterFromJson(Map<String, dynamic> json) => StickyFilter(
  branchMatch: json['branchMatch'] as String?,
  labelMatch: json['labelMatch'] as String?,
  pathsDoNotExist: (json['pathsDoNotExist'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  pathsExist: (json['pathsExist'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  repositoryMatch: json['repositoryMatch'] as String?,
);

Map<String, dynamic> _$StickyFilterToJson(StickyFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'labelMatch': instance.labelMatch,
      'pathsDoNotExist': instance.pathsDoNotExist,
      'pathsExist': instance.pathsExist,
      'repositoryMatch': instance.repositoryMatch,
    };

StickyGitea _$StickyGiteaFromJson(Map<String, dynamic> json) => StickyGitea(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String,
  insecure: json['insecure'] as bool?,
  owner: json['owner'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef5.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StickyGiteaToJson(StickyGitea instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'insecure': instance.insecure,
      'owner': instance.owner,
      'tokenRef': instance.tokenRef,
    };

TokenRef5 _$TokenRef5FromJson(Map<String, dynamic> json) => TokenRef5(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef5ToJson(TokenRef5 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

StickyGithub _$StickyGithubFromJson(Map<String, dynamic> json) => StickyGithub(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String?,
  appSecretName: json['appSecretName'] as String?,
  organization: json['organization'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef6.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StickyGithubToJson(StickyGithub instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'organization': instance.organization,
      'tokenRef': instance.tokenRef,
    };

TokenRef6 _$TokenRef6FromJson(Map<String, dynamic> json) => TokenRef6(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef6ToJson(TokenRef6 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

StickyGitlab _$StickyGitlabFromJson(Map<String, dynamic> json) => StickyGitlab(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String?,
  caRef: json['caRef'] == null
      ? null
      : AmbitiousCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  group: json['group'] as String,
  includeSharedProjects: json['includeSharedProjects'] as bool?,
  includeSubgroups: json['includeSubgroups'] as bool?,
  insecure: json['insecure'] as bool?,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef7.fromJson(json['tokenRef'] as Map<String, dynamic>),
  topic: json['topic'] as String?,
);

Map<String, dynamic> _$StickyGitlabToJson(StickyGitlab instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'caRef': instance.caRef,
      'group': instance.group,
      'includeSharedProjects': instance.includeSharedProjects,
      'includeSubgroups': instance.includeSubgroups,
      'insecure': instance.insecure,
      'tokenRef': instance.tokenRef,
      'topic': instance.topic,
    };

AmbitiousCaRef _$AmbitiousCaRefFromJson(Map<String, dynamic> json) =>
    AmbitiousCaRef(
      configMapName: json['configMapName'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$AmbitiousCaRefToJson(AmbitiousCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

TokenRef7 _$TokenRef7FromJson(Map<String, dynamic> json) => TokenRef7(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef7ToJson(TokenRef7 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

Template5 _$Template5FromJson(Map<String, dynamic> json) => Template5(
  metadata: Metadata6.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec6.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template5ToJson(Template5 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata6 _$Metadata6FromJson(Map<String, dynamic> json) => Metadata6(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata6ToJson(Metadata6 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec6 _$Spec6FromJson(Map<String, dynamic> json) => Spec6(
  destination: Destination6.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info6.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source24.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator6.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy6.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec6ToJson(Spec6 instance) => <String, dynamic>{
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

Destination6 _$Destination6FromJson(Map<String, dynamic> json) => Destination6(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination6ToJson(Destination6 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference6 _$IgnoreDifference6FromJson(Map<String, dynamic> json) =>
    IgnoreDifference6(
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

Map<String, dynamic> _$IgnoreDifference6ToJson(IgnoreDifference6 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info6 _$Info6FromJson(Map<String, dynamic> json) =>
    Info6(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info6ToJson(Info6 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source24 _$Source24FromJson(Map<String, dynamic> json) => Source24(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory27.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm24.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize24.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin26.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source24ToJson(Source24 instance) => <String, dynamic>{
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

Directory27 _$Directory27FromJson(Map<String, dynamic> json) => Directory27(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet24.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory27ToJson(Directory27 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet24 _$Jsonnet24FromJson(Map<String, dynamic> json) => Jsonnet24(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar24.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas24.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet24ToJson(Jsonnet24 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar24 _$ExtVar24FromJson(Map<String, dynamic> json) => ExtVar24(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar24ToJson(ExtVar24 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas24 _$Tlas24FromJson(Map<String, dynamic> json) => Tlas24(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas24ToJson(Tlas24 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm24 _$Helm24FromJson(Map<String, dynamic> json) => Helm24(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter24.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter60.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm24ToJson(Helm24 instance) => <String, dynamic>{
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

FileParameter24 _$FileParameter24FromJson(Map<String, dynamic> json) =>
    FileParameter24(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter24ToJson(FileParameter24 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter60 _$Parameter60FromJson(Map<String, dynamic> json) => Parameter60(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter60ToJson(Parameter60 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize24 _$Kustomize24FromJson(Map<String, dynamic> json) => Kustomize24(
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
        (e) => e == null ? null : Patch24.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica24.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize24ToJson(Kustomize24 instance) =>
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

Patch24 _$Patch24FromJson(Map<String, dynamic> json) => Patch24(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target24.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch24ToJson(Patch24 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target24 _$Target24FromJson(Map<String, dynamic> json) => Target24(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target24ToJson(Target24 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica24 _$Replica24FromJson(Map<String, dynamic> json) =>
    Replica24(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica24ToJson(Replica24 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin26 _$Plugin26FromJson(Map<String, dynamic> json) => Plugin26(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env24.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter61.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin26ToJson(Plugin26 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env24 _$Env24FromJson(Map<String, dynamic> json) =>
    Env24(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env24ToJson(Env24 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter61 _$Parameter61FromJson(Map<String, dynamic> json) => Parameter61(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter61ToJson(Parameter61 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator6 _$SourceHydrator6FromJson(Map<String, dynamic> json) =>
    SourceHydrator6(
      drySource: DrySource6.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo6.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource6.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator6ToJson(SourceHydrator6 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource6 _$DrySource6FromJson(Map<String, dynamic> json) => DrySource6(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource6ToJson(DrySource6 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo6 _$HydrateTo6FromJson(Map<String, dynamic> json) =>
    HydrateTo6(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo6ToJson(HydrateTo6 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource6 _$SyncSource6FromJson(Map<String, dynamic> json) => SyncSource6(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource6ToJson(SyncSource6 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source25 _$Source25FromJson(Map<String, dynamic> json) => Source25(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory28.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm25.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize25.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin27.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source25ToJson(Source25 instance) => <String, dynamic>{
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

Directory28 _$Directory28FromJson(Map<String, dynamic> json) => Directory28(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet25.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory28ToJson(Directory28 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet25 _$Jsonnet25FromJson(Map<String, dynamic> json) => Jsonnet25(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet25ToJson(Jsonnet25 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar25 _$ExtVar25FromJson(Map<String, dynamic> json) => ExtVar25(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar25ToJson(ExtVar25 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas25 _$Tlas25FromJson(Map<String, dynamic> json) => Tlas25(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas25ToJson(Tlas25 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm25 _$Helm25FromJson(Map<String, dynamic> json) => Helm25(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter62.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm25ToJson(Helm25 instance) => <String, dynamic>{
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

FileParameter25 _$FileParameter25FromJson(Map<String, dynamic> json) =>
    FileParameter25(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter25ToJson(FileParameter25 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter62 _$Parameter62FromJson(Map<String, dynamic> json) => Parameter62(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter62ToJson(Parameter62 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize25 _$Kustomize25FromJson(Map<String, dynamic> json) => Kustomize25(
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
        (e) => e == null ? null : Patch25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica25.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize25ToJson(Kustomize25 instance) =>
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

Patch25 _$Patch25FromJson(Map<String, dynamic> json) => Patch25(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target25.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch25ToJson(Patch25 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target25 _$Target25FromJson(Map<String, dynamic> json) => Target25(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target25ToJson(Target25 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica25 _$Replica25FromJson(Map<String, dynamic> json) =>
    Replica25(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica25ToJson(Replica25 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin27 _$Plugin27FromJson(Map<String, dynamic> json) => Plugin27(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env25.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter63.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin27ToJson(Plugin27 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env25 _$Env25FromJson(Map<String, dynamic> json) =>
    Env25(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env25ToJson(Env25 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter63 _$Parameter63FromJson(Map<String, dynamic> json) => Parameter63(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter63ToJson(Parameter63 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy6 _$SyncPolicy6FromJson(Map<String, dynamic> json) => SyncPolicy6(
  automated: json['automated'] == null
      ? null
      : Automated6.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata6.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry6.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy6ToJson(SyncPolicy6 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated6 _$Automated6FromJson(Map<String, dynamic> json) => Automated6(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated6ToJson(Automated6 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata6 _$ManagedNamespaceMetadata6FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata6(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata6ToJson(
  ManagedNamespaceMetadata6 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry6 _$Retry6FromJson(Map<String, dynamic> json) => Retry6(
  backoff: json['backoff'] == null
      ? null
      : Backoff6.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry6ToJson(Retry6 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff6 _$Backoff6FromJson(Map<String, dynamic> json) => Backoff6(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff6ToJson(Backoff6 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

IndigoSelector _$IndigoSelectorFromJson(Map<String, dynamic> json) =>
    IndigoSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$IndigoSelectorToJson(IndigoSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

AmbitiousMatchExpression _$AmbitiousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => AmbitiousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$AmbitiousMatchExpressionToJson(
  AmbitiousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

MergeTemplate _$MergeTemplateFromJson(Map<String, dynamic> json) =>
    MergeTemplate(
      metadata: Metadata7.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: Spec7.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MergeTemplateToJson(MergeTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

Metadata7 _$Metadata7FromJson(Map<String, dynamic> json) => Metadata7(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata7ToJson(Metadata7 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec7 _$Spec7FromJson(Map<String, dynamic> json) => Spec7(
  destination: Destination7.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info7.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source26.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator7.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy7.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec7ToJson(Spec7 instance) => <String, dynamic>{
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

Destination7 _$Destination7FromJson(Map<String, dynamic> json) => Destination7(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination7ToJson(Destination7 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference7 _$IgnoreDifference7FromJson(Map<String, dynamic> json) =>
    IgnoreDifference7(
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

Map<String, dynamic> _$IgnoreDifference7ToJson(IgnoreDifference7 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info7 _$Info7FromJson(Map<String, dynamic> json) =>
    Info7(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info7ToJson(Info7 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source26 _$Source26FromJson(Map<String, dynamic> json) => Source26(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory29.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm26.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize26.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin28.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source26ToJson(Source26 instance) => <String, dynamic>{
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

Directory29 _$Directory29FromJson(Map<String, dynamic> json) => Directory29(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet26.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory29ToJson(Directory29 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet26 _$Jsonnet26FromJson(Map<String, dynamic> json) => Jsonnet26(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar26.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas26.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet26ToJson(Jsonnet26 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar26 _$ExtVar26FromJson(Map<String, dynamic> json) => ExtVar26(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar26ToJson(ExtVar26 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas26 _$Tlas26FromJson(Map<String, dynamic> json) => Tlas26(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas26ToJson(Tlas26 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm26 _$Helm26FromJson(Map<String, dynamic> json) => Helm26(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter26.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter64.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm26ToJson(Helm26 instance) => <String, dynamic>{
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

FileParameter26 _$FileParameter26FromJson(Map<String, dynamic> json) =>
    FileParameter26(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter26ToJson(FileParameter26 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter64 _$Parameter64FromJson(Map<String, dynamic> json) => Parameter64(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter64ToJson(Parameter64 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize26 _$Kustomize26FromJson(Map<String, dynamic> json) => Kustomize26(
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
        (e) => e == null ? null : Patch26.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica26.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize26ToJson(Kustomize26 instance) =>
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

Patch26 _$Patch26FromJson(Map<String, dynamic> json) => Patch26(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target26.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch26ToJson(Patch26 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target26 _$Target26FromJson(Map<String, dynamic> json) => Target26(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target26ToJson(Target26 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica26 _$Replica26FromJson(Map<String, dynamic> json) =>
    Replica26(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica26ToJson(Replica26 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin28 _$Plugin28FromJson(Map<String, dynamic> json) => Plugin28(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env26.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter65.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin28ToJson(Plugin28 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env26 _$Env26FromJson(Map<String, dynamic> json) =>
    Env26(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env26ToJson(Env26 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter65 _$Parameter65FromJson(Map<String, dynamic> json) => Parameter65(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter65ToJson(Parameter65 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator7 _$SourceHydrator7FromJson(Map<String, dynamic> json) =>
    SourceHydrator7(
      drySource: DrySource7.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo7.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource7.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator7ToJson(SourceHydrator7 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource7 _$DrySource7FromJson(Map<String, dynamic> json) => DrySource7(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource7ToJson(DrySource7 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo7 _$HydrateTo7FromJson(Map<String, dynamic> json) =>
    HydrateTo7(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo7ToJson(HydrateTo7 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource7 _$SyncSource7FromJson(Map<String, dynamic> json) => SyncSource7(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource7ToJson(SyncSource7 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source27 _$Source27FromJson(Map<String, dynamic> json) => Source27(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory30.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm27.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize27.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin29.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source27ToJson(Source27 instance) => <String, dynamic>{
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

Directory30 _$Directory30FromJson(Map<String, dynamic> json) => Directory30(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet27.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory30ToJson(Directory30 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet27 _$Jsonnet27FromJson(Map<String, dynamic> json) => Jsonnet27(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet27ToJson(Jsonnet27 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar27 _$ExtVar27FromJson(Map<String, dynamic> json) => ExtVar27(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar27ToJson(ExtVar27 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas27 _$Tlas27FromJson(Map<String, dynamic> json) => Tlas27(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas27ToJson(Tlas27 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm27 _$Helm27FromJson(Map<String, dynamic> json) => Helm27(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter66.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm27ToJson(Helm27 instance) => <String, dynamic>{
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

FileParameter27 _$FileParameter27FromJson(Map<String, dynamic> json) =>
    FileParameter27(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter27ToJson(FileParameter27 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter66 _$Parameter66FromJson(Map<String, dynamic> json) => Parameter66(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter66ToJson(Parameter66 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize27 _$Kustomize27FromJson(Map<String, dynamic> json) => Kustomize27(
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
        (e) => e == null ? null : Patch27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica27.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize27ToJson(Kustomize27 instance) =>
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

Patch27 _$Patch27FromJson(Map<String, dynamic> json) => Patch27(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target27.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch27ToJson(Patch27 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target27 _$Target27FromJson(Map<String, dynamic> json) => Target27(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target27ToJson(Target27 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica27 _$Replica27FromJson(Map<String, dynamic> json) =>
    Replica27(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica27ToJson(Replica27 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin29 _$Plugin29FromJson(Map<String, dynamic> json) => Plugin29(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env27.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter67.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin29ToJson(Plugin29 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env27 _$Env27FromJson(Map<String, dynamic> json) =>
    Env27(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env27ToJson(Env27 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter67 _$Parameter67FromJson(Map<String, dynamic> json) => Parameter67(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter67ToJson(Parameter67 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy7 _$SyncPolicy7FromJson(Map<String, dynamic> json) => SyncPolicy7(
  automated: json['automated'] == null
      ? null
      : Automated7.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata7.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry7.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy7ToJson(SyncPolicy7 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated7 _$Automated7FromJson(Map<String, dynamic> json) => Automated7(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated7ToJson(Automated7 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata7 _$ManagedNamespaceMetadata7FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata7(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata7ToJson(
  ManagedNamespaceMetadata7 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry7 _$Retry7FromJson(Map<String, dynamic> json) => Retry7(
  backoff: json['backoff'] == null
      ? null
      : Backoff7.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry7ToJson(Retry7 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff7 _$Backoff7FromJson(Map<String, dynamic> json) => Backoff7(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff7ToJson(Backoff7 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

Plugin30 _$Plugin30FromJson(Map<String, dynamic> json) => Plugin30(
  configMapRef: TentacledConfigMapRef.fromJson(
    json['configMapRef'] as Map<String, dynamic>,
  ),
  input: json['input'] == null
      ? null
      : TentacledInput.fromJson(json['input'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template6.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$Plugin30ToJson(Plugin30 instance) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'input': instance.input,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

TentacledConfigMapRef _$TentacledConfigMapRefFromJson(
  Map<String, dynamic> json,
) => TentacledConfigMapRef(name: json['name'] as String);

Map<String, dynamic> _$TentacledConfigMapRefToJson(
  TentacledConfigMapRef instance,
) => <String, dynamic>{'name': instance.name};

TentacledInput _$TentacledInputFromJson(Map<String, dynamic> json) =>
    TentacledInput(parameters: json['parameters'] as Map<String, dynamic>?);

Map<String, dynamic> _$TentacledInputToJson(TentacledInput instance) =>
    <String, dynamic>{'parameters': instance.parameters};

Template6 _$Template6FromJson(Map<String, dynamic> json) => Template6(
  metadata: Metadata8.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec8.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template6ToJson(Template6 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata8 _$Metadata8FromJson(Map<String, dynamic> json) => Metadata8(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata8ToJson(Metadata8 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec8 _$Spec8FromJson(Map<String, dynamic> json) => Spec8(
  destination: Destination8.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference8.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info8.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source28.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator8.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy8.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec8ToJson(Spec8 instance) => <String, dynamic>{
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

Destination8 _$Destination8FromJson(Map<String, dynamic> json) => Destination8(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination8ToJson(Destination8 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference8 _$IgnoreDifference8FromJson(Map<String, dynamic> json) =>
    IgnoreDifference8(
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

Map<String, dynamic> _$IgnoreDifference8ToJson(IgnoreDifference8 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info8 _$Info8FromJson(Map<String, dynamic> json) =>
    Info8(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info8ToJson(Info8 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source28 _$Source28FromJson(Map<String, dynamic> json) => Source28(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory31.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm28.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize28.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin31.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source28ToJson(Source28 instance) => <String, dynamic>{
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

Directory31 _$Directory31FromJson(Map<String, dynamic> json) => Directory31(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet28.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory31ToJson(Directory31 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet28 _$Jsonnet28FromJson(Map<String, dynamic> json) => Jsonnet28(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar28.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas28.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet28ToJson(Jsonnet28 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar28 _$ExtVar28FromJson(Map<String, dynamic> json) => ExtVar28(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar28ToJson(ExtVar28 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas28 _$Tlas28FromJson(Map<String, dynamic> json) => Tlas28(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas28ToJson(Tlas28 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm28 _$Helm28FromJson(Map<String, dynamic> json) => Helm28(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter28.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter68.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm28ToJson(Helm28 instance) => <String, dynamic>{
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

FileParameter28 _$FileParameter28FromJson(Map<String, dynamic> json) =>
    FileParameter28(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter28ToJson(FileParameter28 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter68 _$Parameter68FromJson(Map<String, dynamic> json) => Parameter68(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter68ToJson(Parameter68 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize28 _$Kustomize28FromJson(Map<String, dynamic> json) => Kustomize28(
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
        (e) => e == null ? null : Patch28.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica28.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize28ToJson(Kustomize28 instance) =>
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

Patch28 _$Patch28FromJson(Map<String, dynamic> json) => Patch28(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target28.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch28ToJson(Patch28 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target28 _$Target28FromJson(Map<String, dynamic> json) => Target28(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target28ToJson(Target28 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica28 _$Replica28FromJson(Map<String, dynamic> json) =>
    Replica28(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica28ToJson(Replica28 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin31 _$Plugin31FromJson(Map<String, dynamic> json) => Plugin31(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env28.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter69.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin31ToJson(Plugin31 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env28 _$Env28FromJson(Map<String, dynamic> json) =>
    Env28(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env28ToJson(Env28 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter69 _$Parameter69FromJson(Map<String, dynamic> json) => Parameter69(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter69ToJson(Parameter69 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator8 _$SourceHydrator8FromJson(Map<String, dynamic> json) =>
    SourceHydrator8(
      drySource: DrySource8.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo8.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource8.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator8ToJson(SourceHydrator8 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource8 _$DrySource8FromJson(Map<String, dynamic> json) => DrySource8(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource8ToJson(DrySource8 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo8 _$HydrateTo8FromJson(Map<String, dynamic> json) =>
    HydrateTo8(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo8ToJson(HydrateTo8 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource8 _$SyncSource8FromJson(Map<String, dynamic> json) => SyncSource8(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource8ToJson(SyncSource8 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source29 _$Source29FromJson(Map<String, dynamic> json) => Source29(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory32.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm29.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize29.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin32.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source29ToJson(Source29 instance) => <String, dynamic>{
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

Directory32 _$Directory32FromJson(Map<String, dynamic> json) => Directory32(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet29.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory32ToJson(Directory32 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet29 _$Jsonnet29FromJson(Map<String, dynamic> json) => Jsonnet29(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet29ToJson(Jsonnet29 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar29 _$ExtVar29FromJson(Map<String, dynamic> json) => ExtVar29(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar29ToJson(ExtVar29 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas29 _$Tlas29FromJson(Map<String, dynamic> json) => Tlas29(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas29ToJson(Tlas29 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm29 _$Helm29FromJson(Map<String, dynamic> json) => Helm29(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter70.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm29ToJson(Helm29 instance) => <String, dynamic>{
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

FileParameter29 _$FileParameter29FromJson(Map<String, dynamic> json) =>
    FileParameter29(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter29ToJson(FileParameter29 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter70 _$Parameter70FromJson(Map<String, dynamic> json) => Parameter70(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter70ToJson(Parameter70 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize29 _$Kustomize29FromJson(Map<String, dynamic> json) => Kustomize29(
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
        (e) => e == null ? null : Patch29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica29.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize29ToJson(Kustomize29 instance) =>
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

Patch29 _$Patch29FromJson(Map<String, dynamic> json) => Patch29(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target29.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch29ToJson(Patch29 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target29 _$Target29FromJson(Map<String, dynamic> json) => Target29(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target29ToJson(Target29 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica29 _$Replica29FromJson(Map<String, dynamic> json) =>
    Replica29(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica29ToJson(Replica29 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin32 _$Plugin32FromJson(Map<String, dynamic> json) => Plugin32(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env29.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter71.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin32ToJson(Plugin32 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env29 _$Env29FromJson(Map<String, dynamic> json) =>
    Env29(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env29ToJson(Env29 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter71 _$Parameter71FromJson(Map<String, dynamic> json) => Parameter71(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter71ToJson(Parameter71 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy8 _$SyncPolicy8FromJson(Map<String, dynamic> json) => SyncPolicy8(
  automated: json['automated'] == null
      ? null
      : Automated8.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata8.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry8.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy8ToJson(SyncPolicy8 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated8 _$Automated8FromJson(Map<String, dynamic> json) => Automated8(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated8ToJson(Automated8 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata8 _$ManagedNamespaceMetadata8FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata8(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata8ToJson(
  ManagedNamespaceMetadata8 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry8 _$Retry8FromJson(Map<String, dynamic> json) => Retry8(
  backoff: json['backoff'] == null
      ? null
      : Backoff8.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry8ToJson(Retry8 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff8 _$Backoff8FromJson(Map<String, dynamic> json) => Backoff8(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff8ToJson(Backoff8 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

TentacledPullRequest _$TentacledPullRequestFromJson(
  Map<String, dynamic> json,
) => TentacledPullRequest(
  azuredevops: json['azuredevops'] == null
      ? null
      : TentacledAzuredevops.fromJson(
          json['azuredevops'] as Map<String, dynamic>,
        ),
  bitbucket: json['bitbucket'] == null
      ? null
      : IndigoBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : IndigoBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  continueOnRepoNotFoundError: json['continueOnRepoNotFoundError'] as bool?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : IndigoGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : IndigoGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : IndigoGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template7.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledPullRequestToJson(
  TentacledPullRequest instance,
) => <String, dynamic>{
  'azuredevops': instance.azuredevops,
  'bitbucket': instance.bitbucket,
  'bitbucketServer': instance.bitbucketServer,
  'continueOnRepoNotFoundError': instance.continueOnRepoNotFoundError,
  'filters': instance.filters,
  'gitea': instance.gitea,
  'github': instance.github,
  'gitlab': instance.gitlab,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

TentacledAzuredevops _$TentacledAzuredevopsFromJson(
  Map<String, dynamic> json,
) => TentacledAzuredevops(
  api: json['api'] as String?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  organization: json['organization'] as String,
  project: json['project'] as String,
  repo: json['repo'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef8.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TentacledAzuredevopsToJson(
  TentacledAzuredevops instance,
) => <String, dynamic>{
  'api': instance.api,
  'labels': instance.labels,
  'organization': instance.organization,
  'project': instance.project,
  'repo': instance.repo,
  'tokenRef': instance.tokenRef,
};

TokenRef8 _$TokenRef8FromJson(Map<String, dynamic> json) => TokenRef8(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef8ToJson(TokenRef8 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

IndigoBitbucket _$IndigoBitbucketFromJson(Map<String, dynamic> json) =>
    IndigoBitbucket(
      api: json['api'] as String?,
      basicAuth: json['basicAuth'] == null
          ? null
          : HilariousBasicAuth.fromJson(
              json['basicAuth'] as Map<String, dynamic>,
            ),
      bearerToken: json['bearerToken'] == null
          ? null
          : HilariousBearerToken.fromJson(
              json['bearerToken'] as Map<String, dynamic>,
            ),
      owner: json['owner'] as String,
      repo: json['repo'] as String,
    );

Map<String, dynamic> _$IndigoBitbucketToJson(IndigoBitbucket instance) =>
    <String, dynamic>{
      'api': instance.api,
      'basicAuth': instance.basicAuth,
      'bearerToken': instance.bearerToken,
      'owner': instance.owner,
      'repo': instance.repo,
    };

HilariousBasicAuth _$HilariousBasicAuthFromJson(Map<String, dynamic> json) =>
    HilariousBasicAuth(
      passwordRef: HilariousPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$HilariousBasicAuthToJson(HilariousBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

HilariousPasswordRef _$HilariousPasswordRefFromJson(
  Map<String, dynamic> json,
) => HilariousPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$HilariousPasswordRefToJson(
  HilariousPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

HilariousBearerToken _$HilariousBearerTokenFromJson(
  Map<String, dynamic> json,
) => HilariousBearerToken(
  tokenRef: TokenRef9.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HilariousBearerTokenToJson(
  HilariousBearerToken instance,
) => <String, dynamic>{'tokenRef': instance.tokenRef};

TokenRef9 _$TokenRef9FromJson(Map<String, dynamic> json) => TokenRef9(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef9ToJson(TokenRef9 instance) => <String, dynamic>{
  'key': instance.key,
  'secretName': instance.secretName,
};

IndigoBitbucketServer _$IndigoBitbucketServerFromJson(
  Map<String, dynamic> json,
) => IndigoBitbucketServer(
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : AmbitiousBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : AmbitiousBearerToken.fromJson(
          json['bearerToken'] as Map<String, dynamic>,
        ),
  caRef: json['caRef'] == null
      ? null
      : CunningCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
  repo: json['repo'] as String,
);

Map<String, dynamic> _$IndigoBitbucketServerToJson(
  IndigoBitbucketServer instance,
) => <String, dynamic>{
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
  'repo': instance.repo,
};

AmbitiousBasicAuth _$AmbitiousBasicAuthFromJson(Map<String, dynamic> json) =>
    AmbitiousBasicAuth(
      passwordRef: AmbitiousPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$AmbitiousBasicAuthToJson(AmbitiousBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

AmbitiousPasswordRef _$AmbitiousPasswordRefFromJson(
  Map<String, dynamic> json,
) => AmbitiousPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$AmbitiousPasswordRefToJson(
  AmbitiousPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

AmbitiousBearerToken _$AmbitiousBearerTokenFromJson(
  Map<String, dynamic> json,
) => AmbitiousBearerToken(
  tokenRef: TokenRef10.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AmbitiousBearerTokenToJson(
  AmbitiousBearerToken instance,
) => <String, dynamic>{'tokenRef': instance.tokenRef};

TokenRef10 _$TokenRef10FromJson(Map<String, dynamic> json) => TokenRef10(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef10ToJson(TokenRef10 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

CunningCaRef _$CunningCaRefFromJson(Map<String, dynamic> json) => CunningCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$CunningCaRefToJson(CunningCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

IndigoFilter _$IndigoFilterFromJson(Map<String, dynamic> json) => IndigoFilter(
  branchMatch: json['branchMatch'] as String?,
  targetBranchMatch: json['targetBranchMatch'] as String?,
  titleMatch: json['titleMatch'] as String?,
);

Map<String, dynamic> _$IndigoFilterToJson(IndigoFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'targetBranchMatch': instance.targetBranchMatch,
      'titleMatch': instance.titleMatch,
    };

IndigoGitea _$IndigoGiteaFromJson(Map<String, dynamic> json) => IndigoGitea(
  api: json['api'] as String,
  insecure: json['insecure'] as bool?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  owner: json['owner'] as String,
  repo: json['repo'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef11.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoGiteaToJson(IndigoGitea instance) =>
    <String, dynamic>{
      'api': instance.api,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

TokenRef11 _$TokenRef11FromJson(Map<String, dynamic> json) => TokenRef11(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef11ToJson(TokenRef11 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndigoGithub _$IndigoGithubFromJson(Map<String, dynamic> json) => IndigoGithub(
  api: json['api'] as String?,
  appSecretName: json['appSecretName'] as String?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  owner: json['owner'] as String,
  repo: json['repo'] as String,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef12.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoGithubToJson(IndigoGithub instance) =>
    <String, dynamic>{
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'labels': instance.labels,
      'owner': instance.owner,
      'repo': instance.repo,
      'tokenRef': instance.tokenRef,
    };

TokenRef12 _$TokenRef12FromJson(Map<String, dynamic> json) => TokenRef12(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef12ToJson(TokenRef12 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndigoGitlab _$IndigoGitlabFromJson(Map<String, dynamic> json) => IndigoGitlab(
  api: json['api'] as String?,
  caRef: json['caRef'] == null
      ? null
      : MagentaCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  labels: (json['labels'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  project: json['project'] as String,
  pullRequestState: json['pullRequestState'] as String?,
  tokenRef: json['tokenRef'] == null
      ? null
      : TokenRef13.fromJson(json['tokenRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoGitlabToJson(IndigoGitlab instance) =>
    <String, dynamic>{
      'api': instance.api,
      'caRef': instance.caRef,
      'insecure': instance.insecure,
      'labels': instance.labels,
      'project': instance.project,
      'pullRequestState': instance.pullRequestState,
      'tokenRef': instance.tokenRef,
    };

MagentaCaRef _$MagentaCaRefFromJson(Map<String, dynamic> json) => MagentaCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$MagentaCaRefToJson(MagentaCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

TokenRef13 _$TokenRef13FromJson(Map<String, dynamic> json) => TokenRef13(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef13ToJson(TokenRef13 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

Template7 _$Template7FromJson(Map<String, dynamic> json) => Template7(
  metadata: Metadata9.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec9.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template7ToJson(Template7 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata9 _$Metadata9FromJson(Map<String, dynamic> json) => Metadata9(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata9ToJson(Metadata9 instance) => <String, dynamic>{
  'annotations': instance.annotations,
  'finalizers': instance.finalizers,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
};

Spec9 _$Spec9FromJson(Map<String, dynamic> json) => Spec9(
  destination: Destination9.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference9.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Info9.fromJson(e as Map<String, dynamic>))
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source30.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator9.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy9.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec9ToJson(Spec9 instance) => <String, dynamic>{
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

Destination9 _$Destination9FromJson(Map<String, dynamic> json) => Destination9(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$Destination9ToJson(Destination9 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference9 _$IgnoreDifference9FromJson(Map<String, dynamic> json) =>
    IgnoreDifference9(
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

Map<String, dynamic> _$IgnoreDifference9ToJson(IgnoreDifference9 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info9 _$Info9FromJson(Map<String, dynamic> json) =>
    Info9(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info9ToJson(Info9 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source30 _$Source30FromJson(Map<String, dynamic> json) => Source30(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory33.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm30.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize30.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin33.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source30ToJson(Source30 instance) => <String, dynamic>{
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

Directory33 _$Directory33FromJson(Map<String, dynamic> json) => Directory33(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet30.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory33ToJson(Directory33 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet30 _$Jsonnet30FromJson(Map<String, dynamic> json) => Jsonnet30(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar30.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas30.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet30ToJson(Jsonnet30 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar30 _$ExtVar30FromJson(Map<String, dynamic> json) => ExtVar30(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar30ToJson(ExtVar30 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas30 _$Tlas30FromJson(Map<String, dynamic> json) => Tlas30(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas30ToJson(Tlas30 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm30 _$Helm30FromJson(Map<String, dynamic> json) => Helm30(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter30.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter72.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm30ToJson(Helm30 instance) => <String, dynamic>{
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

FileParameter30 _$FileParameter30FromJson(Map<String, dynamic> json) =>
    FileParameter30(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter30ToJson(FileParameter30 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter72 _$Parameter72FromJson(Map<String, dynamic> json) => Parameter72(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter72ToJson(Parameter72 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize30 _$Kustomize30FromJson(Map<String, dynamic> json) => Kustomize30(
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
        (e) => e == null ? null : Patch30.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica30.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize30ToJson(Kustomize30 instance) =>
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

Patch30 _$Patch30FromJson(Map<String, dynamic> json) => Patch30(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target30.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch30ToJson(Patch30 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target30 _$Target30FromJson(Map<String, dynamic> json) => Target30(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target30ToJson(Target30 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica30 _$Replica30FromJson(Map<String, dynamic> json) =>
    Replica30(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica30ToJson(Replica30 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin33 _$Plugin33FromJson(Map<String, dynamic> json) => Plugin33(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env30.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter73.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin33ToJson(Plugin33 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env30 _$Env30FromJson(Map<String, dynamic> json) =>
    Env30(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env30ToJson(Env30 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter73 _$Parameter73FromJson(Map<String, dynamic> json) => Parameter73(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter73ToJson(Parameter73 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator9 _$SourceHydrator9FromJson(Map<String, dynamic> json) =>
    SourceHydrator9(
      drySource: DrySource9.fromJson(json['drySource'] as Map<String, dynamic>),
      hydrateTo: json['hydrateTo'] == null
          ? null
          : HydrateTo9.fromJson(json['hydrateTo'] as Map<String, dynamic>),
      syncSource: SyncSource9.fromJson(
        json['syncSource'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SourceHydrator9ToJson(SourceHydrator9 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource9 _$DrySource9FromJson(Map<String, dynamic> json) => DrySource9(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource9ToJson(DrySource9 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo9 _$HydrateTo9FromJson(Map<String, dynamic> json) =>
    HydrateTo9(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo9ToJson(HydrateTo9 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource9 _$SyncSource9FromJson(Map<String, dynamic> json) => SyncSource9(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource9ToJson(SyncSource9 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source31 _$Source31FromJson(Map<String, dynamic> json) => Source31(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory34.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm31.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize31.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin34.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source31ToJson(Source31 instance) => <String, dynamic>{
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

Directory34 _$Directory34FromJson(Map<String, dynamic> json) => Directory34(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet31.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory34ToJson(Directory34 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet31 _$Jsonnet31FromJson(Map<String, dynamic> json) => Jsonnet31(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet31ToJson(Jsonnet31 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar31 _$ExtVar31FromJson(Map<String, dynamic> json) => ExtVar31(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar31ToJson(ExtVar31 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas31 _$Tlas31FromJson(Map<String, dynamic> json) => Tlas31(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas31ToJson(Tlas31 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm31 _$Helm31FromJson(Map<String, dynamic> json) => Helm31(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter74.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm31ToJson(Helm31 instance) => <String, dynamic>{
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

FileParameter31 _$FileParameter31FromJson(Map<String, dynamic> json) =>
    FileParameter31(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter31ToJson(FileParameter31 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter74 _$Parameter74FromJson(Map<String, dynamic> json) => Parameter74(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter74ToJson(Parameter74 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize31 _$Kustomize31FromJson(Map<String, dynamic> json) => Kustomize31(
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
        (e) => e == null ? null : Patch31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica31.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize31ToJson(Kustomize31 instance) =>
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

Patch31 _$Patch31FromJson(Map<String, dynamic> json) => Patch31(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target31.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch31ToJson(Patch31 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target31 _$Target31FromJson(Map<String, dynamic> json) => Target31(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target31ToJson(Target31 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica31 _$Replica31FromJson(Map<String, dynamic> json) =>
    Replica31(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica31ToJson(Replica31 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin34 _$Plugin34FromJson(Map<String, dynamic> json) => Plugin34(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env31.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter75.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin34ToJson(Plugin34 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env31 _$Env31FromJson(Map<String, dynamic> json) =>
    Env31(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env31ToJson(Env31 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter75 _$Parameter75FromJson(Map<String, dynamic> json) => Parameter75(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter75ToJson(Parameter75 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy9 _$SyncPolicy9FromJson(Map<String, dynamic> json) => SyncPolicy9(
  automated: json['automated'] == null
      ? null
      : Automated9.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata9.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry9.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy9ToJson(SyncPolicy9 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated9 _$Automated9FromJson(Map<String, dynamic> json) => Automated9(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated9ToJson(Automated9 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata9 _$ManagedNamespaceMetadata9FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata9(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata9ToJson(
  ManagedNamespaceMetadata9 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry9 _$Retry9FromJson(Map<String, dynamic> json) => Retry9(
  backoff: json['backoff'] == null
      ? null
      : Backoff9.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry9ToJson(Retry9 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff9 _$Backoff9FromJson(Map<String, dynamic> json) => Backoff9(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff9ToJson(Backoff9 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

TentacledScmProvider _$TentacledScmProviderFromJson(
  Map<String, dynamic> json,
) => TentacledScmProvider(
  awsCodeCommit: json['awsCodeCommit'] == null
      ? null
      : TentacledAwsCodeCommit.fromJson(
          json['awsCodeCommit'] as Map<String, dynamic>,
        ),
  azureDevOps: json['azureDevOps'] == null
      ? null
      : TentacledAzureDevOps.fromJson(
          json['azureDevOps'] as Map<String, dynamic>,
        ),
  bitbucket: json['bitbucket'] == null
      ? null
      : IndecentBitbucket.fromJson(json['bitbucket'] as Map<String, dynamic>),
  bitbucketServer: json['bitbucketServer'] == null
      ? null
      : IndecentBitbucketServer.fromJson(
          json['bitbucketServer'] as Map<String, dynamic>,
        ),
  cloneProtocol: json['cloneProtocol'] as String?,
  filters: (json['filters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  gitea: json['gitea'] == null
      ? null
      : IndecentGitea.fromJson(json['gitea'] as Map<String, dynamic>),
  github: json['github'] == null
      ? null
      : IndecentGithub.fromJson(json['github'] as Map<String, dynamic>),
  gitlab: json['gitlab'] == null
      ? null
      : IndecentGitlab.fromJson(json['gitlab'] as Map<String, dynamic>),
  requeueAfterSeconds: (json['requeueAfterSeconds'] as num?)?.toInt(),
  template: json['template'] == null
      ? null
      : Template8.fromJson(json['template'] as Map<String, dynamic>),
  values: (json['values'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledScmProviderToJson(
  TentacledScmProvider instance,
) => <String, dynamic>{
  'awsCodeCommit': instance.awsCodeCommit,
  'azureDevOps': instance.azureDevOps,
  'bitbucket': instance.bitbucket,
  'bitbucketServer': instance.bitbucketServer,
  'cloneProtocol': instance.cloneProtocol,
  'filters': instance.filters,
  'gitea': instance.gitea,
  'github': instance.github,
  'gitlab': instance.gitlab,
  'requeueAfterSeconds': instance.requeueAfterSeconds,
  'template': instance.template,
  'values': instance.values,
};

TentacledAwsCodeCommit _$TentacledAwsCodeCommitFromJson(
  Map<String, dynamic> json,
) => TentacledAwsCodeCommit(
  allBranches: json['allBranches'] as bool?,
  region: json['region'] as String?,
  role: json['role'] as String?,
  tagFilters: (json['tagFilters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledTagFilter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TentacledAwsCodeCommitToJson(
  TentacledAwsCodeCommit instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'region': instance.region,
  'role': instance.role,
  'tagFilters': instance.tagFilters,
};

TentacledTagFilter _$TentacledTagFilterFromJson(Map<String, dynamic> json) =>
    TentacledTagFilter(
      key: json['key'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$TentacledTagFilterToJson(TentacledTagFilter instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.value};

TentacledAzureDevOps _$TentacledAzureDevOpsFromJson(
  Map<String, dynamic> json,
) => TentacledAzureDevOps(
  accessTokenRef: TentacledAccessTokenRef.fromJson(
    json['accessTokenRef'] as Map<String, dynamic>,
  ),
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String?,
  organization: json['organization'] as String,
  teamProject: json['teamProject'] as String,
);

Map<String, dynamic> _$TentacledAzureDevOpsToJson(
  TentacledAzureDevOps instance,
) => <String, dynamic>{
  'accessTokenRef': instance.accessTokenRef,
  'allBranches': instance.allBranches,
  'api': instance.api,
  'organization': instance.organization,
  'teamProject': instance.teamProject,
};

TentacledAccessTokenRef _$TentacledAccessTokenRefFromJson(
  Map<String, dynamic> json,
) => TentacledAccessTokenRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TentacledAccessTokenRefToJson(
  TentacledAccessTokenRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndecentBitbucket _$IndecentBitbucketFromJson(Map<String, dynamic> json) =>
    IndecentBitbucket(
      allBranches: json['allBranches'] as bool?,
      appPasswordRef: TentacledAppPasswordRef.fromJson(
        json['appPasswordRef'] as Map<String, dynamic>,
      ),
      owner: json['owner'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$IndecentBitbucketToJson(IndecentBitbucket instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'appPasswordRef': instance.appPasswordRef,
      'owner': instance.owner,
      'user': instance.user,
    };

TentacledAppPasswordRef _$TentacledAppPasswordRefFromJson(
  Map<String, dynamic> json,
) => TentacledAppPasswordRef(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TentacledAppPasswordRefToJson(
  TentacledAppPasswordRef instance,
) => <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndecentBitbucketServer _$IndecentBitbucketServerFromJson(
  Map<String, dynamic> json,
) => IndecentBitbucketServer(
  allBranches: json['allBranches'] as bool?,
  api: json['api'] as String,
  basicAuth: json['basicAuth'] == null
      ? null
      : CunningBasicAuth.fromJson(json['basicAuth'] as Map<String, dynamic>),
  bearerToken: json['bearerToken'] == null
      ? null
      : CunningBearerToken.fromJson(
          json['bearerToken'] as Map<String, dynamic>,
        ),
  caRef: json['caRef'] == null
      ? null
      : FriskyCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
  insecure: json['insecure'] as bool?,
  project: json['project'] as String,
);

Map<String, dynamic> _$IndecentBitbucketServerToJson(
  IndecentBitbucketServer instance,
) => <String, dynamic>{
  'allBranches': instance.allBranches,
  'api': instance.api,
  'basicAuth': instance.basicAuth,
  'bearerToken': instance.bearerToken,
  'caRef': instance.caRef,
  'insecure': instance.insecure,
  'project': instance.project,
};

CunningBasicAuth _$CunningBasicAuthFromJson(Map<String, dynamic> json) =>
    CunningBasicAuth(
      passwordRef: CunningPasswordRef.fromJson(
        json['passwordRef'] as Map<String, dynamic>,
      ),
      username: json['username'] as String,
    );

Map<String, dynamic> _$CunningBasicAuthToJson(CunningBasicAuth instance) =>
    <String, dynamic>{
      'passwordRef': instance.passwordRef,
      'username': instance.username,
    };

CunningPasswordRef _$CunningPasswordRefFromJson(Map<String, dynamic> json) =>
    CunningPasswordRef(
      key: json['key'] as String,
      secretName: json['secretName'] as String,
    );

Map<String, dynamic> _$CunningPasswordRefToJson(CunningPasswordRef instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

CunningBearerToken _$CunningBearerTokenFromJson(Map<String, dynamic> json) =>
    CunningBearerToken(
      tokenRef: TokenRef14.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CunningBearerTokenToJson(CunningBearerToken instance) =>
    <String, dynamic>{'tokenRef': instance.tokenRef};

TokenRef14 _$TokenRef14FromJson(Map<String, dynamic> json) => TokenRef14(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef14ToJson(TokenRef14 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

FriskyCaRef _$FriskyCaRefFromJson(Map<String, dynamic> json) => FriskyCaRef(
  configMapName: json['configMapName'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$FriskyCaRefToJson(FriskyCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

IndecentFilter _$IndecentFilterFromJson(Map<String, dynamic> json) =>
    IndecentFilter(
      branchMatch: json['branchMatch'] as String?,
      labelMatch: json['labelMatch'] as String?,
      pathsDoNotExist: (json['pathsDoNotExist'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      pathsExist: (json['pathsExist'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      repositoryMatch: json['repositoryMatch'] as String?,
    );

Map<String, dynamic> _$IndecentFilterToJson(IndecentFilter instance) =>
    <String, dynamic>{
      'branchMatch': instance.branchMatch,
      'labelMatch': instance.labelMatch,
      'pathsDoNotExist': instance.pathsDoNotExist,
      'pathsExist': instance.pathsExist,
      'repositoryMatch': instance.repositoryMatch,
    };

IndecentGitea _$IndecentGiteaFromJson(Map<String, dynamic> json) =>
    IndecentGitea(
      allBranches: json['allBranches'] as bool?,
      api: json['api'] as String,
      insecure: json['insecure'] as bool?,
      owner: json['owner'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef15.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentGiteaToJson(IndecentGitea instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'insecure': instance.insecure,
      'owner': instance.owner,
      'tokenRef': instance.tokenRef,
    };

TokenRef15 _$TokenRef15FromJson(Map<String, dynamic> json) => TokenRef15(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef15ToJson(TokenRef15 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndecentGithub _$IndecentGithubFromJson(Map<String, dynamic> json) =>
    IndecentGithub(
      allBranches: json['allBranches'] as bool?,
      api: json['api'] as String?,
      appSecretName: json['appSecretName'] as String?,
      organization: json['organization'] as String,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef16.fromJson(json['tokenRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentGithubToJson(IndecentGithub instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'appSecretName': instance.appSecretName,
      'organization': instance.organization,
      'tokenRef': instance.tokenRef,
    };

TokenRef16 _$TokenRef16FromJson(Map<String, dynamic> json) => TokenRef16(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef16ToJson(TokenRef16 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

IndecentGitlab _$IndecentGitlabFromJson(Map<String, dynamic> json) =>
    IndecentGitlab(
      allBranches: json['allBranches'] as bool?,
      api: json['api'] as String?,
      caRef: json['caRef'] == null
          ? null
          : MischievousCaRef.fromJson(json['caRef'] as Map<String, dynamic>),
      group: json['group'] as String,
      includeSharedProjects: json['includeSharedProjects'] as bool?,
      includeSubgroups: json['includeSubgroups'] as bool?,
      insecure: json['insecure'] as bool?,
      tokenRef: json['tokenRef'] == null
          ? null
          : TokenRef17.fromJson(json['tokenRef'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$IndecentGitlabToJson(IndecentGitlab instance) =>
    <String, dynamic>{
      'allBranches': instance.allBranches,
      'api': instance.api,
      'caRef': instance.caRef,
      'group': instance.group,
      'includeSharedProjects': instance.includeSharedProjects,
      'includeSubgroups': instance.includeSubgroups,
      'insecure': instance.insecure,
      'tokenRef': instance.tokenRef,
      'topic': instance.topic,
    };

MischievousCaRef _$MischievousCaRefFromJson(Map<String, dynamic> json) =>
    MischievousCaRef(
      configMapName: json['configMapName'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$MischievousCaRefToJson(MischievousCaRef instance) =>
    <String, dynamic>{
      'configMapName': instance.configMapName,
      'key': instance.key,
    };

TokenRef17 _$TokenRef17FromJson(Map<String, dynamic> json) => TokenRef17(
  key: json['key'] as String,
  secretName: json['secretName'] as String,
);

Map<String, dynamic> _$TokenRef17ToJson(TokenRef17 instance) =>
    <String, dynamic>{'key': instance.key, 'secretName': instance.secretName};

Template8 _$Template8FromJson(Map<String, dynamic> json) => Template8(
  metadata: Metadata10.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec10.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Template8ToJson(Template8 instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

Metadata10 _$Metadata10FromJson(Map<String, dynamic> json) => Metadata10(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata10ToJson(Metadata10 instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Spec10 _$Spec10FromJson(Map<String, dynamic> json) => Spec10(
  destination: Destination10.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Info10.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source32.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator10.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy10.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec10ToJson(Spec10 instance) => <String, dynamic>{
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

Destination10 _$Destination10FromJson(Map<String, dynamic> json) =>
    Destination10(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$Destination10ToJson(Destination10 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference10 _$IgnoreDifference10FromJson(Map<String, dynamic> json) =>
    IgnoreDifference10(
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

Map<String, dynamic> _$IgnoreDifference10ToJson(IgnoreDifference10 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info10 _$Info10FromJson(Map<String, dynamic> json) =>
    Info10(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info10ToJson(Info10 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source32 _$Source32FromJson(Map<String, dynamic> json) => Source32(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory35.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm32.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize32.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin35.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source32ToJson(Source32 instance) => <String, dynamic>{
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

Directory35 _$Directory35FromJson(Map<String, dynamic> json) => Directory35(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet32.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory35ToJson(Directory35 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet32 _$Jsonnet32FromJson(Map<String, dynamic> json) => Jsonnet32(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar32.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas32.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet32ToJson(Jsonnet32 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar32 _$ExtVar32FromJson(Map<String, dynamic> json) => ExtVar32(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar32ToJson(ExtVar32 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas32 _$Tlas32FromJson(Map<String, dynamic> json) => Tlas32(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas32ToJson(Tlas32 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm32 _$Helm32FromJson(Map<String, dynamic> json) => Helm32(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter32.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter76.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm32ToJson(Helm32 instance) => <String, dynamic>{
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

FileParameter32 _$FileParameter32FromJson(Map<String, dynamic> json) =>
    FileParameter32(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter32ToJson(FileParameter32 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter76 _$Parameter76FromJson(Map<String, dynamic> json) => Parameter76(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter76ToJson(Parameter76 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize32 _$Kustomize32FromJson(Map<String, dynamic> json) => Kustomize32(
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
        (e) => e == null ? null : Patch32.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica32.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize32ToJson(Kustomize32 instance) =>
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

Patch32 _$Patch32FromJson(Map<String, dynamic> json) => Patch32(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target32.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch32ToJson(Patch32 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target32 _$Target32FromJson(Map<String, dynamic> json) => Target32(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target32ToJson(Target32 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica32 _$Replica32FromJson(Map<String, dynamic> json) =>
    Replica32(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica32ToJson(Replica32 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin35 _$Plugin35FromJson(Map<String, dynamic> json) => Plugin35(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env32.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter77.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin35ToJson(Plugin35 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env32 _$Env32FromJson(Map<String, dynamic> json) =>
    Env32(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env32ToJson(Env32 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter77 _$Parameter77FromJson(Map<String, dynamic> json) => Parameter77(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter77ToJson(Parameter77 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator10 _$SourceHydrator10FromJson(
  Map<String, dynamic> json,
) => SourceHydrator10(
  drySource: DrySource10.fromJson(json['drySource'] as Map<String, dynamic>),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : HydrateTo10.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: SyncSource10.fromJson(json['syncSource'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SourceHydrator10ToJson(SourceHydrator10 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource10 _$DrySource10FromJson(Map<String, dynamic> json) => DrySource10(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource10ToJson(DrySource10 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo10 _$HydrateTo10FromJson(Map<String, dynamic> json) =>
    HydrateTo10(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo10ToJson(HydrateTo10 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource10 _$SyncSource10FromJson(Map<String, dynamic> json) => SyncSource10(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource10ToJson(SyncSource10 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source33 _$Source33FromJson(Map<String, dynamic> json) => Source33(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory36.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm33.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize33.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin36.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source33ToJson(Source33 instance) => <String, dynamic>{
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

Directory36 _$Directory36FromJson(Map<String, dynamic> json) => Directory36(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet33.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory36ToJson(Directory36 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet33 _$Jsonnet33FromJson(Map<String, dynamic> json) => Jsonnet33(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet33ToJson(Jsonnet33 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar33 _$ExtVar33FromJson(Map<String, dynamic> json) => ExtVar33(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar33ToJson(ExtVar33 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas33 _$Tlas33FromJson(Map<String, dynamic> json) => Tlas33(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas33ToJson(Tlas33 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm33 _$Helm33FromJson(Map<String, dynamic> json) => Helm33(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter78.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm33ToJson(Helm33 instance) => <String, dynamic>{
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

FileParameter33 _$FileParameter33FromJson(Map<String, dynamic> json) =>
    FileParameter33(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter33ToJson(FileParameter33 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter78 _$Parameter78FromJson(Map<String, dynamic> json) => Parameter78(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter78ToJson(Parameter78 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize33 _$Kustomize33FromJson(Map<String, dynamic> json) => Kustomize33(
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
        (e) => e == null ? null : Patch33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica33.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize33ToJson(Kustomize33 instance) =>
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

Patch33 _$Patch33FromJson(Map<String, dynamic> json) => Patch33(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target33.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch33ToJson(Patch33 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target33 _$Target33FromJson(Map<String, dynamic> json) => Target33(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target33ToJson(Target33 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica33 _$Replica33FromJson(Map<String, dynamic> json) =>
    Replica33(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica33ToJson(Replica33 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin36 _$Plugin36FromJson(Map<String, dynamic> json) => Plugin36(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env33.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter79.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin36ToJson(Plugin36 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env33 _$Env33FromJson(Map<String, dynamic> json) =>
    Env33(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env33ToJson(Env33 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter79 _$Parameter79FromJson(Map<String, dynamic> json) => Parameter79(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter79ToJson(Parameter79 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy10 _$SyncPolicy10FromJson(Map<String, dynamic> json) => SyncPolicy10(
  automated: json['automated'] == null
      ? null
      : Automated10.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata10.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry10.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy10ToJson(SyncPolicy10 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated10 _$Automated10FromJson(Map<String, dynamic> json) => Automated10(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated10ToJson(Automated10 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata10 _$ManagedNamespaceMetadata10FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata10(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata10ToJson(
  ManagedNamespaceMetadata10 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry10 _$Retry10FromJson(Map<String, dynamic> json) => Retry10(
  backoff: json['backoff'] == null
      ? null
      : Backoff10.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry10ToJson(Retry10 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff10 _$Backoff10FromJson(Map<String, dynamic> json) => Backoff10(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff10ToJson(Backoff10 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

IndecentSelector _$IndecentSelectorFromJson(Map<String, dynamic> json) =>
    IndecentSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$IndecentSelectorToJson(IndecentSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

CunningMatchExpression _$CunningMatchExpressionFromJson(
  Map<String, dynamic> json,
) => CunningMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$CunningMatchExpressionToJson(
  CunningMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

IgnoreApplicationDifference _$IgnoreApplicationDifferenceFromJson(
  Map<String, dynamic> json,
) => IgnoreApplicationDifference(
  jqPathExpressions: (json['jqPathExpressions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  jsonPointers: (json['jsonPointers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$IgnoreApplicationDifferenceToJson(
  IgnoreApplicationDifference instance,
) => <String, dynamic>{
  'jqPathExpressions': instance.jqPathExpressions,
  'jsonPointers': instance.jsonPointers,
  'name': instance.name,
};

PreservedFields _$PreservedFieldsFromJson(Map<String, dynamic> json) =>
    PreservedFields(
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$PreservedFieldsToJson(PreservedFields instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

Strategy _$StrategyFromJson(Map<String, dynamic> json) => Strategy(
  deletionOrder: json['deletionOrder'] as String?,
  rollingSync: json['rollingSync'] == null
      ? null
      : RollingSync.fromJson(json['rollingSync'] as Map<String, dynamic>),
  type: json['type'] as String?,
);

Map<String, dynamic> _$StrategyToJson(Strategy instance) => <String, dynamic>{
  'deletionOrder': instance.deletionOrder,
  'rollingSync': instance.rollingSync,
  'type': instance.type,
};

RollingSync _$RollingSyncFromJson(Map<String, dynamic> json) => RollingSync(
  steps: (json['steps'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Step.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RollingSyncToJson(RollingSync instance) =>
    <String, dynamic>{'steps': instance.steps};

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StepMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  maxUpdate: json['maxUpdate'],
);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'maxUpdate': instance.maxUpdate,
};

StepMatchExpression _$StepMatchExpressionFromJson(Map<String, dynamic> json) =>
    StepMatchExpression(
      key: json['key'] as String?,
      matchExpressionOperator: json['operator'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$StepMatchExpressionToJson(
  StepMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

SyncPolicy11 _$SyncPolicy11FromJson(Map<String, dynamic> json) => SyncPolicy11(
  applicationsSync: $enumDecodeNullable(
    _$ApplicationsSyncEnumMap,
    json['applicationsSync'],
  ),
  preserveResourcesOnDeletion: json['preserveResourcesOnDeletion'] as bool?,
);

Map<String, dynamic> _$SyncPolicy11ToJson(SyncPolicy11 instance) =>
    <String, dynamic>{
      'applicationsSync': _$ApplicationsSyncEnumMap[instance.applicationsSync],
      'preserveResourcesOnDeletion': instance.preserveResourcesOnDeletion,
    };

const _$ApplicationsSyncEnumMap = {
  ApplicationsSync.CREATE_DELETE: 'create-delete',
  ApplicationsSync.CREATE_ONLY: 'create-only',
  ApplicationsSync.CREATE_UPDATE: 'create-update',
  ApplicationsSync.SYNC: 'sync',
};

SpecTemplate _$SpecTemplateFromJson(Map<String, dynamic> json) => SpecTemplate(
  metadata: Metadata11.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec11.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecTemplateToJson(SpecTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

Metadata11 _$Metadata11FromJson(Map<String, dynamic> json) => Metadata11(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$Metadata11ToJson(Metadata11 instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'finalizers': instance.finalizers,
      'labels': instance.labels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Spec11 _$Spec11FromJson(Map<String, dynamic> json) => Spec11(
  destination: Destination11.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  ignoreDifferences: (json['ignoreDifferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IgnoreDifference11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  info: (json['info'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Info11.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  project: json['project'] as String,
  revisionHistoryLimit: (json['revisionHistoryLimit'] as num?)?.toInt(),
  source: json['source'] == null
      ? null
      : Source34.fromJson(json['source'] as Map<String, dynamic>),
  sourceHydrator: json['sourceHydrator'] == null
      ? null
      : SourceHydrator11.fromJson(
          json['sourceHydrator'] as Map<String, dynamic>,
        ),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  syncPolicy: json['syncPolicy'] == null
      ? null
      : SyncPolicy12.fromJson(json['syncPolicy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Spec11ToJson(Spec11 instance) => <String, dynamic>{
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

Destination11 _$Destination11FromJson(Map<String, dynamic> json) =>
    Destination11(
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$Destination11ToJson(Destination11 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

IgnoreDifference11 _$IgnoreDifference11FromJson(Map<String, dynamic> json) =>
    IgnoreDifference11(
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

Map<String, dynamic> _$IgnoreDifference11ToJson(IgnoreDifference11 instance) =>
    <String, dynamic>{
      'group': instance.group,
      'jqPathExpressions': instance.jqPathExpressions,
      'jsonPointers': instance.jsonPointers,
      'kind': instance.kind,
      'managedFieldsManagers': instance.managedFieldsManagers,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Info11 _$Info11FromJson(Map<String, dynamic> json) =>
    Info11(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Info11ToJson(Info11 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Source34 _$Source34FromJson(Map<String, dynamic> json) => Source34(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory37.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm34.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize34.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin37.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source34ToJson(Source34 instance) => <String, dynamic>{
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

Directory37 _$Directory37FromJson(Map<String, dynamic> json) => Directory37(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet34.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory37ToJson(Directory37 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet34 _$Jsonnet34FromJson(Map<String, dynamic> json) => Jsonnet34(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar34.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas34.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet34ToJson(Jsonnet34 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar34 _$ExtVar34FromJson(Map<String, dynamic> json) => ExtVar34(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar34ToJson(ExtVar34 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas34 _$Tlas34FromJson(Map<String, dynamic> json) => Tlas34(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas34ToJson(Tlas34 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm34 _$Helm34FromJson(Map<String, dynamic> json) => Helm34(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter34.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter80.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm34ToJson(Helm34 instance) => <String, dynamic>{
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

FileParameter34 _$FileParameter34FromJson(Map<String, dynamic> json) =>
    FileParameter34(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter34ToJson(FileParameter34 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter80 _$Parameter80FromJson(Map<String, dynamic> json) => Parameter80(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter80ToJson(Parameter80 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize34 _$Kustomize34FromJson(Map<String, dynamic> json) => Kustomize34(
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
        (e) => e == null ? null : Patch34.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica34.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize34ToJson(Kustomize34 instance) =>
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

Patch34 _$Patch34FromJson(Map<String, dynamic> json) => Patch34(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target34.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch34ToJson(Patch34 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target34 _$Target34FromJson(Map<String, dynamic> json) => Target34(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target34ToJson(Target34 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica34 _$Replica34FromJson(Map<String, dynamic> json) =>
    Replica34(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica34ToJson(Replica34 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin37 _$Plugin37FromJson(Map<String, dynamic> json) => Plugin37(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env34.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter81.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin37ToJson(Plugin37 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env34 _$Env34FromJson(Map<String, dynamic> json) =>
    Env34(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env34ToJson(Env34 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter81 _$Parameter81FromJson(Map<String, dynamic> json) => Parameter81(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter81ToJson(Parameter81 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SourceHydrator11 _$SourceHydrator11FromJson(
  Map<String, dynamic> json,
) => SourceHydrator11(
  drySource: DrySource11.fromJson(json['drySource'] as Map<String, dynamic>),
  hydrateTo: json['hydrateTo'] == null
      ? null
      : HydrateTo11.fromJson(json['hydrateTo'] as Map<String, dynamic>),
  syncSource: SyncSource11.fromJson(json['syncSource'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SourceHydrator11ToJson(SourceHydrator11 instance) =>
    <String, dynamic>{
      'drySource': instance.drySource,
      'hydrateTo': instance.hydrateTo,
      'syncSource': instance.syncSource,
    };

DrySource11 _$DrySource11FromJson(Map<String, dynamic> json) => DrySource11(
  path: json['path'] as String,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String,
);

Map<String, dynamic> _$DrySource11ToJson(DrySource11 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'repoURL': instance.repoUrl,
      'targetRevision': instance.targetRevision,
    };

HydrateTo11 _$HydrateTo11FromJson(Map<String, dynamic> json) =>
    HydrateTo11(targetBranch: json['targetBranch'] as String);

Map<String, dynamic> _$HydrateTo11ToJson(HydrateTo11 instance) =>
    <String, dynamic>{'targetBranch': instance.targetBranch};

SyncSource11 _$SyncSource11FromJson(Map<String, dynamic> json) => SyncSource11(
  path: json['path'] as String,
  targetBranch: json['targetBranch'] as String,
);

Map<String, dynamic> _$SyncSource11ToJson(SyncSource11 instance) =>
    <String, dynamic>{
      'path': instance.path,
      'targetBranch': instance.targetBranch,
    };

Source35 _$Source35FromJson(Map<String, dynamic> json) => Source35(
  chart: json['chart'] as String?,
  directory: json['directory'] == null
      ? null
      : Directory38.fromJson(json['directory'] as Map<String, dynamic>),
  helm: json['helm'] == null
      ? null
      : Helm35.fromJson(json['helm'] as Map<String, dynamic>),
  kustomize: json['kustomize'] == null
      ? null
      : Kustomize35.fromJson(json['kustomize'] as Map<String, dynamic>),
  name: json['name'] as String?,
  path: json['path'] as String?,
  plugin: json['plugin'] == null
      ? null
      : Plugin38.fromJson(json['plugin'] as Map<String, dynamic>),
  ref: json['ref'] as String?,
  repoUrl: json['repoURL'] as String,
  targetRevision: json['targetRevision'] as String?,
);

Map<String, dynamic> _$Source35ToJson(Source35 instance) => <String, dynamic>{
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

Directory38 _$Directory38FromJson(Map<String, dynamic> json) => Directory38(
  exclude: json['exclude'] as String?,
  include: json['include'] as String?,
  jsonnet: json['jsonnet'] == null
      ? null
      : Jsonnet35.fromJson(json['jsonnet'] as Map<String, dynamic>),
  recurse: json['recurse'] as bool?,
);

Map<String, dynamic> _$Directory38ToJson(Directory38 instance) =>
    <String, dynamic>{
      'exclude': instance.exclude,
      'include': instance.include,
      'jsonnet': instance.jsonnet,
      'recurse': instance.recurse,
    };

Jsonnet35 _$Jsonnet35FromJson(Map<String, dynamic> json) => Jsonnet35(
  extVars: (json['extVars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ExtVar35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  libs: (json['libs'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  tlas: (json['tlas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Tlas35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Jsonnet35ToJson(Jsonnet35 instance) => <String, dynamic>{
  'extVars': instance.extVars,
  'libs': instance.libs,
  'tlas': instance.tlas,
};

ExtVar35 _$ExtVar35FromJson(Map<String, dynamic> json) => ExtVar35(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ExtVar35ToJson(ExtVar35 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Tlas35 _$Tlas35FromJson(Map<String, dynamic> json) => Tlas35(
  code: json['code'] as bool?,
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$Tlas35ToJson(Tlas35 instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'value': instance.value,
};

Helm35 _$Helm35FromJson(Map<String, dynamic> json) => Helm35(
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  fileParameters: (json['fileParameters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FileParameter35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ignoreMissingValueFiles: json['ignoreMissingValueFiles'] as bool?,
  kubeVersion: json['kubeVersion'] as String?,
  namespace: json['namespace'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter82.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$Helm35ToJson(Helm35 instance) => <String, dynamic>{
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

FileParameter35 _$FileParameter35FromJson(Map<String, dynamic> json) =>
    FileParameter35(
      name: json['name'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$FileParameter35ToJson(FileParameter35 instance) =>
    <String, dynamic>{'name': instance.name, 'path': instance.path};

Parameter82 _$Parameter82FromJson(Map<String, dynamic> json) => Parameter82(
  forceString: json['forceString'] as bool?,
  name: json['name'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$Parameter82ToJson(Parameter82 instance) =>
    <String, dynamic>{
      'forceString': instance.forceString,
      'name': instance.name,
      'value': instance.value,
    };

Kustomize35 _$Kustomize35FromJson(Map<String, dynamic> json) => Kustomize35(
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
        (e) => e == null ? null : Patch35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  replicas: (json['replicas'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Replica35.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$Kustomize35ToJson(Kustomize35 instance) =>
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

Patch35 _$Patch35FromJson(Map<String, dynamic> json) => Patch35(
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as bool?),
  ),
  patch: json['patch'] as String?,
  path: json['path'] as String?,
  target: json['target'] == null
      ? null
      : Target35.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Patch35ToJson(Patch35 instance) => <String, dynamic>{
  'options': instance.options,
  'patch': instance.patch,
  'path': instance.path,
  'target': instance.target,
};

Target35 _$Target35FromJson(Map<String, dynamic> json) => Target35(
  annotationSelector: json['annotationSelector'] as String?,
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  labelSelector: json['labelSelector'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$Target35ToJson(Target35 instance) => <String, dynamic>{
  'annotationSelector': instance.annotationSelector,
  'group': instance.group,
  'kind': instance.kind,
  'labelSelector': instance.labelSelector,
  'name': instance.name,
  'namespace': instance.namespace,
  'version': instance.version,
};

Replica35 _$Replica35FromJson(Map<String, dynamic> json) =>
    Replica35(count: json['count'], name: json['name'] as String);

Map<String, dynamic> _$Replica35ToJson(Replica35 instance) => <String, dynamic>{
  'count': instance.count,
  'name': instance.name,
};

Plugin38 _$Plugin38FromJson(Map<String, dynamic> json) => Plugin38(
  env: (json['env'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Env35.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String?,
  parameters: (json['parameters'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Parameter83.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$Plugin38ToJson(Plugin38 instance) => <String, dynamic>{
  'env': instance.env,
  'name': instance.name,
  'parameters': instance.parameters,
};

Env35 _$Env35FromJson(Map<String, dynamic> json) =>
    Env35(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$Env35ToJson(Env35 instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

Parameter83 _$Parameter83FromJson(Map<String, dynamic> json) => Parameter83(
  array: (json['array'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  map: (json['map'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String?,
  string: json['string'] as String?,
);

Map<String, dynamic> _$Parameter83ToJson(Parameter83 instance) =>
    <String, dynamic>{
      'array': instance.array,
      'map': instance.map,
      'name': instance.name,
      'string': instance.string,
    };

SyncPolicy12 _$SyncPolicy12FromJson(Map<String, dynamic> json) => SyncPolicy12(
  automated: json['automated'] == null
      ? null
      : Automated11.fromJson(json['automated'] as Map<String, dynamic>),
  managedNamespaceMetadata: json['managedNamespaceMetadata'] == null
      ? null
      : ManagedNamespaceMetadata11.fromJson(
          json['managedNamespaceMetadata'] as Map<String, dynamic>,
        ),
  retry: json['retry'] == null
      ? null
      : Retry11.fromJson(json['retry'] as Map<String, dynamic>),
  syncOptions: (json['syncOptions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$SyncPolicy12ToJson(SyncPolicy12 instance) =>
    <String, dynamic>{
      'automated': instance.automated,
      'managedNamespaceMetadata': instance.managedNamespaceMetadata,
      'retry': instance.retry,
      'syncOptions': instance.syncOptions,
    };

Automated11 _$Automated11FromJson(Map<String, dynamic> json) => Automated11(
  allowEmpty: json['allowEmpty'] as bool?,
  enabled: json['enabled'] as bool?,
  prune: json['prune'] as bool?,
  selfHeal: json['selfHeal'] as bool?,
);

Map<String, dynamic> _$Automated11ToJson(Automated11 instance) =>
    <String, dynamic>{
      'allowEmpty': instance.allowEmpty,
      'enabled': instance.enabled,
      'prune': instance.prune,
      'selfHeal': instance.selfHeal,
    };

ManagedNamespaceMetadata11 _$ManagedNamespaceMetadata11FromJson(
  Map<String, dynamic> json,
) => ManagedNamespaceMetadata11(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ManagedNamespaceMetadata11ToJson(
  ManagedNamespaceMetadata11 instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

Retry11 _$Retry11FromJson(Map<String, dynamic> json) => Retry11(
  backoff: json['backoff'] == null
      ? null
      : Backoff11.fromJson(json['backoff'] as Map<String, dynamic>),
  limit: (json['limit'] as num?)?.toInt(),
  refresh: json['refresh'] as bool?,
);

Map<String, dynamic> _$Retry11ToJson(Retry11 instance) => <String, dynamic>{
  'backoff': instance.backoff,
  'limit': instance.limit,
  'refresh': instance.refresh,
};

Backoff11 _$Backoff11FromJson(Map<String, dynamic> json) => Backoff11(
  duration: json['duration'] as String?,
  factor: (json['factor'] as num?)?.toInt(),
  maxDuration: json['maxDuration'] as String?,
);

Map<String, dynamic> _$Backoff11ToJson(Backoff11 instance) => <String, dynamic>{
  'duration': instance.duration,
  'factor': instance.factor,
  'maxDuration': instance.maxDuration,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  applicationStatus: (json['applicationStatus'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ApplicationStatus.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resources: (json['resources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Resource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourcesCount: (json['resourcesCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'applicationStatus': instance.applicationStatus,
  'conditions': instance.conditions,
  'resources': instance.resources,
  'resourcesCount': instance.resourcesCount,
};

ApplicationStatus _$ApplicationStatusFromJson(Map<String, dynamic> json) =>
    ApplicationStatus(
      application: json['application'] as String,
      lastTransitionTime: json['lastTransitionTime'] == null
          ? null
          : DateTime.parse(json['lastTransitionTime'] as String),
      message: json['message'] as String,
      status: json['status'] as String,
      step: json['step'] as String,
      targetRevisions: (json['targetRevisions'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$ApplicationStatusToJson(ApplicationStatus instance) =>
    <String, dynamic>{
      'application': instance.application,
      'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
      'step': instance.step,
      'targetRevisions': instance.targetRevisions,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  reason: json['reason'] as String,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
  group: json['group'] as String?,
  health: json['health'] == null
      ? null
      : Health.fromJson(json['health'] as Map<String, dynamic>),
  hook: json['hook'] as bool?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  requiresDeletionConfirmation: json['requiresDeletionConfirmation'] as bool?,
  requiresPruning: json['requiresPruning'] as bool?,
  status: json['status'] as String?,
  syncWave: (json['syncWave'] as num?)?.toInt(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
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

Health _$HealthFromJson(Map<String, dynamic> json) => Health(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$HealthToJson(Health instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'status': instance.status,
};

ApplicationsetlistArgoprojV1Alpha1Metadata
_$ApplicationsetlistArgoprojV1Alpha1MetadataFromJson(
  Map<String, dynamic> json,
) => ApplicationsetlistArgoprojV1Alpha1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ApplicationsetlistArgoprojV1Alpha1MetadataToJson(
  ApplicationsetlistArgoprojV1Alpha1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
