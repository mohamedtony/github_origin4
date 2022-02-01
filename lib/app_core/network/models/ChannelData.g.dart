// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelData _$ChannelDataFromJson(Map<String, dynamic> json) => ChannelData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      followers_to: json['followers_to'] as int?,
      followers_from: json['followers_from'] as int?,
      status: json['status'] as int?,
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
      boys: json['boys'] as int?,
      girls: json['girls'] as int?,
      link: json['link'] as String?,
      men: json['men'] as int?,
      women: json['women'] as int?,
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    )
      ..user_id = json['user_id'] as int?
      ..channel_id = json['channel_id'] as int?;

Map<String, dynamic> _$ChannelDataToJson(ChannelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'channel_id': instance.channel_id,
      'name': instance.name,
      'link': instance.link,
      'followers_from': instance.followers_from,
      'followers_to': instance.followers_to,
      'men': instance.men,
      'women': instance.women,
      'boys': instance.boys,
      'girls': instance.girls,
      'areas': instance.areas,
      'status': instance.status,
      'channel': instance.channel,
          'type': instance.type,
    };
