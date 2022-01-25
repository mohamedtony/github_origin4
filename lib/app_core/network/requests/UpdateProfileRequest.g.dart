// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateProfileRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      chat: json['chat'] as int?,
      area_id: json['area_id'] as int?,
      country_id: json['country_id'] as int?,
      personal_id: json['personal_id'] as String?,
      email: json['email'] as String?,
      account_name: json['account_name'] as String?,
      fcm_token: json['fcm_token'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
    UpdateProfileRequest instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'role': instance.role,
    'type': instance.type,
    'account_name': instance.account_name,
    'phone': instance.phone,
    'email': instance.email,
    'personal_id': instance.personal_id,
    'country_id': instance.country_id,
    'area_id': instance.area_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('fcm_token', instance.fcm_token);
  writeNotNull('chat', instance.chat);
  return val;
}
