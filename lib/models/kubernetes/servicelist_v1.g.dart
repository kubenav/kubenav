// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicelist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicelistV1 _$ServicelistV1FromJson(Map<String, dynamic> json) =>
    ServicelistV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$ServicelistV1KindEnumMap, json['kind']),
      metadata: json['metadata'] == null
          ? null
          : ServicelistV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ServicelistV1ToJson(ServicelistV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$ServicelistV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$ServicelistV1KindEnumMap = {
  ServicelistV1Kind.SERVICE_LIST: 'ServiceList',
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

const _$ItemKindEnumMap = {ItemKind.SERVICE: 'Service'};

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
  allocateLoadBalancerNodePorts: json['allocateLoadBalancerNodePorts'] as bool?,
  clusterIp: json['clusterIP'] as String?,
  clusterIPs: (json['clusterIPs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  externalIPs: (json['externalIPs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  externalName: json['externalName'] as String?,
  externalTrafficPolicy: $enumDecodeNullable(
    _$TernalTrafficPolicyEnumMap,
    json['externalTrafficPolicy'],
  ),
  healthCheckNodePort: (json['healthCheckNodePort'] as num?)?.toInt(),
  internalTrafficPolicy: $enumDecodeNullable(
    _$TernalTrafficPolicyEnumMap,
    json['internalTrafficPolicy'],
  ),
  ipFamilies: (json['ipFamilies'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$IpFamilyEnumMap, e))
      .toList(),
  ipFamilyPolicy: $enumDecodeNullable(
    _$IpFamilyPolicyEnumMap,
    json['ipFamilyPolicy'],
  ),
  loadBalancerClass: json['loadBalancerClass'] as String?,
  loadBalancerIp: json['loadBalancerIP'] as String?,
  loadBalancerSourceRanges: (json['loadBalancerSourceRanges'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : SpecPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  publishNotReadyAddresses: json['publishNotReadyAddresses'] as bool?,
  selector: (json['selector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  sessionAffinity: $enumDecodeNullable(
    _$SessionAffinityEnumMap,
    json['sessionAffinity'],
  ),
  sessionAffinityConfig: json['sessionAffinityConfig'] == null
      ? null
      : SessionAffinityConfig.fromJson(
          json['sessionAffinityConfig'] as Map<String, dynamic>,
        ),
  trafficDistribution: json['trafficDistribution'] as String?,
  type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'allocateLoadBalancerNodePorts': instance.allocateLoadBalancerNodePorts,
  'clusterIP': instance.clusterIp,
  'clusterIPs': instance.clusterIPs,
  'externalIPs': instance.externalIPs,
  'externalName': instance.externalName,
  'externalTrafficPolicy':
      _$TernalTrafficPolicyEnumMap[instance.externalTrafficPolicy],
  'healthCheckNodePort': instance.healthCheckNodePort,
  'internalTrafficPolicy':
      _$TernalTrafficPolicyEnumMap[instance.internalTrafficPolicy],
  'ipFamilies': instance.ipFamilies?.map((e) => _$IpFamilyEnumMap[e]!).toList(),
  'ipFamilyPolicy': _$IpFamilyPolicyEnumMap[instance.ipFamilyPolicy],
  'loadBalancerClass': instance.loadBalancerClass,
  'loadBalancerIP': instance.loadBalancerIp,
  'loadBalancerSourceRanges': instance.loadBalancerSourceRanges,
  'ports': instance.ports,
  'publishNotReadyAddresses': instance.publishNotReadyAddresses,
  'selector': instance.selector,
  'sessionAffinity': _$SessionAffinityEnumMap[instance.sessionAffinity],
  'sessionAffinityConfig': instance.sessionAffinityConfig,
  'trafficDistribution': instance.trafficDistribution,
  'type': _$TypeEnumMap[instance.type],
};

const _$TernalTrafficPolicyEnumMap = {
  TernalTrafficPolicy.CLUSTER: 'Cluster',
  TernalTrafficPolicy.LOCAL: 'Local',
};

const _$IpFamilyEnumMap = {
  IpFamily.EMPTY: '',
  IpFamily.I_PV4: 'IPv4',
  IpFamily.I_PV6: 'IPv6',
};

const _$IpFamilyPolicyEnumMap = {
  IpFamilyPolicy.PREFER_DUAL_STACK: 'PreferDualStack',
  IpFamilyPolicy.REQUIRE_DUAL_STACK: 'RequireDualStack',
  IpFamilyPolicy.SINGLE_STACK: 'SingleStack',
};

const _$SessionAffinityEnumMap = {
  SessionAffinity.CLIENT_IP: 'ClientIP',
  SessionAffinity.NONE: 'None',
};

const _$TypeEnumMap = {
  Type.CLUSTER_IP: 'ClusterIP',
  Type.EXTERNAL_NAME: 'ExternalName',
  Type.LOAD_BALANCER: 'LoadBalancer',
  Type.NODE_PORT: 'NodePort',
};

SpecPort _$SpecPortFromJson(Map<String, dynamic> json) => SpecPort(
  appProtocol: json['appProtocol'] as String?,
  name: json['name'] as String?,
  nodePort: (json['nodePort'] as num?)?.toInt(),
  port: (json['port'] as num).toInt(),
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
  targetPort: json['targetPort'],
);

Map<String, dynamic> _$SpecPortToJson(SpecPort instance) => <String, dynamic>{
  'appProtocol': instance.appProtocol,
  'name': instance.name,
  'nodePort': instance.nodePort,
  'port': instance.port,
  'protocol': _$ProtocolEnumMap[instance.protocol],
  'targetPort': instance.targetPort,
};

const _$ProtocolEnumMap = {
  Protocol.SCTP: 'SCTP',
  Protocol.TCP: 'TCP',
  Protocol.UDP: 'UDP',
};

SessionAffinityConfig _$SessionAffinityConfigFromJson(
  Map<String, dynamic> json,
) => SessionAffinityConfig(
  clientIp: json['clientIP'] == null
      ? null
      : ClientIp.fromJson(json['clientIP'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionAffinityConfigToJson(
  SessionAffinityConfig instance,
) => <String, dynamic>{'clientIP': instance.clientIp};

ClientIp _$ClientIpFromJson(Map<String, dynamic> json) =>
    ClientIp(timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt());

Map<String, dynamic> _$ClientIpToJson(ClientIp instance) => <String, dynamic>{
  'timeoutSeconds': instance.timeoutSeconds,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  loadBalancer: json['loadBalancer'] == null
      ? null
      : LoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'loadBalancer': instance.loadBalancer,
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
  ipMode: json['ipMode'] as String?,
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
  'ipMode': instance.ipMode,
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

ServicelistV1Metadata _$ServicelistV1MetadataFromJson(
  Map<String, dynamic> json,
) => ServicelistV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ServicelistV1MetadataToJson(
  ServicelistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
