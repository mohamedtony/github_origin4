// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetGallaryRequestFilter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGallaryRequestFilter _$GetGallaryRequestFilterFromJson(
        Map<String, dynamic> json) =>
    GetGallaryRequestFilter(
      filters: (json['filters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGallaryRequestFilterToJson(
        GetGallaryRequestFilter instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'users': instance.users,
      'services': instance.services,
    };
