// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingAdvertiserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingAdvertiserModel _$SettingAdvertiserModelFromJson(
        Map<String, dynamic> json) =>
    SettingAdvertiserModel(
      value: json['value'] as int?,
      key: json['key'] as String?,
      txt: json['txt'] as String?,
    );

Map<String, dynamic> _$SettingAdvertiserModelToJson(
        SettingAdvertiserModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'txt': instance.txt,
      'value': instance.value,
    };
