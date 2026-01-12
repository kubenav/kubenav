// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontalpodautoscalerlist_autoscaling_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorizontalpodautoscalerlistAutoscalingV1
_$HorizontalpodautoscalerlistAutoscalingV1FromJson(Map<String, dynamic> json) =>
    HorizontalpodautoscalerlistAutoscalingV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(
        _$HorizontalpodautoscalerlistAutoscalingV1KindEnumMap,
        json['kind'],
      ),
      metadata: json['metadata'] == null
          ? null
          : HorizontalpodautoscalerlistAutoscalingV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HorizontalpodautoscalerlistAutoscalingV1ToJson(
  HorizontalpodautoscalerlistAutoscalingV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$HorizontalpodautoscalerlistAutoscalingV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.AUTOSCALING_V1: 'autoscaling/v1'};

const _$HorizontalpodautoscalerlistAutoscalingV1KindEnumMap = {
  HorizontalpodautoscalerlistAutoscalingV1Kind.HORIZONTAL_POD_AUTOSCALER_LIST:
      'HorizontalPodAutoscalerList',
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
  ItemKind.HORIZONTAL_POD_AUTOSCALER: 'HorizontalPodAutoscaler',
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
  maxReplicas: (json['maxReplicas'] as num).toInt(),
  minReplicas: (json['minReplicas'] as num?)?.toInt(),
  scaleTargetRef: ScaleTargetRef.fromJson(
    json['scaleTargetRef'] as Map<String, dynamic>,
  ),
  targetCpuUtilizationPercentage:
      (json['targetCPUUtilizationPercentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'maxReplicas': instance.maxReplicas,
  'minReplicas': instance.minReplicas,
  'scaleTargetRef': instance.scaleTargetRef,
  'targetCPUUtilizationPercentage': instance.targetCpuUtilizationPercentage,
};

ScaleTargetRef _$ScaleTargetRefFromJson(Map<String, dynamic> json) =>
    ScaleTargetRef(
      apiVersion: json['apiVersion'] as String?,
      kind: json['kind'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ScaleTargetRefToJson(ScaleTargetRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'kind': instance.kind,
      'name': instance.name,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  currentCpuUtilizationPercentage:
      (json['currentCPUUtilizationPercentage'] as num?)?.toInt(),
  currentReplicas: (json['currentReplicas'] as num).toInt(),
  desiredReplicas: (json['desiredReplicas'] as num).toInt(),
  lastScaleTime: json['lastScaleTime'] == null
      ? null
      : DateTime.parse(json['lastScaleTime'] as String),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'currentCPUUtilizationPercentage': instance.currentCpuUtilizationPercentage,
  'currentReplicas': instance.currentReplicas,
  'desiredReplicas': instance.desiredReplicas,
  'lastScaleTime': instance.lastScaleTime?.toIso8601String(),
  'observedGeneration': instance.observedGeneration,
};

HorizontalpodautoscalerlistAutoscalingV1Metadata
_$HorizontalpodautoscalerlistAutoscalingV1MetadataFromJson(
  Map<String, dynamic> json,
) => HorizontalpodautoscalerlistAutoscalingV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$HorizontalpodautoscalerlistAutoscalingV1MetadataToJson(
  HorizontalpodautoscalerlistAutoscalingV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
