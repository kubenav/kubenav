// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'networkpolicylist_networking_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkpolicylistNetworkingV1 _$NetworkpolicylistNetworkingV1FromJson(
  Map<String, dynamic> json,
) => NetworkpolicylistNetworkingV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$NetworkpolicylistNetworkingV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : NetworkpolicylistNetworkingV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$NetworkpolicylistNetworkingV1ToJson(
  NetworkpolicylistNetworkingV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$NetworkpolicylistNetworkingV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.NETWORKING_K8_S_IO_V1: 'networking.k8s.io/v1',
};

const _$NetworkpolicylistNetworkingV1KindEnumMap = {
  NetworkpolicylistNetworkingV1Kind.NETWORK_POLICY_LIST: 'NetworkPolicyList',
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
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
};

const _$ItemKindEnumMap = {ItemKind.NETWORK_POLICY: 'NetworkPolicy'};

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
  egress: (json['egress'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Egress.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  ingress: (json['ingress'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Ingress.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  podSelector: json['podSelector'] == null
      ? null
      : SpecPodSelector.fromJson(json['podSelector'] as Map<String, dynamic>),
  policyTypes: (json['policyTypes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$PolicyTypeEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'egress': instance.egress,
  'ingress': instance.ingress,
  'podSelector': instance.podSelector,
  'policyTypes': instance.policyTypes
      ?.map((e) => _$PolicyTypeEnumMap[e]!)
      .toList(),
};

const _$PolicyTypeEnumMap = {
  PolicyType.EGRESS: 'Egress',
  PolicyType.INGRESS: 'Ingress',
};

Egress _$EgressFromJson(Map<String, dynamic> json) => Egress(
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : EgressPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  to: (json['to'] as List<dynamic>?)
      ?.map((e) => e == null ? null : To.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EgressToJson(Egress instance) => <String, dynamic>{
  'ports': instance.ports,
  'to': instance.to,
};

EgressPort _$EgressPortFromJson(Map<String, dynamic> json) => EgressPort(
  endPort: (json['endPort'] as num?)?.toInt(),
  port: json['port'],
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
);

Map<String, dynamic> _$EgressPortToJson(EgressPort instance) =>
    <String, dynamic>{
      'endPort': instance.endPort,
      'port': instance.port,
      'protocol': _$ProtocolEnumMap[instance.protocol],
    };

const _$ProtocolEnumMap = {
  Protocol.SCTP: 'SCTP',
  Protocol.TCP: 'TCP',
  Protocol.UDP: 'UDP',
};

To _$ToFromJson(Map<String, dynamic> json) => To(
  ipBlock: json['ipBlock'] == null
      ? null
      : ToIpBlock.fromJson(json['ipBlock'] as Map<String, dynamic>),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : ToNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  podSelector: json['podSelector'] == null
      ? null
      : ToPodSelector.fromJson(json['podSelector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ToToJson(To instance) => <String, dynamic>{
  'ipBlock': instance.ipBlock,
  'namespaceSelector': instance.namespaceSelector,
  'podSelector': instance.podSelector,
};

ToIpBlock _$ToIpBlockFromJson(Map<String, dynamic> json) => ToIpBlock(
  cidr: json['cidr'] as String,
  except: (json['except'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$ToIpBlockToJson(ToIpBlock instance) => <String, dynamic>{
  'cidr': instance.cidr,
  'except': instance.except,
};

ToNamespaceSelector _$ToNamespaceSelectorFromJson(Map<String, dynamic> json) =>
    ToNamespaceSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$ToNamespaceSelectorToJson(
  ToNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

PurpleMatchExpression _$PurpleMatchExpressionFromJson(
  Map<String, dynamic> json,
) => PurpleMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PurpleMatchExpressionToJson(
  PurpleMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

ToPodSelector _$ToPodSelectorFromJson(Map<String, dynamic> json) =>
    ToPodSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$ToPodSelectorToJson(ToPodSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

FluffyMatchExpression _$FluffyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => FluffyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FluffyMatchExpressionToJson(
  FluffyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

Ingress _$IngressFromJson(Map<String, dynamic> json) => Ingress(
  from: (json['from'] as List<dynamic>?)
      ?.map((e) => e == null ? null : From.fromJson(e as Map<String, dynamic>))
      .toList(),
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IngressPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$IngressToJson(Ingress instance) => <String, dynamic>{
  'from': instance.from,
  'ports': instance.ports,
};

From _$FromFromJson(Map<String, dynamic> json) => From(
  ipBlock: json['ipBlock'] == null
      ? null
      : FromIpBlock.fromJson(json['ipBlock'] as Map<String, dynamic>),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : FromNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  podSelector: json['podSelector'] == null
      ? null
      : FromPodSelector.fromJson(json['podSelector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
  'ipBlock': instance.ipBlock,
  'namespaceSelector': instance.namespaceSelector,
  'podSelector': instance.podSelector,
};

FromIpBlock _$FromIpBlockFromJson(Map<String, dynamic> json) => FromIpBlock(
  cidr: json['cidr'] as String,
  except: (json['except'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FromIpBlockToJson(FromIpBlock instance) =>
    <String, dynamic>{'cidr': instance.cidr, 'except': instance.except};

FromNamespaceSelector _$FromNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => FromNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FromNamespaceSelectorToJson(
  FromNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

TentacledMatchExpression _$TentacledMatchExpressionFromJson(
  Map<String, dynamic> json,
) => TentacledMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$TentacledMatchExpressionToJson(
  TentacledMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

FromPodSelector _$FromPodSelectorFromJson(Map<String, dynamic> json) =>
    FromPodSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FromPodSelectorToJson(FromPodSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

StickyMatchExpression _$StickyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => StickyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$StickyMatchExpressionToJson(
  StickyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

IngressPort _$IngressPortFromJson(Map<String, dynamic> json) => IngressPort(
  endPort: (json['endPort'] as num?)?.toInt(),
  port: json['port'],
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
);

Map<String, dynamic> _$IngressPortToJson(IngressPort instance) =>
    <String, dynamic>{
      'endPort': instance.endPort,
      'port': instance.port,
      'protocol': _$ProtocolEnumMap[instance.protocol],
    };

SpecPodSelector _$SpecPodSelectorFromJson(Map<String, dynamic> json) =>
    SpecPodSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$SpecPodSelectorToJson(SpecPodSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

IndigoMatchExpression _$IndigoMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndigoMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndigoMatchExpressionToJson(
  IndigoMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

NetworkpolicylistNetworkingV1Metadata
_$NetworkpolicylistNetworkingV1MetadataFromJson(Map<String, dynamic> json) =>
    NetworkpolicylistNetworkingV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$NetworkpolicylistNetworkingV1MetadataToJson(
  NetworkpolicylistNetworkingV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
