// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdDetailsResponse _$AdDetailsResponseFromJson(Map<String, dynamic> json) =>
    AdDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AdsListModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdDetailsResponseToJson(AdDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
