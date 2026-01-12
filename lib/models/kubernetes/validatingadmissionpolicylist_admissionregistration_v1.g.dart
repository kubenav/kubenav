// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validatingadmissionpolicylist_admissionregistration_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatingadmissionpolicylistAdmissionregistrationV1
_$ValidatingadmissionpolicylistAdmissionregistrationV1FromJson(
  Map<String, dynamic> json,
) => ValidatingadmissionpolicylistAdmissionregistrationV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ValidatingadmissionpolicylistAdmissionregistrationV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ValidatingadmissionpolicylistAdmissionregistrationV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic>
_$ValidatingadmissionpolicylistAdmissionregistrationV1ToJson(
  ValidatingadmissionpolicylistAdmissionregistrationV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind':
      _$ValidatingadmissionpolicylistAdmissionregistrationV1KindEnumMap[instance
          .kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ADMISSIONREGISTRATION_K8_S_IO_V1:
      'admissionregistration.k8s.io/v1',
};

const _$ValidatingadmissionpolicylistAdmissionregistrationV1KindEnumMap = {
  ValidatingadmissionpolicylistAdmissionregistrationV1Kind
          .VALIDATING_ADMISSION_POLICY_LIST:
      'ValidatingAdmissionPolicyList',
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

const _$ItemKindEnumMap = {
  ItemKind.VALIDATING_ADMISSION_POLICY: 'ValidatingAdmissionPolicy',
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
  auditAnnotations: (json['auditAnnotations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AuditAnnotation.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
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
  matchConstraints: json['matchConstraints'] == null
      ? null
      : MatchConstraints.fromJson(
          json['matchConstraints'] as Map<String, dynamic>,
        ),
  paramKind: json['paramKind'] == null
      ? null
      : ParamKind.fromJson(json['paramKind'] as Map<String, dynamic>),
  validations: (json['validations'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Validation.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  variables: (json['variables'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Variable.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'auditAnnotations': instance.auditAnnotations,
  'failurePolicy': _$FailurePolicyEnumMap[instance.failurePolicy],
  'matchConditions': instance.matchConditions,
  'matchConstraints': instance.matchConstraints,
  'paramKind': instance.paramKind,
  'validations': instance.validations,
  'variables': instance.variables,
};

const _$FailurePolicyEnumMap = {
  FailurePolicy.FAIL: 'Fail',
  FailurePolicy.IGNORE: 'Ignore',
};

AuditAnnotation _$AuditAnnotationFromJson(Map<String, dynamic> json) =>
    AuditAnnotation(
      key: json['key'] as String,
      valueExpression: json['valueExpression'] as String,
    );

Map<String, dynamic> _$AuditAnnotationToJson(AuditAnnotation instance) =>
    <String, dynamic>{
      'key': instance.key,
      'valueExpression': instance.valueExpression,
    };

MatchCondition _$MatchConditionFromJson(Map<String, dynamic> json) =>
    MatchCondition(
      expression: json['expression'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MatchConditionToJson(MatchCondition instance) =>
    <String, dynamic>{'expression': instance.expression, 'name': instance.name};

MatchConstraints _$MatchConstraintsFromJson(
  Map<String, dynamic> json,
) => MatchConstraints(
  excludeResourceRules: (json['excludeResourceRules'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ExcludeResourceRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchPolicy: $enumDecodeNullable(_$MatchPolicyEnumMap, json['matchPolicy']),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : NamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  objectSelector: json['objectSelector'] == null
      ? null
      : ObjectSelector.fromJson(json['objectSelector'] as Map<String, dynamic>),
  resourceRules: (json['resourceRules'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ResourceRule.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$MatchConstraintsToJson(MatchConstraints instance) =>
    <String, dynamic>{
      'excludeResourceRules': instance.excludeResourceRules,
      'matchPolicy': _$MatchPolicyEnumMap[instance.matchPolicy],
      'namespaceSelector': instance.namespaceSelector,
      'objectSelector': instance.objectSelector,
      'resourceRules': instance.resourceRules,
    };

const _$MatchPolicyEnumMap = {
  MatchPolicy.EQUIVALENT: 'Equivalent',
  MatchPolicy.EXACT: 'Exact',
};

ExcludeResourceRule _$ExcludeResourceRuleFromJson(Map<String, dynamic> json) =>
    ExcludeResourceRule(
      apiGroups: (json['apiGroups'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      apiVersions: (json['apiVersions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$OperationEnumMap, e))
          .toList(),
      resourceNames: (json['resourceNames'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      scope: $enumDecodeNullable(_$ScopeEnumMap, json['scope']),
    );

Map<String, dynamic> _$ExcludeResourceRuleToJson(
  ExcludeResourceRule instance,
) => <String, dynamic>{
  'apiGroups': instance.apiGroups,
  'apiVersions': instance.apiVersions,
  'operations': instance.operations
      ?.map((e) => _$OperationEnumMap[e]!)
      .toList(),
  'resourceNames': instance.resourceNames,
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

ResourceRule _$ResourceRuleFromJson(Map<String, dynamic> json) => ResourceRule(
  apiGroups: (json['apiGroups'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  apiVersions: (json['apiVersions'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  operations: (json['operations'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$OperationEnumMap, e))
      .toList(),
  resourceNames: (json['resourceNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  resources: (json['resources'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  scope: $enumDecodeNullable(_$ScopeEnumMap, json['scope']),
);

Map<String, dynamic> _$ResourceRuleToJson(ResourceRule instance) =>
    <String, dynamic>{
      'apiGroups': instance.apiGroups,
      'apiVersions': instance.apiVersions,
      'operations': instance.operations
          ?.map((e) => _$OperationEnumMap[e]!)
          .toList(),
      'resourceNames': instance.resourceNames,
      'resources': instance.resources,
      'scope': _$ScopeEnumMap[instance.scope],
    };

ParamKind _$ParamKindFromJson(Map<String, dynamic> json) => ParamKind(
  apiVersion: json['apiVersion'] as String?,
  kind: json['kind'] as String?,
);

Map<String, dynamic> _$ParamKindToJson(ParamKind instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'kind': instance.kind,
};

Validation _$ValidationFromJson(Map<String, dynamic> json) => Validation(
  expression: json['expression'] as String,
  message: json['message'] as String?,
  messageExpression: json['messageExpression'] as String?,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'message': instance.message,
      'messageExpression': instance.messageExpression,
      'reason': instance.reason,
    };

Variable _$VariableFromJson(Map<String, dynamic> json) => Variable(
  expression: json['expression'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
  'expression': instance.expression,
  'name': instance.name,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  observedGeneration: (json['observedGeneration'] as num?)?.toInt(),
  typeChecking: json['typeChecking'] == null
      ? null
      : TypeChecking.fromJson(json['typeChecking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'conditions': instance.conditions,
  'observedGeneration': instance.observedGeneration,
  'typeChecking': instance.typeChecking,
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

TypeChecking _$TypeCheckingFromJson(Map<String, dynamic> json) => TypeChecking(
  expressionWarnings: (json['expressionWarnings'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ExpressionWarning.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TypeCheckingToJson(TypeChecking instance) =>
    <String, dynamic>{'expressionWarnings': instance.expressionWarnings};

ExpressionWarning _$ExpressionWarningFromJson(Map<String, dynamic> json) =>
    ExpressionWarning(
      fieldRef: json['fieldRef'] as String,
      warning: json['warning'] as String,
    );

Map<String, dynamic> _$ExpressionWarningToJson(ExpressionWarning instance) =>
    <String, dynamic>{
      'fieldRef': instance.fieldRef,
      'warning': instance.warning,
    };

ValidatingadmissionpolicylistAdmissionregistrationV1Metadata
_$ValidatingadmissionpolicylistAdmissionregistrationV1MetadataFromJson(
  Map<String, dynamic> json,
) => ValidatingadmissionpolicylistAdmissionregistrationV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic>
_$ValidatingadmissionpolicylistAdmissionregistrationV1MetadataToJson(
  ValidatingadmissionpolicylistAdmissionregistrationV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
