// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterCompanyResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCompanyResponse _$RegisterCompanyResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterCompanyResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data']? null
          : Company.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterCompanyResponseToJson(
        RegisterCompanyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
