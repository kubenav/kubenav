// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resourceclaimtemplatelist_resource_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceclaimtemplatelistResourceV1
_$ResourceclaimtemplatelistResourceV1FromJson(Map<String, dynamic> json) =>
    ResourceclaimtemplatelistResourceV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(
        _$ResourceclaimtemplatelistResourceV1KindEnumMap,
        json['kind'],
      ),
      metadata: json['metadata'] == null
          ? null
          : ResourceclaimtemplatelistResourceV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ResourceclaimtemplatelistResourceV1ToJson(
  ResourceclaimtemplatelistResourceV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ResourceclaimtemplatelistResourceV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.RESOURCE_K8_S_IO_V1: 'resource.k8s.io/v1',
};

const _$ResourceclaimtemplatelistResourceV1KindEnumMap = {
  ResourceclaimtemplatelistResourceV1Kind.RESOURCE_CLAIM_TEMPLATE_LIST:
      'ResourceClaimTemplateList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: ItemSpec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
};

const _$ItemKindEnumMap = {
  ItemKind.RESOURCE_CLAIM_TEMPLATE: 'ResourceClaimTemplate',
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
        (e) => e == null
            ? null
            : PurpleManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleOwnerReference.fromJson(e as Map<String, dynamic>),
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

PurpleManagedField _$PurpleManagedFieldFromJson(Map<String, dynamic> json) =>
    PurpleManagedField(
      apiVersion: json['apiVersion'] as String?,
      fieldsType: json['fieldsType'] as String?,
      fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
      manager: json['manager'] as String?,
      operation: json['operation'] as String?,
      subresource: json['subresource'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$PurpleManagedFieldToJson(PurpleManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

PurpleOwnerReference _$PurpleOwnerReferenceFromJson(
  Map<String, dynamic> json,
) => PurpleOwnerReference(
  apiVersion: json['apiVersion'] as String,
  blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
  controller: json['controller'] as bool?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$PurpleOwnerReferenceToJson(
  PurpleOwnerReference instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'blockOwnerDeletion': instance.blockOwnerDeletion,
  'controller': instance.controller,
  'kind': instance.kind,
  'name': instance.name,
  'uid': instance.uid,
};

ItemSpec _$ItemSpecFromJson(Map<String, dynamic> json) => ItemSpec(
  metadata: json['metadata'] == null
      ? null
      : SpecMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: SpecSpec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemSpecToJson(ItemSpec instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

SpecMetadata _$SpecMetadataFromJson(Map<String, dynamic> json) => SpecMetadata(
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
        (e) => e == null
            ? null
            : FluffyManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyOwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$SpecMetadataToJson(SpecMetadata instance) =>
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

FluffyManagedField _$FluffyManagedFieldFromJson(Map<String, dynamic> json) =>
    FluffyManagedField(
      apiVersion: json['apiVersion'] as String?,
      fieldsType: json['fieldsType'] as String?,
      fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
      manager: json['manager'] as String?,
      operation: json['operation'] as String?,
      subresource: json['subresource'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$FluffyManagedFieldToJson(FluffyManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

FluffyOwnerReference _$FluffyOwnerReferenceFromJson(
  Map<String, dynamic> json,
) => FluffyOwnerReference(
  apiVersion: json['apiVersion'] as String,
  blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
  controller: json['controller'] as bool?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$FluffyOwnerReferenceToJson(
  FluffyOwnerReference instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'blockOwnerDeletion': instance.blockOwnerDeletion,
  'controller': instance.controller,
  'kind': instance.kind,
  'name': instance.name,
  'uid': instance.uid,
};

SpecSpec _$SpecSpecFromJson(Map<String, dynamic> json) => SpecSpec(
  devices: json['devices'] == null
      ? null
      : Devices.fromJson(json['devices'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecSpecToJson(SpecSpec instance) => <String, dynamic>{
  'devices': instance.devices,
};

Devices _$DevicesFromJson(Map<String, dynamic> json) => Devices(
  config: (json['config'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Config.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$DevicesToJson(Devices instance) => <String, dynamic>{
  'config': instance.config,
  'constraints': instance.constraints,
  'requests': instance.requests,
};

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
  opaque: json['opaque'] == null
      ? null
      : Opaque.fromJson(json['opaque'] as Map<String, dynamic>),
  requests: (json['requests'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
  'opaque': instance.opaque,
  'requests': instance.requests,
};

Opaque _$OpaqueFromJson(Map<String, dynamic> json) => Opaque(
  driver: json['driver'] as String,
  parameters: json['parameters'] as Map<String, dynamic>,
);

Map<String, dynamic> _$OpaqueToJson(Opaque instance) => <String, dynamic>{
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
        _$OperatorEnumMap,
        json['operator'],
      ),
      tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ExactlyTolerationToJson(ExactlyToleration instance) =>
    <String, dynamic>{
      'effect': _$EffectEnumMap[instance.effect],
      'key': instance.key,
      'operator': _$OperatorEnumMap[instance.tolerationOperator],
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

const _$EffectEnumMap = {
  Effect.NONE: 'None',
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
};

const _$OperatorEnumMap = {Operator.EQUAL: 'Equal', Operator.EXISTS: 'Exists'};

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
  tolerationOperator: $enumDecodeNullable(_$OperatorEnumMap, json['operator']),
  tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
  value: json['value'] as String?,
);

Map<String, dynamic> _$FirstAvailableTolerationToJson(
  FirstAvailableToleration instance,
) => <String, dynamic>{
  'effect': _$EffectEnumMap[instance.effect],
  'key': instance.key,
  'operator': _$OperatorEnumMap[instance.tolerationOperator],
  'tolerationSeconds': instance.tolerationSeconds,
  'value': instance.value,
};

ResourceclaimtemplatelistResourceV1Metadata
_$ResourceclaimtemplatelistResourceV1MetadataFromJson(
  Map<String, dynamic> json,
) => ResourceclaimtemplatelistResourceV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ResourceclaimtemplatelistResourceV1MetadataToJson(
  ResourceclaimtemplatelistResourceV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
