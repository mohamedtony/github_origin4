// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCouponsFilterFormResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCouponsFilterFormResponse _$GetCouponsFilterFormResponseFromJson(
        Map<String, dynamic> json) =>
    GetCouponsFilterFormResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetCouponsFilterModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCouponsFilterFormResponseToJson(
        GetCouponsFilterFormResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
