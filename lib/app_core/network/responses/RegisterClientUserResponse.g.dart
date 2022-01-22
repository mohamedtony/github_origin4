// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterClientUserResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterClientUserResponse _$RegisterClientUserResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterClientUserResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterClientUserResponseToJson(
        RegisterClientUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
