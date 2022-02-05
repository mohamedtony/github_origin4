// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckPhoneModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPhoneModel _$CheckPhoneModelFromJson(Map<String, dynamic> json) =>
    CheckPhoneModel(
      exists: json['exists'] as bool?,
      has_code: json['has_code'] as bool?,
      has_account: json['has_account'] as bool?,
    );

Map<String, dynamic> _$CheckPhoneModelToJson(CheckPhoneModel instance) =>
    <String, dynamic>{
      'exists': instance.exists,
      'has_code': instance.has_code,
      'has_account': instance.has_account,
    };
