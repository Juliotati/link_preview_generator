// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebInfo _$$_WebInfoFromJson(Map<String, dynamic> json) => _$_WebInfo(
      description: json['description'] as String,
      domain: json['domain'] as String,
      icon: json['icon'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$LinkPreviewTypeEnumMap, json['type']),
      video: json['video'] as String,
    );

Map<String, dynamic> _$$_WebInfoToJson(_$_WebInfo instance) =>
    <String, dynamic>{
      'description': instance.description,
      'domain': instance.domain,
      'icon': instance.icon,
      'image': instance.image,
      'title': instance.title,
      'type': _$LinkPreviewTypeEnumMap[instance.type]!,
      'video': instance.video,
    };

const _$LinkPreviewTypeEnumMap = {
  LinkPreviewType.def: 'def',
  LinkPreviewType.audio: 'audio',
  LinkPreviewType.image: 'image',
  LinkPreviewType.video: 'video',
  LinkPreviewType.amazon: 'amazon',
  LinkPreviewType.instagram: 'instagram',
  LinkPreviewType.twitter: 'twitter',
  LinkPreviewType.youtube: 'youtube',
  LinkPreviewType.error: 'error',
};
