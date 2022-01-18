// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClientProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProfileModel _$ClientProfileModelFromJson(Map<String, dynamic> json) =>
    ClientProfileModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      account_name: json['account_name'] as String?,
      personal_id: json['personal_id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
      blocked_at: json['blocked_at'] as bool?,
      country_id: json['country_id'] as int?,
      area_id: json['area_id'] as int?,
      token: json['token'] as String?,
      chat: json['chat'] as bool?,
    );

Map<String, dynamic> _$ClientProfileModelToJson(ClientProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'account_name': instance.account_name,
      'personal_id': instance.personal_id,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'role': instance.role,
      'image': instance.image,
      'blocked_at': instance.blocked_at,
      'country_id': instance.country_id,
      'area_id': instance.area_id,
      'token': instance.token,
      'chat': instance.chat,
    };
