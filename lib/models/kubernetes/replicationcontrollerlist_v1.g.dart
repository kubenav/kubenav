// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replicationcontrollerlist_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplicationcontrollerlistV1 _$ReplicationcontrollerlistV1FromJson(
  Map<String, dynamic> json,
) => ReplicationcontrollerlistV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : ReplicationcontrollerlistV1Item.fromJson(
                e as Map<String, dynamic>,
              ),
      )
      .toList(),
  kind: $enumDecodeNullable(
    _$ReplicationcontrollerlistV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ReplicationcontrollerlistV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ReplicationcontrollerlistV1ToJson(
  ReplicationcontrollerlistV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ReplicationcontrollerlistV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$ReplicationcontrollerlistV1KindEnumMap = {
  ReplicationcontrollerlistV1Kind.REPLICATION_CONTROLLER_LIST:
      'ReplicationControllerList',
};

ReplicationcontrollerlistV1Item _$ReplicationcontrollerlistV1ItemFromJson(
  Map<String, dynamic> json,
) => ReplicationcontrollerlistV1Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : ItemSpec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReplicationcontrollerlistV1ItemToJson(
  ReplicationcontrollerlistV1Item instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {
  ItemKind.REPLICATION_CONTROLLER: 'ReplicationController',
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
        (e) => e == null
            ? null
            : PurpleManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleOwnerReference.fromJson(e as Map<String, dynamic>),
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

PurpleManagedField _$PurpleManagedFieldFromJson(Map<String, dynamic> json) =>
    PurpleManagedField(
      apiVersion: json['apiVersion'] as String?,
      fieldsType: json['fieldsType'] as String?,
      fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
      manager: json['manager'] as String?,
      operation: json['operation'] as String?,
      subresource: json['subresource'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$PurpleManagedFieldToJson(PurpleManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

PurpleOwnerReference _$PurpleOwnerReferenceFromJson(
  Map<String, dynamic> json,
) => PurpleOwnerReference(
  apiVersion: json['apiVersion'] as String,
  blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
  controller: json['controller'] as bool?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$PurpleOwnerReferenceToJson(
  PurpleOwnerReference instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'blockOwnerDeletion': instance.blockOwnerDeletion,
  'controller': instance.controller,
  'kind': instance.kind,
  'name': instance.name,
  'uid': instance.uid,
};

ItemSpec _$ItemSpecFromJson(Map<String, dynamic> json) => ItemSpec(
  minReadySeconds: (json['minReadySeconds'] as num?)?.toInt(),
  replicas: (json['replicas'] as num?)?.toInt(),
  selector: (json['selector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  template: json['template'] == null
      ? null
      : Template.fromJson(json['template'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemSpecToJson(ItemSpec instance) => <String, dynamic>{
  'minReadySeconds': instance.minReadySeconds,
  'replicas': instance.replicas,
  'selector': instance.selector,
  'template': instance.template,
};

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
  metadata: json['metadata'] == null
      ? null
      : TemplateMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : TemplateSpec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
};

TemplateMetadata _$TemplateMetadataFromJson(
  Map<String, dynamic> json,
) => TemplateMetadata(
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
        (e) => e == null
            ? null
            : FluffyManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyOwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$TemplateMetadataToJson(TemplateMetadata instance) =>
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

FluffyManagedField _$FluffyManagedFieldFromJson(Map<String, dynamic> json) =>
    FluffyManagedField(
      apiVersion: json['apiVersion'] as String?,
      fieldsType: json['fieldsType'] as String?,
      fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
      manager: json['manager'] as String?,
      operation: json['operation'] as String?,
      subresource: json['subresource'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$FluffyManagedFieldToJson(FluffyManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

FluffyOwnerReference _$FluffyOwnerReferenceFromJson(
  Map<String, dynamic> json,
) => FluffyOwnerReference(
  apiVersion: json['apiVersion'] as String,
  blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
  controller: json['controller'] as bool?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$FluffyOwnerReferenceToJson(
  FluffyOwnerReference instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'blockOwnerDeletion': instance.blockOwnerDeletion,
  'controller': instance.controller,
  'kind': instance.kind,
  'name': instance.name,
  'uid': instance.uid,
};

TemplateSpec _$TemplateSpecFromJson(Map<String, dynamic> json) => TemplateSpec(
  activeDeadlineSeconds: (json['activeDeadlineSeconds'] as num?)?.toInt(),
  affinity: json['affinity'] == null
      ? null
      : Affinity.fromJson(json['affinity'] as Map<String, dynamic>),
  automountServiceAccountToken: json['automountServiceAccountToken'] as bool?,
  containers: (json['containers'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Container.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  dnsConfig: json['dnsConfig'] == null
      ? null
      : DnsConfig.fromJson(json['dnsConfig'] as Map<String, dynamic>),
  dnsPolicy: $enumDecodeNullable(_$DnsPolicyEnumMap, json['dnsPolicy']),
  enableServiceLinks: json['enableServiceLinks'] as bool?,
  ephemeralContainers: (json['ephemeralContainers'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : EphemeralContainer.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  hostAliases: (json['hostAliases'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : HostAlias.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  hostIpc: json['hostIPC'] as bool?,
  hostname: json['hostname'] as String?,
  hostnameOverride: json['hostnameOverride'] as String?,
  hostNetwork: json['hostNetwork'] as bool?,
  hostPid: json['hostPID'] as bool?,
  hostUsers: json['hostUsers'] as bool?,
  imagePullSecrets: (json['imagePullSecrets'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ImagePullSecret.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  initContainers: (json['initContainers'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainer.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  nodeName: json['nodeName'] as String?,
  nodeSelector: (json['nodeSelector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  os: json['os'] == null
      ? null
      : Os.fromJson(json['os'] as Map<String, dynamic>),
  overhead: json['overhead'] as Map<String, dynamic>?,
  preemptionPolicy: $enumDecodeNullable(
    _$PreemptionPolicyEnumMap,
    json['preemptionPolicy'],
  ),
  priority: (json['priority'] as num?)?.toInt(),
  priorityClassName: json['priorityClassName'] as String?,
  readinessGates: (json['readinessGates'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ReadinessGate.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceClaims: (json['resourceClaims'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ResourceClaim.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resources: json['resources'] == null
      ? null
      : PurpleResources.fromJson(json['resources'] as Map<String, dynamic>),
  restartPolicy: $enumDecodeNullable(
    _$RestartPolicyEnumMap,
    json['restartPolicy'],
  ),
  runtimeClassName: json['runtimeClassName'] as String?,
  schedulerName: json['schedulerName'] as String?,
  schedulingGates: (json['schedulingGates'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SchedulingGate.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  securityContext: json['securityContext'] == null
      ? null
      : SpecSecurityContext.fromJson(
          json['securityContext'] as Map<String, dynamic>,
        ),
  serviceAccount: json['serviceAccount'] as String?,
  serviceAccountName: json['serviceAccountName'] as String?,
  setHostnameAsFqdn: json['setHostnameAsFQDN'] as bool?,
  shareProcessNamespace: json['shareProcessNamespace'] as bool?,
  subdomain: json['subdomain'] as String?,
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Toleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  topologySpreadConstraints:
      (json['topologySpreadConstraints'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TopologySpreadConstraint.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  volumes: (json['volumes'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Volume.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  workloadRef: json['workloadRef'] == null
      ? null
      : WorkloadRef.fromJson(json['workloadRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TemplateSpecToJson(TemplateSpec instance) =>
    <String, dynamic>{
      'activeDeadlineSeconds': instance.activeDeadlineSeconds,
      'affinity': instance.affinity,
      'automountServiceAccountToken': instance.automountServiceAccountToken,
      'containers': instance.containers,
      'dnsConfig': instance.dnsConfig,
      'dnsPolicy': _$DnsPolicyEnumMap[instance.dnsPolicy],
      'enableServiceLinks': instance.enableServiceLinks,
      'ephemeralContainers': instance.ephemeralContainers,
      'hostAliases': instance.hostAliases,
      'hostIPC': instance.hostIpc,
      'hostname': instance.hostname,
      'hostnameOverride': instance.hostnameOverride,
      'hostNetwork': instance.hostNetwork,
      'hostPID': instance.hostPid,
      'hostUsers': instance.hostUsers,
      'imagePullSecrets': instance.imagePullSecrets,
      'initContainers': instance.initContainers,
      'nodeName': instance.nodeName,
      'nodeSelector': instance.nodeSelector,
      'os': instance.os,
      'overhead': instance.overhead,
      'preemptionPolicy': _$PreemptionPolicyEnumMap[instance.preemptionPolicy],
      'priority': instance.priority,
      'priorityClassName': instance.priorityClassName,
      'readinessGates': instance.readinessGates,
      'resourceClaims': instance.resourceClaims,
      'resources': instance.resources,
      'restartPolicy': _$RestartPolicyEnumMap[instance.restartPolicy],
      'runtimeClassName': instance.runtimeClassName,
      'schedulerName': instance.schedulerName,
      'schedulingGates': instance.schedulingGates,
      'securityContext': instance.securityContext,
      'serviceAccount': instance.serviceAccount,
      'serviceAccountName': instance.serviceAccountName,
      'setHostnameAsFQDN': instance.setHostnameAsFqdn,
      'shareProcessNamespace': instance.shareProcessNamespace,
      'subdomain': instance.subdomain,
      'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
      'tolerations': instance.tolerations,
      'topologySpreadConstraints': instance.topologySpreadConstraints,
      'volumes': instance.volumes,
      'workloadRef': instance.workloadRef,
    };

const _$DnsPolicyEnumMap = {
  DnsPolicy.CLUSTER_FIRST: 'ClusterFirst',
  DnsPolicy.CLUSTER_FIRST_WITH_HOST_NET: 'ClusterFirstWithHostNet',
  DnsPolicy.DEFAULT: 'Default',
  DnsPolicy.NONE: 'None',
};

const _$PreemptionPolicyEnumMap = {
  PreemptionPolicy.NEVER: 'Never',
  PreemptionPolicy.PREEMPT_LOWER_PRIORITY: 'PreemptLowerPriority',
};

const _$RestartPolicyEnumMap = {
  RestartPolicy.ALWAYS: 'Always',
  RestartPolicy.NEVER: 'Never',
  RestartPolicy.ON_FAILURE: 'OnFailure',
};

Affinity _$AffinityFromJson(Map<String, dynamic> json) => Affinity(
  nodeAffinity: json['nodeAffinity'] == null
      ? null
      : NodeAffinity.fromJson(json['nodeAffinity'] as Map<String, dynamic>),
  podAffinity: json['podAffinity'] == null
      ? null
      : PodAffinity.fromJson(json['podAffinity'] as Map<String, dynamic>),
  podAntiAffinity: json['podAntiAffinity'] == null
      ? null
      : PodAntiAffinity.fromJson(
          json['podAntiAffinity'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AffinityToJson(Affinity instance) => <String, dynamic>{
  'nodeAffinity': instance.nodeAffinity,
  'podAffinity': instance.podAffinity,
  'podAntiAffinity': instance.podAntiAffinity,
};

NodeAffinity _$NodeAffinityFromJson(Map<String, dynamic> json) => NodeAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      json['requiredDuringSchedulingIgnoredDuringExecution'] == null
      ? null
      : NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
          json['requiredDuringSchedulingIgnoredDuringExecution']
              as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$NodeAffinityToJson(NodeAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution
_$NodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution(
  preference: Preference.fromJson(json['preference'] as Map<String, dynamic>),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$NodeAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  NodeAffinityPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'preference': instance.preference,
  'weight': instance.weight,
};

Preference _$PreferenceFromJson(Map<String, dynamic> json) => Preference(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PreferenceMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchFields: (json['matchFields'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PreferenceMatchField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PreferenceToJson(Preference instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

PreferenceMatchExpression _$PreferenceMatchExpressionFromJson(
  Map<String, dynamic> json,
) => PreferenceMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: $enumDecode(
    _$MatchExpressionOperatorEnumMap,
    json['operator'],
  ),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PreferenceMatchExpressionToJson(
  PreferenceMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator':
      _$MatchExpressionOperatorEnumMap[instance.matchExpressionOperator]!,
  'values': instance.values,
};

const _$MatchExpressionOperatorEnumMap = {
  MatchExpressionOperator.DOES_NOT_EXIST: 'DoesNotExist',
  MatchExpressionOperator.EXISTS: 'Exists',
  MatchExpressionOperator.GT: 'Gt',
  MatchExpressionOperator.IN: 'In',
  MatchExpressionOperator.LT: 'Lt',
  MatchExpressionOperator.NOT_IN: 'NotIn',
};

PreferenceMatchField _$PreferenceMatchFieldFromJson(
  Map<String, dynamic> json,
) => PreferenceMatchField(
  key: json['key'] as String,
  matchFieldOperator: $enumDecode(
    _$MatchExpressionOperatorEnumMap,
    json['operator'],
  ),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PreferenceMatchFieldToJson(
  PreferenceMatchField instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': _$MatchExpressionOperatorEnumMap[instance.matchFieldOperator]!,
  'values': instance.values,
};

NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution
_$NodeAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution(
  nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : NodeSelectorTerm.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic>
_$NodeAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  NodeAffinityRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

NodeSelectorTerm _$NodeSelectorTermFromJson(Map<String, dynamic> json) =>
    NodeSelectorTerm(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NodeSelectorTermMatchExpression.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      matchFields: (json['matchFields'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NodeSelectorTermMatchField.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
    );

Map<String, dynamic> _$NodeSelectorTermToJson(NodeSelectorTerm instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

NodeSelectorTermMatchExpression _$NodeSelectorTermMatchExpressionFromJson(
  Map<String, dynamic> json,
) => NodeSelectorTermMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: $enumDecode(
    _$MatchExpressionOperatorEnumMap,
    json['operator'],
  ),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$NodeSelectorTermMatchExpressionToJson(
  NodeSelectorTermMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator':
      _$MatchExpressionOperatorEnumMap[instance.matchExpressionOperator]!,
  'values': instance.values,
};

NodeSelectorTermMatchField _$NodeSelectorTermMatchFieldFromJson(
  Map<String, dynamic> json,
) => NodeSelectorTermMatchField(
  key: json['key'] as String,
  matchFieldOperator: $enumDecode(
    _$MatchExpressionOperatorEnumMap,
    json['operator'],
  ),
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$NodeSelectorTermMatchFieldToJson(
  NodeSelectorTermMatchField instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': _$MatchExpressionOperatorEnumMap[instance.matchFieldOperator]!,
  'values': instance.values,
};

PodAffinity _$PodAffinityFromJson(Map<String, dynamic> json) => PodAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PodAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PodAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$PodAffinityToJson(PodAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

PodAffinityPreferredDuringSchedulingIgnoredDuringExecution
_$PodAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PodAffinityPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: PurplePodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$PodAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  PodAffinityPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

PurplePodAffinityTerm _$PurplePodAffinityTermFromJson(
  Map<String, dynamic> json,
) => PurplePodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : PurpleLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : PurpleNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$PurplePodAffinityTermToJson(
  PurplePodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

PurpleLabelSelector _$PurpleLabelSelectorFromJson(Map<String, dynamic> json) =>
    PurpleLabelSelector(
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

Map<String, dynamic> _$PurpleLabelSelectorToJson(
  PurpleLabelSelector instance,
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

PurpleNamespaceSelector _$PurpleNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => PurpleNamespaceSelector(
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

Map<String, dynamic> _$PurpleNamespaceSelectorToJson(
  PurpleNamespaceSelector instance,
) => <String, dynamic>{
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

PodAffinityRequiredDuringSchedulingIgnoredDuringExecution
_$PodAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PodAffinityRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : FluffyLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : FluffyNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$PodAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  PodAffinityRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

FluffyLabelSelector _$FluffyLabelSelectorFromJson(Map<String, dynamic> json) =>
    FluffyLabelSelector(
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

Map<String, dynamic> _$FluffyLabelSelectorToJson(
  FluffyLabelSelector instance,
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

FluffyNamespaceSelector _$FluffyNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => FluffyNamespaceSelector(
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

Map<String, dynamic> _$FluffyNamespaceSelectorToJson(
  FluffyNamespaceSelector instance,
) => <String, dynamic>{
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

PodAntiAffinity _$PodAntiAffinityFromJson(
  Map<String, dynamic> json,
) => PodAntiAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$PodAntiAffinityToJson(PodAntiAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution
_$PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: FluffyPodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  PodAntiAffinityPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

FluffyPodAffinityTerm _$FluffyPodAffinityTermFromJson(
  Map<String, dynamic> json,
) => FluffyPodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : TentacledLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : TentacledNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$FluffyPodAffinityTermToJson(
  FluffyPodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

TentacledLabelSelector _$TentacledLabelSelectorFromJson(
  Map<String, dynamic> json,
) => TentacledLabelSelector(
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

Map<String, dynamic> _$TentacledLabelSelectorToJson(
  TentacledLabelSelector instance,
) => <String, dynamic>{
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

TentacledNamespaceSelector _$TentacledNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => TentacledNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledNamespaceSelectorToJson(
  TentacledNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

IndecentMatchExpression _$IndecentMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndecentMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndecentMatchExpressionToJson(
  IndecentMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution
_$PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : StickyLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : StickyNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  PodAntiAffinityRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

StickyLabelSelector _$StickyLabelSelectorFromJson(Map<String, dynamic> json) =>
    StickyLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$StickyLabelSelectorToJson(
  StickyLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

HilariousMatchExpression _$HilariousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => HilariousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$HilariousMatchExpressionToJson(
  HilariousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

StickyNamespaceSelector _$StickyNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => StickyNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AmbitiousMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$StickyNamespaceSelectorToJson(
  StickyNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

AmbitiousMatchExpression _$AmbitiousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => AmbitiousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$AmbitiousMatchExpressionToJson(
  AmbitiousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

Container _$ContainerFromJson(Map<String, dynamic> json) => Container(
  args: (json['args'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ContainerEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  envFrom: (json['envFrom'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerEnvFrom.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  image: json['image'] as String?,
  imagePullPolicy: $enumDecodeNullable(
    _$PullPolicyEnumMap,
    json['imagePullPolicy'],
  ),
  lifecycle: json['lifecycle'] == null
      ? null
      : ContainerLifecycle.fromJson(json['lifecycle'] as Map<String, dynamic>),
  livenessProbe: json['livenessProbe'] == null
      ? null
      : ContainerLivenessProbe.fromJson(
          json['livenessProbe'] as Map<String, dynamic>,
        ),
  name: json['name'] as String,
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  readinessProbe: json['readinessProbe'] == null
      ? null
      : ContainerReadinessProbe.fromJson(
          json['readinessProbe'] as Map<String, dynamic>,
        ),
  resizePolicy: (json['resizePolicy'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerResizePolicy.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resources: json['resources'] == null
      ? null
      : ContainerResources.fromJson(json['resources'] as Map<String, dynamic>),
  restartPolicy: json['restartPolicy'] as String?,
  restartPolicyRules: (json['restartPolicyRules'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerRestartPolicyRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  securityContext: json['securityContext'] == null
      ? null
      : ContainerSecurityContext.fromJson(
          json['securityContext'] as Map<String, dynamic>,
        ),
  startupProbe: json['startupProbe'] == null
      ? null
      : ContainerStartupProbe.fromJson(
          json['startupProbe'] as Map<String, dynamic>,
        ),
  stdin: json['stdin'] as bool?,
  stdinOnce: json['stdinOnce'] as bool?,
  terminationMessagePath: json['terminationMessagePath'] as String?,
  terminationMessagePolicy: $enumDecodeNullable(
    _$TerminationMessagePolicyEnumMap,
    json['terminationMessagePolicy'],
  ),
  tty: json['tty'] as bool?,
  volumeDevices: (json['volumeDevices'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerVolumeDevice.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  volumeMounts: (json['volumeMounts'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ContainerVolumeMount.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  workingDir: json['workingDir'] as String?,
);

Map<String, dynamic> _$ContainerToJson(Container instance) => <String, dynamic>{
  'args': instance.args,
  'command': instance.command,
  'env': instance.env,
  'envFrom': instance.envFrom,
  'image': instance.image,
  'imagePullPolicy': _$PullPolicyEnumMap[instance.imagePullPolicy],
  'lifecycle': instance.lifecycle,
  'livenessProbe': instance.livenessProbe,
  'name': instance.name,
  'ports': instance.ports,
  'readinessProbe': instance.readinessProbe,
  'resizePolicy': instance.resizePolicy,
  'resources': instance.resources,
  'restartPolicy': instance.restartPolicy,
  'restartPolicyRules': instance.restartPolicyRules,
  'securityContext': instance.securityContext,
  'startupProbe': instance.startupProbe,
  'stdin': instance.stdin,
  'stdinOnce': instance.stdinOnce,
  'terminationMessagePath': instance.terminationMessagePath,
  'terminationMessagePolicy':
      _$TerminationMessagePolicyEnumMap[instance.terminationMessagePolicy],
  'tty': instance.tty,
  'volumeDevices': instance.volumeDevices,
  'volumeMounts': instance.volumeMounts,
  'workingDir': instance.workingDir,
};

const _$PullPolicyEnumMap = {
  PullPolicy.ALWAYS: 'Always',
  PullPolicy.IF_NOT_PRESENT: 'IfNotPresent',
  PullPolicy.NEVER: 'Never',
};

const _$TerminationMessagePolicyEnumMap = {
  TerminationMessagePolicy.FALLBACK_TO_LOGS_ON_ERROR: 'FallbackToLogsOnError',
  TerminationMessagePolicy.FILE: 'File',
};

ContainerEnv _$ContainerEnvFromJson(Map<String, dynamic> json) => ContainerEnv(
  name: json['name'] as String,
  value: json['value'] as String?,
  valueFrom: json['valueFrom'] == null
      ? null
      : PurpleValueFrom.fromJson(json['valueFrom'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContainerEnvToJson(ContainerEnv instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'valueFrom': instance.valueFrom,
    };

PurpleValueFrom _$PurpleValueFromFromJson(Map<String, dynamic> json) =>
    PurpleValueFrom(
      configMapKeyRef: json['configMapKeyRef'] == null
          ? null
          : PurpleConfigMapKeyRef.fromJson(
              json['configMapKeyRef'] as Map<String, dynamic>,
            ),
      fieldRef: json['fieldRef'] == null
          ? null
          : PurpleFieldRef.fromJson(json['fieldRef'] as Map<String, dynamic>),
      fileKeyRef: json['fileKeyRef'] == null
          ? null
          : PurpleFileKeyRef.fromJson(
              json['fileKeyRef'] as Map<String, dynamic>,
            ),
      resourceFieldRef: json['resourceFieldRef'] == null
          ? null
          : PurpleResourceFieldRef.fromJson(
              json['resourceFieldRef'] as Map<String, dynamic>,
            ),
      secretKeyRef: json['secretKeyRef'] == null
          ? null
          : PurpleSecretKeyRef.fromJson(
              json['secretKeyRef'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PurpleValueFromToJson(PurpleValueFrom instance) =>
    <String, dynamic>{
      'configMapKeyRef': instance.configMapKeyRef,
      'fieldRef': instance.fieldRef,
      'fileKeyRef': instance.fileKeyRef,
      'resourceFieldRef': instance.resourceFieldRef,
      'secretKeyRef': instance.secretKeyRef,
    };

PurpleConfigMapKeyRef _$PurpleConfigMapKeyRefFromJson(
  Map<String, dynamic> json,
) => PurpleConfigMapKeyRef(
  key: json['key'] as String,
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$PurpleConfigMapKeyRefToJson(
  PurpleConfigMapKeyRef instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'optional': instance.optional,
};

PurpleFieldRef _$PurpleFieldRefFromJson(Map<String, dynamic> json) =>
    PurpleFieldRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String,
    );

Map<String, dynamic> _$PurpleFieldRefToJson(PurpleFieldRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
    };

PurpleFileKeyRef _$PurpleFileKeyRefFromJson(Map<String, dynamic> json) =>
    PurpleFileKeyRef(
      key: json['key'] as String,
      optional: json['optional'] as bool?,
      path: json['path'] as String,
      volumeName: json['volumeName'] as String,
    );

Map<String, dynamic> _$PurpleFileKeyRefToJson(PurpleFileKeyRef instance) =>
    <String, dynamic>{
      'key': instance.key,
      'optional': instance.optional,
      'path': instance.path,
      'volumeName': instance.volumeName,
    };

PurpleResourceFieldRef _$PurpleResourceFieldRefFromJson(
  Map<String, dynamic> json,
) => PurpleResourceFieldRef(
  containerName: json['containerName'] as String?,
  divisor: json['divisor'],
  resource: json['resource'] as String,
);

Map<String, dynamic> _$PurpleResourceFieldRefToJson(
  PurpleResourceFieldRef instance,
) => <String, dynamic>{
  'containerName': instance.containerName,
  'divisor': instance.divisor,
  'resource': instance.resource,
};

PurpleSecretKeyRef _$PurpleSecretKeyRefFromJson(Map<String, dynamic> json) =>
    PurpleSecretKeyRef(
      key: json['key'] as String,
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$PurpleSecretKeyRefToJson(PurpleSecretKeyRef instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'optional': instance.optional,
    };

ContainerEnvFrom _$ContainerEnvFromFromJson(Map<String, dynamic> json) =>
    ContainerEnvFrom(
      configMapRef: json['configMapRef'] == null
          ? null
          : PurpleConfigMapRef.fromJson(
              json['configMapRef'] as Map<String, dynamic>,
            ),
      prefix: json['prefix'] as String?,
      secretRef: json['secretRef'] == null
          ? null
          : PurpleSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContainerEnvFromToJson(ContainerEnvFrom instance) =>
    <String, dynamic>{
      'configMapRef': instance.configMapRef,
      'prefix': instance.prefix,
      'secretRef': instance.secretRef,
    };

PurpleConfigMapRef _$PurpleConfigMapRefFromJson(Map<String, dynamic> json) =>
    PurpleConfigMapRef(
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$PurpleConfigMapRefToJson(PurpleConfigMapRef instance) =>
    <String, dynamic>{'name': instance.name, 'optional': instance.optional};

PurpleSecretRef _$PurpleSecretRefFromJson(Map<String, dynamic> json) =>
    PurpleSecretRef(
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$PurpleSecretRefToJson(PurpleSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'optional': instance.optional};

ContainerLifecycle _$ContainerLifecycleFromJson(Map<String, dynamic> json) =>
    ContainerLifecycle(
      postStart: json['postStart'] == null
          ? null
          : PurplePostStart.fromJson(json['postStart'] as Map<String, dynamic>),
      preStop: json['preStop'] == null
          ? null
          : PurplePreStop.fromJson(json['preStop'] as Map<String, dynamic>),
      stopSignal: $enumDecodeNullable(_$StopSignalEnumMap, json['stopSignal']),
    );

Map<String, dynamic> _$ContainerLifecycleToJson(ContainerLifecycle instance) =>
    <String, dynamic>{
      'postStart': instance.postStart,
      'preStop': instance.preStop,
      'stopSignal': _$StopSignalEnumMap[instance.stopSignal],
    };

const _$StopSignalEnumMap = {
  StopSignal.SIGABRT: 'SIGABRT',
  StopSignal.SIGALRM: 'SIGALRM',
  StopSignal.SIGBUS: 'SIGBUS',
  StopSignal.SIGCHLD: 'SIGCHLD',
  StopSignal.SIGCLD: 'SIGCLD',
  StopSignal.SIGCONT: 'SIGCONT',
  StopSignal.SIGFPE: 'SIGFPE',
  StopSignal.SIGHUP: 'SIGHUP',
  StopSignal.SIGILL: 'SIGILL',
  StopSignal.SIGINT: 'SIGINT',
  StopSignal.SIGIO: 'SIGIO',
  StopSignal.SIGIOT: 'SIGIOT',
  StopSignal.SIGKILL: 'SIGKILL',
  StopSignal.SIGPIPE: 'SIGPIPE',
  StopSignal.SIGPOLL: 'SIGPOLL',
  StopSignal.SIGPROF: 'SIGPROF',
  StopSignal.SIGPWR: 'SIGPWR',
  StopSignal.SIGQUIT: 'SIGQUIT',
  StopSignal.SIGRTMAX: 'SIGRTMAX',
  StopSignal.SIGRTMAX_1: 'SIGRTMAX-1',
  StopSignal.SIGRTMAX_10: 'SIGRTMAX-10',
  StopSignal.SIGRTMAX_11: 'SIGRTMAX-11',
  StopSignal.SIGRTMAX_12: 'SIGRTMAX-12',
  StopSignal.SIGRTMAX_13: 'SIGRTMAX-13',
  StopSignal.SIGRTMAX_14: 'SIGRTMAX-14',
  StopSignal.SIGRTMAX_2: 'SIGRTMAX-2',
  StopSignal.SIGRTMAX_3: 'SIGRTMAX-3',
  StopSignal.SIGRTMAX_4: 'SIGRTMAX-4',
  StopSignal.SIGRTMAX_5: 'SIGRTMAX-5',
  StopSignal.SIGRTMAX_6: 'SIGRTMAX-6',
  StopSignal.SIGRTMAX_7: 'SIGRTMAX-7',
  StopSignal.SIGRTMAX_8: 'SIGRTMAX-8',
  StopSignal.SIGRTMAX_9: 'SIGRTMAX-9',
  StopSignal.SIGRTMIN: 'SIGRTMIN',
  StopSignal.SIGRTMIN_1: 'SIGRTMIN+1',
  StopSignal.SIGRTMIN_10: 'SIGRTMIN+10',
  StopSignal.SIGRTMIN_11: 'SIGRTMIN+11',
  StopSignal.SIGRTMIN_12: 'SIGRTMIN+12',
  StopSignal.SIGRTMIN_13: 'SIGRTMIN+13',
  StopSignal.SIGRTMIN_14: 'SIGRTMIN+14',
  StopSignal.SIGRTMIN_15: 'SIGRTMIN+15',
  StopSignal.SIGRTMIN_2: 'SIGRTMIN+2',
  StopSignal.SIGRTMIN_3: 'SIGRTMIN+3',
  StopSignal.SIGRTMIN_4: 'SIGRTMIN+4',
  StopSignal.SIGRTMIN_5: 'SIGRTMIN+5',
  StopSignal.SIGRTMIN_6: 'SIGRTMIN+6',
  StopSignal.SIGRTMIN_7: 'SIGRTMIN+7',
  StopSignal.SIGRTMIN_8: 'SIGRTMIN+8',
  StopSignal.SIGRTMIN_9: 'SIGRTMIN+9',
  StopSignal.SIGSEGV: 'SIGSEGV',
  StopSignal.SIGSTKFLT: 'SIGSTKFLT',
  StopSignal.SIGSTOP: 'SIGSTOP',
  StopSignal.SIGSYS: 'SIGSYS',
  StopSignal.SIGTERM: 'SIGTERM',
  StopSignal.SIGTRAP: 'SIGTRAP',
  StopSignal.SIGTSTP: 'SIGTSTP',
  StopSignal.SIGTTIN: 'SIGTTIN',
  StopSignal.SIGTTOU: 'SIGTTOU',
  StopSignal.SIGURG: 'SIGURG',
  StopSignal.SIGUSR1: 'SIGUSR1',
  StopSignal.SIGUSR2: 'SIGUSR2',
  StopSignal.SIGVTALRM: 'SIGVTALRM',
  StopSignal.SIGWINCH: 'SIGWINCH',
  StopSignal.SIGXCPU: 'SIGXCPU',
  StopSignal.SIGXFSZ: 'SIGXFSZ',
};

PurplePostStart _$PurplePostStartFromJson(Map<String, dynamic> json) =>
    PurplePostStart(
      exec: json['exec'] == null
          ? null
          : PurpleExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : PurpleHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
      sleep: json['sleep'] == null
          ? null
          : PurpleSleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : PurpleTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurplePostStartToJson(PurplePostStart instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

PurpleExec _$PurpleExecFromJson(Map<String, dynamic> json) => PurpleExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$PurpleExecToJson(PurpleExec instance) =>
    <String, dynamic>{'command': instance.command};

PurpleHttpGet _$PurpleHttpGetFromJson(Map<String, dynamic> json) =>
    PurpleHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$PurpleHttpGetToJson(PurpleHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

const _$SchemeEnumMap = {Scheme.HTTP: 'HTTP', Scheme.HTTPS: 'HTTPS'};

PurpleHttpHeader _$PurpleHttpHeaderFromJson(Map<String, dynamic> json) =>
    PurpleHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$PurpleHttpHeaderToJson(PurpleHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

PurpleSleep _$PurpleSleepFromJson(Map<String, dynamic> json) =>
    PurpleSleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$PurpleSleepToJson(PurpleSleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

PurpleTcpSocket _$PurpleTcpSocketFromJson(Map<String, dynamic> json) =>
    PurpleTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$PurpleTcpSocketToJson(PurpleTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

PurplePreStop _$PurplePreStopFromJson(Map<String, dynamic> json) =>
    PurplePreStop(
      exec: json['exec'] == null
          ? null
          : FluffyExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : FluffyHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
      sleep: json['sleep'] == null
          ? null
          : FluffySleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : FluffyTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurplePreStopToJson(PurplePreStop instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

FluffyExec _$FluffyExecFromJson(Map<String, dynamic> json) => FluffyExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$FluffyExecToJson(FluffyExec instance) =>
    <String, dynamic>{'command': instance.command};

FluffyHttpGet _$FluffyHttpGetFromJson(Map<String, dynamic> json) =>
    FluffyHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$FluffyHttpGetToJson(FluffyHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

FluffyHttpHeader _$FluffyHttpHeaderFromJson(Map<String, dynamic> json) =>
    FluffyHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$FluffyHttpHeaderToJson(FluffyHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

FluffySleep _$FluffySleepFromJson(Map<String, dynamic> json) =>
    FluffySleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$FluffySleepToJson(FluffySleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

FluffyTcpSocket _$FluffyTcpSocketFromJson(Map<String, dynamic> json) =>
    FluffyTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$FluffyTcpSocketToJson(FluffyTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

ContainerLivenessProbe _$ContainerLivenessProbeFromJson(
  Map<String, dynamic> json,
) => ContainerLivenessProbe(
  exec: json['exec'] == null
      ? null
      : TentacledExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : PurpleGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : TentacledHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : TentacledTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContainerLivenessProbeToJson(
  ContainerLivenessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

TentacledExec _$TentacledExecFromJson(Map<String, dynamic> json) =>
    TentacledExec(
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$TentacledExecToJson(TentacledExec instance) =>
    <String, dynamic>{'command': instance.command};

PurpleGrpc _$PurpleGrpcFromJson(Map<String, dynamic> json) => PurpleGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$PurpleGrpcToJson(PurpleGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

TentacledHttpGet _$TentacledHttpGetFromJson(Map<String, dynamic> json) =>
    TentacledHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$TentacledHttpGetToJson(TentacledHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

TentacledHttpHeader _$TentacledHttpHeaderFromJson(Map<String, dynamic> json) =>
    TentacledHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$TentacledHttpHeaderToJson(
  TentacledHttpHeader instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

TentacledTcpSocket _$TentacledTcpSocketFromJson(Map<String, dynamic> json) =>
    TentacledTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$TentacledTcpSocketToJson(TentacledTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

ContainerPort _$ContainerPortFromJson(Map<String, dynamic> json) =>
    ContainerPort(
      containerPort: (json['containerPort'] as num).toInt(),
      hostIp: json['hostIP'] as String?,
      hostPort: (json['hostPort'] as num?)?.toInt(),
      name: json['name'] as String?,
      protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
    );

Map<String, dynamic> _$ContainerPortToJson(ContainerPort instance) =>
    <String, dynamic>{
      'containerPort': instance.containerPort,
      'hostIP': instance.hostIp,
      'hostPort': instance.hostPort,
      'name': instance.name,
      'protocol': _$ProtocolEnumMap[instance.protocol],
    };

const _$ProtocolEnumMap = {
  Protocol.SCTP: 'SCTP',
  Protocol.TCP: 'TCP',
  Protocol.UDP: 'UDP',
};

ContainerReadinessProbe _$ContainerReadinessProbeFromJson(
  Map<String, dynamic> json,
) => ContainerReadinessProbe(
  exec: json['exec'] == null
      ? null
      : StickyExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : FluffyGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : StickyHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : StickyTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContainerReadinessProbeToJson(
  ContainerReadinessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

StickyExec _$StickyExecFromJson(Map<String, dynamic> json) => StickyExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$StickyExecToJson(StickyExec instance) =>
    <String, dynamic>{'command': instance.command};

FluffyGrpc _$FluffyGrpcFromJson(Map<String, dynamic> json) => FluffyGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$FluffyGrpcToJson(FluffyGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

StickyHttpGet _$StickyHttpGetFromJson(Map<String, dynamic> json) =>
    StickyHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$StickyHttpGetToJson(StickyHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

StickyHttpHeader _$StickyHttpHeaderFromJson(Map<String, dynamic> json) =>
    StickyHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$StickyHttpHeaderToJson(StickyHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

StickyTcpSocket _$StickyTcpSocketFromJson(Map<String, dynamic> json) =>
    StickyTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$StickyTcpSocketToJson(StickyTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

ContainerResizePolicy _$ContainerResizePolicyFromJson(
  Map<String, dynamic> json,
) => ContainerResizePolicy(
  resourceName: json['resourceName'] as String,
  restartPolicy: json['restartPolicy'] as String,
);

Map<String, dynamic> _$ContainerResizePolicyToJson(
  ContainerResizePolicy instance,
) => <String, dynamic>{
  'resourceName': instance.resourceName,
  'restartPolicy': instance.restartPolicy,
};

ContainerResources _$ContainerResourcesFromJson(Map<String, dynamic> json) =>
    ContainerResources(
      claims: (json['claims'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleClaim.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ContainerResourcesToJson(ContainerResources instance) =>
    <String, dynamic>{
      'claims': instance.claims,
      'limits': instance.limits,
      'requests': instance.requests,
    };

PurpleClaim _$PurpleClaimFromJson(Map<String, dynamic> json) => PurpleClaim(
  name: json['name'] as String,
  request: json['request'] as String?,
);

Map<String, dynamic> _$PurpleClaimToJson(PurpleClaim instance) =>
    <String, dynamic>{'name': instance.name, 'request': instance.request};

ContainerRestartPolicyRule _$ContainerRestartPolicyRuleFromJson(
  Map<String, dynamic> json,
) => ContainerRestartPolicyRule(
  action: json['action'] as String,
  exitCodes: json['exitCodes'] == null
      ? null
      : PurpleExitCodes.fromJson(json['exitCodes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContainerRestartPolicyRuleToJson(
  ContainerRestartPolicyRule instance,
) => <String, dynamic>{
  'action': instance.action,
  'exitCodes': instance.exitCodes,
};

PurpleExitCodes _$PurpleExitCodesFromJson(Map<String, dynamic> json) =>
    PurpleExitCodes(
      exitCodesOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
    );

Map<String, dynamic> _$PurpleExitCodesToJson(PurpleExitCodes instance) =>
    <String, dynamic>{
      'operator': instance.exitCodesOperator,
      'values': instance.values,
    };

ContainerSecurityContext _$ContainerSecurityContextFromJson(
  Map<String, dynamic> json,
) => ContainerSecurityContext(
  allowPrivilegeEscalation: json['allowPrivilegeEscalation'] as bool?,
  appArmorProfile: json['appArmorProfile'] == null
      ? null
      : PurpleAppArmorProfile.fromJson(
          json['appArmorProfile'] as Map<String, dynamic>,
        ),
  capabilities: json['capabilities'] == null
      ? null
      : PurpleCapabilities.fromJson(
          json['capabilities'] as Map<String, dynamic>,
        ),
  privileged: json['privileged'] as bool?,
  procMount: $enumDecodeNullable(_$ProcMountEnumMap, json['procMount']),
  readOnlyRootFilesystem: json['readOnlyRootFilesystem'] as bool?,
  runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
  runAsNonRoot: json['runAsNonRoot'] as bool?,
  runAsUser: (json['runAsUser'] as num?)?.toInt(),
  seccompProfile: json['seccompProfile'] == null
      ? null
      : PurpleSeccompProfile.fromJson(
          json['seccompProfile'] as Map<String, dynamic>,
        ),
  seLinuxOptions: json['seLinuxOptions'] == null
      ? null
      : PurpleSeLinuxOptions.fromJson(
          json['seLinuxOptions'] as Map<String, dynamic>,
        ),
  windowsOptions: json['windowsOptions'] == null
      ? null
      : PurpleWindowsOptions.fromJson(
          json['windowsOptions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ContainerSecurityContextToJson(
  ContainerSecurityContext instance,
) => <String, dynamic>{
  'allowPrivilegeEscalation': instance.allowPrivilegeEscalation,
  'appArmorProfile': instance.appArmorProfile,
  'capabilities': instance.capabilities,
  'privileged': instance.privileged,
  'procMount': _$ProcMountEnumMap[instance.procMount],
  'readOnlyRootFilesystem': instance.readOnlyRootFilesystem,
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxOptions': instance.seLinuxOptions,
  'windowsOptions': instance.windowsOptions,
};

const _$ProcMountEnumMap = {
  ProcMount.DEFAULT: 'Default',
  ProcMount.UNMASKED: 'Unmasked',
};

PurpleAppArmorProfile _$PurpleAppArmorProfileFromJson(
  Map<String, dynamic> json,
) => PurpleAppArmorProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$PurpleAppArmorProfileToJson(
  PurpleAppArmorProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

const _$AppArmorProfileTypeEnumMap = {
  AppArmorProfileType.LOCALHOST: 'Localhost',
  AppArmorProfileType.RUNTIME_DEFAULT: 'RuntimeDefault',
  AppArmorProfileType.UNCONFINED: 'Unconfined',
};

PurpleCapabilities _$PurpleCapabilitiesFromJson(Map<String, dynamic> json) =>
    PurpleCapabilities(
      add: (json['add'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      drop: (json['drop'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$PurpleCapabilitiesToJson(PurpleCapabilities instance) =>
    <String, dynamic>{'add': instance.add, 'drop': instance.drop};

PurpleSeLinuxOptions _$PurpleSeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => PurpleSeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$PurpleSeLinuxOptionsToJson(
  PurpleSeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

PurpleSeccompProfile _$PurpleSeccompProfileFromJson(
  Map<String, dynamic> json,
) => PurpleSeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$PurpleSeccompProfileToJson(
  PurpleSeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

PurpleWindowsOptions _$PurpleWindowsOptionsFromJson(
  Map<String, dynamic> json,
) => PurpleWindowsOptions(
  gmsaCredentialSpec: json['gmsaCredentialSpec'] as String?,
  gmsaCredentialSpecName: json['gmsaCredentialSpecName'] as String?,
  hostProcess: json['hostProcess'] as bool?,
  runAsUserName: json['runAsUserName'] as String?,
);

Map<String, dynamic> _$PurpleWindowsOptionsToJson(
  PurpleWindowsOptions instance,
) => <String, dynamic>{
  'gmsaCredentialSpec': instance.gmsaCredentialSpec,
  'gmsaCredentialSpecName': instance.gmsaCredentialSpecName,
  'hostProcess': instance.hostProcess,
  'runAsUserName': instance.runAsUserName,
};

ContainerStartupProbe _$ContainerStartupProbeFromJson(
  Map<String, dynamic> json,
) => ContainerStartupProbe(
  exec: json['exec'] == null
      ? null
      : IndigoExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : TentacledGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : IndigoHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : IndigoTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContainerStartupProbeToJson(
  ContainerStartupProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

IndigoExec _$IndigoExecFromJson(Map<String, dynamic> json) => IndigoExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$IndigoExecToJson(IndigoExec instance) =>
    <String, dynamic>{'command': instance.command};

TentacledGrpc _$TentacledGrpcFromJson(Map<String, dynamic> json) =>
    TentacledGrpc(
      port: (json['port'] as num).toInt(),
      service: json['service'] as String?,
    );

Map<String, dynamic> _$TentacledGrpcToJson(TentacledGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

IndigoHttpGet _$IndigoHttpGetFromJson(Map<String, dynamic> json) =>
    IndigoHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$IndigoHttpGetToJson(IndigoHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

IndigoHttpHeader _$IndigoHttpHeaderFromJson(Map<String, dynamic> json) =>
    IndigoHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$IndigoHttpHeaderToJson(IndigoHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

IndigoTcpSocket _$IndigoTcpSocketFromJson(Map<String, dynamic> json) =>
    IndigoTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$IndigoTcpSocketToJson(IndigoTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

ContainerVolumeDevice _$ContainerVolumeDeviceFromJson(
  Map<String, dynamic> json,
) => ContainerVolumeDevice(
  devicePath: json['devicePath'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$ContainerVolumeDeviceToJson(
  ContainerVolumeDevice instance,
) => <String, dynamic>{
  'devicePath': instance.devicePath,
  'name': instance.name,
};

ContainerVolumeMount _$ContainerVolumeMountFromJson(
  Map<String, dynamic> json,
) => ContainerVolumeMount(
  mountPath: json['mountPath'] as String,
  mountPropagation: $enumDecodeNullable(
    _$MountPropagationEnumMap,
    json['mountPropagation'],
  ),
  name: json['name'] as String,
  readOnly: json['readOnly'] as bool?,
  recursiveReadOnly: json['recursiveReadOnly'] as String?,
  subPath: json['subPath'] as String?,
  subPathExpr: json['subPathExpr'] as String?,
);

Map<String, dynamic> _$ContainerVolumeMountToJson(
  ContainerVolumeMount instance,
) => <String, dynamic>{
  'mountPath': instance.mountPath,
  'mountPropagation': _$MountPropagationEnumMap[instance.mountPropagation],
  'name': instance.name,
  'readOnly': instance.readOnly,
  'recursiveReadOnly': instance.recursiveReadOnly,
  'subPath': instance.subPath,
  'subPathExpr': instance.subPathExpr,
};

const _$MountPropagationEnumMap = {
  MountPropagation.BIDIRECTIONAL: 'Bidirectional',
  MountPropagation.HOST_TO_CONTAINER: 'HostToContainer',
  MountPropagation.NONE: 'None',
};

DnsConfig _$DnsConfigFromJson(Map<String, dynamic> json) => DnsConfig(
  nameservers: (json['nameservers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  options: (json['options'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Option.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  searches: (json['searches'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$DnsConfigToJson(DnsConfig instance) => <String, dynamic>{
  'nameservers': instance.nameservers,
  'options': instance.options,
  'searches': instance.searches,
};

Option _$OptionFromJson(Map<String, dynamic> json) =>
    Option(name: json['name'] as String?, value: json['value'] as String?);

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

EphemeralContainer _$EphemeralContainerFromJson(Map<String, dynamic> json) =>
    EphemeralContainer(
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      env: (json['env'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerEnv.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      envFrom: (json['envFrom'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerEnvFrom.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      image: json['image'] as String?,
      imagePullPolicy: $enumDecodeNullable(
        _$PullPolicyEnumMap,
        json['imagePullPolicy'],
      ),
      lifecycle: json['lifecycle'] == null
          ? null
          : EphemeralContainerLifecycle.fromJson(
              json['lifecycle'] as Map<String, dynamic>,
            ),
      livenessProbe: json['livenessProbe'] == null
          ? null
          : EphemeralContainerLivenessProbe.fromJson(
              json['livenessProbe'] as Map<String, dynamic>,
            ),
      name: json['name'] as String,
      ports: (json['ports'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerPort.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      readinessProbe: json['readinessProbe'] == null
          ? null
          : EphemeralContainerReadinessProbe.fromJson(
              json['readinessProbe'] as Map<String, dynamic>,
            ),
      resizePolicy: (json['resizePolicy'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerResizePolicy.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      resources: json['resources'] == null
          ? null
          : EphemeralContainerResources.fromJson(
              json['resources'] as Map<String, dynamic>,
            ),
      restartPolicy: json['restartPolicy'] as String?,
      restartPolicyRules: (json['restartPolicyRules'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerRestartPolicyRule.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      securityContext: json['securityContext'] == null
          ? null
          : EphemeralContainerSecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>,
            ),
      startupProbe: json['startupProbe'] == null
          ? null
          : EphemeralContainerStartupProbe.fromJson(
              json['startupProbe'] as Map<String, dynamic>,
            ),
      stdin: json['stdin'] as bool?,
      stdinOnce: json['stdinOnce'] as bool?,
      targetContainerName: json['targetContainerName'] as String?,
      terminationMessagePath: json['terminationMessagePath'] as String?,
      terminationMessagePolicy: $enumDecodeNullable(
        _$TerminationMessagePolicyEnumMap,
        json['terminationMessagePolicy'],
      ),
      tty: json['tty'] as bool?,
      volumeDevices: (json['volumeDevices'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerVolumeDevice.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      volumeMounts: (json['volumeMounts'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : EphemeralContainerVolumeMount.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      workingDir: json['workingDir'] as String?,
    );

Map<String, dynamic> _$EphemeralContainerToJson(EphemeralContainer instance) =>
    <String, dynamic>{
      'args': instance.args,
      'command': instance.command,
      'env': instance.env,
      'envFrom': instance.envFrom,
      'image': instance.image,
      'imagePullPolicy': _$PullPolicyEnumMap[instance.imagePullPolicy],
      'lifecycle': instance.lifecycle,
      'livenessProbe': instance.livenessProbe,
      'name': instance.name,
      'ports': instance.ports,
      'readinessProbe': instance.readinessProbe,
      'resizePolicy': instance.resizePolicy,
      'resources': instance.resources,
      'restartPolicy': instance.restartPolicy,
      'restartPolicyRules': instance.restartPolicyRules,
      'securityContext': instance.securityContext,
      'startupProbe': instance.startupProbe,
      'stdin': instance.stdin,
      'stdinOnce': instance.stdinOnce,
      'targetContainerName': instance.targetContainerName,
      'terminationMessagePath': instance.terminationMessagePath,
      'terminationMessagePolicy':
          _$TerminationMessagePolicyEnumMap[instance.terminationMessagePolicy],
      'tty': instance.tty,
      'volumeDevices': instance.volumeDevices,
      'volumeMounts': instance.volumeMounts,
      'workingDir': instance.workingDir,
    };

EphemeralContainerEnv _$EphemeralContainerEnvFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerEnv(
  name: json['name'] as String,
  value: json['value'] as String?,
  valueFrom: json['valueFrom'] == null
      ? null
      : FluffyValueFrom.fromJson(json['valueFrom'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EphemeralContainerEnvToJson(
  EphemeralContainerEnv instance,
) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
  'valueFrom': instance.valueFrom,
};

FluffyValueFrom _$FluffyValueFromFromJson(Map<String, dynamic> json) =>
    FluffyValueFrom(
      configMapKeyRef: json['configMapKeyRef'] == null
          ? null
          : FluffyConfigMapKeyRef.fromJson(
              json['configMapKeyRef'] as Map<String, dynamic>,
            ),
      fieldRef: json['fieldRef'] == null
          ? null
          : FluffyFieldRef.fromJson(json['fieldRef'] as Map<String, dynamic>),
      fileKeyRef: json['fileKeyRef'] == null
          ? null
          : FluffyFileKeyRef.fromJson(
              json['fileKeyRef'] as Map<String, dynamic>,
            ),
      resourceFieldRef: json['resourceFieldRef'] == null
          ? null
          : FluffyResourceFieldRef.fromJson(
              json['resourceFieldRef'] as Map<String, dynamic>,
            ),
      secretKeyRef: json['secretKeyRef'] == null
          ? null
          : FluffySecretKeyRef.fromJson(
              json['secretKeyRef'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluffyValueFromToJson(FluffyValueFrom instance) =>
    <String, dynamic>{
      'configMapKeyRef': instance.configMapKeyRef,
      'fieldRef': instance.fieldRef,
      'fileKeyRef': instance.fileKeyRef,
      'resourceFieldRef': instance.resourceFieldRef,
      'secretKeyRef': instance.secretKeyRef,
    };

FluffyConfigMapKeyRef _$FluffyConfigMapKeyRefFromJson(
  Map<String, dynamic> json,
) => FluffyConfigMapKeyRef(
  key: json['key'] as String,
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$FluffyConfigMapKeyRefToJson(
  FluffyConfigMapKeyRef instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'optional': instance.optional,
};

FluffyFieldRef _$FluffyFieldRefFromJson(Map<String, dynamic> json) =>
    FluffyFieldRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String,
    );

Map<String, dynamic> _$FluffyFieldRefToJson(FluffyFieldRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
    };

FluffyFileKeyRef _$FluffyFileKeyRefFromJson(Map<String, dynamic> json) =>
    FluffyFileKeyRef(
      key: json['key'] as String,
      optional: json['optional'] as bool?,
      path: json['path'] as String,
      volumeName: json['volumeName'] as String,
    );

Map<String, dynamic> _$FluffyFileKeyRefToJson(FluffyFileKeyRef instance) =>
    <String, dynamic>{
      'key': instance.key,
      'optional': instance.optional,
      'path': instance.path,
      'volumeName': instance.volumeName,
    };

FluffyResourceFieldRef _$FluffyResourceFieldRefFromJson(
  Map<String, dynamic> json,
) => FluffyResourceFieldRef(
  containerName: json['containerName'] as String?,
  divisor: json['divisor'],
  resource: json['resource'] as String,
);

Map<String, dynamic> _$FluffyResourceFieldRefToJson(
  FluffyResourceFieldRef instance,
) => <String, dynamic>{
  'containerName': instance.containerName,
  'divisor': instance.divisor,
  'resource': instance.resource,
};

FluffySecretKeyRef _$FluffySecretKeyRefFromJson(Map<String, dynamic> json) =>
    FluffySecretKeyRef(
      key: json['key'] as String,
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$FluffySecretKeyRefToJson(FluffySecretKeyRef instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'optional': instance.optional,
    };

EphemeralContainerEnvFrom _$EphemeralContainerEnvFromFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerEnvFrom(
  configMapRef: json['configMapRef'] == null
      ? null
      : FluffyConfigMapRef.fromJson(
          json['configMapRef'] as Map<String, dynamic>,
        ),
  prefix: json['prefix'] as String?,
  secretRef: json['secretRef'] == null
      ? null
      : FluffySecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EphemeralContainerEnvFromToJson(
  EphemeralContainerEnvFrom instance,
) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'prefix': instance.prefix,
  'secretRef': instance.secretRef,
};

FluffyConfigMapRef _$FluffyConfigMapRefFromJson(Map<String, dynamic> json) =>
    FluffyConfigMapRef(
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$FluffyConfigMapRefToJson(FluffyConfigMapRef instance) =>
    <String, dynamic>{'name': instance.name, 'optional': instance.optional};

FluffySecretRef _$FluffySecretRefFromJson(Map<String, dynamic> json) =>
    FluffySecretRef(
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$FluffySecretRefToJson(FluffySecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'optional': instance.optional};

EphemeralContainerLifecycle _$EphemeralContainerLifecycleFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerLifecycle(
  postStart: json['postStart'] == null
      ? null
      : FluffyPostStart.fromJson(json['postStart'] as Map<String, dynamic>),
  preStop: json['preStop'] == null
      ? null
      : FluffyPreStop.fromJson(json['preStop'] as Map<String, dynamic>),
  stopSignal: $enumDecodeNullable(_$StopSignalEnumMap, json['stopSignal']),
);

Map<String, dynamic> _$EphemeralContainerLifecycleToJson(
  EphemeralContainerLifecycle instance,
) => <String, dynamic>{
  'postStart': instance.postStart,
  'preStop': instance.preStop,
  'stopSignal': _$StopSignalEnumMap[instance.stopSignal],
};

FluffyPostStart _$FluffyPostStartFromJson(Map<String, dynamic> json) =>
    FluffyPostStart(
      exec: json['exec'] == null
          ? null
          : IndecentExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : IndecentHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
      sleep: json['sleep'] == null
          ? null
          : TentacledSleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : IndecentTcpSocket.fromJson(
              json['tcpSocket'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluffyPostStartToJson(FluffyPostStart instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

IndecentExec _$IndecentExecFromJson(Map<String, dynamic> json) => IndecentExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$IndecentExecToJson(IndecentExec instance) =>
    <String, dynamic>{'command': instance.command};

IndecentHttpGet _$IndecentHttpGetFromJson(Map<String, dynamic> json) =>
    IndecentHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$IndecentHttpGetToJson(IndecentHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

IndecentHttpHeader _$IndecentHttpHeaderFromJson(Map<String, dynamic> json) =>
    IndecentHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$IndecentHttpHeaderToJson(IndecentHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

TentacledSleep _$TentacledSleepFromJson(Map<String, dynamic> json) =>
    TentacledSleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$TentacledSleepToJson(TentacledSleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

IndecentTcpSocket _$IndecentTcpSocketFromJson(Map<String, dynamic> json) =>
    IndecentTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$IndecentTcpSocketToJson(IndecentTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

FluffyPreStop _$FluffyPreStopFromJson(Map<String, dynamic> json) =>
    FluffyPreStop(
      exec: json['exec'] == null
          ? null
          : HilariousExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : HilariousHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
      sleep: json['sleep'] == null
          ? null
          : StickySleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : HilariousTcpSocket.fromJson(
              json['tcpSocket'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluffyPreStopToJson(FluffyPreStop instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

HilariousExec _$HilariousExecFromJson(Map<String, dynamic> json) =>
    HilariousExec(
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$HilariousExecToJson(HilariousExec instance) =>
    <String, dynamic>{'command': instance.command};

HilariousHttpGet _$HilariousHttpGetFromJson(Map<String, dynamic> json) =>
    HilariousHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : HilariousHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$HilariousHttpGetToJson(HilariousHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

HilariousHttpHeader _$HilariousHttpHeaderFromJson(Map<String, dynamic> json) =>
    HilariousHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HilariousHttpHeaderToJson(
  HilariousHttpHeader instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

StickySleep _$StickySleepFromJson(Map<String, dynamic> json) =>
    StickySleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$StickySleepToJson(StickySleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

HilariousTcpSocket _$HilariousTcpSocketFromJson(Map<String, dynamic> json) =>
    HilariousTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$HilariousTcpSocketToJson(HilariousTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

EphemeralContainerLivenessProbe _$EphemeralContainerLivenessProbeFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerLivenessProbe(
  exec: json['exec'] == null
      ? null
      : AmbitiousExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : StickyGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : AmbitiousHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : AmbitiousTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$EphemeralContainerLivenessProbeToJson(
  EphemeralContainerLivenessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

AmbitiousExec _$AmbitiousExecFromJson(Map<String, dynamic> json) =>
    AmbitiousExec(
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$AmbitiousExecToJson(AmbitiousExec instance) =>
    <String, dynamic>{'command': instance.command};

StickyGrpc _$StickyGrpcFromJson(Map<String, dynamic> json) => StickyGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$StickyGrpcToJson(StickyGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

AmbitiousHttpGet _$AmbitiousHttpGetFromJson(Map<String, dynamic> json) =>
    AmbitiousHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AmbitiousHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$AmbitiousHttpGetToJson(AmbitiousHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

AmbitiousHttpHeader _$AmbitiousHttpHeaderFromJson(Map<String, dynamic> json) =>
    AmbitiousHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AmbitiousHttpHeaderToJson(
  AmbitiousHttpHeader instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

AmbitiousTcpSocket _$AmbitiousTcpSocketFromJson(Map<String, dynamic> json) =>
    AmbitiousTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$AmbitiousTcpSocketToJson(AmbitiousTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

EphemeralContainerPort _$EphemeralContainerPortFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerPort(
  containerPort: (json['containerPort'] as num).toInt(),
  hostIp: json['hostIP'] as String?,
  hostPort: (json['hostPort'] as num?)?.toInt(),
  name: json['name'] as String?,
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
);

Map<String, dynamic> _$EphemeralContainerPortToJson(
  EphemeralContainerPort instance,
) => <String, dynamic>{
  'containerPort': instance.containerPort,
  'hostIP': instance.hostIp,
  'hostPort': instance.hostPort,
  'name': instance.name,
  'protocol': _$ProtocolEnumMap[instance.protocol],
};

EphemeralContainerReadinessProbe _$EphemeralContainerReadinessProbeFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerReadinessProbe(
  exec: json['exec'] == null
      ? null
      : CunningExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : IndigoGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : CunningHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : CunningTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$EphemeralContainerReadinessProbeToJson(
  EphemeralContainerReadinessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

CunningExec _$CunningExecFromJson(Map<String, dynamic> json) => CunningExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$CunningExecToJson(CunningExec instance) =>
    <String, dynamic>{'command': instance.command};

IndigoGrpc _$IndigoGrpcFromJson(Map<String, dynamic> json) => IndigoGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$IndigoGrpcToJson(IndigoGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

CunningHttpGet _$CunningHttpGetFromJson(Map<String, dynamic> json) =>
    CunningHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$CunningHttpGetToJson(CunningHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

CunningHttpHeader _$CunningHttpHeaderFromJson(Map<String, dynamic> json) =>
    CunningHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$CunningHttpHeaderToJson(CunningHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

CunningTcpSocket _$CunningTcpSocketFromJson(Map<String, dynamic> json) =>
    CunningTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$CunningTcpSocketToJson(CunningTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

EphemeralContainerResizePolicy _$EphemeralContainerResizePolicyFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerResizePolicy(
  resourceName: json['resourceName'] as String,
  restartPolicy: json['restartPolicy'] as String,
);

Map<String, dynamic> _$EphemeralContainerResizePolicyToJson(
  EphemeralContainerResizePolicy instance,
) => <String, dynamic>{
  'resourceName': instance.resourceName,
  'restartPolicy': instance.restartPolicy,
};

EphemeralContainerResources _$EphemeralContainerResourcesFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerResources(
  claims: (json['claims'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffyClaim.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  limits: json['limits'] as Map<String, dynamic>?,
  requests: json['requests'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$EphemeralContainerResourcesToJson(
  EphemeralContainerResources instance,
) => <String, dynamic>{
  'claims': instance.claims,
  'limits': instance.limits,
  'requests': instance.requests,
};

FluffyClaim _$FluffyClaimFromJson(Map<String, dynamic> json) => FluffyClaim(
  name: json['name'] as String,
  request: json['request'] as String?,
);

Map<String, dynamic> _$FluffyClaimToJson(FluffyClaim instance) =>
    <String, dynamic>{'name': instance.name, 'request': instance.request};

EphemeralContainerRestartPolicyRule
_$EphemeralContainerRestartPolicyRuleFromJson(Map<String, dynamic> json) =>
    EphemeralContainerRestartPolicyRule(
      action: json['action'] as String,
      exitCodes: json['exitCodes'] == null
          ? null
          : FluffyExitCodes.fromJson(json['exitCodes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EphemeralContainerRestartPolicyRuleToJson(
  EphemeralContainerRestartPolicyRule instance,
) => <String, dynamic>{
  'action': instance.action,
  'exitCodes': instance.exitCodes,
};

FluffyExitCodes _$FluffyExitCodesFromJson(Map<String, dynamic> json) =>
    FluffyExitCodes(
      exitCodesOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
    );

Map<String, dynamic> _$FluffyExitCodesToJson(FluffyExitCodes instance) =>
    <String, dynamic>{
      'operator': instance.exitCodesOperator,
      'values': instance.values,
    };

EphemeralContainerSecurityContext _$EphemeralContainerSecurityContextFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerSecurityContext(
  allowPrivilegeEscalation: json['allowPrivilegeEscalation'] as bool?,
  appArmorProfile: json['appArmorProfile'] == null
      ? null
      : FluffyAppArmorProfile.fromJson(
          json['appArmorProfile'] as Map<String, dynamic>,
        ),
  capabilities: json['capabilities'] == null
      ? null
      : FluffyCapabilities.fromJson(
          json['capabilities'] as Map<String, dynamic>,
        ),
  privileged: json['privileged'] as bool?,
  procMount: $enumDecodeNullable(_$ProcMountEnumMap, json['procMount']),
  readOnlyRootFilesystem: json['readOnlyRootFilesystem'] as bool?,
  runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
  runAsNonRoot: json['runAsNonRoot'] as bool?,
  runAsUser: (json['runAsUser'] as num?)?.toInt(),
  seccompProfile: json['seccompProfile'] == null
      ? null
      : FluffySeccompProfile.fromJson(
          json['seccompProfile'] as Map<String, dynamic>,
        ),
  seLinuxOptions: json['seLinuxOptions'] == null
      ? null
      : FluffySeLinuxOptions.fromJson(
          json['seLinuxOptions'] as Map<String, dynamic>,
        ),
  windowsOptions: json['windowsOptions'] == null
      ? null
      : FluffyWindowsOptions.fromJson(
          json['windowsOptions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$EphemeralContainerSecurityContextToJson(
  EphemeralContainerSecurityContext instance,
) => <String, dynamic>{
  'allowPrivilegeEscalation': instance.allowPrivilegeEscalation,
  'appArmorProfile': instance.appArmorProfile,
  'capabilities': instance.capabilities,
  'privileged': instance.privileged,
  'procMount': _$ProcMountEnumMap[instance.procMount],
  'readOnlyRootFilesystem': instance.readOnlyRootFilesystem,
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxOptions': instance.seLinuxOptions,
  'windowsOptions': instance.windowsOptions,
};

FluffyAppArmorProfile _$FluffyAppArmorProfileFromJson(
  Map<String, dynamic> json,
) => FluffyAppArmorProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$FluffyAppArmorProfileToJson(
  FluffyAppArmorProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

FluffyCapabilities _$FluffyCapabilitiesFromJson(Map<String, dynamic> json) =>
    FluffyCapabilities(
      add: (json['add'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      drop: (json['drop'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$FluffyCapabilitiesToJson(FluffyCapabilities instance) =>
    <String, dynamic>{'add': instance.add, 'drop': instance.drop};

FluffySeLinuxOptions _$FluffySeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => FluffySeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$FluffySeLinuxOptionsToJson(
  FluffySeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

FluffySeccompProfile _$FluffySeccompProfileFromJson(
  Map<String, dynamic> json,
) => FluffySeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$FluffySeccompProfileToJson(
  FluffySeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

FluffyWindowsOptions _$FluffyWindowsOptionsFromJson(
  Map<String, dynamic> json,
) => FluffyWindowsOptions(
  gmsaCredentialSpec: json['gmsaCredentialSpec'] as String?,
  gmsaCredentialSpecName: json['gmsaCredentialSpecName'] as String?,
  hostProcess: json['hostProcess'] as bool?,
  runAsUserName: json['runAsUserName'] as String?,
);

Map<String, dynamic> _$FluffyWindowsOptionsToJson(
  FluffyWindowsOptions instance,
) => <String, dynamic>{
  'gmsaCredentialSpec': instance.gmsaCredentialSpec,
  'gmsaCredentialSpecName': instance.gmsaCredentialSpecName,
  'hostProcess': instance.hostProcess,
  'runAsUserName': instance.runAsUserName,
};

EphemeralContainerStartupProbe _$EphemeralContainerStartupProbeFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerStartupProbe(
  exec: json['exec'] == null
      ? null
      : MagentaExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : IndecentGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : MagentaHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : MagentaTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$EphemeralContainerStartupProbeToJson(
  EphemeralContainerStartupProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

MagentaExec _$MagentaExecFromJson(Map<String, dynamic> json) => MagentaExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$MagentaExecToJson(MagentaExec instance) =>
    <String, dynamic>{'command': instance.command};

IndecentGrpc _$IndecentGrpcFromJson(Map<String, dynamic> json) => IndecentGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$IndecentGrpcToJson(IndecentGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

MagentaHttpGet _$MagentaHttpGetFromJson(Map<String, dynamic> json) =>
    MagentaHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MagentaHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$MagentaHttpGetToJson(MagentaHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

MagentaHttpHeader _$MagentaHttpHeaderFromJson(Map<String, dynamic> json) =>
    MagentaHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MagentaHttpHeaderToJson(MagentaHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

MagentaTcpSocket _$MagentaTcpSocketFromJson(Map<String, dynamic> json) =>
    MagentaTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$MagentaTcpSocketToJson(MagentaTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

EphemeralContainerVolumeDevice _$EphemeralContainerVolumeDeviceFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerVolumeDevice(
  devicePath: json['devicePath'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$EphemeralContainerVolumeDeviceToJson(
  EphemeralContainerVolumeDevice instance,
) => <String, dynamic>{
  'devicePath': instance.devicePath,
  'name': instance.name,
};

EphemeralContainerVolumeMount _$EphemeralContainerVolumeMountFromJson(
  Map<String, dynamic> json,
) => EphemeralContainerVolumeMount(
  mountPath: json['mountPath'] as String,
  mountPropagation: $enumDecodeNullable(
    _$MountPropagationEnumMap,
    json['mountPropagation'],
  ),
  name: json['name'] as String,
  readOnly: json['readOnly'] as bool?,
  recursiveReadOnly: json['recursiveReadOnly'] as String?,
  subPath: json['subPath'] as String?,
  subPathExpr: json['subPathExpr'] as String?,
);

Map<String, dynamic> _$EphemeralContainerVolumeMountToJson(
  EphemeralContainerVolumeMount instance,
) => <String, dynamic>{
  'mountPath': instance.mountPath,
  'mountPropagation': _$MountPropagationEnumMap[instance.mountPropagation],
  'name': instance.name,
  'readOnly': instance.readOnly,
  'recursiveReadOnly': instance.recursiveReadOnly,
  'subPath': instance.subPath,
  'subPathExpr': instance.subPathExpr,
};

HostAlias _$HostAliasFromJson(Map<String, dynamic> json) => HostAlias(
  hostnames: (json['hostnames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  ip: json['ip'] as String,
);

Map<String, dynamic> _$HostAliasToJson(HostAlias instance) => <String, dynamic>{
  'hostnames': instance.hostnames,
  'ip': instance.ip,
};

ImagePullSecret _$ImagePullSecretFromJson(Map<String, dynamic> json) =>
    ImagePullSecret(name: json['name'] as String?);

Map<String, dynamic> _$ImagePullSecretToJson(ImagePullSecret instance) =>
    <String, dynamic>{'name': instance.name};

InitContainer _$InitContainerFromJson(
  Map<String, dynamic> json,
) => InitContainer(
  args: (json['args'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  env: (json['env'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerEnv.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  envFrom: (json['envFrom'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerEnvFrom.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  image: json['image'] as String?,
  imagePullPolicy: $enumDecodeNullable(
    _$PullPolicyEnumMap,
    json['imagePullPolicy'],
  ),
  lifecycle: json['lifecycle'] == null
      ? null
      : InitContainerLifecycle.fromJson(
          json['lifecycle'] as Map<String, dynamic>,
        ),
  livenessProbe: json['livenessProbe'] == null
      ? null
      : InitContainerLivenessProbe.fromJson(
          json['livenessProbe'] as Map<String, dynamic>,
        ),
  name: json['name'] as String,
  ports: (json['ports'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerPort.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  readinessProbe: json['readinessProbe'] == null
      ? null
      : InitContainerReadinessProbe.fromJson(
          json['readinessProbe'] as Map<String, dynamic>,
        ),
  resizePolicy: (json['resizePolicy'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerResizePolicy.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resources: json['resources'] == null
      ? null
      : InitContainerResources.fromJson(
          json['resources'] as Map<String, dynamic>,
        ),
  restartPolicy: json['restartPolicy'] as String?,
  restartPolicyRules: (json['restartPolicyRules'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerRestartPolicyRule.fromJson(
                e as Map<String, dynamic>,
              ),
      )
      .toList(),
  securityContext: json['securityContext'] == null
      ? null
      : InitContainerSecurityContext.fromJson(
          json['securityContext'] as Map<String, dynamic>,
        ),
  startupProbe: json['startupProbe'] == null
      ? null
      : InitContainerStartupProbe.fromJson(
          json['startupProbe'] as Map<String, dynamic>,
        ),
  stdin: json['stdin'] as bool?,
  stdinOnce: json['stdinOnce'] as bool?,
  terminationMessagePath: json['terminationMessagePath'] as String?,
  terminationMessagePolicy: $enumDecodeNullable(
    _$TerminationMessagePolicyEnumMap,
    json['terminationMessagePolicy'],
  ),
  tty: json['tty'] as bool?,
  volumeDevices: (json['volumeDevices'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerVolumeDevice.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  volumeMounts: (json['volumeMounts'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : InitContainerVolumeMount.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  workingDir: json['workingDir'] as String?,
);

Map<String, dynamic> _$InitContainerToJson(InitContainer instance) =>
    <String, dynamic>{
      'args': instance.args,
      'command': instance.command,
      'env': instance.env,
      'envFrom': instance.envFrom,
      'image': instance.image,
      'imagePullPolicy': _$PullPolicyEnumMap[instance.imagePullPolicy],
      'lifecycle': instance.lifecycle,
      'livenessProbe': instance.livenessProbe,
      'name': instance.name,
      'ports': instance.ports,
      'readinessProbe': instance.readinessProbe,
      'resizePolicy': instance.resizePolicy,
      'resources': instance.resources,
      'restartPolicy': instance.restartPolicy,
      'restartPolicyRules': instance.restartPolicyRules,
      'securityContext': instance.securityContext,
      'startupProbe': instance.startupProbe,
      'stdin': instance.stdin,
      'stdinOnce': instance.stdinOnce,
      'terminationMessagePath': instance.terminationMessagePath,
      'terminationMessagePolicy':
          _$TerminationMessagePolicyEnumMap[instance.terminationMessagePolicy],
      'tty': instance.tty,
      'volumeDevices': instance.volumeDevices,
      'volumeMounts': instance.volumeMounts,
      'workingDir': instance.workingDir,
    };

InitContainerEnv _$InitContainerEnvFromJson(Map<String, dynamic> json) =>
    InitContainerEnv(
      name: json['name'] as String,
      value: json['value'] as String?,
      valueFrom: json['valueFrom'] == null
          ? null
          : TentacledValueFrom.fromJson(
              json['valueFrom'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$InitContainerEnvToJson(InitContainerEnv instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'valueFrom': instance.valueFrom,
    };

TentacledValueFrom _$TentacledValueFromFromJson(Map<String, dynamic> json) =>
    TentacledValueFrom(
      configMapKeyRef: json['configMapKeyRef'] == null
          ? null
          : TentacledConfigMapKeyRef.fromJson(
              json['configMapKeyRef'] as Map<String, dynamic>,
            ),
      fieldRef: json['fieldRef'] == null
          ? null
          : TentacledFieldRef.fromJson(
              json['fieldRef'] as Map<String, dynamic>,
            ),
      fileKeyRef: json['fileKeyRef'] == null
          ? null
          : TentacledFileKeyRef.fromJson(
              json['fileKeyRef'] as Map<String, dynamic>,
            ),
      resourceFieldRef: json['resourceFieldRef'] == null
          ? null
          : TentacledResourceFieldRef.fromJson(
              json['resourceFieldRef'] as Map<String, dynamic>,
            ),
      secretKeyRef: json['secretKeyRef'] == null
          ? null
          : TentacledSecretKeyRef.fromJson(
              json['secretKeyRef'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TentacledValueFromToJson(TentacledValueFrom instance) =>
    <String, dynamic>{
      'configMapKeyRef': instance.configMapKeyRef,
      'fieldRef': instance.fieldRef,
      'fileKeyRef': instance.fileKeyRef,
      'resourceFieldRef': instance.resourceFieldRef,
      'secretKeyRef': instance.secretKeyRef,
    };

TentacledConfigMapKeyRef _$TentacledConfigMapKeyRefFromJson(
  Map<String, dynamic> json,
) => TentacledConfigMapKeyRef(
  key: json['key'] as String,
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$TentacledConfigMapKeyRefToJson(
  TentacledConfigMapKeyRef instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'optional': instance.optional,
};

TentacledFieldRef _$TentacledFieldRefFromJson(Map<String, dynamic> json) =>
    TentacledFieldRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String,
    );

Map<String, dynamic> _$TentacledFieldRefToJson(TentacledFieldRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
    };

TentacledFileKeyRef _$TentacledFileKeyRefFromJson(Map<String, dynamic> json) =>
    TentacledFileKeyRef(
      key: json['key'] as String,
      optional: json['optional'] as bool?,
      path: json['path'] as String,
      volumeName: json['volumeName'] as String,
    );

Map<String, dynamic> _$TentacledFileKeyRefToJson(
  TentacledFileKeyRef instance,
) => <String, dynamic>{
  'key': instance.key,
  'optional': instance.optional,
  'path': instance.path,
  'volumeName': instance.volumeName,
};

TentacledResourceFieldRef _$TentacledResourceFieldRefFromJson(
  Map<String, dynamic> json,
) => TentacledResourceFieldRef(
  containerName: json['containerName'] as String?,
  divisor: json['divisor'],
  resource: json['resource'] as String,
);

Map<String, dynamic> _$TentacledResourceFieldRefToJson(
  TentacledResourceFieldRef instance,
) => <String, dynamic>{
  'containerName': instance.containerName,
  'divisor': instance.divisor,
  'resource': instance.resource,
};

TentacledSecretKeyRef _$TentacledSecretKeyRefFromJson(
  Map<String, dynamic> json,
) => TentacledSecretKeyRef(
  key: json['key'] as String,
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$TentacledSecretKeyRefToJson(
  TentacledSecretKeyRef instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'optional': instance.optional,
};

InitContainerEnvFrom _$InitContainerEnvFromFromJson(
  Map<String, dynamic> json,
) => InitContainerEnvFrom(
  configMapRef: json['configMapRef'] == null
      ? null
      : TentacledConfigMapRef.fromJson(
          json['configMapRef'] as Map<String, dynamic>,
        ),
  prefix: json['prefix'] as String?,
  secretRef: json['secretRef'] == null
      ? null
      : TentacledSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InitContainerEnvFromToJson(
  InitContainerEnvFrom instance,
) => <String, dynamic>{
  'configMapRef': instance.configMapRef,
  'prefix': instance.prefix,
  'secretRef': instance.secretRef,
};

TentacledConfigMapRef _$TentacledConfigMapRefFromJson(
  Map<String, dynamic> json,
) => TentacledConfigMapRef(
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$TentacledConfigMapRefToJson(
  TentacledConfigMapRef instance,
) => <String, dynamic>{'name': instance.name, 'optional': instance.optional};

TentacledSecretRef _$TentacledSecretRefFromJson(Map<String, dynamic> json) =>
    TentacledSecretRef(
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$TentacledSecretRefToJson(TentacledSecretRef instance) =>
    <String, dynamic>{'name': instance.name, 'optional': instance.optional};

InitContainerLifecycle _$InitContainerLifecycleFromJson(
  Map<String, dynamic> json,
) => InitContainerLifecycle(
  postStart: json['postStart'] == null
      ? null
      : TentacledPostStart.fromJson(json['postStart'] as Map<String, dynamic>),
  preStop: json['preStop'] == null
      ? null
      : TentacledPreStop.fromJson(json['preStop'] as Map<String, dynamic>),
  stopSignal: $enumDecodeNullable(_$StopSignalEnumMap, json['stopSignal']),
);

Map<String, dynamic> _$InitContainerLifecycleToJson(
  InitContainerLifecycle instance,
) => <String, dynamic>{
  'postStart': instance.postStart,
  'preStop': instance.preStop,
  'stopSignal': _$StopSignalEnumMap[instance.stopSignal],
};

TentacledPostStart _$TentacledPostStartFromJson(Map<String, dynamic> json) =>
    TentacledPostStart(
      exec: json['exec'] == null
          ? null
          : FriskyExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : FriskyHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
      sleep: json['sleep'] == null
          ? null
          : IndigoSleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : FriskyTcpSocket.fromJson(json['tcpSocket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TentacledPostStartToJson(TentacledPostStart instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

FriskyExec _$FriskyExecFromJson(Map<String, dynamic> json) => FriskyExec(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$FriskyExecToJson(FriskyExec instance) =>
    <String, dynamic>{'command': instance.command};

FriskyHttpGet _$FriskyHttpGetFromJson(Map<String, dynamic> json) =>
    FriskyHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FriskyHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$FriskyHttpGetToJson(FriskyHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

FriskyHttpHeader _$FriskyHttpHeaderFromJson(Map<String, dynamic> json) =>
    FriskyHttpHeader(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$FriskyHttpHeaderToJson(FriskyHttpHeader instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

IndigoSleep _$IndigoSleepFromJson(Map<String, dynamic> json) =>
    IndigoSleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$IndigoSleepToJson(IndigoSleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

FriskyTcpSocket _$FriskyTcpSocketFromJson(Map<String, dynamic> json) =>
    FriskyTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$FriskyTcpSocketToJson(FriskyTcpSocket instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

TentacledPreStop _$TentacledPreStopFromJson(Map<String, dynamic> json) =>
    TentacledPreStop(
      exec: json['exec'] == null
          ? null
          : MischievousExec.fromJson(json['exec'] as Map<String, dynamic>),
      httpGet: json['httpGet'] == null
          ? null
          : MischievousHttpGet.fromJson(
              json['httpGet'] as Map<String, dynamic>,
            ),
      sleep: json['sleep'] == null
          ? null
          : IndecentSleep.fromJson(json['sleep'] as Map<String, dynamic>),
      tcpSocket: json['tcpSocket'] == null
          ? null
          : MischievousTcpSocket.fromJson(
              json['tcpSocket'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TentacledPreStopToJson(TentacledPreStop instance) =>
    <String, dynamic>{
      'exec': instance.exec,
      'httpGet': instance.httpGet,
      'sleep': instance.sleep,
      'tcpSocket': instance.tcpSocket,
    };

MischievousExec _$MischievousExecFromJson(Map<String, dynamic> json) =>
    MischievousExec(
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MischievousExecToJson(MischievousExec instance) =>
    <String, dynamic>{'command': instance.command};

MischievousHttpGet _$MischievousHttpGetFromJson(Map<String, dynamic> json) =>
    MischievousHttpGet(
      host: json['host'] as String?,
      httpHeaders: (json['httpHeaders'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MischievousHttpHeader.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      path: json['path'] as String?,
      port: json['port'],
      scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
    );

Map<String, dynamic> _$MischievousHttpGetToJson(MischievousHttpGet instance) =>
    <String, dynamic>{
      'host': instance.host,
      'httpHeaders': instance.httpHeaders,
      'path': instance.path,
      'port': instance.port,
      'scheme': _$SchemeEnumMap[instance.scheme],
    };

MischievousHttpHeader _$MischievousHttpHeaderFromJson(
  Map<String, dynamic> json,
) => MischievousHttpHeader(
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$MischievousHttpHeaderToJson(
  MischievousHttpHeader instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

IndecentSleep _$IndecentSleepFromJson(Map<String, dynamic> json) =>
    IndecentSleep(seconds: (json['seconds'] as num).toInt());

Map<String, dynamic> _$IndecentSleepToJson(IndecentSleep instance) =>
    <String, dynamic>{'seconds': instance.seconds};

MischievousTcpSocket _$MischievousTcpSocketFromJson(
  Map<String, dynamic> json,
) => MischievousTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$MischievousTcpSocketToJson(
  MischievousTcpSocket instance,
) => <String, dynamic>{'host': instance.host, 'port': instance.port};

InitContainerLivenessProbe _$InitContainerLivenessProbeFromJson(
  Map<String, dynamic> json,
) => InitContainerLivenessProbe(
  exec: json['exec'] == null
      ? null
      : BraggadociousExec.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : HilariousGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : BraggadociousHttpGet.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : BraggadociousTcpSocket.fromJson(
          json['tcpSocket'] as Map<String, dynamic>,
        ),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$InitContainerLivenessProbeToJson(
  InitContainerLivenessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

BraggadociousExec _$BraggadociousExecFromJson(Map<String, dynamic> json) =>
    BraggadociousExec(
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$BraggadociousExecToJson(BraggadociousExec instance) =>
    <String, dynamic>{'command': instance.command};

HilariousGrpc _$HilariousGrpcFromJson(Map<String, dynamic> json) =>
    HilariousGrpc(
      port: (json['port'] as num).toInt(),
      service: json['service'] as String?,
    );

Map<String, dynamic> _$HilariousGrpcToJson(HilariousGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

BraggadociousHttpGet _$BraggadociousHttpGetFromJson(
  Map<String, dynamic> json,
) => BraggadociousHttpGet(
  host: json['host'] as String?,
  httpHeaders: (json['httpHeaders'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : BraggadociousHttpHeader.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  path: json['path'] as String?,
  port: json['port'],
  scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
);

Map<String, dynamic> _$BraggadociousHttpGetToJson(
  BraggadociousHttpGet instance,
) => <String, dynamic>{
  'host': instance.host,
  'httpHeaders': instance.httpHeaders,
  'path': instance.path,
  'port': instance.port,
  'scheme': _$SchemeEnumMap[instance.scheme],
};

BraggadociousHttpHeader _$BraggadociousHttpHeaderFromJson(
  Map<String, dynamic> json,
) => BraggadociousHttpHeader(
  name: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$BraggadociousHttpHeaderToJson(
  BraggadociousHttpHeader instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

BraggadociousTcpSocket _$BraggadociousTcpSocketFromJson(
  Map<String, dynamic> json,
) => BraggadociousTcpSocket(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$BraggadociousTcpSocketToJson(
  BraggadociousTcpSocket instance,
) => <String, dynamic>{'host': instance.host, 'port': instance.port};

InitContainerPort _$InitContainerPortFromJson(Map<String, dynamic> json) =>
    InitContainerPort(
      containerPort: (json['containerPort'] as num).toInt(),
      hostIp: json['hostIP'] as String?,
      hostPort: (json['hostPort'] as num?)?.toInt(),
      name: json['name'] as String?,
      protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
    );

Map<String, dynamic> _$InitContainerPortToJson(InitContainerPort instance) =>
    <String, dynamic>{
      'containerPort': instance.containerPort,
      'hostIP': instance.hostIp,
      'hostPort': instance.hostPort,
      'name': instance.name,
      'protocol': _$ProtocolEnumMap[instance.protocol],
    };

InitContainerReadinessProbe _$InitContainerReadinessProbeFromJson(
  Map<String, dynamic> json,
) => InitContainerReadinessProbe(
  exec: json['exec'] == null
      ? null
      : Exec1.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : AmbitiousGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : HttpGet1.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : TcpSocket1.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$InitContainerReadinessProbeToJson(
  InitContainerReadinessProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

Exec1 _$Exec1FromJson(Map<String, dynamic> json) => Exec1(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$Exec1ToJson(Exec1 instance) => <String, dynamic>{
  'command': instance.command,
};

AmbitiousGrpc _$AmbitiousGrpcFromJson(Map<String, dynamic> json) =>
    AmbitiousGrpc(
      port: (json['port'] as num).toInt(),
      service: json['service'] as String?,
    );

Map<String, dynamic> _$AmbitiousGrpcToJson(AmbitiousGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

HttpGet1 _$HttpGet1FromJson(Map<String, dynamic> json) => HttpGet1(
  host: json['host'] as String?,
  httpHeaders: (json['httpHeaders'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : HttpHeader1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  path: json['path'] as String?,
  port: json['port'],
  scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
);

Map<String, dynamic> _$HttpGet1ToJson(HttpGet1 instance) => <String, dynamic>{
  'host': instance.host,
  'httpHeaders': instance.httpHeaders,
  'path': instance.path,
  'port': instance.port,
  'scheme': _$SchemeEnumMap[instance.scheme],
};

HttpHeader1 _$HttpHeader1FromJson(Map<String, dynamic> json) =>
    HttpHeader1(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$HttpHeader1ToJson(HttpHeader1 instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

TcpSocket1 _$TcpSocket1FromJson(Map<String, dynamic> json) =>
    TcpSocket1(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$TcpSocket1ToJson(TcpSocket1 instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

InitContainerResizePolicy _$InitContainerResizePolicyFromJson(
  Map<String, dynamic> json,
) => InitContainerResizePolicy(
  resourceName: json['resourceName'] as String,
  restartPolicy: json['restartPolicy'] as String,
);

Map<String, dynamic> _$InitContainerResizePolicyToJson(
  InitContainerResizePolicy instance,
) => <String, dynamic>{
  'resourceName': instance.resourceName,
  'restartPolicy': instance.restartPolicy,
};

InitContainerResources _$InitContainerResourcesFromJson(
  Map<String, dynamic> json,
) => InitContainerResources(
  claims: (json['claims'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledClaim.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  limits: json['limits'] as Map<String, dynamic>?,
  requests: json['requests'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$InitContainerResourcesToJson(
  InitContainerResources instance,
) => <String, dynamic>{
  'claims': instance.claims,
  'limits': instance.limits,
  'requests': instance.requests,
};

TentacledClaim _$TentacledClaimFromJson(Map<String, dynamic> json) =>
    TentacledClaim(
      name: json['name'] as String,
      request: json['request'] as String?,
    );

Map<String, dynamic> _$TentacledClaimToJson(TentacledClaim instance) =>
    <String, dynamic>{'name': instance.name, 'request': instance.request};

InitContainerRestartPolicyRule _$InitContainerRestartPolicyRuleFromJson(
  Map<String, dynamic> json,
) => InitContainerRestartPolicyRule(
  action: json['action'] as String,
  exitCodes: json['exitCodes'] == null
      ? null
      : TentacledExitCodes.fromJson(json['exitCodes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InitContainerRestartPolicyRuleToJson(
  InitContainerRestartPolicyRule instance,
) => <String, dynamic>{
  'action': instance.action,
  'exitCodes': instance.exitCodes,
};

TentacledExitCodes _$TentacledExitCodesFromJson(Map<String, dynamic> json) =>
    TentacledExitCodes(
      exitCodesOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
    );

Map<String, dynamic> _$TentacledExitCodesToJson(TentacledExitCodes instance) =>
    <String, dynamic>{
      'operator': instance.exitCodesOperator,
      'values': instance.values,
    };

InitContainerSecurityContext _$InitContainerSecurityContextFromJson(
  Map<String, dynamic> json,
) => InitContainerSecurityContext(
  allowPrivilegeEscalation: json['allowPrivilegeEscalation'] as bool?,
  appArmorProfile: json['appArmorProfile'] == null
      ? null
      : TentacledAppArmorProfile.fromJson(
          json['appArmorProfile'] as Map<String, dynamic>,
        ),
  capabilities: json['capabilities'] == null
      ? null
      : TentacledCapabilities.fromJson(
          json['capabilities'] as Map<String, dynamic>,
        ),
  privileged: json['privileged'] as bool?,
  procMount: $enumDecodeNullable(_$ProcMountEnumMap, json['procMount']),
  readOnlyRootFilesystem: json['readOnlyRootFilesystem'] as bool?,
  runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
  runAsNonRoot: json['runAsNonRoot'] as bool?,
  runAsUser: (json['runAsUser'] as num?)?.toInt(),
  seccompProfile: json['seccompProfile'] == null
      ? null
      : TentacledSeccompProfile.fromJson(
          json['seccompProfile'] as Map<String, dynamic>,
        ),
  seLinuxOptions: json['seLinuxOptions'] == null
      ? null
      : TentacledSeLinuxOptions.fromJson(
          json['seLinuxOptions'] as Map<String, dynamic>,
        ),
  windowsOptions: json['windowsOptions'] == null
      ? null
      : TentacledWindowsOptions.fromJson(
          json['windowsOptions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$InitContainerSecurityContextToJson(
  InitContainerSecurityContext instance,
) => <String, dynamic>{
  'allowPrivilegeEscalation': instance.allowPrivilegeEscalation,
  'appArmorProfile': instance.appArmorProfile,
  'capabilities': instance.capabilities,
  'privileged': instance.privileged,
  'procMount': _$ProcMountEnumMap[instance.procMount],
  'readOnlyRootFilesystem': instance.readOnlyRootFilesystem,
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxOptions': instance.seLinuxOptions,
  'windowsOptions': instance.windowsOptions,
};

TentacledAppArmorProfile _$TentacledAppArmorProfileFromJson(
  Map<String, dynamic> json,
) => TentacledAppArmorProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$TentacledAppArmorProfileToJson(
  TentacledAppArmorProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

TentacledCapabilities _$TentacledCapabilitiesFromJson(
  Map<String, dynamic> json,
) => TentacledCapabilities(
  add: (json['add'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  drop: (json['drop'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$TentacledCapabilitiesToJson(
  TentacledCapabilities instance,
) => <String, dynamic>{'add': instance.add, 'drop': instance.drop};

TentacledSeLinuxOptions _$TentacledSeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => TentacledSeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$TentacledSeLinuxOptionsToJson(
  TentacledSeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

TentacledSeccompProfile _$TentacledSeccompProfileFromJson(
  Map<String, dynamic> json,
) => TentacledSeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$TentacledSeccompProfileToJson(
  TentacledSeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

TentacledWindowsOptions _$TentacledWindowsOptionsFromJson(
  Map<String, dynamic> json,
) => TentacledWindowsOptions(
  gmsaCredentialSpec: json['gmsaCredentialSpec'] as String?,
  gmsaCredentialSpecName: json['gmsaCredentialSpecName'] as String?,
  hostProcess: json['hostProcess'] as bool?,
  runAsUserName: json['runAsUserName'] as String?,
);

Map<String, dynamic> _$TentacledWindowsOptionsToJson(
  TentacledWindowsOptions instance,
) => <String, dynamic>{
  'gmsaCredentialSpec': instance.gmsaCredentialSpec,
  'gmsaCredentialSpecName': instance.gmsaCredentialSpecName,
  'hostProcess': instance.hostProcess,
  'runAsUserName': instance.runAsUserName,
};

InitContainerStartupProbe _$InitContainerStartupProbeFromJson(
  Map<String, dynamic> json,
) => InitContainerStartupProbe(
  exec: json['exec'] == null
      ? null
      : Exec2.fromJson(json['exec'] as Map<String, dynamic>),
  failureThreshold: (json['failureThreshold'] as num?)?.toInt(),
  grpc: json['grpc'] == null
      ? null
      : CunningGrpc.fromJson(json['grpc'] as Map<String, dynamic>),
  httpGet: json['httpGet'] == null
      ? null
      : HttpGet2.fromJson(json['httpGet'] as Map<String, dynamic>),
  initialDelaySeconds: (json['initialDelaySeconds'] as num?)?.toInt(),
  periodSeconds: (json['periodSeconds'] as num?)?.toInt(),
  successThreshold: (json['successThreshold'] as num?)?.toInt(),
  tcpSocket: json['tcpSocket'] == null
      ? null
      : TcpSocket2.fromJson(json['tcpSocket'] as Map<String, dynamic>),
  terminationGracePeriodSeconds: (json['terminationGracePeriodSeconds'] as num?)
      ?.toInt(),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$InitContainerStartupProbeToJson(
  InitContainerStartupProbe instance,
) => <String, dynamic>{
  'exec': instance.exec,
  'failureThreshold': instance.failureThreshold,
  'grpc': instance.grpc,
  'httpGet': instance.httpGet,
  'initialDelaySeconds': instance.initialDelaySeconds,
  'periodSeconds': instance.periodSeconds,
  'successThreshold': instance.successThreshold,
  'tcpSocket': instance.tcpSocket,
  'terminationGracePeriodSeconds': instance.terminationGracePeriodSeconds,
  'timeoutSeconds': instance.timeoutSeconds,
};

Exec2 _$Exec2FromJson(Map<String, dynamic> json) => Exec2(
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$Exec2ToJson(Exec2 instance) => <String, dynamic>{
  'command': instance.command,
};

CunningGrpc _$CunningGrpcFromJson(Map<String, dynamic> json) => CunningGrpc(
  port: (json['port'] as num).toInt(),
  service: json['service'] as String?,
);

Map<String, dynamic> _$CunningGrpcToJson(CunningGrpc instance) =>
    <String, dynamic>{'port': instance.port, 'service': instance.service};

HttpGet2 _$HttpGet2FromJson(Map<String, dynamic> json) => HttpGet2(
  host: json['host'] as String?,
  httpHeaders: (json['httpHeaders'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : HttpHeader2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  path: json['path'] as String?,
  port: json['port'],
  scheme: $enumDecodeNullable(_$SchemeEnumMap, json['scheme']),
);

Map<String, dynamic> _$HttpGet2ToJson(HttpGet2 instance) => <String, dynamic>{
  'host': instance.host,
  'httpHeaders': instance.httpHeaders,
  'path': instance.path,
  'port': instance.port,
  'scheme': _$SchemeEnumMap[instance.scheme],
};

HttpHeader2 _$HttpHeader2FromJson(Map<String, dynamic> json) =>
    HttpHeader2(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$HttpHeader2ToJson(HttpHeader2 instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

TcpSocket2 _$TcpSocket2FromJson(Map<String, dynamic> json) =>
    TcpSocket2(host: json['host'] as String?, port: json['port']);

Map<String, dynamic> _$TcpSocket2ToJson(TcpSocket2 instance) =>
    <String, dynamic>{'host': instance.host, 'port': instance.port};

InitContainerVolumeDevice _$InitContainerVolumeDeviceFromJson(
  Map<String, dynamic> json,
) => InitContainerVolumeDevice(
  devicePath: json['devicePath'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$InitContainerVolumeDeviceToJson(
  InitContainerVolumeDevice instance,
) => <String, dynamic>{
  'devicePath': instance.devicePath,
  'name': instance.name,
};

InitContainerVolumeMount _$InitContainerVolumeMountFromJson(
  Map<String, dynamic> json,
) => InitContainerVolumeMount(
  mountPath: json['mountPath'] as String,
  mountPropagation: $enumDecodeNullable(
    _$MountPropagationEnumMap,
    json['mountPropagation'],
  ),
  name: json['name'] as String,
  readOnly: json['readOnly'] as bool?,
  recursiveReadOnly: json['recursiveReadOnly'] as String?,
  subPath: json['subPath'] as String?,
  subPathExpr: json['subPathExpr'] as String?,
);

Map<String, dynamic> _$InitContainerVolumeMountToJson(
  InitContainerVolumeMount instance,
) => <String, dynamic>{
  'mountPath': instance.mountPath,
  'mountPropagation': _$MountPropagationEnumMap[instance.mountPropagation],
  'name': instance.name,
  'readOnly': instance.readOnly,
  'recursiveReadOnly': instance.recursiveReadOnly,
  'subPath': instance.subPath,
  'subPathExpr': instance.subPathExpr,
};

Os _$OsFromJson(Map<String, dynamic> json) => Os(name: json['name'] as String);

Map<String, dynamic> _$OsToJson(Os instance) => <String, dynamic>{
  'name': instance.name,
};

ReadinessGate _$ReadinessGateFromJson(Map<String, dynamic> json) =>
    ReadinessGate(conditionType: json['conditionType'] as String);

Map<String, dynamic> _$ReadinessGateToJson(ReadinessGate instance) =>
    <String, dynamic>{'conditionType': instance.conditionType};

ResourceClaim _$ResourceClaimFromJson(Map<String, dynamic> json) =>
    ResourceClaim(
      name: json['name'] as String,
      resourceClaimName: json['resourceClaimName'] as String?,
      resourceClaimTemplateName: json['resourceClaimTemplateName'] as String?,
    );

Map<String, dynamic> _$ResourceClaimToJson(ResourceClaim instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resourceClaimName': instance.resourceClaimName,
      'resourceClaimTemplateName': instance.resourceClaimTemplateName,
    };

PurpleResources _$PurpleResourcesFromJson(Map<String, dynamic> json) =>
    PurpleResources(
      claims: (json['claims'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyClaim.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PurpleResourcesToJson(PurpleResources instance) =>
    <String, dynamic>{
      'claims': instance.claims,
      'limits': instance.limits,
      'requests': instance.requests,
    };

StickyClaim _$StickyClaimFromJson(Map<String, dynamic> json) => StickyClaim(
  name: json['name'] as String,
  request: json['request'] as String?,
);

Map<String, dynamic> _$StickyClaimToJson(StickyClaim instance) =>
    <String, dynamic>{'name': instance.name, 'request': instance.request};

SchedulingGate _$SchedulingGateFromJson(Map<String, dynamic> json) =>
    SchedulingGate(name: json['name'] as String);

Map<String, dynamic> _$SchedulingGateToJson(SchedulingGate instance) =>
    <String, dynamic>{'name': instance.name};

SpecSecurityContext _$SpecSecurityContextFromJson(Map<String, dynamic> json) =>
    SpecSecurityContext(
      appArmorProfile: json['appArmorProfile'] == null
          ? null
          : StickyAppArmorProfile.fromJson(
              json['appArmorProfile'] as Map<String, dynamic>,
            ),
      fsGroup: (json['fsGroup'] as num?)?.toInt(),
      fsGroupChangePolicy: $enumDecodeNullable(
        _$FsGroupChangePolicyEnumMap,
        json['fsGroupChangePolicy'],
      ),
      runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
      runAsNonRoot: json['runAsNonRoot'] as bool?,
      runAsUser: (json['runAsUser'] as num?)?.toInt(),
      seccompProfile: json['seccompProfile'] == null
          ? null
          : StickySeccompProfile.fromJson(
              json['seccompProfile'] as Map<String, dynamic>,
            ),
      seLinuxChangePolicy: json['seLinuxChangePolicy'] as String?,
      seLinuxOptions: json['seLinuxOptions'] == null
          ? null
          : StickySeLinuxOptions.fromJson(
              json['seLinuxOptions'] as Map<String, dynamic>,
            ),
      supplementalGroups: (json['supplementalGroups'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      supplementalGroupsPolicy: $enumDecodeNullable(
        _$SupplementalGroupsPolicyEnumMap,
        json['supplementalGroupsPolicy'],
      ),
      sysctls: (json['sysctls'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Sysctl.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      windowsOptions: json['windowsOptions'] == null
          ? null
          : StickyWindowsOptions.fromJson(
              json['windowsOptions'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SpecSecurityContextToJson(
  SpecSecurityContext instance,
) => <String, dynamic>{
  'appArmorProfile': instance.appArmorProfile,
  'fsGroup': instance.fsGroup,
  'fsGroupChangePolicy':
      _$FsGroupChangePolicyEnumMap[instance.fsGroupChangePolicy],
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxChangePolicy': instance.seLinuxChangePolicy,
  'seLinuxOptions': instance.seLinuxOptions,
  'supplementalGroups': instance.supplementalGroups,
  'supplementalGroupsPolicy':
      _$SupplementalGroupsPolicyEnumMap[instance.supplementalGroupsPolicy],
  'sysctls': instance.sysctls,
  'windowsOptions': instance.windowsOptions,
};

const _$FsGroupChangePolicyEnumMap = {
  FsGroupChangePolicy.ALWAYS: 'Always',
  FsGroupChangePolicy.ON_ROOT_MISMATCH: 'OnRootMismatch',
};

const _$SupplementalGroupsPolicyEnumMap = {
  SupplementalGroupsPolicy.MERGE: 'Merge',
  SupplementalGroupsPolicy.STRICT: 'Strict',
};

StickyAppArmorProfile _$StickyAppArmorProfileFromJson(
  Map<String, dynamic> json,
) => StickyAppArmorProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$StickyAppArmorProfileToJson(
  StickyAppArmorProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

StickySeLinuxOptions _$StickySeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => StickySeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$StickySeLinuxOptionsToJson(
  StickySeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

StickySeccompProfile _$StickySeccompProfileFromJson(
  Map<String, dynamic> json,
) => StickySeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: $enumDecode(_$AppArmorProfileTypeEnumMap, json['type']),
);

Map<String, dynamic> _$StickySeccompProfileToJson(
  StickySeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': _$AppArmorProfileTypeEnumMap[instance.type]!,
};

Sysctl _$SysctlFromJson(Map<String, dynamic> json) =>
    Sysctl(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$SysctlToJson(Sysctl instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

StickyWindowsOptions _$StickyWindowsOptionsFromJson(
  Map<String, dynamic> json,
) => StickyWindowsOptions(
  gmsaCredentialSpec: json['gmsaCredentialSpec'] as String?,
  gmsaCredentialSpecName: json['gmsaCredentialSpecName'] as String?,
  hostProcess: json['hostProcess'] as bool?,
  runAsUserName: json['runAsUserName'] as String?,
);

Map<String, dynamic> _$StickyWindowsOptionsToJson(
  StickyWindowsOptions instance,
) => <String, dynamic>{
  'gmsaCredentialSpec': instance.gmsaCredentialSpec,
  'gmsaCredentialSpecName': instance.gmsaCredentialSpecName,
  'hostProcess': instance.hostProcess,
  'runAsUserName': instance.runAsUserName,
};

Toleration _$TolerationFromJson(Map<String, dynamic> json) => Toleration(
  effect: $enumDecodeNullable(_$EffectEnumMap, json['effect']),
  key: json['key'] as String?,
  tolerationOperator: $enumDecodeNullable(
    _$TolerationOperatorEnumMap,
    json['operator'],
  ),
  tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
  value: json['value'] as String?,
);

Map<String, dynamic> _$TolerationToJson(Toleration instance) =>
    <String, dynamic>{
      'effect': _$EffectEnumMap[instance.effect],
      'key': instance.key,
      'operator': _$TolerationOperatorEnumMap[instance.tolerationOperator],
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

const _$EffectEnumMap = {
  Effect.NO_EXECUTE: 'NoExecute',
  Effect.NO_SCHEDULE: 'NoSchedule',
  Effect.PREFER_NO_SCHEDULE: 'PreferNoSchedule',
};

const _$TolerationOperatorEnumMap = {
  TolerationOperator.EQUAL: 'Equal',
  TolerationOperator.EXISTS: 'Exists',
  TolerationOperator.GT: 'Gt',
  TolerationOperator.LT: 'Lt',
};

TopologySpreadConstraint _$TopologySpreadConstraintFromJson(
  Map<String, dynamic> json,
) => TopologySpreadConstraint(
  labelSelector: json['labelSelector'] == null
      ? null
      : TopologySpreadConstraintLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  maxSkew: (json['maxSkew'] as num).toInt(),
  minDomains: (json['minDomains'] as num?)?.toInt(),
  nodeAffinityPolicy: $enumDecodeNullable(
    _$NodePolicyEnumMap,
    json['nodeAffinityPolicy'],
  ),
  nodeTaintsPolicy: $enumDecodeNullable(
    _$NodePolicyEnumMap,
    json['nodeTaintsPolicy'],
  ),
  topologyKey: json['topologyKey'] as String,
  whenUnsatisfiable: $enumDecode(
    _$WhenUnsatisfiableEnumMap,
    json['whenUnsatisfiable'],
  ),
);

Map<String, dynamic> _$TopologySpreadConstraintToJson(
  TopologySpreadConstraint instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'maxSkew': instance.maxSkew,
  'minDomains': instance.minDomains,
  'nodeAffinityPolicy': _$NodePolicyEnumMap[instance.nodeAffinityPolicy],
  'nodeTaintsPolicy': _$NodePolicyEnumMap[instance.nodeTaintsPolicy],
  'topologyKey': instance.topologyKey,
  'whenUnsatisfiable': _$WhenUnsatisfiableEnumMap[instance.whenUnsatisfiable]!,
};

const _$NodePolicyEnumMap = {
  NodePolicy.HONOR: 'Honor',
  NodePolicy.IGNORE: 'Ignore',
};

const _$WhenUnsatisfiableEnumMap = {
  WhenUnsatisfiable.DO_NOT_SCHEDULE: 'DoNotSchedule',
  WhenUnsatisfiable.SCHEDULE_ANYWAY: 'ScheduleAnyway',
};

TopologySpreadConstraintLabelSelector
_$TopologySpreadConstraintLabelSelectorFromJson(Map<String, dynamic> json) =>
    TopologySpreadConstraintLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$TopologySpreadConstraintLabelSelectorToJson(
  TopologySpreadConstraintLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

CunningMatchExpression _$CunningMatchExpressionFromJson(
  Map<String, dynamic> json,
) => CunningMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$CunningMatchExpressionToJson(
  CunningMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
  awsElasticBlockStore: json['awsElasticBlockStore'] == null
      ? null
      : AwsElasticBlockStore.fromJson(
          json['awsElasticBlockStore'] as Map<String, dynamic>,
        ),
  azureDisk: json['azureDisk'] == null
      ? null
      : AzureDisk.fromJson(json['azureDisk'] as Map<String, dynamic>),
  azureFile: json['azureFile'] == null
      ? null
      : AzureFile.fromJson(json['azureFile'] as Map<String, dynamic>),
  cephfs: json['cephfs'] == null
      ? null
      : Cephfs.fromJson(json['cephfs'] as Map<String, dynamic>),
  cinder: json['cinder'] == null
      ? null
      : Cinder.fromJson(json['cinder'] as Map<String, dynamic>),
  configMap: json['configMap'] == null
      ? null
      : VolumeConfigMap.fromJson(json['configMap'] as Map<String, dynamic>),
  csi: json['csi'] == null
      ? null
      : Csi.fromJson(json['csi'] as Map<String, dynamic>),
  downwardApi: json['downwardAPI'] == null
      ? null
      : VolumeDownwardApi.fromJson(json['downwardAPI'] as Map<String, dynamic>),
  emptyDir: json['emptyDir'] == null
      ? null
      : EmptyDir.fromJson(json['emptyDir'] as Map<String, dynamic>),
  ephemeral: json['ephemeral'] == null
      ? null
      : Ephemeral.fromJson(json['ephemeral'] as Map<String, dynamic>),
  fc: json['fc'] == null
      ? null
      : Fc.fromJson(json['fc'] as Map<String, dynamic>),
  flexVolume: json['flexVolume'] == null
      ? null
      : FlexVolume.fromJson(json['flexVolume'] as Map<String, dynamic>),
  flocker: json['flocker'] == null
      ? null
      : Flocker.fromJson(json['flocker'] as Map<String, dynamic>),
  gcePersistentDisk: json['gcePersistentDisk'] == null
      ? null
      : GcePersistentDisk.fromJson(
          json['gcePersistentDisk'] as Map<String, dynamic>,
        ),
  gitRepo: json['gitRepo'] == null
      ? null
      : GitRepo.fromJson(json['gitRepo'] as Map<String, dynamic>),
  glusterfs: json['glusterfs'] == null
      ? null
      : Glusterfs.fromJson(json['glusterfs'] as Map<String, dynamic>),
  hostPath: json['hostPath'] == null
      ? null
      : HostPath.fromJson(json['hostPath'] as Map<String, dynamic>),
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
  iscsi: json['iscsi'] == null
      ? null
      : Iscsi.fromJson(json['iscsi'] as Map<String, dynamic>),
  name: json['name'] as String,
  nfs: json['nfs'] == null
      ? null
      : Nfs.fromJson(json['nfs'] as Map<String, dynamic>),
  persistentVolumeClaim: json['persistentVolumeClaim'] == null
      ? null
      : PersistentVolumeClaim.fromJson(
          json['persistentVolumeClaim'] as Map<String, dynamic>,
        ),
  photonPersistentDisk: json['photonPersistentDisk'] == null
      ? null
      : PhotonPersistentDisk.fromJson(
          json['photonPersistentDisk'] as Map<String, dynamic>,
        ),
  portworxVolume: json['portworxVolume'] == null
      ? null
      : PortworxVolume.fromJson(json['portworxVolume'] as Map<String, dynamic>),
  projected: json['projected'] == null
      ? null
      : Projected.fromJson(json['projected'] as Map<String, dynamic>),
  quobyte: json['quobyte'] == null
      ? null
      : Quobyte.fromJson(json['quobyte'] as Map<String, dynamic>),
  rbd: json['rbd'] == null
      ? null
      : Rbd.fromJson(json['rbd'] as Map<String, dynamic>),
  scaleIo: json['scaleIO'] == null
      ? null
      : ScaleIo.fromJson(json['scaleIO'] as Map<String, dynamic>),
  secret: json['secret'] == null
      ? null
      : VolumeSecret.fromJson(json['secret'] as Map<String, dynamic>),
  storageos: json['storageos'] == null
      ? null
      : Storageos.fromJson(json['storageos'] as Map<String, dynamic>),
  vsphereVolume: json['vsphereVolume'] == null
      ? null
      : VsphereVolume.fromJson(json['vsphereVolume'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
  'awsElasticBlockStore': instance.awsElasticBlockStore,
  'azureDisk': instance.azureDisk,
  'azureFile': instance.azureFile,
  'cephfs': instance.cephfs,
  'cinder': instance.cinder,
  'configMap': instance.configMap,
  'csi': instance.csi,
  'downwardAPI': instance.downwardApi,
  'emptyDir': instance.emptyDir,
  'ephemeral': instance.ephemeral,
  'fc': instance.fc,
  'flexVolume': instance.flexVolume,
  'flocker': instance.flocker,
  'gcePersistentDisk': instance.gcePersistentDisk,
  'gitRepo': instance.gitRepo,
  'glusterfs': instance.glusterfs,
  'hostPath': instance.hostPath,
  'image': instance.image,
  'iscsi': instance.iscsi,
  'name': instance.name,
  'nfs': instance.nfs,
  'persistentVolumeClaim': instance.persistentVolumeClaim,
  'photonPersistentDisk': instance.photonPersistentDisk,
  'portworxVolume': instance.portworxVolume,
  'projected': instance.projected,
  'quobyte': instance.quobyte,
  'rbd': instance.rbd,
  'scaleIO': instance.scaleIo,
  'secret': instance.secret,
  'storageos': instance.storageos,
  'vsphereVolume': instance.vsphereVolume,
};

AwsElasticBlockStore _$AwsElasticBlockStoreFromJson(
  Map<String, dynamic> json,
) => AwsElasticBlockStore(
  fsType: json['fsType'] as String?,
  partition: (json['partition'] as num?)?.toInt(),
  readOnly: json['readOnly'] as bool?,
  volumeId: json['volumeID'] as String,
);

Map<String, dynamic> _$AwsElasticBlockStoreToJson(
  AwsElasticBlockStore instance,
) => <String, dynamic>{
  'fsType': instance.fsType,
  'partition': instance.partition,
  'readOnly': instance.readOnly,
  'volumeID': instance.volumeId,
};

AzureDisk _$AzureDiskFromJson(Map<String, dynamic> json) => AzureDisk(
  cachingMode: $enumDecodeNullable(_$CachingModeEnumMap, json['cachingMode']),
  diskName: json['diskName'] as String,
  diskUri: json['diskURI'] as String,
  fsType: json['fsType'] as String?,
  kind: $enumDecodeNullable(_$AzureDiskKindEnumMap, json['kind']),
  readOnly: json['readOnly'] as bool?,
);

Map<String, dynamic> _$AzureDiskToJson(AzureDisk instance) => <String, dynamic>{
  'cachingMode': _$CachingModeEnumMap[instance.cachingMode],
  'diskName': instance.diskName,
  'diskURI': instance.diskUri,
  'fsType': instance.fsType,
  'kind': _$AzureDiskKindEnumMap[instance.kind],
  'readOnly': instance.readOnly,
};

const _$CachingModeEnumMap = {
  CachingMode.NONE: 'None',
  CachingMode.READ_ONLY: 'ReadOnly',
  CachingMode.READ_WRITE: 'ReadWrite',
};

const _$AzureDiskKindEnumMap = {
  AzureDiskKind.DEDICATED: 'Dedicated',
  AzureDiskKind.MANAGED: 'Managed',
  AzureDiskKind.SHARED: 'Shared',
};

AzureFile _$AzureFileFromJson(Map<String, dynamic> json) => AzureFile(
  readOnly: json['readOnly'] as bool?,
  secretName: json['secretName'] as String,
  shareName: json['shareName'] as String,
);

Map<String, dynamic> _$AzureFileToJson(AzureFile instance) => <String, dynamic>{
  'readOnly': instance.readOnly,
  'secretName': instance.secretName,
  'shareName': instance.shareName,
};

Cephfs _$CephfsFromJson(Map<String, dynamic> json) => Cephfs(
  monitors: (json['monitors'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  path: json['path'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretFile: json['secretFile'] as String?,
  secretRef: json['secretRef'] == null
      ? null
      : CephfsSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  user: json['user'] as String?,
);

Map<String, dynamic> _$CephfsToJson(Cephfs instance) => <String, dynamic>{
  'monitors': instance.monitors,
  'path': instance.path,
  'readOnly': instance.readOnly,
  'secretFile': instance.secretFile,
  'secretRef': instance.secretRef,
  'user': instance.user,
};

CephfsSecretRef _$CephfsSecretRefFromJson(Map<String, dynamic> json) =>
    CephfsSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$CephfsSecretRefToJson(CephfsSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

Cinder _$CinderFromJson(Map<String, dynamic> json) => Cinder(
  fsType: json['fsType'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : CinderSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  volumeId: json['volumeID'] as String,
);

Map<String, dynamic> _$CinderToJson(Cinder instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'volumeID': instance.volumeId,
};

CinderSecretRef _$CinderSecretRefFromJson(Map<String, dynamic> json) =>
    CinderSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$CinderSecretRefToJson(CinderSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

VolumeConfigMap _$VolumeConfigMapFromJson(Map<String, dynamic> json) =>
    VolumeConfigMap(
      defaultMode: (json['defaultMode'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$VolumeConfigMapToJson(VolumeConfigMap instance) =>
    <String, dynamic>{
      'defaultMode': instance.defaultMode,
      'items': instance.items,
      'name': instance.name,
      'optional': instance.optional,
    };

PurpleItem _$PurpleItemFromJson(Map<String, dynamic> json) => PurpleItem(
  key: json['key'] as String,
  mode: (json['mode'] as num?)?.toInt(),
  path: json['path'] as String,
);

Map<String, dynamic> _$PurpleItemToJson(PurpleItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'mode': instance.mode,
      'path': instance.path,
    };

Csi _$CsiFromJson(Map<String, dynamic> json) => Csi(
  driver: json['driver'] as String,
  fsType: json['fsType'] as String?,
  nodePublishSecretRef: json['nodePublishSecretRef'] == null
      ? null
      : NodePublishSecretRef.fromJson(
          json['nodePublishSecretRef'] as Map<String, dynamic>,
        ),
  readOnly: json['readOnly'] as bool?,
  volumeAttributes: (json['volumeAttributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$CsiToJson(Csi instance) => <String, dynamic>{
  'driver': instance.driver,
  'fsType': instance.fsType,
  'nodePublishSecretRef': instance.nodePublishSecretRef,
  'readOnly': instance.readOnly,
  'volumeAttributes': instance.volumeAttributes,
};

NodePublishSecretRef _$NodePublishSecretRefFromJson(
  Map<String, dynamic> json,
) => NodePublishSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$NodePublishSecretRefToJson(
  NodePublishSecretRef instance,
) => <String, dynamic>{'name': instance.name};

VolumeDownwardApi _$VolumeDownwardApiFromJson(Map<String, dynamic> json) =>
    VolumeDownwardApi(
      defaultMode: (json['defaultMode'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$VolumeDownwardApiToJson(VolumeDownwardApi instance) =>
    <String, dynamic>{
      'defaultMode': instance.defaultMode,
      'items': instance.items,
    };

FluffyItem _$FluffyItemFromJson(Map<String, dynamic> json) => FluffyItem(
  fieldRef: json['fieldRef'] == null
      ? null
      : StickyFieldRef.fromJson(json['fieldRef'] as Map<String, dynamic>),
  mode: (json['mode'] as num?)?.toInt(),
  path: json['path'] as String,
  resourceFieldRef: json['resourceFieldRef'] == null
      ? null
      : StickyResourceFieldRef.fromJson(
          json['resourceFieldRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FluffyItemToJson(FluffyItem instance) =>
    <String, dynamic>{
      'fieldRef': instance.fieldRef,
      'mode': instance.mode,
      'path': instance.path,
      'resourceFieldRef': instance.resourceFieldRef,
    };

StickyFieldRef _$StickyFieldRefFromJson(Map<String, dynamic> json) =>
    StickyFieldRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String,
    );

Map<String, dynamic> _$StickyFieldRefToJson(StickyFieldRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
    };

StickyResourceFieldRef _$StickyResourceFieldRefFromJson(
  Map<String, dynamic> json,
) => StickyResourceFieldRef(
  containerName: json['containerName'] as String?,
  divisor: json['divisor'],
  resource: json['resource'] as String,
);

Map<String, dynamic> _$StickyResourceFieldRefToJson(
  StickyResourceFieldRef instance,
) => <String, dynamic>{
  'containerName': instance.containerName,
  'divisor': instance.divisor,
  'resource': instance.resource,
};

EmptyDir _$EmptyDirFromJson(Map<String, dynamic> json) =>
    EmptyDir(medium: json['medium'] as String?, sizeLimit: json['sizeLimit']);

Map<String, dynamic> _$EmptyDirToJson(EmptyDir instance) => <String, dynamic>{
  'medium': instance.medium,
  'sizeLimit': instance.sizeLimit,
};

Ephemeral _$EphemeralFromJson(Map<String, dynamic> json) => Ephemeral(
  volumeClaimTemplate: json['volumeClaimTemplate'] == null
      ? null
      : VolumeClaimTemplate.fromJson(
          json['volumeClaimTemplate'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$EphemeralToJson(Ephemeral instance) => <String, dynamic>{
  'volumeClaimTemplate': instance.volumeClaimTemplate,
};

VolumeClaimTemplate _$VolumeClaimTemplateFromJson(Map<String, dynamic> json) =>
    VolumeClaimTemplate(
      metadata: json['metadata'] == null
          ? null
          : VolumeClaimTemplateMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      spec: VolumeClaimTemplateSpec.fromJson(
        json['spec'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VolumeClaimTemplateToJson(
  VolumeClaimTemplate instance,
) => <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

VolumeClaimTemplateMetadata _$VolumeClaimTemplateMetadataFromJson(
  Map<String, dynamic> json,
) => VolumeClaimTemplateMetadata(
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
        (e) => e == null
            ? null
            : TentacledManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TentacledOwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$VolumeClaimTemplateMetadataToJson(
  VolumeClaimTemplateMetadata instance,
) => <String, dynamic>{
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

TentacledManagedField _$TentacledManagedFieldFromJson(
  Map<String, dynamic> json,
) => TentacledManagedField(
  apiVersion: json['apiVersion'] as String?,
  fieldsType: json['fieldsType'] as String?,
  fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
  manager: json['manager'] as String?,
  operation: json['operation'] as String?,
  subresource: json['subresource'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$TentacledManagedFieldToJson(
  TentacledManagedField instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'fieldsType': instance.fieldsType,
  'fieldsV1': instance.fieldsV1,
  'manager': instance.manager,
  'operation': instance.operation,
  'subresource': instance.subresource,
  'time': instance.time?.toIso8601String(),
};

TentacledOwnerReference _$TentacledOwnerReferenceFromJson(
  Map<String, dynamic> json,
) => TentacledOwnerReference(
  apiVersion: json['apiVersion'] as String,
  blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
  controller: json['controller'] as bool?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$TentacledOwnerReferenceToJson(
  TentacledOwnerReference instance,
) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'blockOwnerDeletion': instance.blockOwnerDeletion,
  'controller': instance.controller,
  'kind': instance.kind,
  'name': instance.name,
  'uid': instance.uid,
};

VolumeClaimTemplateSpec _$VolumeClaimTemplateSpecFromJson(
  Map<String, dynamic> json,
) => VolumeClaimTemplateSpec(
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
      : FluffyResources.fromJson(json['resources'] as Map<String, dynamic>),
  selector: json['selector'] == null
      ? null
      : Selector.fromJson(json['selector'] as Map<String, dynamic>),
  storageClassName: json['storageClassName'] as String?,
  volumeAttributesClassName: json['volumeAttributesClassName'] as String?,
  volumeMode: $enumDecodeNullable(_$VolumeModeEnumMap, json['volumeMode']),
  volumeName: json['volumeName'] as String?,
);

Map<String, dynamic> _$VolumeClaimTemplateSpecToJson(
  VolumeClaimTemplateSpec instance,
) => <String, dynamic>{
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

FluffyResources _$FluffyResourcesFromJson(Map<String, dynamic> json) =>
    FluffyResources(
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FluffyResourcesToJson(FluffyResources instance) =>
    <String, dynamic>{'limits': instance.limits, 'requests': instance.requests};

Selector _$SelectorFromJson(Map<String, dynamic> json) => Selector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SelectorMatchExpression.fromJson(e as Map<String, dynamic>),
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

SelectorMatchExpression _$SelectorMatchExpressionFromJson(
  Map<String, dynamic> json,
) => SelectorMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$SelectorMatchExpressionToJson(
  SelectorMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

Fc _$FcFromJson(Map<String, dynamic> json) => Fc(
  fsType: json['fsType'] as String?,
  lun: (json['lun'] as num?)?.toInt(),
  readOnly: json['readOnly'] as bool?,
  targetWwNs: (json['targetWWNs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  wwids: (json['wwids'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FcToJson(Fc instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'lun': instance.lun,
  'readOnly': instance.readOnly,
  'targetWWNs': instance.targetWwNs,
  'wwids': instance.wwids,
};

FlexVolume _$FlexVolumeFromJson(Map<String, dynamic> json) => FlexVolume(
  driver: json['driver'] as String,
  fsType: json['fsType'] as String?,
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : FlexVolumeSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FlexVolumeToJson(FlexVolume instance) =>
    <String, dynamic>{
      'driver': instance.driver,
      'fsType': instance.fsType,
      'options': instance.options,
      'readOnly': instance.readOnly,
      'secretRef': instance.secretRef,
    };

FlexVolumeSecretRef _$FlexVolumeSecretRefFromJson(Map<String, dynamic> json) =>
    FlexVolumeSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$FlexVolumeSecretRefToJson(
  FlexVolumeSecretRef instance,
) => <String, dynamic>{'name': instance.name};

Flocker _$FlockerFromJson(Map<String, dynamic> json) => Flocker(
  datasetName: json['datasetName'] as String?,
  datasetUuid: json['datasetUUID'] as String?,
);

Map<String, dynamic> _$FlockerToJson(Flocker instance) => <String, dynamic>{
  'datasetName': instance.datasetName,
  'datasetUUID': instance.datasetUuid,
};

GcePersistentDisk _$GcePersistentDiskFromJson(Map<String, dynamic> json) =>
    GcePersistentDisk(
      fsType: json['fsType'] as String?,
      partition: (json['partition'] as num?)?.toInt(),
      pdName: json['pdName'] as String,
      readOnly: json['readOnly'] as bool?,
    );

Map<String, dynamic> _$GcePersistentDiskToJson(GcePersistentDisk instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'partition': instance.partition,
      'pdName': instance.pdName,
      'readOnly': instance.readOnly,
    };

GitRepo _$GitRepoFromJson(Map<String, dynamic> json) => GitRepo(
  directory: json['directory'] as String?,
  repository: json['repository'] as String,
  revision: json['revision'] as String?,
);

Map<String, dynamic> _$GitRepoToJson(GitRepo instance) => <String, dynamic>{
  'directory': instance.directory,
  'repository': instance.repository,
  'revision': instance.revision,
};

Glusterfs _$GlusterfsFromJson(Map<String, dynamic> json) => Glusterfs(
  endpoints: json['endpoints'] as String,
  path: json['path'] as String,
  readOnly: json['readOnly'] as bool?,
);

Map<String, dynamic> _$GlusterfsToJson(Glusterfs instance) => <String, dynamic>{
  'endpoints': instance.endpoints,
  'path': instance.path,
  'readOnly': instance.readOnly,
};

HostPath _$HostPathFromJson(Map<String, dynamic> json) => HostPath(
  path: json['path'] as String,
  type: $enumDecodeNullable(_$HostPathTypeEnumMap, json['type']),
);

Map<String, dynamic> _$HostPathToJson(HostPath instance) => <String, dynamic>{
  'path': instance.path,
  'type': _$HostPathTypeEnumMap[instance.type],
};

const _$HostPathTypeEnumMap = {
  HostPathType.BLOCK_DEVICE: 'BlockDevice',
  HostPathType.CHAR_DEVICE: 'CharDevice',
  HostPathType.DIRECTORY: 'Directory',
  HostPathType.DIRECTORY_OR_CREATE: 'DirectoryOrCreate',
  HostPathType.EMPTY: '',
  HostPathType.FILE: 'File',
  HostPathType.FILE_OR_CREATE: 'FileOrCreate',
  HostPathType.SOCKET: 'Socket',
};

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  pullPolicy: $enumDecodeNullable(_$PullPolicyEnumMap, json['pullPolicy']),
  reference: json['reference'] as String?,
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'pullPolicy': _$PullPolicyEnumMap[instance.pullPolicy],
  'reference': instance.reference,
};

Iscsi _$IscsiFromJson(Map<String, dynamic> json) => Iscsi(
  chapAuthDiscovery: json['chapAuthDiscovery'] as bool?,
  chapAuthSession: json['chapAuthSession'] as bool?,
  fsType: json['fsType'] as String?,
  initiatorName: json['initiatorName'] as String?,
  iqn: json['iqn'] as String,
  iscsiInterface: json['iscsiInterface'] as String?,
  lun: (json['lun'] as num).toInt(),
  portals: (json['portals'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : IscsiSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  targetPortal: json['targetPortal'] as String,
);

Map<String, dynamic> _$IscsiToJson(Iscsi instance) => <String, dynamic>{
  'chapAuthDiscovery': instance.chapAuthDiscovery,
  'chapAuthSession': instance.chapAuthSession,
  'fsType': instance.fsType,
  'initiatorName': instance.initiatorName,
  'iqn': instance.iqn,
  'iscsiInterface': instance.iscsiInterface,
  'lun': instance.lun,
  'portals': instance.portals,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'targetPortal': instance.targetPortal,
};

IscsiSecretRef _$IscsiSecretRefFromJson(Map<String, dynamic> json) =>
    IscsiSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$IscsiSecretRefToJson(IscsiSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

Nfs _$NfsFromJson(Map<String, dynamic> json) => Nfs(
  path: json['path'] as String,
  readOnly: json['readOnly'] as bool?,
  server: json['server'] as String,
);

Map<String, dynamic> _$NfsToJson(Nfs instance) => <String, dynamic>{
  'path': instance.path,
  'readOnly': instance.readOnly,
  'server': instance.server,
};

PersistentVolumeClaim _$PersistentVolumeClaimFromJson(
  Map<String, dynamic> json,
) => PersistentVolumeClaim(
  claimName: json['claimName'] as String,
  readOnly: json['readOnly'] as bool?,
);

Map<String, dynamic> _$PersistentVolumeClaimToJson(
  PersistentVolumeClaim instance,
) => <String, dynamic>{
  'claimName': instance.claimName,
  'readOnly': instance.readOnly,
};

PhotonPersistentDisk _$PhotonPersistentDiskFromJson(
  Map<String, dynamic> json,
) => PhotonPersistentDisk(
  fsType: json['fsType'] as String?,
  pdId: json['pdID'] as String,
);

Map<String, dynamic> _$PhotonPersistentDiskToJson(
  PhotonPersistentDisk instance,
) => <String, dynamic>{'fsType': instance.fsType, 'pdID': instance.pdId};

PortworxVolume _$PortworxVolumeFromJson(Map<String, dynamic> json) =>
    PortworxVolume(
      fsType: json['fsType'] as String?,
      readOnly: json['readOnly'] as bool?,
      volumeId: json['volumeID'] as String,
    );

Map<String, dynamic> _$PortworxVolumeToJson(PortworxVolume instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'readOnly': instance.readOnly,
      'volumeID': instance.volumeId,
    };

Projected _$ProjectedFromJson(Map<String, dynamic> json) => Projected(
  defaultMode: (json['defaultMode'] as num?)?.toInt(),
  sources: (json['sources'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Source.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ProjectedToJson(Projected instance) => <String, dynamic>{
  'defaultMode': instance.defaultMode,
  'sources': instance.sources,
};

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
  clusterTrustBundle: json['clusterTrustBundle'] == null
      ? null
      : ClusterTrustBundle.fromJson(
          json['clusterTrustBundle'] as Map<String, dynamic>,
        ),
  configMap: json['configMap'] == null
      ? null
      : SourceConfigMap.fromJson(json['configMap'] as Map<String, dynamic>),
  downwardApi: json['downwardAPI'] == null
      ? null
      : SourceDownwardApi.fromJson(json['downwardAPI'] as Map<String, dynamic>),
  podCertificate: json['podCertificate'] == null
      ? null
      : PodCertificate.fromJson(json['podCertificate'] as Map<String, dynamic>),
  secret: json['secret'] == null
      ? null
      : SourceSecret.fromJson(json['secret'] as Map<String, dynamic>),
  serviceAccountToken: json['serviceAccountToken'] == null
      ? null
      : ServiceAccountToken.fromJson(
          json['serviceAccountToken'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'clusterTrustBundle': instance.clusterTrustBundle,
  'configMap': instance.configMap,
  'downwardAPI': instance.downwardApi,
  'podCertificate': instance.podCertificate,
  'secret': instance.secret,
  'serviceAccountToken': instance.serviceAccountToken,
};

ClusterTrustBundle _$ClusterTrustBundleFromJson(Map<String, dynamic> json) =>
    ClusterTrustBundle(
      labelSelector: json['labelSelector'] == null
          ? null
          : ClusterTrustBundleLabelSelector.fromJson(
              json['labelSelector'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
      path: json['path'] as String,
      signerName: json['signerName'] as String?,
    );

Map<String, dynamic> _$ClusterTrustBundleToJson(ClusterTrustBundle instance) =>
    <String, dynamic>{
      'labelSelector': instance.labelSelector,
      'name': instance.name,
      'optional': instance.optional,
      'path': instance.path,
      'signerName': instance.signerName,
    };

ClusterTrustBundleLabelSelector _$ClusterTrustBundleLabelSelectorFromJson(
  Map<String, dynamic> json,
) => ClusterTrustBundleLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$ClusterTrustBundleLabelSelectorToJson(
  ClusterTrustBundleLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MagentaMatchExpression _$MagentaMatchExpressionFromJson(
  Map<String, dynamic> json,
) => MagentaMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$MagentaMatchExpressionToJson(
  MagentaMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

SourceConfigMap _$SourceConfigMapFromJson(Map<String, dynamic> json) =>
    SourceConfigMap(
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      name: json['name'] as String?,
      optional: json['optional'] as bool?,
    );

Map<String, dynamic> _$SourceConfigMapToJson(SourceConfigMap instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'optional': instance.optional,
    };

TentacledItem _$TentacledItemFromJson(Map<String, dynamic> json) =>
    TentacledItem(
      key: json['key'] as String,
      mode: (json['mode'] as num?)?.toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$TentacledItemToJson(TentacledItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'mode': instance.mode,
      'path': instance.path,
    };

SourceDownwardApi _$SourceDownwardApiFromJson(Map<String, dynamic> json) =>
    SourceDownwardApi(
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$SourceDownwardApiToJson(SourceDownwardApi instance) =>
    <String, dynamic>{'items': instance.items};

StickyItem _$StickyItemFromJson(Map<String, dynamic> json) => StickyItem(
  fieldRef: json['fieldRef'] == null
      ? null
      : IndigoFieldRef.fromJson(json['fieldRef'] as Map<String, dynamic>),
  mode: (json['mode'] as num?)?.toInt(),
  path: json['path'] as String,
  resourceFieldRef: json['resourceFieldRef'] == null
      ? null
      : IndigoResourceFieldRef.fromJson(
          json['resourceFieldRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StickyItemToJson(StickyItem instance) =>
    <String, dynamic>{
      'fieldRef': instance.fieldRef,
      'mode': instance.mode,
      'path': instance.path,
      'resourceFieldRef': instance.resourceFieldRef,
    };

IndigoFieldRef _$IndigoFieldRefFromJson(Map<String, dynamic> json) =>
    IndigoFieldRef(
      apiVersion: json['apiVersion'] as String?,
      fieldPath: json['fieldPath'] as String,
    );

Map<String, dynamic> _$IndigoFieldRefToJson(IndigoFieldRef instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldPath': instance.fieldPath,
    };

IndigoResourceFieldRef _$IndigoResourceFieldRefFromJson(
  Map<String, dynamic> json,
) => IndigoResourceFieldRef(
  containerName: json['containerName'] as String?,
  divisor: json['divisor'],
  resource: json['resource'] as String,
);

Map<String, dynamic> _$IndigoResourceFieldRefToJson(
  IndigoResourceFieldRef instance,
) => <String, dynamic>{
  'containerName': instance.containerName,
  'divisor': instance.divisor,
  'resource': instance.resource,
};

PodCertificate _$PodCertificateFromJson(Map<String, dynamic> json) =>
    PodCertificate(
      certificateChainPath: json['certificateChainPath'] as String?,
      credentialBundlePath: json['credentialBundlePath'] as String?,
      keyPath: json['keyPath'] as String?,
      keyType: json['keyType'] as String,
      maxExpirationSeconds: (json['maxExpirationSeconds'] as num?)?.toInt(),
      signerName: json['signerName'] as String,
      userAnnotations: (json['userAnnotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PodCertificateToJson(PodCertificate instance) =>
    <String, dynamic>{
      'certificateChainPath': instance.certificateChainPath,
      'credentialBundlePath': instance.credentialBundlePath,
      'keyPath': instance.keyPath,
      'keyType': instance.keyType,
      'maxExpirationSeconds': instance.maxExpirationSeconds,
      'signerName': instance.signerName,
      'userAnnotations': instance.userAnnotations,
    };

SourceSecret _$SourceSecretFromJson(Map<String, dynamic> json) => SourceSecret(
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndigoItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  optional: json['optional'] as bool?,
);

Map<String, dynamic> _$SourceSecretToJson(SourceSecret instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'optional': instance.optional,
    };

IndigoItem _$IndigoItemFromJson(Map<String, dynamic> json) => IndigoItem(
  key: json['key'] as String,
  mode: (json['mode'] as num?)?.toInt(),
  path: json['path'] as String,
);

Map<String, dynamic> _$IndigoItemToJson(IndigoItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'mode': instance.mode,
      'path': instance.path,
    };

ServiceAccountToken _$ServiceAccountTokenFromJson(Map<String, dynamic> json) =>
    ServiceAccountToken(
      audience: json['audience'] as String?,
      expirationSeconds: (json['expirationSeconds'] as num?)?.toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$ServiceAccountTokenToJson(
  ServiceAccountToken instance,
) => <String, dynamic>{
  'audience': instance.audience,
  'expirationSeconds': instance.expirationSeconds,
  'path': instance.path,
};

Quobyte _$QuobyteFromJson(Map<String, dynamic> json) => Quobyte(
  group: json['group'] as String?,
  readOnly: json['readOnly'] as bool?,
  registry: json['registry'] as String,
  tenant: json['tenant'] as String?,
  user: json['user'] as String?,
  volume: json['volume'] as String,
);

Map<String, dynamic> _$QuobyteToJson(Quobyte instance) => <String, dynamic>{
  'group': instance.group,
  'readOnly': instance.readOnly,
  'registry': instance.registry,
  'tenant': instance.tenant,
  'user': instance.user,
  'volume': instance.volume,
};

Rbd _$RbdFromJson(Map<String, dynamic> json) => Rbd(
  fsType: json['fsType'] as String?,
  image: json['image'] as String,
  keyring: json['keyring'] as String?,
  monitors: (json['monitors'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  pool: json['pool'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : RbdSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  user: json['user'] as String?,
);

Map<String, dynamic> _$RbdToJson(Rbd instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'image': instance.image,
  'keyring': instance.keyring,
  'monitors': instance.monitors,
  'pool': instance.pool,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'user': instance.user,
};

RbdSecretRef _$RbdSecretRefFromJson(Map<String, dynamic> json) =>
    RbdSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$RbdSecretRefToJson(RbdSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

ScaleIo _$ScaleIoFromJson(Map<String, dynamic> json) => ScaleIo(
  fsType: json['fsType'] as String?,
  gateway: json['gateway'] as String,
  protectionDomain: json['protectionDomain'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: ScaleIoSecretRef.fromJson(
    json['secretRef'] as Map<String, dynamic>,
  ),
  sslEnabled: json['sslEnabled'] as bool?,
  storageMode: json['storageMode'] as String?,
  storagePool: json['storagePool'] as String?,
  system: json['system'] as String,
  volumeName: json['volumeName'] as String?,
);

Map<String, dynamic> _$ScaleIoToJson(ScaleIo instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'gateway': instance.gateway,
  'protectionDomain': instance.protectionDomain,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'sslEnabled': instance.sslEnabled,
  'storageMode': instance.storageMode,
  'storagePool': instance.storagePool,
  'system': instance.system,
  'volumeName': instance.volumeName,
};

ScaleIoSecretRef _$ScaleIoSecretRefFromJson(Map<String, dynamic> json) =>
    ScaleIoSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$ScaleIoSecretRefToJson(ScaleIoSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

VolumeSecret _$VolumeSecretFromJson(Map<String, dynamic> json) => VolumeSecret(
  defaultMode: (json['defaultMode'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : IndecentItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  optional: json['optional'] as bool?,
  secretName: json['secretName'] as String?,
);

Map<String, dynamic> _$VolumeSecretToJson(VolumeSecret instance) =>
    <String, dynamic>{
      'defaultMode': instance.defaultMode,
      'items': instance.items,
      'optional': instance.optional,
      'secretName': instance.secretName,
    };

IndecentItem _$IndecentItemFromJson(Map<String, dynamic> json) => IndecentItem(
  key: json['key'] as String,
  mode: (json['mode'] as num?)?.toInt(),
  path: json['path'] as String,
);

Map<String, dynamic> _$IndecentItemToJson(IndecentItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'mode': instance.mode,
      'path': instance.path,
    };

Storageos _$StorageosFromJson(Map<String, dynamic> json) => Storageos(
  fsType: json['fsType'] as String?,
  readOnly: json['readOnly'] as bool?,
  secretRef: json['secretRef'] == null
      ? null
      : StorageosSecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  volumeName: json['volumeName'] as String?,
  volumeNamespace: json['volumeNamespace'] as String?,
);

Map<String, dynamic> _$StorageosToJson(Storageos instance) => <String, dynamic>{
  'fsType': instance.fsType,
  'readOnly': instance.readOnly,
  'secretRef': instance.secretRef,
  'volumeName': instance.volumeName,
  'volumeNamespace': instance.volumeNamespace,
};

StorageosSecretRef _$StorageosSecretRefFromJson(Map<String, dynamic> json) =>
    StorageosSecretRef(name: json['name'] as String?);

Map<String, dynamic> _$StorageosSecretRefToJson(StorageosSecretRef instance) =>
    <String, dynamic>{'name': instance.name};

VsphereVolume _$VsphereVolumeFromJson(Map<String, dynamic> json) =>
    VsphereVolume(
      fsType: json['fsType'] as String?,
      storagePolicyId: json['storagePolicyID'] as String?,
      storagePolicyName: json['storagePolicyName'] as String?,
      volumePath: json['volumePath'] as String,
    );

Map<String, dynamic> _$VsphereVolumeToJson(VsphereVolume instance) =>
    <String, dynamic>{
      'fsType': instance.fsType,
      'storagePolicyID': instance.storagePolicyId,
      'storagePolicyName': instance.storagePolicyName,
      'volumePath': instance.volumePath,
    };

WorkloadRef _$WorkloadRefFromJson(Map<String, dynamic> json) => WorkloadRef(
  name: json['name'] as String,
  podGroup: json['podGroup'] as String,
  podGroupReplicaKey: json['podGroupReplicaKey'] as String?,
);

Map<String, dynamic> _$WorkloadRefToJson(WorkloadRef instance) =>
    <String, dynamic>{
      'name': instance.name,
      'podGroup': instance.podGroup,
      'podGroupReplicaKey': instance.podGroupReplicaKey,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  availableReplicas: (json['availableReplicas'] as num?)?.toInt(),
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  fullyLabeledReplicas: (json['fullyLabeledReplicas'] as num?)?.toInt(),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  readyReplicas: (json['readyReplicas'] as num?)?.toInt(),
  replicas: (json['replicas'] as num).toInt(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'availableReplicas': instance.availableReplicas,
  'conditions': instance.conditions,
  'fullyLabeledReplicas': instance.fullyLabeledReplicas,
  'observedGeneration': instance.observedGeneration,
  'readyReplicas': instance.readyReplicas,
  'replicas': instance.replicas,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

ReplicationcontrollerlistV1Metadata
_$ReplicationcontrollerlistV1MetadataFromJson(Map<String, dynamic> json) =>
    ReplicationcontrollerlistV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ReplicationcontrollerlistV1MetadataToJson(
  ReplicationcontrollerlistV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
