// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoponsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoponsResponse _$CoponsResponseFromJson(Map<String, dynamic> json) =>
    CoponsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CoponModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoponsResponseToJson(CoponsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
