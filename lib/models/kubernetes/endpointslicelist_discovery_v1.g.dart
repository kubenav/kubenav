// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpointslicelist_discovery_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointslicelistDiscoveryV1 _$EndpointslicelistDiscoveryV1FromJson(
  Map<String, dynamic> json,
) => EndpointslicelistDiscoveryV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$EndpointslicelistDiscoveryV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : EndpointslicelistDiscoveryV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$EndpointslicelistDiscoveryV1ToJson(
  EndpointslicelistDiscoveryV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$EndpointslicelistDiscoveryV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.DISCOVERY_K8_S_IO_V1: 'discovery.k8s.io/v1',
};

const _$EndpointslicelistDiscoveryV1KindEnumMap = {
  EndpointslicelistDiscoveryV1Kind.ENDPOINT_SLICE_LIST: 'EndpointSliceList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  addressType: $enumDecode(_$AddressTypeEnumMap, json['addressType']),
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  endpoints: (json['endpoints'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  ports: (json['ports'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Port.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'addressType': _$AddressTypeEnumMap[instance.addressType]!,
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'endpoints': instance.endpoints,
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'ports': instance.ports,
};

const _$AddressTypeEnumMap = {
  AddressType.FQDN: 'FQDN',
  AddressType.I_PV4: 'IPv4',
  AddressType.I_PV6: 'IPv6',
};

const _$ItemKindEnumMap = {ItemKind.ENDPOINT_SLICE: 'EndpointSlice'};

Endpoint _$EndpointFromJson(Map<String, dynamic> json) => Endpoint(
  addresses: (json['addresses'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  conditions: json['conditions'] == null
      ? null
      : Conditions.fromJson(json['conditions'] as Map<String, dynamic>),
  deprecatedTopology: (json['deprecatedTopology'] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, e as String?)),
  hints: json['hints'] == null
      ? null
      : Hints.fromJson(json['hints'] as Map<String, dynamic>),
  hostname: json['hostname'] as String?,
  nodeName: json['nodeName'] as String?,
  targetRef: json['targetRef'] == null
      ? null
      : TargetRef.fromJson(json['targetRef'] as Map<String, dynamic>),
  zone: json['zone'] as String?,
);

Map<String, dynamic> _$EndpointToJson(Endpoint instance) => <String, dynamic>{
  'addresses': instance.addresses,
  'conditions': instance.conditions,
  'deprecatedTopology': instance.deprecatedTopology,
  'hints': instance.hints,
  'hostname': instance.hostname,
  'nodeName': instance.nodeName,
  'targetRef': instance.targetRef,
  'zone': instance.zone,
};

Conditions _$ConditionsFromJson(Map<String, dynamic> json) => Conditions(
  ready: json['ready'] as bool?,
  serving: json['serving'] as bool?,
  terminating: json['terminating'] as bool?,
);

Map<String, dynamic> _$ConditionsToJson(Conditions instance) =>
    <String, dynamic>{
      'ready': instance.ready,
      'serving': instance.serving,
      'terminating': instance.terminating,
    };

Hints _$HintsFromJson(Map<String, dynamic> json) => Hints(
  forNodes: (json['forNodes'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ForNode.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  forZones: (json['forZones'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : ForZone.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$HintsToJson(Hints instance) => <String, dynamic>{
  'forNodes': instance.forNodes,
  'forZones': instance.forZones,
};

ForNode _$ForNodeFromJson(Map<String, dynamic> json) =>
    ForNode(name: json['name'] as String);

Map<String, dynamic> _$ForNodeToJson(ForNode instance) => <String, dynamic>{
  'name': instance.name,
};

ForZone _$ForZoneFromJson(Map<String, dynamic> json) =>
    ForZone(name: json['name'] as String);

Map<String, dynamic> _$ForZoneToJson(ForZone instance) => <String, dynamic>{
  'name': instance.name,
};

TargetRef _$TargetRefFromJson(Map<String, dynamic> json) => TargetRef(
  apiVersion: json['apiVersion'] as String?,
  fieldPath: json['fieldPath'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$TargetRefToJson(TargetRef instance) => <String, dynamic>{
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

Port _$PortFromJson(Map<String, dynamic> json) => Port(
  appProtocol: json['appProtocol'] as String?,
  name: json['name'] as String?,
  port: (json['port'] as num?)?.toInt(),
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
);

Map<String, dynamic> _$PortToJson(Port instance) => <String, dynamic>{
  'appProtocol': instance.appProtocol,
  'name': instance.name,
  'port': instance.port,
  'protocol': _$ProtocolEnumMap[instance.protocol],
};

const _$ProtocolEnumMap = {
  Protocol.SCTP: 'SCTP',
  Protocol.TCP: 'TCP',
  Protocol.UDP: 'UDP',
};

EndpointslicelistDiscoveryV1Metadata
_$EndpointslicelistDiscoveryV1MetadataFromJson(Map<String, dynamic> json) =>
    EndpointslicelistDiscoveryV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$EndpointslicelistDiscoveryV1MetadataToJson(
  EndpointslicelistDiscoveryV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
