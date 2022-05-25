// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetNotificationRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationRequest _$GetNotificationRequestFromJson(
        Map<String, dynamic> json) =>
    GetNotificationRequest(
      sort: json['sort'] as String?,
      page: json['page'] as int?,
      filters: json['filters'] as String?,
      from_date: json['from_date'] as String?,
      to_date: json['to_date'] as String?,
    );

Map<String, dynamic> _$GetNotificationRequestToJson(
        GetNotificationRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'page': instance.page,
      'sort': instance.sort,
      'from_date': instance.from_date,
      'to_date': instance.to_date,
    };
