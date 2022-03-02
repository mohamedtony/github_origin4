// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LinkModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => LinkModel(
      id: json['id'] as int?,
      ads_id: json['ads_id'] as int?,
      name: json['name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$LinkModelToJson(LinkModel instance) => <String, dynamic>{
      'id': instance.id,
      'ads_id': instance.ads_id,
      'name': instance.name,
      'link': instance.link,
    };
