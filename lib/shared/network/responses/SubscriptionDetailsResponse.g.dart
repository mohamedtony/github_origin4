// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDetailsResponse _$SubscriptionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SubscriptionDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionDetailsResponseToJson(
        SubscriptionDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
