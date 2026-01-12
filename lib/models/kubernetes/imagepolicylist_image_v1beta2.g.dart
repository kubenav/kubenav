// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagepolicylist_image_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagepolicylistImageV1Beta2 _$ImagepolicylistImageV1Beta2FromJson(
  Map<String, dynamic> json,
) => ImagepolicylistImageV1Beta2(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ImagepolicylistImageV1Beta2KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ImagepolicylistImageV1Beta2Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImagepolicylistImageV1Beta2ToJson(
  ImagepolicylistImageV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ImagepolicylistImageV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.IMAGE_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'image.toolkit.fluxcd.io/v1beta2',
};

const _$ImagepolicylistImageV1Beta2KindEnumMap = {
  ImagepolicylistImageV1Beta2Kind.IMAGE_POLICY_LIST: 'ImagePolicyList',
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
      : StatusClass.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.IMAGE_POLICY: 'ImagePolicy'};

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
  digestReflectionPolicy: $enumDecodeNullable(
    _$DigestReflectionPolicyEnumMap,
    json['digestReflectionPolicy'],
  ),
  filterTags: json['filterTags'] == null
      ? null
      : FilterTags.fromJson(json['filterTags'] as Map<String, dynamic>),
  imageRepositoryRef: ImageRepositoryRef.fromJson(
    json['imageRepositoryRef'] as Map<String, dynamic>,
  ),
  interval: json['interval'] as String?,
  policy: Policy.fromJson(json['policy'] as Map<String, dynamic>),
  suspend: json['suspend'] as bool?,
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'digestReflectionPolicy':
      _$DigestReflectionPolicyEnumMap[instance.digestReflectionPolicy],
  'filterTags': instance.filterTags,
  'imageRepositoryRef': instance.imageRepositoryRef,
  'interval': instance.interval,
  'policy': instance.policy,
  'suspend': instance.suspend,
};

const _$DigestReflectionPolicyEnumMap = {
  DigestReflectionPolicy.ALWAYS: 'Always',
  DigestReflectionPolicy.IF_NOT_PRESENT: 'IfNotPresent',
  DigestReflectionPolicy.NEVER: 'Never',
};

FilterTags _$FilterTagsFromJson(Map<String, dynamic> json) => FilterTags(
  extract: json['extract'] as String?,
  pattern: json['pattern'] as String?,
);

Map<String, dynamic> _$FilterTagsToJson(FilterTags instance) =>
    <String, dynamic>{'extract': instance.extract, 'pattern': instance.pattern};

ImageRepositoryRef _$ImageRepositoryRefFromJson(Map<String, dynamic> json) =>
    ImageRepositoryRef(
      name: json['name'] as String,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$ImageRepositoryRefToJson(ImageRepositoryRef instance) =>
    <String, dynamic>{'name': instance.name, 'namespace': instance.namespace};

Policy _$PolicyFromJson(Map<String, dynamic> json) => Policy(
  alphabetical: json['alphabetical'] == null
      ? null
      : Alphabetical.fromJson(json['alphabetical'] as Map<String, dynamic>),
  numerical: json['numerical'] == null
      ? null
      : Numerical.fromJson(json['numerical'] as Map<String, dynamic>),
  semver: json['semver'] == null
      ? null
      : Semver.fromJson(json['semver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PolicyToJson(Policy instance) => <String, dynamic>{
  'alphabetical': instance.alphabetical,
  'numerical': instance.numerical,
  'semver': instance.semver,
};

Alphabetical _$AlphabeticalFromJson(Map<String, dynamic> json) =>
    Alphabetical(order: $enumDecodeNullable(_$OrderEnumMap, json['order']));

Map<String, dynamic> _$AlphabeticalToJson(Alphabetical instance) =>
    <String, dynamic>{'order': _$OrderEnumMap[instance.order]};

const _$OrderEnumMap = {Order.ASC: 'asc', Order.DESC: 'desc'};

Numerical _$NumericalFromJson(Map<String, dynamic> json) =>
    Numerical(order: $enumDecodeNullable(_$OrderEnumMap, json['order']));

Map<String, dynamic> _$NumericalToJson(Numerical instance) => <String, dynamic>{
  'order': _$OrderEnumMap[instance.order],
};

Semver _$SemverFromJson(Map<String, dynamic> json) =>
    Semver(range: json['range'] as String);

Map<String, dynamic> _$SemverToJson(Semver instance) => <String, dynamic>{
  'range': instance.range,
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  latestRef: json['latestRef'] == null
      ? null
      : LatestRef.fromJson(json['latestRef'] as Map<String, dynamic>),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  observedPreviousRef: json['observedPreviousRef'] == null
      ? null
      : ObservedPreviousRef.fromJson(
          json['observedPreviousRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'latestRef': instance.latestRef,
      'observedGeneration': instance.observedGeneration,
      'observedPreviousRef': instance.observedPreviousRef,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: DateTime.parse(json['lastTransitionTime'] as String),
  message: json['message'] as String,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  reason: json['reason'] as String,
  status: $enumDecode(_$StatusEnumEnumMap, json['status']),
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime.toIso8601String(),
  'message': instance.message,
  'observedGeneration': instance.observedGeneration,
  'reason': instance.reason,
  'status': _$StatusEnumEnumMap[instance.status]!,
  'type': instance.type,
};

const _$StatusEnumEnumMap = {
  StatusEnum.FALSE: 'False',
  StatusEnum.TRUE: 'True',
  StatusEnum.UNKNOWN: 'Unknown',
};

LatestRef _$LatestRefFromJson(Map<String, dynamic> json) => LatestRef(
  digest: json['digest'] as String?,
  name: json['name'] as String,
  tag: json['tag'] as String,
);

Map<String, dynamic> _$LatestRefToJson(LatestRef instance) => <String, dynamic>{
  'digest': instance.digest,
  'name': instance.name,
  'tag': instance.tag,
};

ObservedPreviousRef _$ObservedPreviousRefFromJson(Map<String, dynamic> json) =>
    ObservedPreviousRef(
      digest: json['digest'] as String?,
      name: json['name'] as String,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$ObservedPreviousRefToJson(
  ObservedPreviousRef instance,
) => <String, dynamic>{
  'digest': instance.digest,
  'name': instance.name,
  'tag': instance.tag,
};

ImagepolicylistImageV1Beta2Metadata
_$ImagepolicylistImageV1Beta2MetadataFromJson(Map<String, dynamic> json) =>
    ImagepolicylistImageV1Beta2Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ImagepolicylistImageV1Beta2MetadataToJson(
  ImagepolicylistImageV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
