// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imageupdateautomationlist_image_v1beta2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageupdateautomationlistImageV1Beta2
_$ImageupdateautomationlistImageV1Beta2FromJson(Map<String, dynamic> json) =>
    ImageupdateautomationlistImageV1Beta2(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(
        _$ImageupdateautomationlistImageV1Beta2KindEnumMap,
        json['kind'],
      ),
      metadata: json['metadata'] == null
          ? null
          : ImageupdateautomationlistImageV1Beta2Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ImageupdateautomationlistImageV1Beta2ToJson(
  ImageupdateautomationlistImageV1Beta2 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ImageupdateautomationlistImageV1Beta2KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.IMAGE_TOOLKIT_FLUXCD_IO_V1_BETA2:
      'image.toolkit.fluxcd.io/v1beta2',
};

const _$ImageupdateautomationlistImageV1Beta2KindEnumMap = {
  ImageupdateautomationlistImageV1Beta2Kind.IMAGE_UPDATE_AUTOMATION_LIST:
      'ImageUpdateAutomationList',
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

const _$ItemKindEnumMap = {
  ItemKind.IMAGE_UPDATE_AUTOMATION: 'ImageUpdateAutomation',
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
  git: json['git'] == null
      ? null
      : Git.fromJson(json['git'] as Map<String, dynamic>),
  interval: json['interval'] as String,
  policySelector: json['policySelector'] == null
      ? null
      : PolicySelector.fromJson(json['policySelector'] as Map<String, dynamic>),
  sourceRef: SourceRef.fromJson(json['sourceRef'] as Map<String, dynamic>),
  suspend: json['suspend'] as bool?,
  update: json['update'] == null
      ? null
      : Update.fromJson(json['update'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'git': instance.git,
  'interval': instance.interval,
  'policySelector': instance.policySelector,
  'sourceRef': instance.sourceRef,
  'suspend': instance.suspend,
  'update': instance.update,
};

Git _$GitFromJson(Map<String, dynamic> json) => Git(
  checkout: json['checkout'] == null
      ? null
      : Checkout.fromJson(json['checkout'] as Map<String, dynamic>),
  commit: Commit.fromJson(json['commit'] as Map<String, dynamic>),
  push: json['push'] == null
      ? null
      : Push.fromJson(json['push'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GitToJson(Git instance) => <String, dynamic>{
  'checkout': instance.checkout,
  'commit': instance.commit,
  'push': instance.push,
};

Checkout _$CheckoutFromJson(Map<String, dynamic> json) =>
    Checkout(ref: Ref.fromJson(json['ref'] as Map<String, dynamic>));

Map<String, dynamic> _$CheckoutToJson(Checkout instance) => <String, dynamic>{
  'ref': instance.ref,
};

Ref _$RefFromJson(Map<String, dynamic> json) => Ref(
  branch: json['branch'] as String?,
  commit: json['commit'] as String?,
  name: json['name'] as String?,
  semver: json['semver'] as String?,
  tag: json['tag'] as String?,
);

Map<String, dynamic> _$RefToJson(Ref instance) => <String, dynamic>{
  'branch': instance.branch,
  'commit': instance.commit,
  'name': instance.name,
  'semver': instance.semver,
  'tag': instance.tag,
};

Commit _$CommitFromJson(Map<String, dynamic> json) => Commit(
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  messageTemplate: json['messageTemplate'] as String?,
  messageTemplateValues:
      (json['messageTemplateValues'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
  signingKey: json['signingKey'] == null
      ? null
      : SigningKey.fromJson(json['signingKey'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommitToJson(Commit instance) => <String, dynamic>{
  'author': instance.author,
  'messageTemplate': instance.messageTemplate,
  'messageTemplateValues': instance.messageTemplateValues,
  'signingKey': instance.signingKey,
};

Author _$AuthorFromJson(Map<String, dynamic> json) =>
    Author(email: json['email'] as String, name: json['name'] as String?);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
};

SigningKey _$SigningKeyFromJson(Map<String, dynamic> json) => SigningKey(
  secretRef: SecretRef.fromJson(json['secretRef'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SigningKeyToJson(SigningKey instance) =>
    <String, dynamic>{'secretRef': instance.secretRef};

SecretRef _$SecretRefFromJson(Map<String, dynamic> json) =>
    SecretRef(name: json['name'] as String);

Map<String, dynamic> _$SecretRefToJson(SecretRef instance) => <String, dynamic>{
  'name': instance.name,
};

Push _$PushFromJson(Map<String, dynamic> json) => Push(
  branch: json['branch'] as String?,
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  refspec: json['refspec'] as String?,
);

Map<String, dynamic> _$PushToJson(Push instance) => <String, dynamic>{
  'branch': instance.branch,
  'options': instance.options,
  'refspec': instance.refspec,
};

PolicySelector _$PolicySelectorFromJson(Map<String, dynamic> json) =>
    PolicySelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : MatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PolicySelectorToJson(PolicySelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

MatchExpression _$MatchExpressionFromJson(Map<String, dynamic> json) =>
    MatchExpression(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpressionToJson(MatchExpression instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

SourceRef _$SourceRefFromJson(Map<String, dynamic> json) => SourceRef(
  apiVersion: json['apiVersion'] as String?,
  kind: $enumDecode(_$SourceRefKindEnumMap, json['kind']),
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
);

Map<String, dynamic> _$SourceRefToJson(SourceRef instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': _$SourceRefKindEnumMap[instance.kind]!,
  'name': instance.name,
  'namespace': instance.namespace,
};

const _$SourceRefKindEnumMap = {SourceRefKind.GIT_REPOSITORY: 'GitRepository'};

Update _$UpdateFromJson(Map<String, dynamic> json) => Update(
  path: json['path'] as String?,
  strategy: $enumDecodeNullable(_$StrategyEnumMap, json['strategy']),
);

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
  'path': instance.path,
  'strategy': _$StrategyEnumMap[instance.strategy],
};

const _$StrategyEnumMap = {Strategy.SETTERS: 'Setters'};

StatusClass _$StatusClassFromJson(Map<String, dynamic> json) => StatusClass(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  lastAutomationRunTime: json['lastAutomationRunTime'] == null
      ? null
      : DateTime.parse(json['lastAutomationRunTime'] as String),
  lastHandledReconcileAt: json['lastHandledReconcileAt'] as String?,
  lastPushCommit: json['lastPushCommit'] as String?,
  lastPushTime: json['lastPushTime'] == null
      ? null
      : DateTime.parse(json['lastPushTime'] as String),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  observedPolicies: (json['observedPolicies'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      e == null ? null : ObservedPolicy.fromJson(e as Map<String, dynamic>),
    ),
  ),
  observedSourceRevision: json['observedSourceRevision'] as String?,
);

Map<String, dynamic> _$StatusClassToJson(
  StatusClass instance,
) => <String, dynamic>{
  'conditions': instance.conditions,
  'lastAutomationRunTime': instance.lastAutomationRunTime?.toIso8601String(),
  'lastHandledReconcileAt': instance.lastHandledReconcileAt,
  'lastPushCommit': instance.lastPushCommit,
  'lastPushTime': instance.lastPushTime?.toIso8601String(),
  'observedGeneration': instance.observedGeneration,
  'observedPolicies': instance.observedPolicies,
  'observedSourceRevision': instance.observedSourceRevision,
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

ObservedPolicy _$ObservedPolicyFromJson(Map<String, dynamic> json) =>
    ObservedPolicy(
      digest: json['digest'] as String?,
      name: json['name'] as String,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$ObservedPolicyToJson(ObservedPolicy instance) =>
    <String, dynamic>{
      'digest': instance.digest,
      'name': instance.name,
      'tag': instance.tag,
    };

ImageupdateautomationlistImageV1Beta2Metadata
_$ImageupdateautomationlistImageV1Beta2MetadataFromJson(
  Map<String, dynamic> json,
) => ImageupdateautomationlistImageV1Beta2Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ImageupdateautomationlistImageV1Beta2MetadataToJson(
  ImageupdateautomationlistImageV1Beta2Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
