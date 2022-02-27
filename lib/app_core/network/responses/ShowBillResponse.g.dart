// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowBillResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowBillResponse _$ShowBillResponseFromJson(Map<String, dynamic> json) =>
    ShowBillResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ShowBillModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowBillResponseToJson(ShowBillResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
