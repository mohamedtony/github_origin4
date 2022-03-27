// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
