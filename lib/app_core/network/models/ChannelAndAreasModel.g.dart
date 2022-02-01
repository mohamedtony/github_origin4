// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelAndAreasModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelAndAreasModel _$ChannelAndAreasModelFromJson(
        Map<String, dynamic> json) =>
    ChannelAndAreasModel(
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelAndAreasModelToJson(
        ChannelAndAreasModel instance) =>
    <String, dynamic>{
      'channels': instance.channels,
      'areas': instance.areas,
    };
