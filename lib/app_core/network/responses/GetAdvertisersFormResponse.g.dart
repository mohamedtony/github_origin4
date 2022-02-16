// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersFormResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersFormResponse _$GetAdvertisersFormResponseFromJson(
        Map<String, dynamic> json) =>
    GetAdvertisersFormResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetAdvertisersFromModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAdvertisersFormResponseToJson(
        GetAdvertisersFormResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
