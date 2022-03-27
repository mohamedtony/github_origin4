// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvertiserProfileDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiserProfileDetailsResponse _$AdvertiserProfileDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AdvertiserProfileDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AdvertiserProfileModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertiserProfileDetailsResponseToJson(
        AdvertiserProfileDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
