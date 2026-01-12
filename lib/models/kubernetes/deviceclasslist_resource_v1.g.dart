// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deviceclasslist_resource_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceclasslistResourceV1 _$DeviceclasslistResourceV1FromJson(
  Map<String, dynamic> json,
) => DeviceclasslistResourceV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$DeviceclasslistResourceV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : DeviceclasslistResourceV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DeviceclasslistResourceV1ToJson(
  DeviceclasslistResourceV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$DeviceclasslistResourceV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.RESOURCE_K8_S_IO_V1: 'resource.k8s.io/v1',
};

const _$DeviceclasslistResourceV1KindEnumMap = {
  DeviceclasslistResourceV1Kind.DEVICE_CLASS_LIST: 'DeviceClassList',
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

const _$ItemKindEnumMap = {ItemKind.DEVICE_CLASS: 'DeviceClass'};

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
  config: (json['config'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Config.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  extendedResourceName: json['extendedResourceName'] as String?,
  selectors: (json['selectors'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Selector.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'config': instance.config,
  'extendedResourceName': instance.extendedResourceName,
  'selectors': instance.selectors,
};

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
  opaque: json['opaque'] == null
      ? null
      : Opaque.fromJson(json['opaque'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
  'opaque': instance.opaque,
};

Opaque _$OpaqueFromJson(Map<String, dynamic> json) => Opaque(
  driver: json['driver'] as String,
  parameters: json['parameters'] as Map<String, dynamic>,
);

Map<String, dynamic> _$OpaqueToJson(Opaque instance) => <String, dynamic>{
  'driver': instance.driver,
  'parameters': instance.parameters,
};

Selector _$SelectorFromJson(Map<String, dynamic> json) => Selector(
  cel: json['cel'] == null
      ? null
      : Cel.fromJson(json['cel'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SelectorToJson(Selector instance) => <String, dynamic>{
  'cel': instance.cel,
};

Cel _$CelFromJson(Map<String, dynamic> json) =>
    Cel(expression: json['expression'] as String);

Map<String, dynamic> _$CelToJson(Cel instance) => <String, dynamic>{
  'expression': instance.expression,
};

DeviceclasslistResourceV1Metadata _$DeviceclasslistResourceV1MetadataFromJson(
  Map<String, dynamic> json,
) => DeviceclasslistResourceV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$DeviceclasslistResourceV1MetadataToJson(
  DeviceclasslistResourceV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
