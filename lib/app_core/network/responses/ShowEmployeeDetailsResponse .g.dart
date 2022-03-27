// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowEmployeeDetailsResponse .dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowEmployeeDetailsResponse _$ShowEmployeeDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ShowEmployeeDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as int?,
    );

Map<String, dynamic> _$ShowEmployeeDetailsResponseToJson(
        ShowEmployeeDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
