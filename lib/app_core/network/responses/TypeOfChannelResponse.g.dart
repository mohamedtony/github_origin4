// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypeOfChannelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOfChannelResponse _$TypeOfChannelResponseFromJson(
        Map<String, dynamic> json) =>
    TypeOfChannelResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TypeOfChannelModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeOfChannelResponseToJson(
        TypeOfChannelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
