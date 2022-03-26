// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StopOrActivateResponse .dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopOrActivateResponse _$StopOrActivateResponseFromJson(
        Map<String, dynamic> json) =>
    StopOrActivateResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as int?,
    );

Map<String, dynamic> _$StopOrActivateResponseToJson(
        StopOrActivateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
