// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDetail _$SubscriptionDetailFromJson(Map<String, dynamic> json) =>
    SubscriptionDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      commission: (json['commission'] as num?)?.toDouble(),
      subscribers_count: json['subscribers_count'] as int?,
      image: json['image'] as String?,
      settings: (json['settings'] as List<dynamic>?)
          ?.map((e) =>
              SubscriptionSettingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      periods: (json['periods'] as List<dynamic>?)
          ?.map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      first_period: json['first_period'] == null
          ? null
          : PeriodModel.fromJson(json['first_period'] as Map<String, dynamic>),
      free_txt: json['free_txt'] as String?,
    );

Map<String, dynamic> _$SubscriptionDetailToJson(SubscriptionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'commission': instance.commission,
      'image': instance.image,
      'subscribers_count': instance.subscribers_count,
      'first_period': instance.first_period,
      'settings': instance.settings,
      'periods': instance.periods,
      'free_txt': instance.free_txt,
    };
