// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      channel_type: json['channel_type'] as int?,
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'channel_type': instance.channel_type,
      'image': instance.image,
    };
