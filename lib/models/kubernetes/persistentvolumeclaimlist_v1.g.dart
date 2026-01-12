// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistentvolumeclaimlist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistentvolumeclaimlistV1 _$PersistentvolumeclaimlistV1FromJson(
  Map<String, dynamic> json,
) => PersistentvolumeclaimlistV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$PersistentvolumeclaimlistV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : PersistentvolumeclaimlistV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PersistentvolumeclaimlistV1ToJson(
  PersistentvolumeclaimlistV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$PersistentvolumeclaimlistV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$PersistentvolumeclaimlistV1KindEnumMap = {
  PersistentvolumeclaimlistV1Kind.PERSISTENT_VOLUME_CLAIM_LIST:
      'PersistentVolumeClaimList',
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
      : StatusClass.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {
  ItemKind.PERSISTENT_VOLUME_CLAIM: 'PersistentVolumeClaim',
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
  accessModes: (json['accessModes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$AccessModeEnumMap, e))
      .toList(),
  dataSource: json['dataSource'] == null
      ? null
      : DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
  dataSourceRef: json['dataSourceRef'] == null
      ? null
      : DataSourceRef.fromJson(json['dataSourceRef'] as Map<String, dynamic>),
  resources: json['resources'] == null
      ? null
      : Resources.fromJson(json['resources'] as Map<String, dynamic>),
  selector: json['selector'] == null
      ? null
      : Selector.fromJson(json['selector'] as Map<String, dynamic>),
  storageClassName: json['storageClassName'] as String?,
  volumeAttributesClassName: json['volumeAttributesClassName'] as String?,
  volumeMode: $enumDecodeNullable(_$VolumeModeEnumMap, json['volumeMode']),
  volumeName: json['volumeName'] as String?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'accessModes': instance.accessModes
      ?.map((e) => _$AccessModeEnumMap[e]!)
      .toList(),
  'dataSource': instance.dataSource,
  'dataSourceRef': instance.dataSourceRef,
  'resources': instance.resources,
  'selector': instance.selector,
  'storageClassName': instance.storageClassName,
  'volumeAttributesClassName': instance.volumeAttributesClassName,
  'volumeMode': _$VolumeModeEnumMap[instance.volumeMode],
  'volumeName': instance.volumeName,
};

const _$AccessModeEnumMap = {
  AccessMode.READ_ONLY_MANY: 'ReadOnlyMany',
  AccessMode.READ_WRITE_MANY: 'ReadWriteMany',
  AccessMode.READ_WRITE_ONCE: 'ReadWriteOnce',
  AccessMode.READ_WRITE_ONCE_POD: 'ReadWriteOncePod',
};

const _$VolumeModeEnumMap = {
  VolumeMode.BLOCK: 'Block',
  VolumeMode.FILESYSTEM: 'Filesystem',
};

DataSource _$DataSourceFromJson(Map<String, dynamic> json) => DataSource(
  apiGroup: json['apiGroup'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$DataSourceToJson(DataSource instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'kind': instance.kind,
      'name': instance.name,
    };

DataSourceRef _$DataSourceRefFromJson(Map<String, dynamic> json) =>
    DataSourceRef(
      apiGroup: json['apiGroup'] as String?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$DataSourceRefToJson(DataSourceRef instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
    };

Resources _$ResourcesFromJson(Map<String, dynamic> json) => Resources(
  limits: json['limits'] as Map<String, dynamic>?,
  requests: json['requests'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ResourcesToJson(Resources instance) => <String, dynamic>{
  'limits': instance.limits,
  'requests': instance.requests,
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

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  accessModes: (json['accessModes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$AccessModeEnumMap, e))
      .toList(),
  allocatedResources: json['allocatedResources'] as Map<String, dynamic>?,
  allocatedResourceStatuses:
      (json['allocatedResourceStatuses'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, $enumDecode(_$AllocatedResourceStatusEnumMap, e)),
      ),
  capacity: json['capacity'] as Map<String, dynamic>?,
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  currentVolumeAttributesClassName:
      json['currentVolumeAttributesClassName'] as String?,
  modifyVolumeStatus: json['modifyVolumeStatus'] == null
      ? null
      : ModifyVolumeStatus.fromJson(
          json['modifyVolumeStatus'] as Map<String, dynamic>,
        ),
  phase: $enumDecodeNullable(_$PhaseEnumMap, json['phase']),
);

Map<String, dynamic> _$StatusClassToJson(
  StatusClass instance,
) => <String, dynamic>{
  'accessModes': instance.accessModes
      ?.map((e) => _$AccessModeEnumMap[e]!)
      .toList(),
  'allocatedResources': instance.allocatedResources,
  'allocatedResourceStatuses': instance.allocatedResourceStatuses?.map(
    (k, e) => MapEntry(k, _$AllocatedResourceStatusEnumMap[e]!),
  ),
  'capacity': instance.capacity,
  'conditions': instance.conditions,
  'currentVolumeAttributesClassName': instance.currentVolumeAttributesClassName,
  'modifyVolumeStatus': instance.modifyVolumeStatus,
  'phase': _$PhaseEnumMap[instance.phase],
};

const _$AllocatedResourceStatusEnumMap = {
  AllocatedResourceStatus.CONTROLLER_RESIZE_INFEASIBLE:
      'ControllerResizeInfeasible',
  AllocatedResourceStatus.CONTROLLER_RESIZE_IN_PROGRESS:
      'ControllerResizeInProgress',
  AllocatedResourceStatus.NODE_RESIZE_INFEASIBLE: 'NodeResizeInfeasible',
  AllocatedResourceStatus.NODE_RESIZE_IN_PROGRESS: 'NodeResizeInProgress',
  AllocatedResourceStatus.NODE_RESIZE_PENDING: 'NodeResizePending',
};

const _$PhaseEnumMap = {
  Phase.BOUND: 'Bound',
  Phase.LOST: 'Lost',
  Phase.PENDING: 'Pending',
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastProbeTime: json['lastProbeTime'] == null
      ? null
      : DateTime.parse(json['lastProbeTime'] as String),
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastProbeTime': instance.lastProbeTime?.toIso8601String(),
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

ModifyVolumeStatus _$ModifyVolumeStatusFromJson(Map<String, dynamic> json) =>
    ModifyVolumeStatus(
      status: $enumDecode(_$StatusEnumEnumMap, json['status']),
      targetVolumeAttributesClassName:
          json['targetVolumeAttributesClassName'] as String?,
    );

Map<String, dynamic> _$ModifyVolumeStatusToJson(
  ModifyVolumeStatus instance,
) => <String, dynamic>{
  'status': _$StatusEnumEnumMap[instance.status]!,
  'targetVolumeAttributesClassName': instance.targetVolumeAttributesClassName,
};

const _$StatusEnumEnumMap = {
  StatusEnum.INFEASIBLE: 'Infeasible',
  StatusEnum.IN_PROGRESS: 'InProgress',
  StatusEnum.PENDING: 'Pending',
};

PersistentvolumeclaimlistV1Metadata
_$PersistentvolumeclaimlistV1MetadataFromJson(Map<String, dynamic> json) =>
    PersistentvolumeclaimlistV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$PersistentvolumeclaimlistV1MetadataToJson(
  PersistentvolumeclaimlistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
