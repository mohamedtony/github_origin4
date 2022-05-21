// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdsFilterForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdsFilterForm _$GetAdsFilterFormFromJson(Map<String, dynamic> json) =>
    GetAdsFilterForm(
      filters: (json['filters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => AdTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAdsFilterFormToJson(GetAdsFilterForm instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'types': instance.types,
      'areas': instance.areas,
      'countries': instance.countries,
    };
