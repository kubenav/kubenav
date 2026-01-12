// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiresourcelist_meta_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiresourcelistMetaV1 _$ApiresourcelistMetaV1FromJson(
  Map<String, dynamic> json,
) => ApiresourcelistMetaV1(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  groupVersion: json['groupVersion'] as String,
  kind: $enumDecodeNullable(_$KindEnumMap, json['kind']),
  resources: (json['resources'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Resource.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ApiresourcelistMetaV1ToJson(
  ApiresourcelistMetaV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'groupVersion': instance.groupVersion,
  'kind': _$KindEnumMap[instance.kind],
  'resources': instance.resources,
};

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$KindEnumMap = {Kind.API_RESOURCE_LIST: 'APIResourceList'};

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  group: json['group'] as String?,
  kind: json['kind'] as String,
  name: json['name'] as String,
  namespaced: json['namespaced'] as bool,
  shortNames: (json['shortNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  singularName: json['singularName'] as String,
  storageVersionHash: json['storageVersionHash'] as String?,
  verbs: (json['verbs'] as List<dynamic>).map((e) => e as String?).toList(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
  'categories': instance.categories,
  'group': instance.group,
  'kind': instance.kind,
  'name': instance.name,
  'namespaced': instance.namespaced,
  'shortNames': instance.shortNames,
  'singularName': instance.singularName,
  'storageVersionHash': instance.storageVersionHash,
  'verbs': instance.verbs,
  'version': instance.version,
};
