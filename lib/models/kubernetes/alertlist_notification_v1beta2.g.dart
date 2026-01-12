// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alertlist_notification_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertlistNotificationV1Beta2 _$AlertlistNotificationV1Beta2FromJson(
  Map<String, dynamic> json,
) => AlertlistNotificationV1Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$AlertlistNotificationV1Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : AlertlistNotificationV1Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AlertlistNotificationV1Beta2ToJson(
  AlertlistNotificationV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$AlertlistNotificationV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.NOTIFICATION_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'notification.toolkit.fluxcd.io/v1beta2',
};

const _$AlertlistNotificationV1Beta2KindEnumMap = {
  AlertlistNotificationV1Beta2Kind.ALERT_LIST: 'AlertList',
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

const _$ItemKindEnumMap = {ItemKind.ALERT: 'Alert'};

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
  eventMetadata: (json['eventMetadata'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  eventSeverity: $enumDecodeNullable(
    _$EventSeverityEnumMap,
    json['eventSeverity'],
  ),
  eventSources: (json['eventSources'] as List<dynamic>)
      .map(
        (e) =>
            e == null ? null : EventSource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  exclusionList: (json['exclusionList'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  inclusionList: (json['inclusionList'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  providerRef: ProviderRef.fromJson(
    json['providerRef'] as Map<String, dynamic>,
  ),
  summary: json['summary'] as String?,
  suspend: json['suspend'] as bool?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'eventMetadata': instance.eventMetadata,
  'eventSeverity': _$EventSeverityEnumMap[instance.eventSeverity],
  'eventSources': instance.eventSources,
  'exclusionList': instance.exclusionList,
  'inclusionList': instance.inclusionList,
  'providerRef': instance.providerRef,
  'summary': instance.summary,
  'suspend': instance.suspend,
};

const _$EventSeverityEnumMap = {
  EventSeverity.ERROR: 'error',
  EventSeverity.INFO: 'info',
};

EventSource _$EventSourceFromJson(Map<String, dynamic> json) => EventSource(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$EventSourceKindEnumMap, json['kind']),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$EventSourceToJson(EventSource instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'kind': _$EventSourceKindEnumMap[instance.kind]!,
      'matchLabels': instance.matchLabels,
      'name': instance.name,
      'namespace': instance.namespace,
    };

const _$EventSourceKindEnumMap = {
  EventSourceKind.BUCKET: 'Bucket',
  EventSourceKind.GIT_REPOSITORY: 'GitRepository',
  EventSourceKind.HELM_CHART: 'HelmChart',
  EventSourceKind.HELM_RELEASE: 'HelmRelease',
  EventSourceKind.HELM_REPOSITORY: 'HelmRepository',
  EventSourceKind.IMAGE_POLICY: 'ImagePolicy',
  EventSourceKind.IMAGE_REPOSITORY: 'ImageRepository',
  EventSourceKind.IMAGE_UPDATE_AUTOMATION: 'ImageUpdateAutomation',
  EventSourceKind.KUSTOMIZATION: 'Kustomization',
  EventSourceKind.OCI_REPOSITORY: 'OCIRepository',
};

ProviderRef _$ProviderRefFromJson(Map<String, dynamic> json) =>
    ProviderRef(name: json['name'] as String);

Map<String, dynamic> _$ProviderRefToJson(ProviderRef instance) =>
    <String, dynamic>{'name': instance.name};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'observedGeneration': instance.observedGeneration,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  reason: json['reason'] as String,
  status: $enumDecode(_$StatusEnumEnumMap, json['status']),
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime.toIso8601String(),
  'message': instance.message,
  'observedGeneration': instance.observedGeneration,
  'reason': instance.reason,
  'status': _$StatusEnumEnumMap[instance.status]!,
  'type': instance.type,
};

const _$StatusEnumEnumMap = {
  StatusEnum.FALSE: 'False',
  StatusEnum.TRUE: 'True',
  StatusEnum.UNKNOWN: 'Unknown',
};

AlertlistNotificationV1Beta2Metadata
_$AlertlistNotificationV1Beta2MetadataFromJson(Map<String, dynamic> json) =>
    AlertlistNotificationV1Beta2Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$AlertlistNotificationV1Beta2MetadataToJson(
  AlertlistNotificationV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
