// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as int?,
      ads_id: json['ads_id'] as int?,
      path: json['path'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      type: json['type'] as String?,
      video_id: json['video_id'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ads_id': instance.ads_id,
      'path': instance.path,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'type': instance.type,
      'video_id': instance.video_id,
    };
