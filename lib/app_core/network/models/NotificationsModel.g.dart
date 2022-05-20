// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    NotificationsModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      body: json['body'] as String?,
      created_at: json['created_at'] as String?,
      model_id: json['model_id'] as String?,
      type: json['type'] as String?,
      model_type: json['model_type'] as String?,
      starred: json['starred'] as int?,
      seen: json['seen'] as bool?,
    );

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'type': instance.type,
      'model_id': instance.model_id,
      'model_type': instance.model_type,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.created_at,
      'user': instance.user,
      'starred': instance.starred,
      'seen': instance.seen,
    };
