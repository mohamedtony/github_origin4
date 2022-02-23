// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateAdvertiseRequestResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdvertiseRequestResponse _$CreateAdvertiseRequestResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAdvertiseRequestResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RequestData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAdvertiseRequestResponseToJson(
        CreateAdvertiseRequestResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
