// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepliedMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepliedMessage _$RepliedMessageFromJson(Map<String, dynamic> json) =>
    RepliedMessage(
      id: json['id'] as int?,
      message_type: json['message_type'] as String?,
      message: json['message'] as String?,
      replied_message: json['replied_message'] as String?,
      sent_at: json['sent_at'] as String?,
      sent_from: json['sent_from'] as String?,
    );

Map<String, dynamic> _$RepliedMessageToJson(RepliedMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message_type': instance.message_type,
      'message': instance.message,
      'sent_at': instance.sent_at,
      'sent_from': instance.sent_from,
      'replied_message': instance.replied_message,
    };
