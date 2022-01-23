// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelsResponse _$ChannelsResponseFromJson(Map<String, dynamic> json) =>
    ChannelsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChannelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelsResponseToJson(ChannelsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
