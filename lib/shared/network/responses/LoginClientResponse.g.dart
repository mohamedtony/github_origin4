// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginClientResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginClientResponse _$LoginClientResponseFromJson(Map<String, dynamic> json) =>
    LoginClientResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginClientResponseToJson(
        LoginClientResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
