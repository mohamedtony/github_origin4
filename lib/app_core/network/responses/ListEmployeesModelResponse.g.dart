// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListEmployeesModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListEmployeesModelResponse _$ListEmployeesModelResponseFromJson(
        Map<String, dynamic> json) =>
    ListEmployeesModelResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      employee: (json['employee'] as List<dynamic>?)
          ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] as int?,
    );

Map<String, dynamic> _$ListEmployeesModelResponseToJson(
        ListEmployeesModelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'employee': instance.employee,
      'pagination': instance.pagination,
    };
