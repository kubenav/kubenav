// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiverlist_notification_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiverlistNotificationV1 _$ReceiverlistNotificationV1FromJson(
  Map<String, dynamic> json,
) => ReceiverlistNotificationV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ReceiverlistNotificationV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ReceiverlistNotificationV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ReceiverlistNotificationV1ToJson(
  ReceiverlistNotificationV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ReceiverlistNotificationV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.NOTIFICATION_TOOLKIT_FLUXCD_IO_V1:
      'notification.toolkit.fluxcd.io/v1',
};

const _$ReceiverlistNotificationV1KindEnumMap = {
  ReceiverlistNotificationV1Kind.RECEIVER_LIST: 'ReceiverList',
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

const _$ItemKindEnumMap = {ItemKind.RECEIVER: 'Receiver'};

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
  events: (json['events'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  interval: json['interval'] as String?,
  resourceFilter: json['resourceFilter'] as String?,
  resources: (json['resources'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Resource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  secretRef: SecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
  suspend: json['suspend'] as bool?,
  type: $enumDecode(_$TypeEnumMap, json['type']),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'events': instance.events,
  'interval': instance.interval,
  'resourceFilter': instance.resourceFilter,
  'resources': instance.resources,
  'secretRef': instance.secretRef,
  'suspend': instance.suspend,
  'type': _$TypeEnumMap[instance.type]!,
};

const _$TypeEnumMap = {
  Type.ACR: 'acr',
  Type.BITBUCKET: 'bitbucket',
  Type.CDEVENTS: 'cdevents',
  Type.DOCKERHUB: 'dockerhub',
  Type.GCR: 'gcr',
  Type.GENERIC: 'generic',
  Type.GENERIC_HMAC: 'generic-hmac',
  Type.GITHUB: 'github',
  Type.GITLAB: 'gitlab',
  Type.HARBOR: 'harbor',
  Type.NEXUS: 'nexus',
  Type.QUAY: 'quay',
};

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$ResourceKindEnumMap, json['kind']),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': _$ResourceKindEnumMap[instance.kind]!,
  'matchLabels': instance.matchLabels,
  'name': instance.name,
  'namespace': instance.namespace,
};

const _$ResourceKindEnumMap = {
  ResourceKind.BUCKET: 'Bucket',
  ResourceKind.GIT_REPOSITORY: 'GitRepository',
  ResourceKind.HELM_CHART: 'HelmChart',
  ResourceKind.HELM_RELEASE: 'HelmRelease',
  ResourceKind.HELM_REPOSITORY: 'HelmRepository',
  ResourceKind.IMAGE_POLICY: 'ImagePolicy',
  ResourceKind.IMAGE_REPOSITORY: 'ImageRepository',
  ResourceKind.IMAGE_UPDATE_AUTOMATION: 'ImageUpdateAutomation',
  ResourceKind.KUSTOMIZATION: 'Kustomization',
  ResourceKind.OCI_REPOSITORY: 'OCIRepository',
};

SecretRef _$SecretRefFromJson(Map<String, dynamic> json) =>
    SecretRef(name: json['name'] as String);

Map<String, dynamic> _$SecretRefToJson(SecretRef instance) => <String, dynamic>{
  'name': instance.name,
};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  webhookPath: json['webhookPath'] as String?,
);

Map<String, dynamic> _$StatusClassToJson(StatusClass instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'lastHandledReconcileAt': instance.lastHandledReconcileAt,
      'observedGeneration': instance.observedGeneration,
      'webhookPath': instance.webhookPath,
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

ReceiverlistNotificationV1Metadata _$ReceiverlistNotificationV1MetadataFromJson(
  Map<String, dynamic> json,
) => ReceiverlistNotificationV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ReceiverlistNotificationV1MetadataToJson(
  ReceiverlistNotificationV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
