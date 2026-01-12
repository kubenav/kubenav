// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flowschemalist_flowcontrol_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowschemalistFlowcontrolV1 _$FlowschemalistFlowcontrolV1FromJson(
  Map<String, dynamic> json,
) => FlowschemalistFlowcontrolV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$FlowschemalistFlowcontrolV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : FlowschemalistFlowcontrolV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FlowschemalistFlowcontrolV1ToJson(
  FlowschemalistFlowcontrolV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$FlowschemalistFlowcontrolV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.FLOWCONTROL_APISERVER_K8_S_IO_V1:
      'flowcontrol.apiserver.k8s.io/v1',
};

const _$FlowschemalistFlowcontrolV1KindEnumMap = {
  FlowschemalistFlowcontrolV1Kind.FLOW_SCHEMA_LIST: 'FlowSchemaList',
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

const _$ItemKindEnumMap = {ItemKind.FLOW_SCHEMA: 'FlowSchema'};

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
  distinguisherMethod: json['distinguisherMethod'] == null
      ? null
      : DistinguisherMethod.fromJson(
          json['distinguisherMethod'] as Map<String, dynamic>,
        ),
  matchingPrecedence: (json['matchingPrecedence'] as num?)?.toInt(),
  priorityLevelConfiguration: PriorityLevelConfiguration.fromJson(
    json['priorityLevelConfiguration'] as Map<String, dynamic>,
  ),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'distinguisherMethod': instance.distinguisherMethod,
  'matchingPrecedence': instance.matchingPrecedence,
  'priorityLevelConfiguration': instance.priorityLevelConfiguration,
  'rules': instance.rules,
};

DistinguisherMethod _$DistinguisherMethodFromJson(Map<String, dynamic> json) =>
    DistinguisherMethod(type: json['type'] as String);

Map<String, dynamic> _$DistinguisherMethodToJson(
  DistinguisherMethod instance,
) => <String, dynamic>{'type': instance.type};

PriorityLevelConfiguration _$PriorityLevelConfigurationFromJson(
  Map<String, dynamic> json,
) => PriorityLevelConfiguration(name: json['name'] as String);

Map<String, dynamic> _$PriorityLevelConfigurationToJson(
  PriorityLevelConfiguration instance,
) => <String, dynamic>{'name': instance.name};

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
  nonResourceRules: (json['nonResourceRules'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : NonResourceRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceRules: (json['resourceRules'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ResourceRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  subjects: (json['subjects'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Subject.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
  'nonResourceRules': instance.nonResourceRules,
  'resourceRules': instance.resourceRules,
  'subjects': instance.subjects,
};

NonResourceRule _$NonResourceRuleFromJson(Map<String, dynamic> json) =>
    NonResourceRule(
      nonResourceUrLs: (json['nonResourceURLs'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      verbs: (json['verbs'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$NonResourceRuleToJson(NonResourceRule instance) =>
    <String, dynamic>{
      'nonResourceURLs': instance.nonResourceUrLs,
      'verbs': instance.verbs,
    };

ResourceRule _$ResourceRuleFromJson(Map<String, dynamic> json) => ResourceRule(
  apiGroups: (json['apiGroups'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  clusterScope: json['clusterScope'] as bool?,
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  resources: (json['resources'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  verbs: (json['verbs'] as List<dynamic>).map((e) => e as String?).toList(),
);

Map<String, dynamic> _$ResourceRuleToJson(ResourceRule instance) =>
    <String, dynamic>{
      'apiGroups': instance.apiGroups,
      'clusterScope': instance.clusterScope,
      'namespaces': instance.namespaces,
      'resources': instance.resources,
      'verbs': instance.verbs,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  group: json['group'] == null
      ? null
      : Group.fromJson(json['group'] as Map<String, dynamic>),
  kind: json['kind'] as String,
  serviceAccount: json['serviceAccount'] == null
      ? null
      : ServiceAccount.fromJson(json['serviceAccount'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'group': instance.group,
  'kind': instance.kind,
  'serviceAccount': instance.serviceAccount,
  'user': instance.user,
};

Group _$GroupFromJson(Map<String, dynamic> json) =>
    Group(name: json['name'] as String);

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
  'name': instance.name,
};

ServiceAccount _$ServiceAccountFromJson(Map<String, dynamic> json) =>
    ServiceAccount(
      name: json['name'] as String,
      namespace: json['namespace'] as String,
    );

Map<String, dynamic> _$ServiceAccountToJson(ServiceAccount instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

User _$UserFromJson(Map<String, dynamic> json) =>
    User(name: json['name'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};

FlowschemalistFlowcontrolV1Metadata
_$FlowschemalistFlowcontrolV1MetadataFromJson(Map<String, dynamic> json) =>
    FlowschemalistFlowcontrolV1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$FlowschemalistFlowcontrolV1MetadataToJson(
  FlowschemalistFlowcontrolV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
