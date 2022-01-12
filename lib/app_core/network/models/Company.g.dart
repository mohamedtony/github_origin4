// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      personalId: json['personal_id'] as String?,
      password: json['password'] as String?,
      image: json['image'] as String?,
      countryId: json['country_id'] as int?,
      areaId: json['area_id'] as int?,
      accountName: json['account_name'] as String?,
    )
      ..blockedAt = json['blocked_at'] as bool?
      ..token = json['token'] as String?;

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
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
      'image': instance.image,
      'blocked_at': instance.blockedAt,
      'token': instance.token,
    };
