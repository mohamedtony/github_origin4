// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormChannelsAndAreas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormChannelsAndAreas _$FormChannelsAndAreasFromJson(
        Map<String, dynamic> json) =>
    FormChannelsAndAreas(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ChannelAndAreasModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormChannelsAndAreasToJson(
        FormChannelsAndAreas instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
