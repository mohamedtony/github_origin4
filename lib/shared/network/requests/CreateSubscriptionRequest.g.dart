// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateSubscriptionRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSubscriptionRequest _$CreateSubscriptionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateSubscriptionRequest(
      period_id: json['period_id'] as int?,
      payment_method: json['payment_method'] as String?,
      execute: json['execute'] as int?,
    );

Map<String, dynamic> _$CreateSubscriptionRequestToJson(
        CreateSubscriptionRequest instance) =>
    <String, dynamic>{
      'period_id': instance.period_id,
      'payment_method': instance.payment_method,
      'execute': instance.execute,
    };
