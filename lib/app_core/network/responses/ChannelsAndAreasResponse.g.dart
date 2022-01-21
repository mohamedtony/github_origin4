// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelsAndAreasResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelsAndAreasResponse _$ChannelsAndAreasResponseFromJson(
        Map<String, dynamic> json) =>
    ChannelsAndAreasResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ChannelAndArea.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelsAndAreasResponseToJson(
        ChannelsAndAreasResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
