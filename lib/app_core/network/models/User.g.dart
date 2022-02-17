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
      blockedAt: json['blocked_at'] as bool?,
      company_name: json['company_name'] as String?,
      token: json['token'] as String?,
      whatsapp: json['whatsapp'] as String?,
      requests: json['requests'] == null
          ? null
          : AdvertiserStatistics.fromJson(
              json['requests'] as Map<String, dynamic>),
      added_from: json['added_from'] as String?,
      created_at: json['created_at'] as String?,
      payments: json['payments'] as int?,
      product_type: json['product_type'] == null
          ? null
          : ProductType.fromJson(json['product_type'] as Map<String, dynamic>),
      rate: json['rate'] as String?,
      socials: json['socials'] == null
          ? null
          : SocialsModel.fromJson(json['socials'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'payments': instance.payments,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'image': instance.image,
      'whatsapp': instance.whatsapp,
      'company_name': instance.company_name,
      'username': instance.username,
      'type': instance.type,
      'rate': instance.rate,
      'added_from': instance.added_from,
      'created_at': instance.created_at,
      'product_type': instance.product_type,
      'requests': instance.requests,
      'socials': instance.socials,
      'account_name': instance.accountName,
      'personal_id': instance.personalId,
      'country_id': instance.countryId,
      'area_id': instance.areaId,
      'password': instance.password,
      'blocked_at': instance.blockedAt,
      'token': instance.token,
      'sgl': instance.sgl,
    };
