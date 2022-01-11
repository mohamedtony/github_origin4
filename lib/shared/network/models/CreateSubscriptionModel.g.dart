// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateSubscriptionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSubscriptionModel _$CreateSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    CreateSubscriptionModel(
      subscription: json['subscription'] == null
          ? null
          : SubscriptionBaka.fromJson(
              json['subscription'] as Map<String, dynamic>),
      period: json['period'] == null
          ? null
          : PeriodModel.fromJson(json['period'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toDouble(),
      added_tax: (json['added_tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateSubscriptionModelToJson(
        CreateSubscriptionModel instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'period': instance.period,
      'total': instance.total,
      'added_tax': instance.added_tax,
      'discount': instance.discount,
    };
