// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appprojectlist_argoproj_v1alpha1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppprojectlistArgoprojV1Alpha1 _$AppprojectlistArgoprojV1Alpha1FromJson(
  Map<String, dynamic> json,
) => AppprojectlistArgoprojV1Alpha1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : AppprojectlistArgoprojV1Alpha1Item.fromJson(
                e as Map<String, dynamic>,
              ),
      )
      .toList(),
  kind: $enumDecodeNullable(
    _$AppprojectlistArgoprojV1Alpha1KindEnumMap,
    json['kind'],
  ),
  metadata: json['metadata'] == null
      ? null
      : AppprojectlistArgoprojV1Alpha1Metadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppprojectlistArgoprojV1Alpha1ToJson(
  AppprojectlistArgoprojV1Alpha1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$AppprojectlistArgoprojV1Alpha1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ARGOPROJ_IO_V1_ALPHA1: 'argoproj.io/v1alpha1',
};

const _$AppprojectlistArgoprojV1Alpha1KindEnumMap = {
  AppprojectlistArgoprojV1Alpha1Kind.APP_PROJECT_LIST: 'AppProjectList',
};

AppprojectlistArgoprojV1Alpha1Item _$AppprojectlistArgoprojV1Alpha1ItemFromJson(
  Map<String, dynamic> json,
) => AppprojectlistArgoprojV1Alpha1Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: Spec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppprojectlistArgoprojV1Alpha1ItemToJson(
  AppprojectlistArgoprojV1Alpha1Item instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.APP_PROJECT: 'AppProject'};

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
  clusterResourceBlacklist: (json['clusterResourceBlacklist'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ClusterResourceBlacklist.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  clusterResourceWhitelist: (json['clusterResourceWhitelist'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : ClusterResourceWhitelist.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  description: json['description'] as String?,
  destinations: (json['destinations'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : Destination.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  destinationServiceAccounts:
      (json['destinationServiceAccounts'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : DestinationServiceAccount.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  namespaceResourceBlacklist:
      (json['namespaceResourceBlacklist'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NamespaceResourceBlacklist.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  namespaceResourceWhitelist:
      (json['namespaceResourceWhitelist'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : NamespaceResourceWhitelist.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  orphanedResources: json['orphanedResources'] == null
      ? null
      : OrphanedResources.fromJson(
          json['orphanedResources'] as Map<String, dynamic>,
        ),
  permitOnlyProjectScopedClusters:
      json['permitOnlyProjectScopedClusters'] as bool?,
  roles: (json['roles'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
      .toList(),
  signatureKeys: (json['signatureKeys'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : SignatureKey.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  sourceNamespaces: (json['sourceNamespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  sourceRepos: (json['sourceRepos'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  syncWindows: (json['syncWindows'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : SyncWindow.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecToJson(Spec instance) => <String, dynamic>{
  'clusterResourceBlacklist': instance.clusterResourceBlacklist,
  'clusterResourceWhitelist': instance.clusterResourceWhitelist,
  'description': instance.description,
  'destinations': instance.destinations,
  'destinationServiceAccounts': instance.destinationServiceAccounts,
  'namespaceResourceBlacklist': instance.namespaceResourceBlacklist,
  'namespaceResourceWhitelist': instance.namespaceResourceWhitelist,
  'orphanedResources': instance.orphanedResources,
  'permitOnlyProjectScopedClusters': instance.permitOnlyProjectScopedClusters,
  'roles': instance.roles,
  'signatureKeys': instance.signatureKeys,
  'sourceNamespaces': instance.sourceNamespaces,
  'sourceRepos': instance.sourceRepos,
  'syncWindows': instance.syncWindows,
};

ClusterResourceBlacklist _$ClusterResourceBlacklistFromJson(
  Map<String, dynamic> json,
) => ClusterResourceBlacklist(
  group: json['group'] as String,
  kind: json['kind'] as String,
);

Map<String, dynamic> _$ClusterResourceBlacklistToJson(
  ClusterResourceBlacklist instance,
) => <String, dynamic>{'group': instance.group, 'kind': instance.kind};

ClusterResourceWhitelist _$ClusterResourceWhitelistFromJson(
  Map<String, dynamic> json,
) => ClusterResourceWhitelist(
  group: json['group'] as String,
  kind: json['kind'] as String,
);

Map<String, dynamic> _$ClusterResourceWhitelistToJson(
  ClusterResourceWhitelist instance,
) => <String, dynamic>{'group': instance.group, 'kind': instance.kind};

DestinationServiceAccount _$DestinationServiceAccountFromJson(
  Map<String, dynamic> json,
) => DestinationServiceAccount(
  defaultServiceAccount: json['defaultServiceAccount'] as String,
  namespace: json['namespace'] as String?,
  server: json['server'] as String,
);

Map<String, dynamic> _$DestinationServiceAccountToJson(
  DestinationServiceAccount instance,
) => <String, dynamic>{
  'defaultServiceAccount': instance.defaultServiceAccount,
  'namespace': instance.namespace,
  'server': instance.server,
};

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  server: json['server'] as String?,
);

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namespace': instance.namespace,
      'server': instance.server,
    };

NamespaceResourceBlacklist _$NamespaceResourceBlacklistFromJson(
  Map<String, dynamic> json,
) => NamespaceResourceBlacklist(
  group: json['group'] as String,
  kind: json['kind'] as String,
);

Map<String, dynamic> _$NamespaceResourceBlacklistToJson(
  NamespaceResourceBlacklist instance,
) => <String, dynamic>{'group': instance.group, 'kind': instance.kind};

NamespaceResourceWhitelist _$NamespaceResourceWhitelistFromJson(
  Map<String, dynamic> json,
) => NamespaceResourceWhitelist(
  group: json['group'] as String,
  kind: json['kind'] as String,
);

Map<String, dynamic> _$NamespaceResourceWhitelistToJson(
  NamespaceResourceWhitelist instance,
) => <String, dynamic>{'group': instance.group, 'kind': instance.kind};

OrphanedResources _$OrphanedResourcesFromJson(Map<String, dynamic> json) =>
    OrphanedResources(
      ignore: (json['ignore'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Ignore.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      warn: json['warn'] as bool?,
    );

Map<String, dynamic> _$OrphanedResourcesToJson(OrphanedResources instance) =>
    <String, dynamic>{'ignore': instance.ignore, 'warn': instance.warn};

Ignore _$IgnoreFromJson(Map<String, dynamic> json) => Ignore(
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$IgnoreToJson(Ignore instance) => <String, dynamic>{
  'group': instance.group,
  'kind': instance.kind,
  'name': instance.name,
};

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  description: json['description'] as String?,
  groups: (json['groups'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  jwtTokens: (json['jwtTokens'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : JwtToken.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String,
  policies: (json['policies'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'description': instance.description,
  'groups': instance.groups,
  'jwtTokens': instance.jwtTokens,
  'name': instance.name,
  'policies': instance.policies,
};

JwtToken _$JwtTokenFromJson(Map<String, dynamic> json) => JwtToken(
  exp: (json['exp'] as num?)?.toInt(),
  iat: (json['iat'] as num).toInt(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$JwtTokenToJson(JwtToken instance) => <String, dynamic>{
  'exp': instance.exp,
  'iat': instance.iat,
  'id': instance.id,
};

SignatureKey _$SignatureKeyFromJson(Map<String, dynamic> json) =>
    SignatureKey(keyId: json['keyID'] as String);

Map<String, dynamic> _$SignatureKeyToJson(SignatureKey instance) =>
    <String, dynamic>{'keyID': instance.keyId};

SyncWindow _$SyncWindowFromJson(Map<String, dynamic> json) => SyncWindow(
  andOperator: json['andOperator'] as bool?,
  applications: (json['applications'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  clusters: (json['clusters'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  description: json['description'] as String?,
  duration: json['duration'] as String?,
  kind: json['kind'] as String?,
  manualSync: json['manualSync'] as bool?,
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  schedule: json['schedule'] as String?,
  timeZone: json['timeZone'] as String?,
);

Map<String, dynamic> _$SyncWindowToJson(SyncWindow instance) =>
    <String, dynamic>{
      'andOperator': instance.andOperator,
      'applications': instance.applications,
      'clusters': instance.clusters,
      'description': instance.description,
      'duration': instance.duration,
      'kind': instance.kind,
      'manualSync': instance.manualSync,
      'namespaces': instance.namespaces,
      'schedule': instance.schedule,
      'timeZone': instance.timeZone,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  jwtTokensByRole: (json['jwtTokensByRole'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      e == null ? null : JwtTokensByRole.fromJson(e as Map<String, dynamic>),
    ),
  ),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'jwtTokensByRole': instance.jwtTokensByRole,
};

JwtTokensByRole _$JwtTokensByRoleFromJson(Map<String, dynamic> json) =>
    JwtTokensByRole(
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : JwtTokensByRoleItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$JwtTokensByRoleToJson(JwtTokensByRole instance) =>
    <String, dynamic>{'items': instance.items};

JwtTokensByRoleItem _$JwtTokensByRoleItemFromJson(Map<String, dynamic> json) =>
    JwtTokensByRoleItem(
      exp: (json['exp'] as num?)?.toInt(),
      iat: (json['iat'] as num).toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$JwtTokensByRoleItemToJson(
  JwtTokensByRoleItem instance,
) => <String, dynamic>{
  'exp': instance.exp,
  'iat': instance.iat,
  'id': instance.id,
};

AppprojectlistArgoprojV1Alpha1Metadata
_$AppprojectlistArgoprojV1Alpha1MetadataFromJson(Map<String, dynamic> json) =>
    AppprojectlistArgoprojV1Alpha1Metadata(
      metadataContinue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$AppprojectlistArgoprojV1Alpha1MetadataToJson(
  AppprojectlistArgoprojV1Alpha1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
