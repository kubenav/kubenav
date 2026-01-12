// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resourceclaimlist_resource_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceclaimlistResourceV1 _$ResourceclaimlistResourceV1FromJson(
  Map<String, dynamic> json,
) => ResourceclaimlistResourceV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ResourceclaimlistResourceV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ResourceclaimlistResourceV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ResourceclaimlistResourceV1ToJson(
  ResourceclaimlistResourceV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ResourceclaimlistResourceV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.RESOURCE_K8_S_IO_V1: 'resource.k8s.io/v1',
};

const _$ResourceclaimlistResourceV1KindEnumMap = {
  ResourceclaimlistResourceV1Kind.RESOURCE_CLAIM_LIST: 'ResourceClaimList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec.fromJson(json['spec'] as Map<String, dynamic>),
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

const _$ItemKindEnumMap = {ItemKind.RESOURCE_CLAIM: 'ResourceClaim'};

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
  devices: json['devices'] == null
      ? null
      : SpecDevices.fromJson(json['devices'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'devices': instance.devices,
};

SpecDevices _$SpecDevicesFromJson(Map<String, dynamic> json) => SpecDevices(
  config: (json['config'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleConfig.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  constraints: (json['constraints'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Constraint.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  requests: (json['requests'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Request.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecDevicesToJson(SpecDevices instance) =>
    <String, dynamic>{
      'config': instance.config,
      'constraints': instance.constraints,
      'requests': instance.requests,
    };

PurpleConfig _$PurpleConfigFromJson(Map<String, dynamic> json) => PurpleConfig(
  opaque: json['opaque'] == null
      ? null
      : PurpleOpaque.fromJson(json['opaque'] as Map<String, dynamic>),
  requests: (json['requests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$PurpleConfigToJson(PurpleConfig instance) =>
    <String, dynamic>{'opaque': instance.opaque, 'requests': instance.requests};

PurpleOpaque _$PurpleOpaqueFromJson(Map<String, dynamic> json) => PurpleOpaque(
  driver: json['driver'] as String,
  parameters: json['parameters'] as Map<String, dynamic>,
);

Map<String, dynamic> _$PurpleOpaqueToJson(PurpleOpaque instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'parameters': instance.parameters,
    };

Constraint _$ConstraintFromJson(Map<String, dynamic> json) => Constraint(
  distinctAttribute: json['distinctAttribute'] as String?,
  matchAttribute: json['matchAttribute'] as String?,
  requests: (json['requests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$ConstraintToJson(Constraint instance) =>
    <String, dynamic>{
      'distinctAttribute': instance.distinctAttribute,
      'matchAttribute': instance.matchAttribute,
      'requests': instance.requests,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
  exactly: json['exactly'] == null
      ? null
      : Exactly.fromJson(json['exactly'] as Map<String, dynamic>),
  firstAvailable: (json['firstAvailable'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FirstAvailable.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String,
);

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
  'exactly': instance.exactly,
  'firstAvailable': instance.firstAvailable,
  'name': instance.name,
};

Exactly _$ExactlyFromJson(Map<String, dynamic> json) => Exactly(
  adminAccess: json['adminAccess'] as bool?,
  allocationMode: $enumDecodeNullable(
    _$AllocationModeEnumMap,
    json['allocationMode'],
  ),
  capacity: json['capacity'] == null
      ? null
      : ExactlyCapacity.fromJson(json['capacity'] as Map<String, dynamic>),
  count: (json['count'] as num?)?.toInt(),
  deviceClassName: json['deviceClassName'] as String,
  selectors: (json['selectors'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ExactlySelector.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ExactlyToleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ExactlyToJson(Exactly instance) => <String, dynamic>{
  'adminAccess': instance.adminAccess,
  'allocationMode': _$AllocationModeEnumMap[instance.allocationMode],
  'capacity': instance.capacity,
  'count': instance.count,
  'deviceClassName': instance.deviceClassName,
  'selectors': instance.selectors,
  'tolerations': instance.tolerations,
};

const _$AllocationModeEnumMap = {
  AllocationMode.ALL: 'All',
  AllocationMode.EXACT_COUNT: 'ExactCount',
};

ExactlyCapacity _$ExactlyCapacityFromJson(Map<String, dynamic> json) =>
    ExactlyCapacity(requests: json['requests'] as Map<String, dynamic>?);

Map<String, dynamic> _$ExactlyCapacityToJson(ExactlyCapacity instance) =>
    <String, dynamic>{'requests': instance.requests};

ExactlySelector _$ExactlySelectorFromJson(Map<String, dynamic> json) =>
    ExactlySelector(
      cel: json['cel'] == null
          ? null
          : PurpleCel.fromJson(json['cel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExactlySelectorToJson(ExactlySelector instance) =>
    <String, dynamic>{'cel': instance.cel};

PurpleCel _$PurpleCelFromJson(Map<String, dynamic> json) =>
    PurpleCel(expression: json['expression'] as String);

Map<String, dynamic> _$PurpleCelToJson(PurpleCel instance) => <String, dynamic>{
  'expression': instance.expression,
};

ExactlyToleration _$ExactlyTolerationFromJson(Map<String, dynamic> json) =>
    ExactlyToleration(
      effect: $enumDecodeNullable(_$EffectEnumMap, json['effect']),
      key: json['key'] as String?,
      tolerationOperator: $enumDecodeNullable(
        _$TolerationOperatorEnumMap,
        json['operator'],
      ),
      tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ExactlyTolerationToJson(ExactlyToleration instance) =>
    <String, dynamic>{
      'effect': _$EffectEnumMap[instance.effect],
      'key': instance.key,
      'operator': _$TolerationOperatorEnumMap[instance.tolerationOperator],
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

const _$EffectEnumMap = {
  Effect.NONE: 'None',
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
};

const _$TolerationOperatorEnumMap = {
  TolerationOperator.EQUAL: 'Equal',
  TolerationOperator.EXISTS: 'Exists',
};

FirstAvailable _$FirstAvailableFromJson(Map<String, dynamic> json) =>
    FirstAvailable(
      allocationMode: $enumDecodeNullable(
        _$AllocationModeEnumMap,
        json['allocationMode'],
      ),
      capacity: json['capacity'] == null
          ? null
          : FirstAvailableCapacity.fromJson(
              json['capacity'] as Map<String, dynamic>,
            ),
      count: (json['count'] as num?)?.toInt(),
      deviceClassName: json['deviceClassName'] as String,
      name: json['name'] as String,
      selectors: (json['selectors'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FirstAvailableSelector.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      tolerations: (json['tolerations'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FirstAvailableToleration.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$FirstAvailableToJson(FirstAvailable instance) =>
    <String, dynamic>{
      'allocationMode': _$AllocationModeEnumMap[instance.allocationMode],
      'capacity': instance.capacity,
      'count': instance.count,
      'deviceClassName': instance.deviceClassName,
      'name': instance.name,
      'selectors': instance.selectors,
      'tolerations': instance.tolerations,
    };

FirstAvailableCapacity _$FirstAvailableCapacityFromJson(
  Map<String, dynamic> json,
) =>
    FirstAvailableCapacity(requests: json['requests'] as Map<String, dynamic>?);

Map<String, dynamic> _$FirstAvailableCapacityToJson(
  FirstAvailableCapacity instance,
) => <String, dynamic>{'requests': instance.requests};

FirstAvailableSelector _$FirstAvailableSelectorFromJson(
  Map<String, dynamic> json,
) => FirstAvailableSelector(
  cel: json['cel'] == null
      ? null
      : FluffyCel.fromJson(json['cel'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FirstAvailableSelectorToJson(
  FirstAvailableSelector instance,
) => <String, dynamic>{'cel': instance.cel};

FluffyCel _$FluffyCelFromJson(Map<String, dynamic> json) =>
    FluffyCel(expression: json['expression'] as String);

Map<String, dynamic> _$FluffyCelToJson(FluffyCel instance) => <String, dynamic>{
  'expression': instance.expression,
};

FirstAvailableToleration _$FirstAvailableTolerationFromJson(
  Map<String, dynamic> json,
) => FirstAvailableToleration(
  effect: $enumDecodeNullable(_$EffectEnumMap, json['effect']),
  key: json['key'] as String?,
  tolerationOperator: $enumDecodeNullable(
    _$TolerationOperatorEnumMap,
    json['operator'],
  ),
  tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
  value: json['value'] as String?,
);

Map<String, dynamic> _$FirstAvailableTolerationToJson(
  FirstAvailableToleration instance,
) => <String, dynamic>{
  'effect': _$EffectEnumMap[instance.effect],
  'key': instance.key,
  'operator': _$TolerationOperatorEnumMap[instance.tolerationOperator],
  'tolerationSeconds': instance.tolerationSeconds,
  'value': instance.value,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  allocation: json['allocation'] == null
      ? null
      : Allocation.fromJson(json['allocation'] as Map<String, dynamic>),
  devices: (json['devices'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Device.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  reservedFor: (json['reservedFor'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ReservedFor.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'allocation': instance.allocation,
  'devices': instance.devices,
  'reservedFor': instance.reservedFor,
};

Allocation _$AllocationFromJson(Map<String, dynamic> json) => Allocation(
  allocationTimestamp: json['allocationTimestamp'] == null
      ? null
      : DateTime.parse(json['allocationTimestamp'] as String),
  devices: json['devices'] == null
      ? null
      : AllocationDevices.fromJson(json['devices'] as Map<String, dynamic>),
  nodeSelector: json['nodeSelector'] == null
      ? null
      : NodeSelector.fromJson(json['nodeSelector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AllocationToJson(Allocation instance) =>
    <String, dynamic>{
      'allocationTimestamp': instance.allocationTimestamp?.toIso8601String(),
      'devices': instance.devices,
      'nodeSelector': instance.nodeSelector,
    };

AllocationDevices _$AllocationDevicesFromJson(Map<String, dynamic> json) =>
    AllocationDevices(
      config: (json['config'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyConfig.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      results: (json['results'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Result.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$AllocationDevicesToJson(AllocationDevices instance) =>
    <String, dynamic>{'config': instance.config, 'results': instance.results};

FluffyConfig _$FluffyConfigFromJson(Map<String, dynamic> json) => FluffyConfig(
  opaque: json['opaque'] == null
      ? null
      : FluffyOpaque.fromJson(json['opaque'] as Map<String, dynamic>),
  requests: (json['requests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  source: $enumDecode(_$SourceEnumMap, json['source']),
);

Map<String, dynamic> _$FluffyConfigToJson(FluffyConfig instance) =>
    <String, dynamic>{
      'opaque': instance.opaque,
      'requests': instance.requests,
      'source': _$SourceEnumMap[instance.source]!,
    };

const _$SourceEnumMap = {
  Source.FROM_CLAIM: 'FromClaim',
  Source.FROM_CLASS: 'FromClass',
};

FluffyOpaque _$FluffyOpaqueFromJson(Map<String, dynamic> json) => FluffyOpaque(
  driver: json['driver'] as String,
  parameters: json['parameters'] as Map<String, dynamic>,
);

Map<String, dynamic> _$FluffyOpaqueToJson(FluffyOpaque instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'parameters': instance.parameters,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  adminAccess: json['adminAccess'] as bool?,
  bindingConditions: (json['bindingConditions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  bindingFailureConditions: (json['bindingFailureConditions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  consumedCapacity: json['consumedCapacity'] as Map<String, dynamic>?,
  device: json['device'] as String,
  driver: json['driver'] as String,
  pool: json['pool'] as String,
  request: json['request'] as String,
  shareId: json['shareID'] as String?,
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ResultToleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'adminAccess': instance.adminAccess,
  'bindingConditions': instance.bindingConditions,
  'bindingFailureConditions': instance.bindingFailureConditions,
  'consumedCapacity': instance.consumedCapacity,
  'device': instance.device,
  'driver': instance.driver,
  'pool': instance.pool,
  'request': instance.request,
  'shareID': instance.shareId,
  'tolerations': instance.tolerations,
};

ResultToleration _$ResultTolerationFromJson(Map<String, dynamic> json) =>
    ResultToleration(
      effect: $enumDecodeNullable(_$EffectEnumMap, json['effect']),
      key: json['key'] as String?,
      tolerationOperator: $enumDecodeNullable(
        _$TolerationOperatorEnumMap,
        json['operator'],
      ),
      tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ResultTolerationToJson(ResultToleration instance) =>
    <String, dynamic>{
      'effect': _$EffectEnumMap[instance.effect],
      'key': instance.key,
      'operator': _$TolerationOperatorEnumMap[instance.tolerationOperator],
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

NodeSelector _$NodeSelectorFromJson(Map<String, dynamic> json) => NodeSelector(
  nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : NodeSelectorTerm.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$NodeSelectorToJson(NodeSelector instance) =>
    <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

NodeSelectorTerm _$NodeSelectorTermFromJson(Map<String, dynamic> json) =>
    NodeSelectorTerm(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchFields: (json['matchFields'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MatchField.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$NodeSelectorTermToJson(NodeSelectorTerm instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

MatchExpression _$MatchExpressionFromJson(Map<String, dynamic> json) =>
    MatchExpression(
      key: json['key'] as String,
      matchExpressionOperator: $enumDecode(
        _$MatchExpressionOperatorEnumMap,
        json['operator'],
      ),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpressionToJson(MatchExpression instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator':
          _$MatchExpressionOperatorEnumMap[instance.matchExpressionOperator]!,
      'values': instance.values,
    };

const _$MatchExpressionOperatorEnumMap = {
  MatchExpressionOperator.DOES_NOT_EXIST: 'DoesNotExist',
  MatchExpressionOperator.EXISTS: 'Exists',
  MatchExpressionOperator.GT: 'Gt',
  MatchExpressionOperator.IN: 'In',
  MatchExpressionOperator.LT: 'Lt',
  MatchExpressionOperator.NOT_IN: 'NotIn',
};

MatchField _$MatchFieldFromJson(Map<String, dynamic> json) => MatchField(
  key: json['key'] as String,
  matchFieldOperator: $enumDecode(
    _$MatchExpressionOperatorEnumMap,
    json['operator'],
  ),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$MatchFieldToJson(
  MatchField instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': _$MatchExpressionOperatorEnumMap[instance.matchFieldOperator]!,
  'values': instance.values,
};

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  data: json['data'] as Map<String, dynamic>?,
  device: json['device'] as String,
  driver: json['driver'] as String,
  networkData: json['networkData'] == null
      ? null
      : NetworkData.fromJson(json['networkData'] as Map<String, dynamic>),
  pool: json['pool'] as String,
  shareId: json['shareID'] as String?,
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'data': instance.data,
  'device': instance.device,
  'driver': instance.driver,
  'networkData': instance.networkData,
  'pool': instance.pool,
  'shareID': instance.shareId,
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

NetworkData _$NetworkDataFromJson(Map<String, dynamic> json) => NetworkData(
  hardwareAddress: json['hardwareAddress'] as String?,
  interfaceName: json['interfaceName'] as String?,
  ips: (json['ips'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$NetworkDataToJson(NetworkData instance) =>
    <String, dynamic>{
      'hardwareAddress': instance.hardwareAddress,
      'interfaceName': instance.interfaceName,
      'ips': instance.ips,
    };

ReservedFor _$ReservedForFromJson(Map<String, dynamic> json) => ReservedFor(
  apiGroup: json['apiGroup'] as String?,
  name: json['name'] as String,
  resource: json['resource'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$ReservedForToJson(ReservedFor instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'name': instance.name,
      'resource': instance.resource,
      'uid': instance.uid,
    };

ResourceclaimlistResourceV1Metadata
_$ResourceclaimlistResourceV1MetadataFromJson(Map<String, dynamic> json) =>
    ResourceclaimlistResourceV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ResourceclaimlistResourceV1MetadataToJson(
  ResourceclaimlistResourceV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
