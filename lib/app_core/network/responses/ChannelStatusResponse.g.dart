// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelStatusResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelStatusResponse _$ChannelStatusResponseFromJson(
        Map<String, dynamic> json) =>
    ChannelStatusResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : StatusChannelModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelStatusResponseToJson(
        ChannelStatusResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
