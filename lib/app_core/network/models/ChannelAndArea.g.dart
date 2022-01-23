// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelAndArea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelAndArea _$ChannelAndAreaFromJson(Map<String, dynamic> json) =>
    ChannelAndArea(
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelAndAreaToJson(ChannelAndArea instance) =>
    <String, dynamic>{
      'channels': instance.channels,
      'areas': instance.areas,
    };
