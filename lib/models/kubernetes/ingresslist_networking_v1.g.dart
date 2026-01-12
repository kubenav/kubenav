// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingresslist_networking_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngresslistNetworkingV1 _$IngresslistNetworkingV1FromJson(
  Map<String, dynamic> json,
) => IngresslistNetworkingV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(_$IngresslistNetworkingV1KindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : IngresslistNetworkingV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$IngresslistNetworkingV1ToJson(
  IngresslistNetworkingV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$IngresslistNetworkingV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.NETWORKING_K8_S_IO_V1: 'networking.k8s.io/v1',
};

const _$IngresslistNetworkingV1KindEnumMap = {
  IngresslistNetworkingV1Kind.INGRESS_LIST: 'IngressList',
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

const _$ItemKindEnumMap = {ItemKind.INGRESS: 'Ingress'};

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
  defaultBackend: json['defaultBackend'] == null
      ? null
      : DefaultBackend.fromJson(json['defaultBackend'] as Map<String, dynamic>),
  ingressClassName: json['ingressClassName'] as String?,
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
      .toList(),
  tls: (json['tls'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Tl.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'defaultBackend': instance.defaultBackend,
  'ingressClassName': instance.ingressClassName,
  'rules': instance.rules,
  'tls': instance.tls,
};

DefaultBackend _$DefaultBackendFromJson(Map<String, dynamic> json) =>
    DefaultBackend(
      resource: json['resource'] == null
          ? null
          : DefaultBackendResource.fromJson(
              json['resource'] as Map<String, dynamic>,
            ),
      service: json['service'] == null
          ? null
          : DefaultBackendService.fromJson(
              json['service'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DefaultBackendToJson(DefaultBackend instance) =>
    <String, dynamic>{
      'resource': instance.resource,
      'service': instance.service,
    };

DefaultBackendResource _$DefaultBackendResourceFromJson(
  Map<String, dynamic> json,
) => DefaultBackendResource(
  apiGroup: json['apiGroup'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$DefaultBackendResourceToJson(
  DefaultBackendResource instance,
) => <String, dynamic>{
  'apiGroup': instance.apiGroup,
  'kind': instance.kind,
  'name': instance.name,
};

DefaultBackendService _$DefaultBackendServiceFromJson(
  Map<String, dynamic> json,
) => DefaultBackendService(
  name: json['name'] as String,
  port: json['port'] == null
      ? null
      : PurplePort.fromJson(json['port'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DefaultBackendServiceToJson(
  DefaultBackendService instance,
) => <String, dynamic>{'name': instance.name, 'port': instance.port};

PurplePort _$PurplePortFromJson(Map<String, dynamic> json) => PurplePort(
  name: json['name'] as String?,
  number: (json['number'] as num?)?.toInt(),
);

Map<String, dynamic> _$PurplePortToJson(PurplePort instance) =>
    <String, dynamic>{'name': instance.name, 'number': instance.number};

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
  host: json['host'] as String?,
  http: json['http'] == null
      ? null
      : Http.fromJson(json['http'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
  'host': instance.host,
  'http': instance.http,
};

Http _$HttpFromJson(Map<String, dynamic> json) => Http(
  paths: (json['paths'] as List<dynamic>)
      .map((e) => e == null ? null : Path.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HttpToJson(Http instance) => <String, dynamic>{
  'paths': instance.paths,
};

Path _$PathFromJson(Map<String, dynamic> json) => Path(
  backend: Backend.fromJson(json['backend'] as Map<String, dynamic>),
  path: json['path'] as String?,
  pathType: $enumDecode(_$PathTypeEnumMap, json['pathType']),
);

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
  'backend': instance.backend,
  'path': instance.path,
  'pathType': _$PathTypeEnumMap[instance.pathType]!,
};

const _$PathTypeEnumMap = {
  PathType.EXACT: 'Exact',
  PathType.IMPLEMENTATION_SPECIFIC: 'ImplementationSpecific',
  PathType.PREFIX: 'Prefix',
};

Backend _$BackendFromJson(Map<String, dynamic> json) => Backend(
  resource: json['resource'] == null
      ? null
      : BackendResource.fromJson(json['resource'] as Map<String, dynamic>),
  service: json['service'] == null
      ? null
      : BackendService.fromJson(json['service'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BackendToJson(Backend instance) => <String, dynamic>{
  'resource': instance.resource,
  'service': instance.service,
};

BackendResource _$BackendResourceFromJson(Map<String, dynamic> json) =>
    BackendResource(
      apiGroup: json['apiGroup'] as String?,
      kind: json['kind'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$BackendResourceToJson(BackendResource instance) =>
    <String, dynamic>{
      'apiGroup': instance.apiGroup,
      'kind': instance.kind,
      'name': instance.name,
    };

BackendService _$BackendServiceFromJson(Map<String, dynamic> json) =>
    BackendService(
      name: json['name'] as String,
      port: json['port'] == null
          ? null
          : FluffyPort.fromJson(json['port'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackendServiceToJson(BackendService instance) =>
    <String, dynamic>{'name': instance.name, 'port': instance.port};

FluffyPort _$FluffyPortFromJson(Map<String, dynamic> json) => FluffyPort(
  name: json['name'] as String?,
  number: (json['number'] as num?)?.toInt(),
);

Map<String, dynamic> _$FluffyPortToJson(FluffyPort instance) =>
    <String, dynamic>{'name': instance.name, 'number': instance.number};

Tl _$TlFromJson(Map<String, dynamic> json) => Tl(
  hosts: (json['hosts'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  secretName: json['secretName'] as String?,
);

Map<String, dynamic> _$TlToJson(Tl instance) => <String, dynamic>{
  'hosts': instance.hosts,
  'secretName': instance.secretName,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  loadBalancer: json['loadBalancer'] == null
      ? null
      : LoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'loadBalancer': instance.loadBalancer,
};

LoadBalancer _$LoadBalancerFromJson(Map<String, dynamic> json) => LoadBalancer(
  ingress: (json['ingress'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Ingress.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$LoadBalancerToJson(LoadBalancer instance) =>
    <String, dynamic>{'ingress': instance.ingress};

Ingress _$IngressFromJson(Map<String, dynamic> json) => Ingress(
  hostname: json['hostname'] as String?,
  ip: json['ip'] as String?,
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IngressPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$IngressToJson(Ingress instance) => <String, dynamic>{
  'hostname': instance.hostname,
  'ip': instance.ip,
  'ports': instance.ports,
};

IngressPort _$IngressPortFromJson(Map<String, dynamic> json) => IngressPort(
  error: json['error'] as String?,
  port: (json['port'] as num).toInt(),
  protocol: $enumDecode(_$ProtocolEnumMap, json['protocol']),
);

Map<String, dynamic> _$IngressPortToJson(IngressPort instance) =>
    <String, dynamic>{
      'error': instance.error,
      'port': instance.port,
      'protocol': _$ProtocolEnumMap[instance.protocol]!,
    };

const _$ProtocolEnumMap = {
  Protocol.SCTP: 'SCTP',
  Protocol.TCP: 'TCP',
  Protocol.UDP: 'UDP',
};

IngresslistNetworkingV1Metadata _$IngresslistNetworkingV1MetadataFromJson(
  Map<String, dynamic> json,
) => IngresslistNetworkingV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$IngresslistNetworkingV1MetadataToJson(
  IngresslistNetworkingV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
