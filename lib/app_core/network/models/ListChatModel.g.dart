// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListChatModel _$ListChatModelFromJson(Map<String, dynamic> json) =>
    ListChatModel(
      id: json['id'] as int?,
      room: json['room'] as String?,
      message_type: json['message_type'] as String?,
      message: json['message'] as String?,
      from_me: json['from_me'] as bool?,
      to_user: json['to_user'] == null
          ? null
          : ToUserModel.fromJson(json['to_user'] as Map<String, dynamic>),
      from_user: json['from_user'] == null
          ? null
          : FromUserModel.fromJson(json['from_user'] as Map<String, dynamic>),
      not_seen: json['not_seen'] as int?,
      sent_at: json['sent_at'] as String?,
      sent_from: json['sent_from'] as String?,
    );

Map<String, dynamic> _$ListChatModelToJson(ListChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'not_seen': instance.not_seen,
      'room': instance.room,
      'sent_at': instance.sent_at,
      'sent_from': instance.sent_from,
      'message_type': instance.message_type,
      'message': instance.message,
      'from_me': instance.from_me,
      'from_user': instance.from_user,
      'to_user': instance.to_user,
    };
