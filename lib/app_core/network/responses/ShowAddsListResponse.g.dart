// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowAddsListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowAddsListResponse _$ShowAddsListResponseFromJson(
        Map<String, dynamic> json) =>
    ShowAddsListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowAddsListResponseToJson(
        ShowAddsListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
