// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddEmployeeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmployeeResponse _$AddEmployeeResponseFromJson(Map<String, dynamic> json) =>
    AddEmployeeResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Employee.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$AddEmployeeResponseToJson(
        AddEmployeeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
