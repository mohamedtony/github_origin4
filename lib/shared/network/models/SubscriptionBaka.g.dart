// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionBaka.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionBaka _$SubscriptionBakaFromJson(Map<String, dynamic> json) =>
    SubscriptionBaka(
      id: json['id'] as int?,
      name: json['name'] as String?,
      commission: json['commission'] as String?,
      subscribers_count: json['subscribers_count'] as int?,
      image: json['image'] as String?,
      first_period: json['first_period'] == null
          ? null
          : PeriodModel.fromJson(json['first_period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionBakaToJson(SubscriptionBaka instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'commission': instance.commission,
      'image': instance.image,
      'subscribers_count': instance.subscribers_count,
      'first_period': instance.first_period,
    };
