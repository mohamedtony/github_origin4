// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestModelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModelData _$RequestModelDataFromJson(Map<String, dynamic> json) =>
    RequestModelData(
      requests: json['requests'] == null
          ? null
          : RequestModel.fromJson(json['requests'] as Map<String, dynamic>),
      sort_types: json['sort_types'] == null
          ? null
          : SortTypesModel.fromJson(json['sort_types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestModelDataToJson(RequestModelData instance) =>
    <String, dynamic>{
      'sort_types': instance.sort_types,
      'requests': instance.requests,
    };
