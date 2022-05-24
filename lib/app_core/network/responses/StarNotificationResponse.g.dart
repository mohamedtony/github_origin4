// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StarNotificationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarNotificationResponse _$StarNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    StarNotificationResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : StarNotificationModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarNotificationResponseToJson(
        StarNotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
