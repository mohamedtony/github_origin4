// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCategoriesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponse _$GetCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetCategoryModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesResponseToJson(
        GetCategoriesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
