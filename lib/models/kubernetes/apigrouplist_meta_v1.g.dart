// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apigrouplist_meta_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApigrouplistMetaV1 _$ApigrouplistMetaV1FromJson(Map<String, dynamic> json) =>
    ApigrouplistMetaV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      groups: (json['groups'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$ApigrouplistMetaV1KindEnumMap, json['kind']),
    );

Map<String, dynamic> _$ApigrouplistMetaV1ToJson(ApigrouplistMetaV1 instance) =>
    <String, dynamic>{
      'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
      'groups': instance.groups,
      'kind': _$ApigrouplistMetaV1KindEnumMap[instance.kind],
    };

const _$ApiVersionEnumMap = {ApiVersion.V1: 'v1'};

const _$ApigrouplistMetaV1KindEnumMap = {
  ApigrouplistMetaV1Kind.API_GROUP_LIST: 'APIGroupList',
};

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$GroupKindEnumMap, json['kind']),
  name: json['name'] as String,
  preferredVersion: json['preferredVersion'] == null
      ? null
      : PreferredVersion.fromJson(
          json['preferredVersion'] as Map<String, dynamic>,
        ),
  serverAddressByClientCidRs:
      (json['serverAddressByClientCIDRs'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : ServerAddressByClientCidr.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  versions: (json['versions'] as List<dynamic>)
      .map(
        (e) => e == null ? null : Version.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$GroupKindEnumMap[instance.kind],
  'name': instance.name,
  'preferredVersion': instance.preferredVersion,
  'serverAddressByClientCIDRs': instance.serverAddressByClientCidRs,
  'versions': instance.versions,
};

const _$GroupKindEnumMap = {GroupKind.API_GROUP: 'APIGroup'};

PreferredVersion _$PreferredVersionFromJson(Map<String, dynamic> json) =>
    PreferredVersion(
      groupVersion: json['groupVersion'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$PreferredVersionToJson(PreferredVersion instance) =>
    <String, dynamic>{
      'groupVersion': instance.groupVersion,
      'version': instance.version,
    };

ServerAddressByClientCidr _$ServerAddressByClientCidrFromJson(
  Map<String, dynamic> json,
) => ServerAddressByClientCidr(
  clientCidr: json['clientCIDR'] as String,
  serverAddress: json['serverAddress'] as String,
);

Map<String, dynamic> _$ServerAddressByClientCidrToJson(
  ServerAddressByClientCidr instance,
) => <String, dynamic>{
  'clientCIDR': instance.clientCidr,
  'serverAddress': instance.serverAddress,
};

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
  groupVersion: json['groupVersion'] as String,
  version: json['version'] as String,
);

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
  'groupVersion': instance.groupVersion,
  'version': instance.version,
};
