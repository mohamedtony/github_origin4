// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_client_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginClientRequest _$LoginClientRequestFromJson(Map<String, dynamic> json) =>
    LoginClientRequest(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginClientRequestToJson(LoginClientRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };
