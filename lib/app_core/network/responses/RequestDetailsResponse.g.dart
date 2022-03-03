// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDetailsResponse _$RequestDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    RequestDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RequestDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestDetailsResponseToJson(
        RequestDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
