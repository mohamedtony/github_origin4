// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
