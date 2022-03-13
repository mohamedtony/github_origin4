// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCancelReasonsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCancelReasonsResponse _$GetCancelReasonsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCancelReasonsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCancelReasonsResponseToJson(
        GetCancelReasonsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
