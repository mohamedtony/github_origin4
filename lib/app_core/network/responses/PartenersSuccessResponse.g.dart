// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartenersSuccessResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartenersSuccessResponse _$PartenersSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    PartenersSuccessResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PartnerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartenersSuccessResponseToJson(
        PartenersSuccessResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
