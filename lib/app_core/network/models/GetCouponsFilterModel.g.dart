// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCouponsFilterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCouponsFilterModel _$GetCouponsFilterModelFromJson(
        Map<String, dynamic> json) =>
    GetCouponsFilterModel(
      filters: (json['filters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      stores:
          (json['stores'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetCouponsFilterModelToJson(
        GetCouponsFilterModel instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'stores': instance.stores,
    };
