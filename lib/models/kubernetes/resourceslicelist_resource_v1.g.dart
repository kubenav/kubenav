// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resourceslicelist_resource_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceslicelistResourceV1 _$ResourceslicelistResourceV1FromJson(
  Map<String, dynamic> json,
) => ResourceslicelistResourceV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ResourceslicelistResourceV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ResourceslicelistResourceV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ResourceslicelistResourceV1ToJson(
  ResourceslicelistResourceV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ResourceslicelistResourceV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.RESOURCE_K8_S_IO_V1: 'resource.k8s.io/v1',
};

const _$ResourceslicelistResourceV1KindEnumMap = {
  ResourceslicelistResourceV1Kind.RESOURCE_SLICE_LIST: 'ResourceSliceList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
};

const _$ItemKindEnumMap = {ItemKind.RESOURCE_SLICE: 'ResourceSlice'};

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
  allNodes: json['allNodes'] as bool?,
  devices: (json['devices'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Device.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  driver: json['driver'] as String,
  nodeName: json['nodeName'] as String?,
  nodeSelector: json['nodeSelector'] == null
      ? null
      : SpecNodeSelector.fromJson(json['nodeSelector'] as Map<String, dynamic>),
  perDeviceNodeSelection: json['perDeviceNodeSelection'] as bool?,
  pool: Pool.fromJson(json['pool'] as Map<String, dynamic>),
  sharedCounters: (json['sharedCounters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SharedCounter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'allNodes': instance.allNodes,
  'devices': instance.devices,
  'driver': instance.driver,
  'nodeName': instance.nodeName,
  'nodeSelector': instance.nodeSelector,
  'perDeviceNodeSelection': instance.perDeviceNodeSelection,
  'pool': instance.pool,
  'sharedCounters': instance.sharedCounters,
};

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
  allNodes: json['allNodes'] as bool?,
  allowMultipleAllocations: json['allowMultipleAllocations'] as bool?,
  attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      e == null ? null : Attribute.fromJson(e as Map<String, dynamic>),
    ),
  ),
  bindingConditions: (json['bindingConditions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  bindingFailureConditions: (json['bindingFailureConditions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  bindsToNode: json['bindsToNode'] as bool?,
  capacity: (json['capacity'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      e == null ? null : Capacity.fromJson(e as Map<String, dynamic>),
    ),
  ),
  consumesCounters: (json['consumesCounters'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ConsumesCounter.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String,
  nodeName: json['nodeName'] as String?,
  nodeSelector: json['nodeSelector'] == null
      ? null
      : DeviceNodeSelector.fromJson(
          json['nodeSelector'] as Map<String, dynamic>,
        ),
  taints: (json['taints'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Taint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'allNodes': instance.allNodes,
  'allowMultipleAllocations': instance.allowMultipleAllocations,
  'attributes': instance.attributes,
  'bindingConditions': instance.bindingConditions,
  'bindingFailureConditions': instance.bindingFailureConditions,
  'bindsToNode': instance.bindsToNode,
  'capacity': instance.capacity,
  'consumesCounters': instance.consumesCounters,
  'name': instance.name,
  'nodeName': instance.nodeName,
  'nodeSelector': instance.nodeSelector,
  'taints': instance.taints,
};

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
  attributeBool: json['bool'] as bool?,
  attributeInt: (json['int'] as num?)?.toInt(),
  string: json['string'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
  'bool': instance.attributeBool,
  'int': instance.attributeInt,
  'string': instance.string,
  'version': instance.version,
};

Capacity _$CapacityFromJson(Map<String, dynamic> json) => Capacity(
  requestPolicy: json['requestPolicy'] == null
      ? null
      : RequestPolicy.fromJson(json['requestPolicy'] as Map<String, dynamic>),
  value: json['value'],
);

Map<String, dynamic> _$CapacityToJson(Capacity instance) => <String, dynamic>{
  'requestPolicy': instance.requestPolicy,
  'value': instance.value,
};

RequestPolicy _$RequestPolicyFromJson(Map<String, dynamic> json) =>
    RequestPolicy(
      requestPolicyDefault: json['default'],
      validRange: json['validRange'] == null
          ? null
          : ValidRange.fromJson(json['validRange'] as Map<String, dynamic>),
      validValues: json['validValues'] as List<dynamic>?,
    );

Map<String, dynamic> _$RequestPolicyToJson(RequestPolicy instance) =>
    <String, dynamic>{
      'default': instance.requestPolicyDefault,
      'validRange': instance.validRange,
      'validValues': instance.validValues,
    };

ValidRange _$ValidRangeFromJson(Map<String, dynamic> json) =>
    ValidRange(max: json['max'], min: json['min'], step: json['step']);

Map<String, dynamic> _$ValidRangeToJson(ValidRange instance) =>
    <String, dynamic>{
      'max': instance.max,
      'min': instance.min,
      'step': instance.step,
    };

ConsumesCounter _$ConsumesCounterFromJson(Map<String, dynamic> json) =>
    ConsumesCounter(
      counters: (json['counters'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ConsumesCounterCounter.fromJson(e as Map<String, dynamic>),
        ),
      ),
      counterSet: json['counterSet'] as String,
    );

Map<String, dynamic> _$ConsumesCounterToJson(ConsumesCounter instance) =>
    <String, dynamic>{
      'counters': instance.counters,
      'counterSet': instance.counterSet,
    };

ConsumesCounterCounter _$ConsumesCounterCounterFromJson(
  Map<String, dynamic> json,
) => ConsumesCounterCounter(value: json['value']);

Map<String, dynamic> _$ConsumesCounterCounterToJson(
  ConsumesCounterCounter instance,
) => <String, dynamic>{'value': instance.value};

DeviceNodeSelector _$DeviceNodeSelectorFromJson(Map<String, dynamic> json) =>
    DeviceNodeSelector(
      nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
          .map(
            (e) => e == null
                ? null
                : PurpleNodeSelectorTerm.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$DeviceNodeSelectorToJson(DeviceNodeSelector instance) =>
    <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

PurpleNodeSelectorTerm _$PurpleNodeSelectorTermFromJson(
  Map<String, dynamic> json,
) => PurpleNodeSelectorTerm(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchFields: (json['matchFields'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleMatchField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurpleNodeSelectorTermToJson(
  PurpleNodeSelectorTerm instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchFields': instance.matchFields,
};

PurpleMatchExpression _$PurpleMatchExpressionFromJson(
  Map<String, dynamic> json,
) => PurpleMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PurpleMatchExpressionToJson(
  PurpleMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': _$OperatorEnumMap[instance.matchExpressionOperator]!,
  'values': instance.values,
};

const _$OperatorEnumMap = {
  Operator.DOES_NOT_EXIST: 'DoesNotExist',
  Operator.EXISTS: 'Exists',
  Operator.GT: 'Gt',
  Operator.IN: 'In',
  Operator.LT: 'Lt',
  Operator.NOT_IN: 'NotIn',
};

PurpleMatchField _$PurpleMatchFieldFromJson(Map<String, dynamic> json) =>
    PurpleMatchField(
      key: json['key'] as String,
      matchFieldOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$PurpleMatchFieldToJson(PurpleMatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.matchFieldOperator]!,
      'values': instance.values,
    };

Taint _$TaintFromJson(Map<String, dynamic> json) => Taint(
  effect: $enumDecode(_$EffectEnumMap, json['effect']),
  key: json['key'] as String,
  timeAdded: json['timeAdded'] == null
      ? null
      : DateTime.parse(json['timeAdded'] as String),
  value: json['value'] as String?,
);

Map<String, dynamic> _$TaintToJson(Taint instance) => <String, dynamic>{
  'effect': _$EffectEnumMap[instance.effect]!,
  'key': instance.key,
  'timeAdded': instance.timeAdded?.toIso8601String(),
  'value': instance.value,
};

const _$EffectEnumMap = {
  Effect.NONE: 'None',
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
};

SpecNodeSelector _$SpecNodeSelectorFromJson(Map<String, dynamic> json) =>
    SpecNodeSelector(
      nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
          .map(
            (e) => e == null
                ? null
                : FluffyNodeSelectorTerm.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$SpecNodeSelectorToJson(SpecNodeSelector instance) =>
    <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

FluffyNodeSelectorTerm _$FluffyNodeSelectorTermFromJson(
  Map<String, dynamic> json,
) => FluffyNodeSelectorTerm(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchFields: (json['matchFields'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyMatchField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffyNodeSelectorTermToJson(
  FluffyNodeSelectorTerm instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchFields': instance.matchFields,
};

FluffyMatchExpression _$FluffyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => FluffyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FluffyMatchExpressionToJson(
  FluffyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': _$OperatorEnumMap[instance.matchExpressionOperator]!,
  'values': instance.values,
};

FluffyMatchField _$FluffyMatchFieldFromJson(Map<String, dynamic> json) =>
    FluffyMatchField(
      key: json['key'] as String,
      matchFieldOperator: $enumDecode(_$OperatorEnumMap, json['operator']),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FluffyMatchFieldToJson(FluffyMatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.matchFieldOperator]!,
      'values': instance.values,
    };

Pool _$PoolFromJson(Map<String, dynamic> json) => Pool(
  generation: (json['generation'] as num).toInt(),
  name: json['name'] as String,
  resourceSliceCount: (json['resourceSliceCount'] as num).toInt(),
);

Map<String, dynamic> _$PoolToJson(Pool instance) => <String, dynamic>{
  'generation': instance.generation,
  'name': instance.name,
  'resourceSliceCount': instance.resourceSliceCount,
};

SharedCounter _$SharedCounterFromJson(Map<String, dynamic> json) =>
    SharedCounter(
      counters: (json['counters'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          e == null
              ? null
              : SharedCounterCounter.fromJson(e as Map<String, dynamic>),
        ),
      ),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SharedCounterToJson(SharedCounter instance) =>
    <String, dynamic>{'counters': instance.counters, 'name': instance.name};

SharedCounterCounter _$SharedCounterCounterFromJson(
  Map<String, dynamic> json,
) => SharedCounterCounter(value: json['value']);

Map<String, dynamic> _$SharedCounterCounterToJson(
  SharedCounterCounter instance,
) => <String, dynamic>{'value': instance.value};

ResourceslicelistResourceV1Metadata
_$ResourceslicelistResourceV1MetadataFromJson(Map<String, dynamic> json) =>
    ResourceslicelistResourceV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ResourceslicelistResourceV1MetadataToJson(
  ResourceslicelistResourceV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
