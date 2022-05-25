// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetGalleryFilterResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGalleryFilterResponse _$GetGalleryFilterResponseFromJson(
        Map<String, dynamic> json) =>
    GetGalleryFilterResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetGallaryRequestFilter.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGalleryFilterResponseToJson(
        GetGalleryFilterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
