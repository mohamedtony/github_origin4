// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvancedOptionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvancedOptionsResponse _$GetAdvancedOptionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAdvancedOptionsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AdvancedOptionsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAdvancedOptionsResponseToJson(
        GetAdvancedOptionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
