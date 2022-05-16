// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginClientResponse2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginClientResponse2 _$LoginClientResponse2FromJson(
        Map<String, dynamic> json) =>
    LoginClientResponse2(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$LoginClientResponse2ToJson(
        LoginClientResponse2 instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
