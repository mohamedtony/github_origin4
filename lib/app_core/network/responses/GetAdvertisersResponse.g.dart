// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersResponse _$GetAdvertisersResponseFromJson(
        Map<String, dynamic> json) =>
    GetAdvertisersResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetAdvertisersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAdvertisersResponseToJson(
        GetAdvertisersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
