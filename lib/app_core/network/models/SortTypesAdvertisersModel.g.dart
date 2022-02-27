// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SortTypesAdvertisersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortTypesAdvertisersModel _$SortTypesAdvertisersModelFromJson(
        Map<String, dynamic> json) =>
    SortTypesAdvertisersModel(
      reply_speed: json['reply_speed'] as String?,
      oldest: json['oldest'] as String?,
      latest: json['latest'] as String?,
      top_rated: json['top_rated'] as String?,
      most_ads: json['most_ads'] as String?,
      most_followers: json['most_followers'] as String?,
      less_followers: json['less_followers'] as String?,
    );

Map<String, dynamic> _$SortTypesAdvertisersModelToJson(
        SortTypesAdvertisersModel instance) =>
    <String, dynamic>{
      'reply_speed': instance.reply_speed,
      'oldest': instance.oldest,
      'latest': instance.latest,
      'top_rated': instance.top_rated,
      'most_ads': instance.most_ads,
      'most_followers': instance.most_followers,
      'less_followers': instance.less_followers,
    };
