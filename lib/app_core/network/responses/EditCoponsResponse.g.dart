// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EditCoponsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditCoponsResponse _$EditCoponsResponseFromJson(Map<String, dynamic> json) =>
    EditCoponsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CoponModelResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditCoponsResponseToJson(EditCoponsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
