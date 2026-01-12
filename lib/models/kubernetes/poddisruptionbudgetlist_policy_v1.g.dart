// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poddisruptionbudgetlist_policy_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoddisruptionbudgetlistPolicyV1 _$PoddisruptionbudgetlistPolicyV1FromJson(
  Map<String, dynamic> json,
) => PoddisruptionbudgetlistPolicyV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$PoddisruptionbudgetlistPolicyV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : PoddisruptionbudgetlistPolicyV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PoddisruptionbudgetlistPolicyV1ToJson(
  PoddisruptionbudgetlistPolicyV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$PoddisruptionbudgetlistPolicyV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.POLICY_V1: 'policy/v1'};

const _$PoddisruptionbudgetlistPolicyV1KindEnumMap = {
  PoddisruptionbudgetlistPolicyV1Kind.POD_DISRUPTION_BUDGET_LIST:
      'PodDisruptionBudgetList',
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
  ItemKind.POD_DISRUPTION_BUDGET: 'PodDisruptionBudget',
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
  maxUnavailable: json['maxUnavailable'],
  minAvailable: json['minAvailable'],
  selector: json['selector'] == null
      ? null
      : Selector.fromJson(json['selector'] as Map<String, dynamic>),
  unhealthyPodEvictionPolicy: $enumDecodeNullable(
    _$UnhealthyPodEvictionPolicyEnumMap,
    json['unhealthyPodEvictionPolicy'],
  ),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'maxUnavailable': instance.maxUnavailable,
  'minAvailable': instance.minAvailable,
  'selector': instance.selector,
  'unhealthyPodEvictionPolicy':
      _$UnhealthyPodEvictionPolicyEnumMap[instance.unhealthyPodEvictionPolicy],
};

const _$UnhealthyPodEvictionPolicyEnumMap = {
  UnhealthyPodEvictionPolicy.ALWAYS_ALLOW: 'AlwaysAllow',
  UnhealthyPodEvictionPolicy.IF_HEALTHY_BUDGET: 'IfHealthyBudget',
};

Selector _$SelectorFromJson(Map<String, dynamic> json) => Selector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$SelectorToJson(Selector instance) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression _$MatchExpressionFromJson(Map<String, dynamic> json) =>
    MatchExpression(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpressionToJson(MatchExpression instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  currentHealthy: (json['currentHealthy'] as num).toInt(),
  desiredHealthy: (json['desiredHealthy'] as num).toInt(),
  disruptedPods: (json['disruptedPods'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e == null ? null : DateTime.parse(e as String)),
  ),
  disruptionsAllowed: (json['disruptionsAllowed'] as num).toInt(),
  expectedPods: (json['expectedPods'] as num).toInt(),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'currentHealthy': instance.currentHealthy,
  'desiredHealthy': instance.desiredHealthy,
  'disruptedPods': instance.disruptedPods?.map(
    (k, e) => MapEntry(k, e?.toIso8601String()),
  ),
  'disruptionsAllowed': instance.disruptionsAllowed,
  'expectedPods': instance.expectedPods,
  'observedGeneration': instance.observedGeneration,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  reason: json['reason'] as String,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime.toIso8601String(),
  'message': instance.message,
  'observedGeneration': instance.observedGeneration,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

PoddisruptionbudgetlistPolicyV1Metadata
_$PoddisruptionbudgetlistPolicyV1MetadataFromJson(Map<String, dynamic> json) =>
    PoddisruptionbudgetlistPolicyV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$PoddisruptionbudgetlistPolicyV1MetadataToJson(
  PoddisruptionbudgetlistPolicyV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
