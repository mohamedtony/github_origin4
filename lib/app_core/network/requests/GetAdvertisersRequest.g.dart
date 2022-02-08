// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersRequest _$GetAdvertisersRequestFromJson(
        Map<String, dynamic> json) =>
    GetAdvertisersRequest(
      sort_by: json['sort_by'] as String?,
      categories:
          (json['categories'] as List<dynamic>?)?.map((e) => e as int).toList(),
      countries:
          (json['countries'] as List<dynamic>?)?.map((e) => e as int).toList(),
      areas: (json['areas'] as List<dynamic>?)?.map((e) => e as int).toList(),
      country_category: (json['country_category'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      keyword: json['keyword'] as String?,
    );

Map<String, dynamic> _$GetAdvertisersRequestToJson(
        GetAdvertisersRequest instance) =>
    <String, dynamic>{
      'sort_by': instance.sort_by,
      'categories': instance.categories,
      'countries': instance.countries,
      'areas': instance.areas,
      'country_category': instance.country_category,
      'keyword': instance.keyword,
    };
