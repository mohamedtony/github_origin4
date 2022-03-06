// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RefuseOrderReasonResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefuseOrderReasonResponse _$RefuseOrderReasonResponseFromJson(
        Map<String, dynamic> json) =>
    RefuseOrderReasonResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$RefuseOrderReasonResponseToJson(
        RefuseOrderReasonResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
