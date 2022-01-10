// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MLoginRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MLoginRequest _$MLoginRequestFromJson(Map<String, dynamic> json) =>
    MLoginRequest(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      fcm_token: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$MLoginRequestToJson(MLoginRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'fcm_token': instance.fcm_token,
    };
