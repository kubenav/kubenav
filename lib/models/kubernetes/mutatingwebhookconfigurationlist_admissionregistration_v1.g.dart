// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutatingwebhookconfigurationlist_admissionregistration_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MutatingwebhookconfigurationlistAdmissionregistrationV1
_$MutatingwebhookconfigurationlistAdmissionregistrationV1FromJson(
  Map<String, dynamic> json,
) => MutatingwebhookconfigurationlistAdmissionregistrationV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$MutatingwebhookconfigurationlistAdmissionregistrationV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : MutatingwebhookconfigurationlistAdmissionregistrationV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic>
_$MutatingwebhookconfigurationlistAdmissionregistrationV1ToJson(
  MutatingwebhookconfigurationlistAdmissionregistrationV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind':
      _$MutatingwebhookconfigurationlistAdmissionregistrationV1KindEnumMap[instance
          .kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ADMISSIONREGISTRATION_K8_S_IO_V1:
      'admissionregistration.k8s.io/v1',
};

const _$MutatingwebhookconfigurationlistAdmissionregistrationV1KindEnumMap = {
  MutatingwebhookconfigurationlistAdmissionregistrationV1Kind
          .MUTATING_WEBHOOK_CONFIGURATION_LIST:
      'MutatingWebhookConfigurationList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: json['metadata'] == null
      ? null
      : ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  webhooks: (json['webhooks'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Webhook.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'webhooks': instance.webhooks,
};

const _$ItemKindEnumMap = {
  ItemKind.MUTATING_WEBHOOK_CONFIGURATION: 'MutatingWebhookConfiguration',
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

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
  admissionReviewVersions: (json['admissionReviewVersions'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
  clientConfig: ClientConfig.fromJson(
    json['clientConfig'] as Map<String, dynamic>,
  ),
  failurePolicy: $enumDecodeNullable(
    _$FailurePolicyEnumMap,
    json['failurePolicy'],
  ),
  matchConditions: (json['matchConditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchCondition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchPolicy: $enumDecodeNullable(_$MatchPolicyEnumMap, json['matchPolicy']),
  name: json['name'] as String,
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : NamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  objectSelector: json['objectSelector'] == null
      ? null
      : ObjectSelector.fromJson(json['objectSelector'] as Map<String, dynamic>),
  reinvocationPolicy: $enumDecodeNullable(
    _$ReinvocationPolicyEnumMap,
    json['reinvocationPolicy'],
  ),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
      .toList(),
  sideEffects: $enumDecode(_$SideEffectsEnumMap, json['sideEffects']),
  timeoutSeconds: (json['timeoutSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$WebhookToJson(Webhook instance) => <String, dynamic>{
  'admissionReviewVersions': instance.admissionReviewVersions,
  'clientConfig': instance.clientConfig,
  'failurePolicy': _$FailurePolicyEnumMap[instance.failurePolicy],
  'matchConditions': instance.matchConditions,
  'matchPolicy': _$MatchPolicyEnumMap[instance.matchPolicy],
  'name': instance.name,
  'namespaceSelector': instance.namespaceSelector,
  'objectSelector': instance.objectSelector,
  'reinvocationPolicy':
      _$ReinvocationPolicyEnumMap[instance.reinvocationPolicy],
  'rules': instance.rules,
  'sideEffects': _$SideEffectsEnumMap[instance.sideEffects]!,
  'timeoutSeconds': instance.timeoutSeconds,
};

const _$FailurePolicyEnumMap = {
  FailurePolicy.FAIL: 'Fail',
  FailurePolicy.IGNORE: 'Ignore',
};

const _$MatchPolicyEnumMap = {
  MatchPolicy.EQUIVALENT: 'Equivalent',
  MatchPolicy.EXACT: 'Exact',
};

const _$ReinvocationPolicyEnumMap = {
  ReinvocationPolicy.IF_NEEDED: 'IfNeeded',
  ReinvocationPolicy.NEVER: 'Never',
};

const _$SideEffectsEnumMap = {
  SideEffects.NONE: 'None',
  SideEffects.NONE_ON_DRY_RUN: 'NoneOnDryRun',
  SideEffects.SOME: 'Some',
  SideEffects.UNKNOWN: 'Unknown',
};

ClientConfig _$ClientConfigFromJson(Map<String, dynamic> json) => ClientConfig(
  caBundle: json['caBundle'] as String?,
  service: json['service'] == null
      ? null
      : Service.fromJson(json['service'] as Map<String, dynamic>),
  url: json['url'] as String?,
);

Map<String, dynamic> _$ClientConfigToJson(ClientConfig instance) =>
    <String, dynamic>{
      'caBundle': instance.caBundle,
      'service': instance.service,
      'url': instance.url,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
  name: json['name'] as String,
  namespace: json['namespace'] as String,
  path: json['path'] as String?,
  port: (json['port'] as num?)?.toInt(),
);

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'path': instance.path,
  'port': instance.port,
};

MatchCondition _$MatchConditionFromJson(Map<String, dynamic> json) =>
    MatchCondition(
      expression: json['expression'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MatchConditionToJson(MatchCondition instance) =>
    <String, dynamic>{'expression': instance.expression, 'name': instance.name};

NamespaceSelector _$NamespaceSelectorFromJson(Map<String, dynamic> json) =>
    NamespaceSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NamespaceSelectorMatchExpression.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$NamespaceSelectorToJson(NamespaceSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

NamespaceSelectorMatchExpression _$NamespaceSelectorMatchExpressionFromJson(
  Map<String, dynamic> json,
) => NamespaceSelectorMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$NamespaceSelectorMatchExpressionToJson(
  NamespaceSelectorMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

ObjectSelector _$ObjectSelectorFromJson(Map<String, dynamic> json) =>
    ObjectSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : ObjectSelectorMatchExpression.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$ObjectSelectorToJson(ObjectSelector instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchLabels': instance.matchLabels,
    };

ObjectSelectorMatchExpression _$ObjectSelectorMatchExpressionFromJson(
  Map<String, dynamic> json,
) => ObjectSelectorMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$ObjectSelectorMatchExpressionToJson(
  ObjectSelectorMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
  apiGroups: (json['apiGroups'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  operations: (json['operations'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$OperationEnumMap, e))
      .toList(),
  resources: (json['resources'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  scope: $enumDecodeNullable(_$ScopeEnumMap, json['scope']),
);

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
  'apiGroups': instance.apiGroups,
  'apiVersions': instance.apiVersions,
  'operations': instance.operations
      ?.map((e) => _$OperationEnumMap[e]!)
      .toList(),
  'resources': instance.resources,
  'scope': _$ScopeEnumMap[instance.scope],
};

const _$OperationEnumMap = {
  Operation.CONNECT: 'CONNECT',
  Operation.CREATE: 'CREATE',
  Operation.DELETE: 'DELETE',
  Operation.EMPTY: '*',
  Operation.UPDATE: 'UPDATE',
};

const _$ScopeEnumMap = {
  Scope.CLUSTER: 'Cluster',
  Scope.EMPTY: '*',
  Scope.NAMESPACED: 'Namespaced',
};

MutatingwebhookconfigurationlistAdmissionregistrationV1Metadata
_$MutatingwebhookconfigurationlistAdmissionregistrationV1MetadataFromJson(
  Map<String, dynamic> json,
) => MutatingwebhookconfigurationlistAdmissionregistrationV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic>
_$MutatingwebhookconfigurationlistAdmissionregistrationV1MetadataToJson(
  MutatingwebhookconfigurationlistAdmissionregistrationV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
