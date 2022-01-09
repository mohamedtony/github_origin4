// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscruptionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscruptionResponse _$SubscruptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscruptionResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubscriptionBaka.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscruptionResponseToJson(
        SubscruptionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
