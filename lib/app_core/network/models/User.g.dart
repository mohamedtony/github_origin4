// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      personalId: json['personal_id'] as String?,
      password: json['password'] as String?,
      sgl: json['sgl'] as String?,
      countryId: json['country_id'] as int?,
      areaId: json['area_id'] as int?,
      accountName: json['account_name'] as String?,
    )
      ..blockedAt = json['blocked_at'] as bool?
      ..token = json['token'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'image': instance.image,
      'username': instance.username,
      'type': instance.type,
      'account_name': instance.accountName,
      'personal_id': instance.personalId,
      'country_id': instance.countryId,
      'area_id': instance.areaId,
      'password': instance.password,
      'blocked_at': instance.blockedAt,
      'token': instance.token,
      'sgl': instance.sgl,
    };
