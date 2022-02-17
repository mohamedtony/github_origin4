// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvertiserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiserModel _$AdvertiserModelFromJson(Map<String, dynamic> json) =>
    AdvertiserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
      requests: json['requests'] == null
          ? null
          : AdvertiserStatistics.fromJson(
              json['requests'] as Map<String, dynamic>),
      socials: json['socials'] == null
          ? null
          : SocialsModel.fromJson(json['socials'] as Map<String, dynamic>),
      rate: json['rate'] as String?,
      payments: json['payments'] as int?,
      added_from: json['added_from'] as String?,
      whatsapp: json['whatsapp'] as String?,
      company_name: json['company_name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$AdvertiserModelToJson(AdvertiserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payments': instance.payments,
      'username': instance.username,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'role': instance.role,
      'company_name': instance.company_name,
      'rate': instance.rate,
      'image': instance.image,
      'added_from': instance.added_from,
      'requests': instance.requests,
      'socials': instance.socials,
    };
