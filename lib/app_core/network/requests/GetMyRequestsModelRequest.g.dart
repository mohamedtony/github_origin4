// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetMyRequestsModelRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyRequestsModelRequest _$GetMyRequestsModelRequestFromJson(
        Map<String, dynamic> json) =>
    GetMyRequestsModelRequest(
      archive: json['archive'] as int?,
      filters: json['filters'] as String?,
      sort_by: json['sort_by'] as String?,
      advertiser_name: json['advertiser_name'] as String?,
      from_date: json['from_date'] as String?,
      areas: json['areas'] as String?,
      to_date: json['to_date'] as String?,
      keyword: json['keyword'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$GetMyRequestsModelRequestToJson(
        GetMyRequestsModelRequest instance) =>
    <String, dynamic>{
      'archive': instance.archive,
      'keyword': instance.keyword,
      'sort_by': instance.sort_by,
      'from_date': instance.from_date,
      'to_date': instance.to_date,
      'advertiser_name': instance.advertiser_name,
      'areas': instance.areas,
      'filters': instance.filters,
      'page': instance.page,
    };
