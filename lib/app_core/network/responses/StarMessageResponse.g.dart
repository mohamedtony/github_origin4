// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StarMessageResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarMessageResponse _$StarMessageResponseFromJson(Map<String, dynamic> json) =>
    StarMessageResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : StarModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarMessageResponseToJson(
        StarMessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
