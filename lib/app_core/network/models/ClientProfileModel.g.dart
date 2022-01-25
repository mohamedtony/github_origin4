// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClientProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProfileModel _$ClientProfileModelFromJson(Map<String, dynamic> json) =>
    ClientProfileModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      manager_name: json['manager_name'] as String?,
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
      country: json['country'] == null
          ? null
          : CountryWithFlag.fromJson(json['country'] as Map<String, dynamic>),
      followers: json['followers'] as int?,
      rate: json['rate'] as String?,
      wallet: json['wallet'] as int?,
      ads_count: json['ads_count'] as int?,
      profile_completion: json['profile_completion'] as int?,
      reply_speed: json['reply_speed'] as String?,
      sgl: json['sgl'] as String?,
      points: json['points'] as int?,
    );

Map<String, dynamic> _$ClientProfileModelToJson(ClientProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'account_name': instance.account_name,
      'manager_name': instance.manager_name,
      'country': instance.country,
      'personal_id': instance.personal_id,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'role': instance.role,
      'profile_completion': instance.profile_completion,
      'image': instance.image,
      'blocked_at': instance.blocked_at,
      'country_id': instance.country_id,
      'area_id': instance.area_id,
      'token': instance.token,
      'chat': instance.chat,
      'followers': instance.followers,
      'reply_speed': instance.reply_speed,
      'ads_count': instance.ads_count,
      'rate': instance.rate,
      'wallet': instance.wallet,
      'sgl': instance.sgl,
      'points': instance.points,
    };
