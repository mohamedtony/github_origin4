// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdsListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdsListResponse _$GetAdsListResponseFromJson(Map<String, dynamic> json) =>
    GetAdsListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AdsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAdsListResponseToJson(GetAdsListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
