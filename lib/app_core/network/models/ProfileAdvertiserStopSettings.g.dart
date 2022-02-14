// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileAdvertiserStopSettings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAdvertiserStopSettings _$ProfileAdvertiserStopSettingsFromJson(
        Map<String, dynamic> json) =>
    ProfileAdvertiserStopSettings(
      stop_account: json['stop_account'] as String?,
      stop_from: json['stop_from'] as String?,
      stop_to: json['stop_to'] as String?,
      stop_text: json['stop_text'] as String?,
    )..stop_reason_id = json['stop_reason_id'] as String?;

Map<String, dynamic> _$ProfileAdvertiserStopSettingsToJson(
        ProfileAdvertiserStopSettings instance) =>
    <String, dynamic>{
      'stop_account': instance.stop_account,
      'stop_reason_id': instance.stop_reason_id,
      'stop_from': instance.stop_from,
      'stop_to': instance.stop_to,
      'stop_text': instance.stop_text,
    };
