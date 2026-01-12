// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listmeta_meta_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListmetaMetaV1 _$ListmetaMetaV1FromJson(Map<String, dynamic> json) =>
    ListmetaMetaV1(
      listmetaMetaV1Continue: json['continue'] as String?,
      remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
      resourceVersion: json['resourceVersion'] as String?,
      selfLink: json['selfLink'] as String?,
    );

Map<String, dynamic> _$ListmetaMetaV1ToJson(ListmetaMetaV1 instance) =>
    <String, dynamic>{
      'continue': instance.listmetaMetaV1Continue,
      'remainingItemCount': instance.remainingItemCount,
      'resourceVersion': instance.resourceVersion,
      'selfLink': instance.selfLink,
    };
