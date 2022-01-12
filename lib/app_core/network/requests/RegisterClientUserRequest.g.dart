// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterClientUserRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterClientUserRequest _$RegisterClientUserRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterClientUserRequest(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      accountName: json['account_name'] as String?,
      areaId: json['area_id'] as String?,
      countryId: json['country_id'] as String?,
      fcmToken: json['fcm_token'] as String?,
      password: json['password'] as String?,
      personalId: json['personal_id'] as String?,
      role: json['role'] as String?,
      type: json['type'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$RegisterClientUserRequestToJson(
        RegisterClientUserRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'username': instance.username,
      'type': instance.type,
      'account_name': instance.accountName,
      'personal_id': instance.personalId,
      'country_id': instance.countryId,
      'area_id': instance.areaId,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
    };
