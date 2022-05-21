// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRequestFiltersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRequestFiltersResponse _$MyRequestFiltersResponseFromJson(
        Map<String, dynamic> json) =>
    MyRequestFiltersResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GetMyRequestsFilterForm.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyRequestFiltersResponseToJson(
        MyRequestFiltersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
