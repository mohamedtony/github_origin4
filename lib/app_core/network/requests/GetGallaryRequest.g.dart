// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetGallaryRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGallaryRequest _$GetGallaryRequestFromJson(Map<String, dynamic> json) =>
    GetGallaryRequest(
      categories: json['categories'] as String?,
      filters: json['filters'] as String?,
      user_id: json['user_id'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$GetGallaryRequestToJson(GetGallaryRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'user_id': instance.user_id,
      'categories': instance.categories,
      'page': instance.page,
    };
