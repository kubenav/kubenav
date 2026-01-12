// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nodelist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodelistV1 _$NodelistV1FromJson(Map<String, dynamic> json) => NodelistV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(_$NodelistV1KindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : NodelistV1Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NodelistV1ToJson(NodelistV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$NodelistV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$NodelistV1KindEnumMap = {NodelistV1Kind.NODE_LIST: 'NodeList'};

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

const _$ItemKindEnumMap = {ItemKind.NODE: 'Node'};

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
  configSource: json['configSource'] == null
      ? null
      : ConfigSource.fromJson(json['configSource'] as Map<String, dynamic>),
  externalId: json['externalID'] as String?,
  podCidr: json['podCIDR'] as String?,
  podCidRs: (json['podCIDRs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  providerId: json['providerID'] as String?,
  taints: (json['taints'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Taint.fromJson(e as Map<String, dynamic>))
      .toList(),
  unschedulable: json['unschedulable'] as bool?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'configSource': instance.configSource,
  'externalID': instance.externalId,
  'podCIDR': instance.podCidr,
  'podCIDRs': instance.podCidRs,
  'providerID': instance.providerId,
  'taints': instance.taints,
  'unschedulable': instance.unschedulable,
};

ConfigSource _$ConfigSourceFromJson(Map<String, dynamic> json) => ConfigSource(
  configMap: json['configMap'] == null
      ? null
      : ConfigSourceConfigMap.fromJson(
          json['configMap'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ConfigSourceToJson(ConfigSource instance) =>
    <String, dynamic>{'configMap': instance.configMap};

ConfigSourceConfigMap _$ConfigSourceConfigMapFromJson(
  Map<String, dynamic> json,
) => ConfigSourceConfigMap(
  kubeletConfigKey: json['kubeletConfigKey'] as String,
  name: json['name'] as String,
  namespace: json['namespace'] as String,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$ConfigSourceConfigMapToJson(
  ConfigSourceConfigMap instance,
) => <String, dynamic>{
  'kubeletConfigKey': instance.kubeletConfigKey,
  'name': instance.name,
  'namespace': instance.namespace,
  'resourceVersion': instance.resourceVersion,
  'uid': instance.uid,
};

Taint _$TaintFromJson(Map<String, dynamic> json) => Taint(
  effect: $enumDecode(_$EffectEnumMap, json['effect']),
  key: json['key'] as String,
  timeAdded: json['timeAdded'] == null
      ? null
      : DateTime.parse(json['timeAdded'] as String),
  value: json['value'] as String?,
);

Map<String, dynamic> _$TaintToJson(Taint instance) => <String, dynamic>{
  'effect': _$EffectEnumMap[instance.effect]!,
  'key': instance.key,
  'timeAdded': instance.timeAdded?.toIso8601String(),
  'value': instance.value,
};

const _$EffectEnumMap = {
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
  Effect.PREFER_NO_SCHEDULE: 'PreferNoSchedule',
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Address.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  allocatable: json['allocatable'] as Map<String, dynamic>?,
  capacity: json['capacity'] as Map<String, dynamic>?,
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  config: json['config'] == null
      ? null
      : Config.fromJson(json['config'] as Map<String, dynamic>),
  daemonEndpoints: json['daemonEndpoints'] == null
      ? null
      : DaemonEndpoints.fromJson(
          json['daemonEndpoints'] as Map<String, dynamic>,
        ),
  declaredFeatures: (json['declaredFeatures'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  features: json['features'] == null
      ? null
      : StatusFeatures.fromJson(json['features'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
      .toList(),
  nodeInfo: json['nodeInfo'] == null
      ? null
      : NodeInfo.fromJson(json['nodeInfo'] as Map<String, dynamic>),
  phase: $enumDecodeNullable(_$PhaseEnumMap, json['phase']),
  runtimeHandlers: (json['runtimeHandlers'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : RuntimeHandler.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  volumesAttached: (json['volumesAttached'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : VolumesAttached.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  volumesInUse: (json['volumesInUse'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'addresses': instance.addresses,
  'allocatable': instance.allocatable,
  'capacity': instance.capacity,
  'conditions': instance.conditions,
  'config': instance.config,
  'daemonEndpoints': instance.daemonEndpoints,
  'declaredFeatures': instance.declaredFeatures,
  'features': instance.features,
  'images': instance.images,
  'nodeInfo': instance.nodeInfo,
  'phase': _$PhaseEnumMap[instance.phase],
  'runtimeHandlers': instance.runtimeHandlers,
  'volumesAttached': instance.volumesAttached,
  'volumesInUse': instance.volumesInUse,
};

const _$PhaseEnumMap = {
  Phase.PENDING: 'Pending',
  Phase.RUNNING: 'Running',
  Phase.TERMINATED: 'Terminated',
};

Address _$AddressFromJson(Map<String, dynamic> json) =>
    Address(address: json['address'] as String, type: json['type'] as String);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'address': instance.address,
  'type': instance.type,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastHeartbeatTime: json['lastHeartbeatTime'] == null
      ? null
      : DateTime.parse(json['lastHeartbeatTime'] as String),
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastHeartbeatTime': instance.lastHeartbeatTime?.toIso8601String(),
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
  active: json['active'] == null
      ? null
      : Active.fromJson(json['active'] as Map<String, dynamic>),
  assigned: json['assigned'] == null
      ? null
      : Assigned.fromJson(json['assigned'] as Map<String, dynamic>),
  error: json['error'] as String?,
  lastKnownGood: json['lastKnownGood'] == null
      ? null
      : LastKnownGood.fromJson(json['lastKnownGood'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
  'active': instance.active,
  'assigned': instance.assigned,
  'error': instance.error,
  'lastKnownGood': instance.lastKnownGood,
};

Active _$ActiveFromJson(Map<String, dynamic> json) => Active(
  configMap: json['configMap'] == null
      ? null
      : ActiveConfigMap.fromJson(json['configMap'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActiveToJson(Active instance) => <String, dynamic>{
  'configMap': instance.configMap,
};

ActiveConfigMap _$ActiveConfigMapFromJson(Map<String, dynamic> json) =>
    ActiveConfigMap(
      kubeletConfigKey: json['kubeletConfigKey'] as String,
      name: json['name'] as String,
      namespace: json['namespace'] as String,
      resourceVersion: json['resourceVersion'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$ActiveConfigMapToJson(ActiveConfigMap instance) =>
    <String, dynamic>{
      'kubeletConfigKey': instance.kubeletConfigKey,
      'name': instance.name,
      'namespace': instance.namespace,
      'resourceVersion': instance.resourceVersion,
      'uid': instance.uid,
    };

Assigned _$AssignedFromJson(Map<String, dynamic> json) => Assigned(
  configMap: json['configMap'] == null
      ? null
      : AssignedConfigMap.fromJson(json['configMap'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AssignedToJson(Assigned instance) => <String, dynamic>{
  'configMap': instance.configMap,
};

AssignedConfigMap _$AssignedConfigMapFromJson(Map<String, dynamic> json) =>
    AssignedConfigMap(
      kubeletConfigKey: json['kubeletConfigKey'] as String,
      name: json['name'] as String,
      namespace: json['namespace'] as String,
      resourceVersion: json['resourceVersion'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$AssignedConfigMapToJson(AssignedConfigMap instance) =>
    <String, dynamic>{
      'kubeletConfigKey': instance.kubeletConfigKey,
      'name': instance.name,
      'namespace': instance.namespace,
      'resourceVersion': instance.resourceVersion,
      'uid': instance.uid,
    };

LastKnownGood _$LastKnownGoodFromJson(Map<String, dynamic> json) =>
    LastKnownGood(
      configMap: json['configMap'] == null
          ? null
          : LastKnownGoodConfigMap.fromJson(
              json['configMap'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LastKnownGoodToJson(LastKnownGood instance) =>
    <String, dynamic>{'configMap': instance.configMap};

LastKnownGoodConfigMap _$LastKnownGoodConfigMapFromJson(
  Map<String, dynamic> json,
) => LastKnownGoodConfigMap(
  kubeletConfigKey: json['kubeletConfigKey'] as String,
  name: json['name'] as String,
  namespace: json['namespace'] as String,
  resourceVersion: json['resourceVersion'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$LastKnownGoodConfigMapToJson(
  LastKnownGoodConfigMap instance,
) => <String, dynamic>{
  'kubeletConfigKey': instance.kubeletConfigKey,
  'name': instance.name,
  'namespace': instance.namespace,
  'resourceVersion': instance.resourceVersion,
  'uid': instance.uid,
};

DaemonEndpoints _$DaemonEndpointsFromJson(Map<String, dynamic> json) =>
    DaemonEndpoints(
      kubeletEndpoint: json['kubeletEndpoint'] == null
          ? null
          : KubeletEndpoint.fromJson(
              json['kubeletEndpoint'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DaemonEndpointsToJson(DaemonEndpoints instance) =>
    <String, dynamic>{'kubeletEndpoint': instance.kubeletEndpoint};

KubeletEndpoint _$KubeletEndpointFromJson(Map<String, dynamic> json) =>
    KubeletEndpoint(port: (json['Port'] as num).toInt());

Map<String, dynamic> _$KubeletEndpointToJson(KubeletEndpoint instance) =>
    <String, dynamic>{'Port': instance.port};

StatusFeatures _$StatusFeaturesFromJson(Map<String, dynamic> json) =>
    StatusFeatures(
      supplementalGroupsPolicy: json['supplementalGroupsPolicy'] as bool?,
    );

Map<String, dynamic> _$StatusFeaturesToJson(StatusFeatures instance) =>
    <String, dynamic>{
      'supplementalGroupsPolicy': instance.supplementalGroupsPolicy,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  names: (json['names'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  sizeBytes: (json['sizeBytes'] as num?)?.toInt(),
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'names': instance.names,
  'sizeBytes': instance.sizeBytes,
};

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) => NodeInfo(
  architecture: json['architecture'] as String,
  bootId: json['bootID'] as String,
  containerRuntimeVersion: json['containerRuntimeVersion'] as String,
  kernelVersion: json['kernelVersion'] as String,
  kubeletVersion: json['kubeletVersion'] as String,
  kubeProxyVersion: json['kubeProxyVersion'] as String,
  machineId: json['machineID'] as String,
  operatingSystem: json['operatingSystem'] as String,
  osImage: json['osImage'] as String,
  swap: json['swap'] == null
      ? null
      : Swap.fromJson(json['swap'] as Map<String, dynamic>),
  systemUuid: json['systemUUID'] as String,
);

Map<String, dynamic> _$NodeInfoToJson(NodeInfo instance) => <String, dynamic>{
  'architecture': instance.architecture,
  'bootID': instance.bootId,
  'containerRuntimeVersion': instance.containerRuntimeVersion,
  'kernelVersion': instance.kernelVersion,
  'kubeletVersion': instance.kubeletVersion,
  'kubeProxyVersion': instance.kubeProxyVersion,
  'machineID': instance.machineId,
  'operatingSystem': instance.operatingSystem,
  'osImage': instance.osImage,
  'swap': instance.swap,
  'systemUUID': instance.systemUuid,
};

Swap _$SwapFromJson(Map<String, dynamic> json) =>
    Swap(capacity: (json['capacity'] as num?)?.toInt());

Map<String, dynamic> _$SwapToJson(Swap instance) => <String, dynamic>{
  'capacity': instance.capacity,
};

RuntimeHandler _$RuntimeHandlerFromJson(Map<String, dynamic> json) =>
    RuntimeHandler(
      features: json['features'] == null
          ? null
          : RuntimeHandlerFeatures.fromJson(
              json['features'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RuntimeHandlerToJson(RuntimeHandler instance) =>
    <String, dynamic>{'features': instance.features, 'name': instance.name};

RuntimeHandlerFeatures _$RuntimeHandlerFeaturesFromJson(
  Map<String, dynamic> json,
) => RuntimeHandlerFeatures(
  recursiveReadOnlyMounts: json['recursiveReadOnlyMounts'] as bool?,
  userNamespaces: json['userNamespaces'] as bool?,
);

Map<String, dynamic> _$RuntimeHandlerFeaturesToJson(
  RuntimeHandlerFeatures instance,
) => <String, dynamic>{
  'recursiveReadOnlyMounts': instance.recursiveReadOnlyMounts,
  'userNamespaces': instance.userNamespaces,
};

VolumesAttached _$VolumesAttachedFromJson(Map<String, dynamic> json) =>
    VolumesAttached(
      devicePath: json['devicePath'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$VolumesAttachedToJson(VolumesAttached instance) =>
    <String, dynamic>{'devicePath': instance.devicePath, 'name': instance.name};

NodelistV1Metadata _$NodelistV1MetadataFromJson(Map<String, dynamic> json) =>
    NodelistV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$NodelistV1MetadataToJson(NodelistV1Metadata instance) =>
    <String, dynamic>{
      'continue': instance.metadataContinue,
      'remainingItemCount': instance.remainingItemCount,
      'resourceVersion': instance.resourceVersion,
      'selfLink': instance.selfLink,
    };
