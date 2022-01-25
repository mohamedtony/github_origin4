// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUseLocationsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUseLocationsResponse _$GetUseLocationsResponseFromJson(
        Map<String, dynamic> json) =>
    GetUseLocationsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CountriesAreasModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUseLocationsResponseToJson(
        GetUseLocationsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
