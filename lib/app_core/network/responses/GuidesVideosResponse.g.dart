// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GuidesVideosResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuidesVideosResponse _$GuidesVideosResponseFromJson(
        Map<String, dynamic> json) =>
    GuidesVideosResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuidesVideosResponseToJson(
        GuidesVideosResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
