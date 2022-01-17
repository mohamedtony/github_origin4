// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetMyProfileInfoResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyProfileInfoResponse _$GetMyProfileInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetMyProfileInfoResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ClientProfileModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMyProfileInfoResponseToJson(
        GetMyProfileInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
