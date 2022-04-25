// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageChatModel _$MessageChatModelFromJson(Map<String, dynamic> json) =>
    MessageChatModel(
      to_user_id: json['to_user_id'] as String?,
      message: json['message'] as String?,
      room: json['room'] as String?,
      video: json['video'] as String?,
      from_user_id: json['from_user_id'] as int?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      replied_message: json['replied_message'] == null
          ? null
          : RepliedMessage.fromJson(
              json['replied_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageChatModelToJson(MessageChatModel instance) =>
    <String, dynamic>{
      'to_user_id': instance.to_user_id,
      'message': instance.message,
      'room': instance.room,
      'video': instance.video,
      'image': instance.image,
      'type': instance.type,
      'from_user_id': instance.from_user_id,
      'replied_message': instance.replied_message,
    };
