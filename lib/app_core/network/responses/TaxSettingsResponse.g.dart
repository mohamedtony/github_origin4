// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxSettingsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxSettingsResponse _$TaxSettingsResponseFromJson(Map<String, dynamic> json) =>
    TaxSettingsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TaxSettingsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaxSettingsResponseToJson(
        TaxSettingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
