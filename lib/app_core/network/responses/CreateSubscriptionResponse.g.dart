// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateSubscriptionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSubscriptionResponse _$CreateSubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    CreateSubscriptionResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$CreateSubscriptionResponseToJson(
        CreateSubscriptionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
