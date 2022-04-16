// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RepostAdsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepostAdsResponse _$RepostAdsResponseFromJson(Map<String, dynamic> json) =>
    RepostAdsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$RepostAdsResponseToJson(RepostAdsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
