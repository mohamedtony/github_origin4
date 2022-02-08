// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersModel _$GetAdvertisersModelFromJson(Map<String, dynamic> json) =>
    GetAdvertisersModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      chat: json['chat'] as bool?,
      in_blacklist: json['in_blacklist'] as int?,
      is_liked: json['is_liked'] as bool?,
      is_muted: json['is_muted'] as bool?,
    );

Map<String, dynamic> _$GetAdvertisersModelToJson(
        GetAdvertisersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'chat': instance.chat,
      'in_blacklist': instance.in_blacklist,
      'is_liked': instance.is_liked,
      'is_muted': instance.is_muted,
    };
