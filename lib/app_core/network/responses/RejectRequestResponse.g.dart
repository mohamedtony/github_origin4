// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RejectRequestResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectRequestResponse _$RejectRequestResponseFromJson(
        Map<String, dynamic> json) =>
    RejectRequestResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ReasonDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectRequestResponseToJson(
        RejectRequestResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
