// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      url: json['url'] as String?,
      media: $enumDecodeNullable(_$MediaTypeEnumMap, json['media']),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'url': instance.url,
      'media': _$MediaTypeEnumMap[instance.media],
      'duration': instance.duration?.inMicroseconds,
      'user': instance.user,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
  MediaType.audio: 'audio',
};
