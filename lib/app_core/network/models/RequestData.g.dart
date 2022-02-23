// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestData _$RequestDataFromJson(Map<String, dynamic> json) => RequestData(
      id: json['id'] as int?,
      advertiser: json['advertiser'] == null
          ? null
          : AdvertiserModel.fromJson(
              json['advertiser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestDataToJson(RequestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advertiser': instance.advertiser,
    };
