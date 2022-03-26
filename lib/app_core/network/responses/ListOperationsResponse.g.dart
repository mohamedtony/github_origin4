// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListOperationsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOperationsResponse _$ListOperationsResponseFromJson(
        Map<String, dynamic> json) =>
    ListOperationsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListOperationsResponseToJson(
        ListOperationsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
