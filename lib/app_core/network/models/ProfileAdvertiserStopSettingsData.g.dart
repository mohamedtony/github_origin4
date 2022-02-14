// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileAdvertiserStopSettingsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAdvertiserStopSettingsData _$ProfileAdvertiserStopSettingsDataFromJson(
        Map<String, dynamic> json) =>
    ProfileAdvertiserStopSettingsData(
      reasons: (json['reasons'] as List<dynamic>?)
          ?.map((e) => ReasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] == null
          ? null
          : ProfileAdvertiserStopSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileAdvertiserStopSettingsDataToJson(
        ProfileAdvertiserStopSettingsData instance) =>
    <String, dynamic>{
      'reasons': instance.reasons,
      'settings': instance.settings,
    };
