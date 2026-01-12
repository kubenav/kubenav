// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpointslist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointslistV1 _$EndpointslistV1FromJson(Map<String, dynamic> json) =>
    EndpointslistV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$EndpointslistV1KindEnumMap, json['kind']),
      metadata: json['metadata'] == null
          ? null
          : EndpointslistV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$EndpointslistV1ToJson(EndpointslistV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$EndpointslistV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$EndpointslistV1KindEnumMap = {
  EndpointslistV1Kind.ENDPOINTS_LIST: 'EndpointsList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  subsets: (json['subsets'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Subset.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'subsets': instance.subsets,
};

const _$ItemKindEnumMap = {ItemKind.ENDPOINTS: 'Endpoints'};

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

Subset _$SubsetFromJson(Map<String, dynamic> json) => Subset(
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Address.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  notReadyAddresses: (json['notReadyAddresses'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : NotReadyAddress.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ports: (json['ports'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Port.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubsetToJson(Subset instance) => <String, dynamic>{
  'addresses': instance.addresses,
  'notReadyAddresses': instance.notReadyAddresses,
  'ports': instance.ports,
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  hostname: json['hostname'] as String?,
  ip: json['ip'] as String,
  nodeName: json['nodeName'] as String?,
  targetRef: json['targetRef'] == null
      ? null
      : AddressTargetRef.fromJson(json['targetRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'hostname': instance.hostname,
  'ip': instance.ip,
  'nodeName': instance.nodeName,
  'targetRef': instance.targetRef,
};

AddressTargetRef _$AddressTargetRefFromJson(Map<String, dynamic> json) =>
    AddressTargetRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String?,
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      resourceVersion: json['resourceVersion'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$AddressTargetRefToJson(AddressTargetRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
      'kind': instance.kind,
      'name': instance.name,
      'namespace': instance.namespace,
      'resourceVersion': instance.resourceVersion,
      'uid': instance.uid,
    };

NotReadyAddress _$NotReadyAddressFromJson(Map<String, dynamic> json) =>
    NotReadyAddress(
      hostname: json['hostname'] as String?,
      ip: json['ip'] as String,
      nodeName: json['nodeName'] as String?,
      targetRef: json['targetRef'] == null
          ? null
          : NotReadyAddressTargetRef.fromJson(
              json['targetRef'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$NotReadyAddressToJson(NotReadyAddress instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'ip': instance.ip,
      'nodeName': instance.nodeName,
      'targetRef': instance.targetRef,
    };

NotReadyAddressTargetRef _$NotReadyAddressTargetRefFromJson(
  Map<String, dynamic> json,
) => NotReadyAddressTargetRef(
  apiVersion: json['apiVersion'] as String?,
  fieldPath: json['fieldPath'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$NotReadyAddressTargetRefToJson(
  NotReadyAddressTargetRef instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'fieldPath': instance.fieldPath,
  'kind': instance.kind,
  'name': instance.name,
  'namespace': instance.namespace,
  'resourceVersion': instance.resourceVersion,
  'uid': instance.uid,
};

Port _$PortFromJson(Map<String, dynamic> json) => Port(
  appProtocol: json['appProtocol'] as String?,
  name: json['name'] as String?,
  port: (json['port'] as num).toInt(),
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

EndpointslistV1Metadata _$EndpointslistV1MetadataFromJson(
  Map<String, dynamic> json,
) => EndpointslistV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$EndpointslistV1MetadataToJson(
  EndpointslistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
