// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PeriodModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodModel _$PeriodModelFromJson(Map<String, dynamic> json) => PeriodModel(
      id: json['id'] as int?,
      subscription_id: json['subscription_id'] as int?,
      months_count: json['months_count'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      price_after_discount: (json['price_after_discount'] as num?)?.toDouble(),
      free_days: json['free_days'] as int?,
      free_txt: json['free_txt'] as String?,
    );

Map<String, dynamic> _$PeriodModelToJson(PeriodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscription_id': instance.subscription_id,
      'months_count': instance.months_count,
      'price': instance.price,
      'price_after_discount': instance.price_after_discount,
      'free_days': instance.free_days,
      'free_txt': instance.free_txt,
    };
