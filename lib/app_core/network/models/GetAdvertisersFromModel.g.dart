// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersFromModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersFromModel _$GetAdvertisersFromModelFromJson(
        Map<String, dynamic> json) =>
    GetAdvertisersFromModel(
      sort_types: json['sort_types'] == null
          ? null
          : SortTypesAdvertisersModel.fromJson(json['sort_types'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      effect_slides: (json['effect_slides'] as List<dynamic>?)
          ?.map((e) => EffectSlidesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAdvertisersFromModelToJson(
        GetAdvertisersFromModel instance) =>
    <String, dynamic>{
      'sort_types': instance.sort_types,
      'categories': instance.categories,
      'effect_slides': instance.effect_slides,
      'countries': instance.countries,
      'channels': instance.channels,
    };
