// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdsRequest _$GetAdsRequestFromJson(Map<String, dynamic> json) =>
    GetAdsRequest(
      user_id: json['user_id'] as int?,
      page: json['page'] as int?,
      ads_types: json['ads_types'] as String?,
      filters: json['filters'] as String?,
      countries: json['countries'] as String?,
      areas: json['areas'] as String?,
      country_category: json['country_category'] as String?,
      distance_from: json['distance_from'] as int?,
      distance_to: json['distance_to'] as int?,
      name: json['name'] as String?,
      date_from: json['date_from'] as String?,
      date_to: json['date_to'] as String?,
    );

Map<String, dynamic> _$GetAdsRequestToJson(GetAdsRequest instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'ads_types': instance.ads_types,
      'filters': instance.filters,
      'countries': instance.countries,
      'areas': instance.areas,
      'country_category': instance.country_category,
      'page': instance.page,
      'distance_from': instance.distance_from,
      'distance_to': instance.distance_to,
      'name': instance.name,
      'date_from': instance.date_from,
      'date_to': instance.date_to,
    };
