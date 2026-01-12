// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customresourcedefinitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomResourceDefinitionList _$CustomResourceDefinitionListFromJson(
  Map<String, dynamic> json,
) => CustomResourceDefinitionList(
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : CustomResourceDefinition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CustomResourceDefinitionListToJson(
  CustomResourceDefinitionList instance,
) => <String, dynamic>{'items': instance.items};

CustomResourceDefinition _$CustomResourceDefinitionFromJson(
  Map<String, dynamic> json,
) =>
    CustomResourceDefinition(
        spec: json['spec'] == null
            ? null
            : CustomResourceDefinitionSpec.fromJson(
                json['spec'] as Map<String, dynamic>,
              ),
      )
      ..metadata = json['metadata'] == null
          ? null
          : CustomResourceDefinitionMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            )
      ..status = json['status'] == null
          ? null
          : CustomResourceDefinitionStatus.fromJson(
              json['status'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$CustomResourceDefinitionToJson(
  CustomResourceDefinition instance,
) => <String, dynamic>{
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

CustomResourceDefinitionSpec _$CustomResourceDefinitionSpecFromJson(
  Map<String, dynamic> json,
) =>
    CustomResourceDefinitionSpec(
        group: json['group'] as String,
        names: CustomResourceDefinitionNames.fromJson(
          json['names'] as Map<String, dynamic>,
        ),
        preserveUnknownFields: json['preserveUnknownFields'] as bool?,
        scope: json['scope'] as String,
        versions:
            (json['versions'] as List<dynamic>?)
                ?.map(
                  (e) => CustomResourceDefinitionVersion.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            const [],
      )
      ..conversion = json['conversion'] == null
          ? null
          : CustomResourceConversion.fromJson(
              json['conversion'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$CustomResourceDefinitionSpecToJson(
  CustomResourceDefinitionSpec instance,
) => <String, dynamic>{
  'conversion': instance.conversion,
  'group': instance.group,
  'names': instance.names,
  'preserveUnknownFields': instance.preserveUnknownFields,
  'scope': instance.scope,
  'versions': instance.versions,
};

CustomResourceConversion _$CustomResourceConversionFromJson(
  Map<String, dynamic> json,
) => CustomResourceConversion(strategy: json['strategy'] as String);

Map<String, dynamic> _$CustomResourceConversionToJson(
  CustomResourceConversion instance,
) => <String, dynamic>{'strategy': instance.strategy};

CustomResourceDefinitionNames _$CustomResourceDefinitionNamesFromJson(
  Map<String, dynamic> json,
) => CustomResourceDefinitionNames(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  kind: json['kind'] as String,
  listKind: json['listKind'] as String?,
  plural: json['plural'] as String,
  shortNames:
      (json['shortNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  singular: json['singular'] as String?,
);

Map<String, dynamic> _$CustomResourceDefinitionNamesToJson(
  CustomResourceDefinitionNames instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'kind': instance.kind,
  'listKind': instance.listKind,
  'plural': instance.plural,
  'shortNames': instance.shortNames,
  'singular': instance.singular,
};

CustomResourceDefinitionVersion _$CustomResourceDefinitionVersionFromJson(
  Map<String, dynamic> json,
) => CustomResourceDefinitionVersion(
  additionalPrinterColumns:
      (json['additionalPrinterColumns'] as List<dynamic>?)
          ?.map(
            (e) => CustomResourceColumnDefinition.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  deprecated: json['deprecated'] as bool?,
  deprecationWarning: json['deprecationWarning'] as String?,
  name: json['name'] as String,
  served: json['served'] as bool,
  storage: json['storage'] as bool,
);

Map<String, dynamic> _$CustomResourceDefinitionVersionToJson(
  CustomResourceDefinitionVersion instance,
) => <String, dynamic>{
  'additionalPrinterColumns': instance.additionalPrinterColumns,
  'deprecated': instance.deprecated,
  'deprecationWarning': instance.deprecationWarning,
  'name': instance.name,
  'served': instance.served,
  'storage': instance.storage,
};

CustomResourceColumnDefinition _$CustomResourceColumnDefinitionFromJson(
  Map<String, dynamic> json,
) => CustomResourceColumnDefinition(
  description: json['description'] as String?,
  format: json['format'] as String?,
  jsonPath: json['jsonPath'] as String,
  name: json['name'] as String,
  priority: (json['priority'] as num?)?.toInt(),
  type: json['type'] as String,
);

Map<String, dynamic> _$CustomResourceColumnDefinitionToJson(
  CustomResourceColumnDefinition instance,
) => <String, dynamic>{
  'description': instance.description,
  'format': instance.format,
  'jsonPath': instance.jsonPath,
  'name': instance.name,
  'priority': instance.priority,
  'type': instance.type,
};

CustomResourceDefinitionMetadata _$CustomResourceDefinitionMetadataFromJson(
  Map<String, dynamic> json,
) => CustomResourceDefinitionMetadata(
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

Map<String, dynamic> _$CustomResourceDefinitionMetadataToJson(
  CustomResourceDefinitionMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'creationTimestamp': instance.creationTimestamp?.toIso8601String(),
  'deletionGracePeriodSeconds': instance.deletionGracePeriodSeconds,
  'deletionTimestamp': instance.deletionTimestamp?.toIso8601String(),
  'finalizers': instance.finalizers,
  'generateName': instance.generateName,
  'generation': instance.generation,
  'labels': instance.labels,
  'name': instance.name,
  'namespace': instance.namespace,
  'ownerReferences': instance.ownerReferences,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
  'uid': instance.uid,
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

CustomResourceDefinitionStatus _$CustomResourceDefinitionStatusFromJson(
  Map<String, dynamic> json,
) => CustomResourceDefinitionStatus(
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Condition.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  storedVersions: (json['storedVersions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CustomResourceDefinitionStatusToJson(
  CustomResourceDefinitionStatus instance,
) => <String, dynamic>{
  'conditions': instance.conditions,
  'storedVersions': instance.storedVersions,
};

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
  lastTransitionTime: json['lastTransitionTime'] == null
      ? null
      : DateTime.parse(json['lastTransitionTime'] as String),
  lastUpdateTime: json['lastUpdateTime'] == null
      ? null
      : DateTime.parse(json['lastUpdateTime'] as String),
  message: json['message'] as String?,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
  'lastTransitionTime': instance.lastTransitionTime?.toIso8601String(),
  'lastUpdateTime': instance.lastUpdateTime?.toIso8601String(),
  'message': instance.message,
  'reason': instance.reason,
  'status': instance.status,
  'type': instance.type,
};
