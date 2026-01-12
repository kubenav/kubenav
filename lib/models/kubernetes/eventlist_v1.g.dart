// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventlist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventlistV1 _$EventlistV1FromJson(Map<String, dynamic> json) => EventlistV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(_$EventlistV1KindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : EventlistV1Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EventlistV1ToJson(EventlistV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$EventlistV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$EventlistV1KindEnumMap = {EventlistV1Kind.EVENT_LIST: 'EventList'};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  action: json['action'] as String?,
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  count: (json['count'] as num?)?.toInt(),
  eventTime: json['eventTime'] == null
      ? null
      : DateTime.parse(json['eventTime'] as String),
  firstTimestamp: json['firstTimestamp'] == null
      ? null
      : DateTime.parse(json['firstTimestamp'] as String),
  involvedObject: InvolvedObject.fromJson(
    json['involvedObject'] as Map<String, dynamic>,
  ),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  lastTimestamp: json['lastTimestamp'] == null
      ? null
      : DateTime.parse(json['lastTimestamp'] as String),
  message: json['message'] as String?,
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  reason: json['reason'] as String?,
  related: json['related'] == null
      ? null
      : Related.fromJson(json['related'] as Map<String, dynamic>),
  reportingComponent: json['reportingComponent'] as String?,
  reportingInstance: json['reportingInstance'] as String?,
  series: json['series'] == null
      ? null
      : Series.fromJson(json['series'] as Map<String, dynamic>),
  source: json['source'] == null
      ? null
      : Source.fromJson(json['source'] as Map<String, dynamic>),
  type: json['type'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'action': instance.action,
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'count': instance.count,
  'eventTime': instance.eventTime?.toIso8601String(),
  'firstTimestamp': instance.firstTimestamp?.toIso8601String(),
  'involvedObject': instance.involvedObject,
  'kind': _$ItemKindEnumMap[instance.kind],
  'lastTimestamp': instance.lastTimestamp?.toIso8601String(),
  'message': instance.message,
  'metadata': instance.metadata,
  'reason': instance.reason,
  'related': instance.related,
  'reportingComponent': instance.reportingComponent,
  'reportingInstance': instance.reportingInstance,
  'series': instance.series,
  'source': instance.source,
  'type': instance.type,
};

const _$ItemKindEnumMap = {ItemKind.EVENT: 'Event'};

InvolvedObject _$InvolvedObjectFromJson(Map<String, dynamic> json) =>
    InvolvedObject(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      resourceVersion: json['resourceVersion'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$InvolvedObjectToJson(InvolvedObject instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
      'resourceVersion': instance.resourceVersion,
      'uid': instance.uid,
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

Related _$RelatedFromJson(Map<String, dynamic> json) => Related(
  apiVersion: json['apiVersion'] as String?,
  fieldPath: json['fieldPath'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$RelatedToJson(Related instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'fieldPath': instance.fieldPath,
  'kind': instance.kind,
  'name': instance.name,
  'namespace': instance.namespace,
  'resourceVersion': instance.resourceVersion,
  'uid': instance.uid,
};

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
  count: (json['count'] as num?)?.toInt(),
  lastObservedTime: json['lastObservedTime'] == null
      ? null
      : DateTime.parse(json['lastObservedTime'] as String),
);

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
  'count': instance.count,
  'lastObservedTime': instance.lastObservedTime?.toIso8601String(),
};

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
  component: json['component'] as String?,
  host: json['host'] as String?,
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'component': instance.component,
  'host': instance.host,
};

EventlistV1Metadata _$EventlistV1MetadataFromJson(Map<String, dynamic> json) =>
    EventlistV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$EventlistV1MetadataToJson(
  EventlistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
