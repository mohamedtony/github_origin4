// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvertiserProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiserProfileModel _$AdvertiserProfileModelFromJson(
        Map<String, dynamic> json) =>
    AdvertiserProfileModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      role: json['role'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      reply_speed: json['reply_speed'] as String?,
      added_from: json['added_from'] as String?,
      manager_name: json['manager_name'] as String?,
      company_name: json['company_name'] as String?,
      phone: json['phone'] as String?,
      ads_count: json['ads_count'] as int?,
      account_name: json['account_name'] as String?,
      email: json['email'] as String?,
      followers: json['followers'] as int?,
      gender: json['gender'] as String?,
      is_followed: json['is_followed'] as bool?,
      is_liked: json['is_liked'] as bool?,
    );

Map<String, dynamic> _$AdvertiserProfileModelToJson(
        AdvertiserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'account_name': instance.account_name,
      'company_name': instance.company_name,
      'manager_name': instance.manager_name,
      'role': instance.role,
      'rate': instance.rate,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'added_from': instance.added_from,
      'reply_speed': instance.reply_speed,
      'followers': instance.followers,
      'ads_count': instance.ads_count,
      'channels': instance.channels,
      'is_followed': instance.is_followed,
      'is_liked': instance.is_liked,
      'country': instance.country,
    };
