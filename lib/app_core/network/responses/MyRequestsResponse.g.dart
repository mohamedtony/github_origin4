// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRequestsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRequestsResponse _$MyRequestsResponseFromJson(Map<String, dynamic> json) =>
    MyRequestsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RequestModelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyRequestsResponseToJson(MyRequestsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
