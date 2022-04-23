// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowOnAppResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowOnAppResponse _$ShowOnAppResponseFromJson(Map<String, dynamic> json) =>
    ShowOnAppResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as int?,
    );

Map<String, dynamic> _$ShowOnAppResponseToJson(ShowOnAppResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
