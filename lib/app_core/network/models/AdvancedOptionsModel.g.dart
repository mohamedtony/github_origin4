// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvancedOptionsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvancedOptionsModel _$AdvancedOptionsModelFromJson(
        Map<String, dynamic> json) =>
    AdvancedOptionsModel(
      chat_in_orders: json['chat_in_orders'] as int?,
      chat_out_orders: json['chat_out_orders'] as int?,
      contant_in_orders: json['contant_in_orders'] as int?,
      profile_ads_count: json['profile_ads_count'] as int?,
      profile_ads_views: json['profile_ads_views'] as int?,
      profile_followers_count: json['profile_followers_count'] as int?,
      profile_manager: json['profile_manager'] as int?,
      profile_rate: json['profile_rate'] as int?,
      profile_reply_speed: json['profile_reply_speed'] as int?,
      stop_receiving_orders: json['stop_receiving_orders'] as int?,
      whatsapp_in_orders: json['whatsapp_in_orders'] as int?,
    );

Map<String, dynamic> _$AdvancedOptionsModelToJson(
        AdvancedOptionsModel instance) =>
    <String, dynamic>{
      'chat_in_orders': instance.chat_in_orders,
      'contant_in_orders': instance.contant_in_orders,
      'whatsapp_in_orders': instance.whatsapp_in_orders,
      'chat_out_orders': instance.chat_out_orders,
      'stop_receiving_orders': instance.stop_receiving_orders,
      'profile_ads_views': instance.profile_ads_views,
      'profile_followers_count': instance.profile_followers_count,
      'profile_rate': instance.profile_rate,
      'profile_reply_speed': instance.profile_reply_speed,
      'profile_ads_count': instance.profile_ads_count,
      'profile_manager': instance.profile_manager,
    };
