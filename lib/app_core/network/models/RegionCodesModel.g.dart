// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegionCodesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionCodesModel _$RegionCodesModelFromJson(Map<String, dynamic> json) =>
    RegionCodesModel(
      name: json['name'] as String?,
      dial_code: json['dial_code'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$RegionCodesModelToJson(RegionCodesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dial_code': instance.dial_code,
      'code': instance.code,
    };
