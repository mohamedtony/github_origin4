// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestModelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModelData _$RequestModelDataFromJson(Map<String, dynamic> json) =>
    RequestModelData(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sort_types: (json['sort_types'] as List<dynamic>?)
          ?.map((e) => SortTypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestModelDataToJson(RequestModelData instance) =>
    <String, dynamic>{
      'sort_types': instance.sort_types,
      'requests': instance.requests,
      'pagination': instance.pagination,
    };
