// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetStopProfileResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStopProfileResponse _$GetStopProfileResponseFromJson(
        Map<String, dynamic> json) =>
    GetStopProfileResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileAdvertiserStopSettingsData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStopProfileResponseToJson(
        GetStopProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
