// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtimeclasslist_node_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuntimeclasslistNodeV1 _$RuntimeclasslistNodeV1FromJson(
  Map<String, dynamic> json,
) => RuntimeclasslistNodeV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(_$RuntimeclasslistNodeV1KindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : RuntimeclasslistNodeV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RuntimeclasslistNodeV1ToJson(
  RuntimeclasslistNodeV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$RuntimeclasslistNodeV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.NODE_K8_S_IO_V1: 'node.k8s.io/v1'};

const _$RuntimeclasslistNodeV1KindEnumMap = {
  RuntimeclasslistNodeV1Kind.RUNTIME_CLASS_LIST: 'RuntimeClassList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  handler: json['handler'] as String,
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  overhead: json['overhead'] == null
      ? null
      : Overhead.fromJson(json['overhead'] as Map<String, dynamic>),
  scheduling: json['scheduling'] == null
      ? null
      : Scheduling.fromJson(json['scheduling'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'handler': instance.handler,
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'overhead': instance.overhead,
  'scheduling': instance.scheduling,
};

const _$ItemKindEnumMap = {ItemKind.RUNTIME_CLASS: 'RuntimeClass'};

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

Overhead _$OverheadFromJson(Map<String, dynamic> json) =>
    Overhead(podFixed: json['podFixed'] as Map<String, dynamic>?);

Map<String, dynamic> _$OverheadToJson(Overhead instance) => <String, dynamic>{
  'podFixed': instance.podFixed,
};

Scheduling _$SchedulingFromJson(Map<String, dynamic> json) => Scheduling(
  nodeSelector: (json['nodeSelector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Toleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SchedulingToJson(Scheduling instance) =>
    <String, dynamic>{
      'nodeSelector': instance.nodeSelector,
      'tolerations': instance.tolerations,
    };

Toleration _$TolerationFromJson(Map<String, dynamic> json) => Toleration(
  effect: $enumDecodeNullable(_$EffectEnumMap, json['effect']),
  key: json['key'] as String?,
  tolerationOperator: $enumDecodeNullable(_$OperatorEnumMap, json['operator']),
  tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
  value: json['value'] as String?,
);

Map<String, dynamic> _$TolerationToJson(Toleration instance) =>
    <String, dynamic>{
      'effect': _$EffectEnumMap[instance.effect],
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.tolerationOperator],
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

const _$EffectEnumMap = {
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
  Effect.PREFER_NO_SCHEDULE: 'PreferNoSchedule',
};

const _$OperatorEnumMap = {
  Operator.EQUAL: 'Equal',
  Operator.EXISTS: 'Exists',
  Operator.GT: 'Gt',
  Operator.LT: 'Lt',
};

RuntimeclasslistNodeV1Metadata _$RuntimeclasslistNodeV1MetadataFromJson(
  Map<String, dynamic> json,
) => RuntimeclasslistNodeV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$RuntimeclasslistNodeV1MetadataToJson(
  RuntimeclasslistNodeV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
