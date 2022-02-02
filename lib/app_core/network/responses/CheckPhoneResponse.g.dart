// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckPhoneResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPhoneResponse _$CheckPhoneResponseFromJson(Map<String, dynamic> json) =>
    CheckPhoneResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CheckPhoneModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckPhoneResponseToJson(CheckPhoneResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
