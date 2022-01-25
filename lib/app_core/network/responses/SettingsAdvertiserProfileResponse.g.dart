// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingsAdvertiserProfileResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsAdvertiserProfileResponse _$SettingsAdvertiserProfileResponseFromJson(
        Map<String, dynamic> json) =>
    SettingsAdvertiserProfileResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => SettingAdvertiserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SettingsAdvertiserProfileResponseToJson(
        SettingsAdvertiserProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
