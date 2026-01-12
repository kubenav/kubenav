// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rolelist_rbac_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolelistRbacV1 _$RolelistRbacV1FromJson(Map<String, dynamic> json) =>
    RolelistRbacV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$RolelistRbacV1KindEnumMap, json['kind']),
      metadata: json['metadata'] == null
          ? null
          : RolelistRbacV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RolelistRbacV1ToJson(RolelistRbacV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'items': instance.items,
      'kind': _$RolelistRbacV1KindEnumMap[instance.kind],
      'metadata': instance.metadata,
    };

const _$ApiVersionEnumMap = {
  ApiVersion.RBAC_AUTHORIZATION_K8_S_IO_V1: 'rbac.authorization.k8s.io/v1',
};

const _$RolelistRbacV1KindEnumMap = {RolelistRbacV1Kind.ROLE_LIST: 'RoleList'};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'rules': instance.rules,
};

const _$ItemKindEnumMap = {ItemKind.ROLE: 'Role'};

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

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
  apiGroups: (json['apiGroups'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  nonResourceUrLs: (json['nonResourceURLs'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  resourceNames: (json['resourceNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  resources: (json['resources'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  verbs: (json['verbs'] as List<dynamic>).map((e) => e as String?).toList(),
);

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
  'apiGroups': instance.apiGroups,
  'nonResourceURLs': instance.nonResourceUrLs,
  'resourceNames': instance.resourceNames,
  'resources': instance.resources,
  'verbs': instance.verbs,
};

RolelistRbacV1Metadata _$RolelistRbacV1MetadataFromJson(
  Map<String, dynamic> json,
) => RolelistRbacV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$RolelistRbacV1MetadataToJson(
  RolelistRbacV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
