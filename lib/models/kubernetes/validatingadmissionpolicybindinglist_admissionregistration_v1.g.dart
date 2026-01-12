// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validatingadmissionpolicybindinglist_admissionregistration_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatingadmissionpolicybindinglistAdmissionregistrationV1
_$ValidatingadmissionpolicybindinglistAdmissionregistrationV1FromJson(
  Map<String, dynamic> json,
) => ValidatingadmissionpolicybindinglistAdmissionregistrationV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  kind: $enumDecodeNullable(
    _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic>
_$ValidatingadmissionpolicybindinglistAdmissionregistrationV1ToJson(
  ValidatingadmissionpolicybindinglistAdmissionregistrationV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind':
      _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1KindEnumMap[instance
          .kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ADMISSIONREGISTRATION_K8_S_IO_V1:
      'admissionregistration.k8s.io/v1',
};

const _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1KindEnumMap =
    {
      ValidatingadmissionpolicybindinglistAdmissionregistrationV1Kind
              .VALIDATING_ADMISSION_POLICY_BINDING_LIST:
          'ValidatingAdmissionPolicyBindingList',
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

const _$ItemKindEnumMap = {
  ItemKind.VALIDATING_ADMISSION_POLICY_BINDING:
      'ValidatingAdmissionPolicyBinding',
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
  matchResources: json['matchResources'] == null
      ? null
      : MatchResources.fromJson(json['matchResources'] as Map<String, dynamic>),
  paramRef: json['paramRef'] == null
      ? null
      : ParamRef.fromJson(json['paramRef'] as Map<String, dynamic>),
  policyName: json['policyName'] as String?,
  validationActions: (json['validationActions'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$ValidationActionEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'matchResources': instance.matchResources,
  'paramRef': instance.paramRef,
  'policyName': instance.policyName,
  'validationActions': instance.validationActions
      ?.map((e) => _$ValidationActionEnumMap[e]!)
      .toList(),
};

const _$ValidationActionEnumMap = {
  ValidationAction.AUDIT: 'Audit',
  ValidationAction.DENY: 'Deny',
  ValidationAction.WARN: 'Warn',
};

MatchResources _$MatchResourcesFromJson(
  Map<String, dynamic> json,
) => MatchResources(
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

Map<String, dynamic> _$MatchResourcesToJson(MatchResources instance) =>
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

ParamRef _$ParamRefFromJson(Map<String, dynamic> json) => ParamRef(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  parameterNotFoundAction: json['parameterNotFoundAction'] as String?,
  selector: json['selector'] == null
      ? null
      : Selector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ParamRefToJson(ParamRef instance) => <String, dynamic>{
  'name': instance.name,
  'namespace': instance.namespace,
  'parameterNotFoundAction': instance.parameterNotFoundAction,
  'selector': instance.selector,
};

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

ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata
_$ValidatingadmissionpolicybindinglistAdmissionregistrationV1MetadataFromJson(
  Map<String, dynamic> json,
) => ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic>
_$ValidatingadmissionpolicybindinglistAdmissionregistrationV1MetadataToJson(
  ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
