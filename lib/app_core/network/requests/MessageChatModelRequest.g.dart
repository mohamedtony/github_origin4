// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageChatModelRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageChatModelRequest _$MessageChatModelRequestFromJson(
        Map<String, dynamic> json) =>
    MessageChatModelRequest(
      to_user_id: json['to_user_id'] as String?,
      message: json['message'] as String?,
      room: json['room'] as String?,
      video: json['video'] as String?,
      from_user_id: json['from_user_id'] as int?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      message_id: json['message_id'] as int?,
      replied_come_from: json['replied_come_from'] as int?,
    );

Map<String, dynamic> _$MessageChatModelRequestToJson(
        MessageChatModelRequest instance) =>
    <String, dynamic>{
      'to_user_id': instance.to_user_id,
      'message': instance.message,
      'room': instance.room,
      'video': instance.video,
      'image': instance.image,
      'type': instance.type,
      'from_user_id': instance.from_user_id,
      'replied_come_from': instance.replied_come_from,
      'message_id': instance.message_id,
    };
