// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdsFilterFormResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdsFilterFormResponse _$GetAdsFilterFormResponseFromJson(
        Map<String, dynamic> json) =>
    GetAdsFilterFormResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetAdsFilterForm.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAdsFilterFormResponseToJson(
        GetAdsFilterFormResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
