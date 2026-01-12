// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontalpodautoscalerlist_autoscaling_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorizontalpodautoscalerlistAutoscalingV2
_$HorizontalpodautoscalerlistAutoscalingV2FromJson(Map<String, dynamic> json) =>
    HorizontalpodautoscalerlistAutoscalingV2(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(
        _$HorizontalpodautoscalerlistAutoscalingV2KindEnumMap,
        json['kind'],
      ),
      metadata: json['metadata'] == null
          ? null
          : HorizontalpodautoscalerlistAutoscalingV2Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HorizontalpodautoscalerlistAutoscalingV2ToJson(
  HorizontalpodautoscalerlistAutoscalingV2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$HorizontalpodautoscalerlistAutoscalingV2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.AUTOSCALING_V2: 'autoscaling/v2'};

const _$HorizontalpodautoscalerlistAutoscalingV2KindEnumMap = {
  HorizontalpodautoscalerlistAutoscalingV2Kind.HORIZONTAL_POD_AUTOSCALER_LIST:
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
  behavior: json['behavior'] == null
      ? null
      : Behavior.fromJson(json['behavior'] as Map<String, dynamic>),
  maxReplicas: (json['maxReplicas'] as num).toInt(),
  metrics: (json['metrics'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : SpecMetric.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  minReplicas: (json['minReplicas'] as num?)?.toInt(),
  scaleTargetRef: ScaleTargetRef.fromJson(
    json['scaleTargetRef'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'behavior': instance.behavior,
  'maxReplicas': instance.maxReplicas,
  'metrics': instance.metrics,
  'minReplicas': instance.minReplicas,
  'scaleTargetRef': instance.scaleTargetRef,
};

Behavior _$BehaviorFromJson(Map<String, dynamic> json) => Behavior(
  scaleDown: json['scaleDown'] == null
      ? null
      : ScaleDown.fromJson(json['scaleDown'] as Map<String, dynamic>),
  scaleUp: json['scaleUp'] == null
      ? null
      : ScaleUp.fromJson(json['scaleUp'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BehaviorToJson(Behavior instance) => <String, dynamic>{
  'scaleDown': instance.scaleDown,
  'scaleUp': instance.scaleUp,
};

ScaleDown _$ScaleDownFromJson(Map<String, dynamic> json) => ScaleDown(
  policies: (json['policies'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ScaleDownPolicy.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  selectPolicy: json['selectPolicy'] as String?,
  stabilizationWindowSeconds: (json['stabilizationWindowSeconds'] as num?)
      ?.toInt(),
  tolerance: json['tolerance'],
);

Map<String, dynamic> _$ScaleDownToJson(ScaleDown instance) => <String, dynamic>{
  'policies': instance.policies,
  'selectPolicy': instance.selectPolicy,
  'stabilizationWindowSeconds': instance.stabilizationWindowSeconds,
  'tolerance': instance.tolerance,
};

ScaleDownPolicy _$ScaleDownPolicyFromJson(Map<String, dynamic> json) =>
    ScaleDownPolicy(
      periodSeconds: (json['periodSeconds'] as num).toInt(),
      type: json['type'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$ScaleDownPolicyToJson(ScaleDownPolicy instance) =>
    <String, dynamic>{
      'periodSeconds': instance.periodSeconds,
      'type': instance.type,
      'value': instance.value,
    };

ScaleUp _$ScaleUpFromJson(Map<String, dynamic> json) => ScaleUp(
  policies: (json['policies'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ScaleUpPolicy.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  selectPolicy: json['selectPolicy'] as String?,
  stabilizationWindowSeconds: (json['stabilizationWindowSeconds'] as num?)
      ?.toInt(),
  tolerance: json['tolerance'],
);

Map<String, dynamic> _$ScaleUpToJson(ScaleUp instance) => <String, dynamic>{
  'policies': instance.policies,
  'selectPolicy': instance.selectPolicy,
  'stabilizationWindowSeconds': instance.stabilizationWindowSeconds,
  'tolerance': instance.tolerance,
};

ScaleUpPolicy _$ScaleUpPolicyFromJson(Map<String, dynamic> json) =>
    ScaleUpPolicy(
      periodSeconds: (json['periodSeconds'] as num).toInt(),
      type: json['type'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$ScaleUpPolicyToJson(ScaleUpPolicy instance) =>
    <String, dynamic>{
      'periodSeconds': instance.periodSeconds,
      'type': instance.type,
      'value': instance.value,
    };

SpecMetric _$SpecMetricFromJson(Map<String, dynamic> json) => SpecMetric(
  containerResource: json['containerResource'] == null
      ? null
      : MetricContainerResource.fromJson(
          json['containerResource'] as Map<String, dynamic>,
        ),
  metricExternal: json['external'] == null
      ? null
      : MetricExternal.fromJson(json['external'] as Map<String, dynamic>),
  object: json['object'] == null
      ? null
      : MetricObject.fromJson(json['object'] as Map<String, dynamic>),
  pods: json['pods'] == null
      ? null
      : MetricPods.fromJson(json['pods'] as Map<String, dynamic>),
  resource: json['resource'] == null
      ? null
      : MetricResource.fromJson(json['resource'] as Map<String, dynamic>),
  type: json['type'] as String,
);

Map<String, dynamic> _$SpecMetricToJson(SpecMetric instance) =>
    <String, dynamic>{
      'containerResource': instance.containerResource,
      'external': instance.metricExternal,
      'object': instance.object,
      'pods': instance.pods,
      'resource': instance.resource,
      'type': instance.type,
    };

MetricContainerResource _$MetricContainerResourceFromJson(
  Map<String, dynamic> json,
) => MetricContainerResource(
  container: json['container'] as String,
  name: json['name'] as String,
  target: ContainerResourceTarget.fromJson(
    json['target'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MetricContainerResourceToJson(
  MetricContainerResource instance,
) => <String, dynamic>{
  'container': instance.container,
  'name': instance.name,
  'target': instance.target,
};

ContainerResourceTarget _$ContainerResourceTargetFromJson(
  Map<String, dynamic> json,
) => ContainerResourceTarget(
  averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
  averageValue: json['averageValue'],
  type: json['type'] as String,
  value: json['value'],
);

Map<String, dynamic> _$ContainerResourceTargetToJson(
  ContainerResourceTarget instance,
) => <String, dynamic>{
  'averageUtilization': instance.averageUtilization,
  'averageValue': instance.averageValue,
  'type': instance.type,
  'value': instance.value,
};

MetricExternal _$MetricExternalFromJson(Map<String, dynamic> json) =>
    MetricExternal(
      metric: PurpleMetric.fromJson(json['metric'] as Map<String, dynamic>),
      target: ExternalTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetricExternalToJson(MetricExternal instance) =>
    <String, dynamic>{'metric': instance.metric, 'target': instance.target};

PurpleMetric _$PurpleMetricFromJson(Map<String, dynamic> json) => PurpleMetric(
  name: json['name'] as String,
  selector: json['selector'] == null
      ? null
      : PurpleSelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurpleMetricToJson(PurpleMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

PurpleSelector _$PurpleSelectorFromJson(Map<String, dynamic> json) =>
    PurpleSelector(
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

Map<String, dynamic> _$PurpleSelectorToJson(PurpleSelector instance) =>
    <String, dynamic>{
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

ExternalTarget _$ExternalTargetFromJson(Map<String, dynamic> json) =>
    ExternalTarget(
      averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
      averageValue: json['averageValue'],
      type: json['type'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$ExternalTargetToJson(ExternalTarget instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'type': instance.type,
      'value': instance.value,
    };

MetricObject _$MetricObjectFromJson(Map<String, dynamic> json) => MetricObject(
  describedObject: PurpleDescribedObject.fromJson(
    json['describedObject'] as Map<String, dynamic>,
  ),
  metric: FluffyMetric.fromJson(json['metric'] as Map<String, dynamic>),
  target: ObjectTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetricObjectToJson(MetricObject instance) =>
    <String, dynamic>{
      'describedObject': instance.describedObject,
      'metric': instance.metric,
      'target': instance.target,
    };

PurpleDescribedObject _$PurpleDescribedObjectFromJson(
  Map<String, dynamic> json,
) => PurpleDescribedObject(
  apiVersion: json['apiVersion'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$PurpleDescribedObjectToJson(
  PurpleDescribedObject instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': instance.kind,
  'name': instance.name,
};

FluffyMetric _$FluffyMetricFromJson(Map<String, dynamic> json) => FluffyMetric(
  name: json['name'] as String,
  selector: json['selector'] == null
      ? null
      : FluffySelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluffyMetricToJson(FluffyMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

FluffySelector _$FluffySelectorFromJson(Map<String, dynamic> json) =>
    FluffySelector(
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

Map<String, dynamic> _$FluffySelectorToJson(FluffySelector instance) =>
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

ObjectTarget _$ObjectTargetFromJson(Map<String, dynamic> json) => ObjectTarget(
  averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
  averageValue: json['averageValue'],
  type: json['type'] as String,
  value: json['value'],
);

Map<String, dynamic> _$ObjectTargetToJson(ObjectTarget instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'type': instance.type,
      'value': instance.value,
    };

MetricPods _$MetricPodsFromJson(Map<String, dynamic> json) => MetricPods(
  metric: TentacledMetric.fromJson(json['metric'] as Map<String, dynamic>),
  target: PodsTarget.fromJson(json['target'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetricPodsToJson(MetricPods instance) =>
    <String, dynamic>{'metric': instance.metric, 'target': instance.target};

TentacledMetric _$TentacledMetricFromJson(Map<String, dynamic> json) =>
    TentacledMetric(
      name: json['name'] as String,
      selector: json['selector'] == null
          ? null
          : TentacledSelector.fromJson(
              json['selector'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TentacledMetricToJson(TentacledMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

TentacledSelector _$TentacledSelectorFromJson(Map<String, dynamic> json) =>
    TentacledSelector(
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

Map<String, dynamic> _$TentacledSelectorToJson(TentacledSelector instance) =>
    <String, dynamic>{
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

PodsTarget _$PodsTargetFromJson(Map<String, dynamic> json) => PodsTarget(
  averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
  averageValue: json['averageValue'],
  type: json['type'] as String,
  value: json['value'],
);

Map<String, dynamic> _$PodsTargetToJson(PodsTarget instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'type': instance.type,
      'value': instance.value,
    };

MetricResource _$MetricResourceFromJson(Map<String, dynamic> json) =>
    MetricResource(
      name: json['name'] as String,
      target: ResourceTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetricResourceToJson(MetricResource instance) =>
    <String, dynamic>{'name': instance.name, 'target': instance.target};

ResourceTarget _$ResourceTargetFromJson(Map<String, dynamic> json) =>
    ResourceTarget(
      averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
      averageValue: json['averageValue'],
      type: json['type'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$ResourceTargetToJson(ResourceTarget instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'type': instance.type,
      'value': instance.value,
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
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  currentMetrics: (json['currentMetrics'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : CurrentMetric.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  currentReplicas: (json['currentReplicas'] as num?)?.toInt(),
  desiredReplicas: (json['desiredReplicas'] as num).toInt(),
  lastScaleTime: json['lastScaleTime'] == null
      ? null
      : DateTime.parse(json['lastScaleTime'] as String),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'currentMetrics': instance.currentMetrics,
  'currentReplicas': instance.currentReplicas,
  'desiredReplicas': instance.desiredReplicas,
  'lastScaleTime': instance.lastScaleTime?.toIso8601String(),
  'observedGeneration': instance.observedGeneration,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
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

CurrentMetric _$CurrentMetricFromJson(Map<String, dynamic> json) =>
    CurrentMetric(
      containerResource: json['containerResource'] == null
          ? null
          : CurrentMetricContainerResource.fromJson(
              json['containerResource'] as Map<String, dynamic>,
            ),
      currentMetricExternal: json['external'] == null
          ? null
          : CurrentMetricExternal.fromJson(
              json['external'] as Map<String, dynamic>,
            ),
      object: json['object'] == null
          ? null
          : CurrentMetricObject.fromJson(
              json['object'] as Map<String, dynamic>,
            ),
      pods: json['pods'] == null
          ? null
          : CurrentMetricPods.fromJson(json['pods'] as Map<String, dynamic>),
      resource: json['resource'] == null
          ? null
          : CurrentMetricResource.fromJson(
              json['resource'] as Map<String, dynamic>,
            ),
      type: json['type'] as String,
    );

Map<String, dynamic> _$CurrentMetricToJson(CurrentMetric instance) =>
    <String, dynamic>{
      'containerResource': instance.containerResource,
      'external': instance.currentMetricExternal,
      'object': instance.object,
      'pods': instance.pods,
      'resource': instance.resource,
      'type': instance.type,
    };

CurrentMetricContainerResource _$CurrentMetricContainerResourceFromJson(
  Map<String, dynamic> json,
) => CurrentMetricContainerResource(
  container: json['container'] as String,
  current: ContainerResourceCurrent.fromJson(
    json['current'] as Map<String, dynamic>,
  ),
  name: json['name'] as String,
);

Map<String, dynamic> _$CurrentMetricContainerResourceToJson(
  CurrentMetricContainerResource instance,
) => <String, dynamic>{
  'container': instance.container,
  'current': instance.current,
  'name': instance.name,
};

ContainerResourceCurrent _$ContainerResourceCurrentFromJson(
  Map<String, dynamic> json,
) => ContainerResourceCurrent(
  averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
  averageValue: json['averageValue'],
  value: json['value'],
);

Map<String, dynamic> _$ContainerResourceCurrentToJson(
  ContainerResourceCurrent instance,
) => <String, dynamic>{
  'averageUtilization': instance.averageUtilization,
  'averageValue': instance.averageValue,
  'value': instance.value,
};

CurrentMetricExternal _$CurrentMetricExternalFromJson(
  Map<String, dynamic> json,
) => CurrentMetricExternal(
  current: ExternalCurrent.fromJson(json['current'] as Map<String, dynamic>),
  metric: StickyMetric.fromJson(json['metric'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentMetricExternalToJson(
  CurrentMetricExternal instance,
) => <String, dynamic>{'current': instance.current, 'metric': instance.metric};

ExternalCurrent _$ExternalCurrentFromJson(Map<String, dynamic> json) =>
    ExternalCurrent(
      averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
      averageValue: json['averageValue'],
      value: json['value'],
    );

Map<String, dynamic> _$ExternalCurrentToJson(ExternalCurrent instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'value': instance.value,
    };

StickyMetric _$StickyMetricFromJson(Map<String, dynamic> json) => StickyMetric(
  name: json['name'] as String,
  selector: json['selector'] == null
      ? null
      : StickySelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StickyMetricToJson(StickyMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

StickySelector _$StickySelectorFromJson(Map<String, dynamic> json) =>
    StickySelector(
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

Map<String, dynamic> _$StickySelectorToJson(StickySelector instance) =>
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

CurrentMetricObject _$CurrentMetricObjectFromJson(Map<String, dynamic> json) =>
    CurrentMetricObject(
      current: ObjectCurrent.fromJson(json['current'] as Map<String, dynamic>),
      describedObject: FluffyDescribedObject.fromJson(
        json['describedObject'] as Map<String, dynamic>,
      ),
      metric: IndigoMetric.fromJson(json['metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentMetricObjectToJson(
  CurrentMetricObject instance,
) => <String, dynamic>{
  'current': instance.current,
  'describedObject': instance.describedObject,
  'metric': instance.metric,
};

ObjectCurrent _$ObjectCurrentFromJson(Map<String, dynamic> json) =>
    ObjectCurrent(
      averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
      averageValue: json['averageValue'],
      value: json['value'],
    );

Map<String, dynamic> _$ObjectCurrentToJson(ObjectCurrent instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'value': instance.value,
    };

FluffyDescribedObject _$FluffyDescribedObjectFromJson(
  Map<String, dynamic> json,
) => FluffyDescribedObject(
  apiVersion: json['apiVersion'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$FluffyDescribedObjectToJson(
  FluffyDescribedObject instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': instance.kind,
  'name': instance.name,
};

IndigoMetric _$IndigoMetricFromJson(Map<String, dynamic> json) => IndigoMetric(
  name: json['name'] as String,
  selector: json['selector'] == null
      ? null
      : IndigoSelector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IndigoMetricToJson(IndigoMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

IndigoSelector _$IndigoSelectorFromJson(Map<String, dynamic> json) =>
    IndigoSelector(
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

Map<String, dynamic> _$IndigoSelectorToJson(IndigoSelector instance) =>
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

CurrentMetricPods _$CurrentMetricPodsFromJson(Map<String, dynamic> json) =>
    CurrentMetricPods(
      current: PodsCurrent.fromJson(json['current'] as Map<String, dynamic>),
      metric: IndecentMetric.fromJson(json['metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentMetricPodsToJson(CurrentMetricPods instance) =>
    <String, dynamic>{'current': instance.current, 'metric': instance.metric};

PodsCurrent _$PodsCurrentFromJson(Map<String, dynamic> json) => PodsCurrent(
  averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
  averageValue: json['averageValue'],
  value: json['value'],
);

Map<String, dynamic> _$PodsCurrentToJson(PodsCurrent instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'value': instance.value,
    };

IndecentMetric _$IndecentMetricFromJson(Map<String, dynamic> json) =>
    IndecentMetric(
      name: json['name'] as String,
      selector: json['selector'] == null
          ? null
          : IndecentSelector.fromJson(json['selector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndecentMetricToJson(IndecentMetric instance) =>
    <String, dynamic>{'name': instance.name, 'selector': instance.selector};

IndecentSelector _$IndecentSelectorFromJson(Map<String, dynamic> json) =>
    IndecentSelector(
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

Map<String, dynamic> _$IndecentSelectorToJson(IndecentSelector instance) =>
    <String, dynamic>{
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

CurrentMetricResource _$CurrentMetricResourceFromJson(
  Map<String, dynamic> json,
) => CurrentMetricResource(
  current: ResourceCurrent.fromJson(json['current'] as Map<String, dynamic>),
  name: json['name'] as String,
);

Map<String, dynamic> _$CurrentMetricResourceToJson(
  CurrentMetricResource instance,
) => <String, dynamic>{'current': instance.current, 'name': instance.name};

ResourceCurrent _$ResourceCurrentFromJson(Map<String, dynamic> json) =>
    ResourceCurrent(
      averageUtilization: (json['averageUtilization'] as num?)?.toInt(),
      averageValue: json['averageValue'],
      value: json['value'],
    );

Map<String, dynamic> _$ResourceCurrentToJson(ResourceCurrent instance) =>
    <String, dynamic>{
      'averageUtilization': instance.averageUtilization,
      'averageValue': instance.averageValue,
      'value': instance.value,
    };

HorizontalpodautoscalerlistAutoscalingV2Metadata
_$HorizontalpodautoscalerlistAutoscalingV2MetadataFromJson(
  Map<String, dynamic> json,
) => HorizontalpodautoscalerlistAutoscalingV2Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$HorizontalpodautoscalerlistAutoscalingV2MetadataToJson(
  HorizontalpodautoscalerlistAutoscalingV2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
