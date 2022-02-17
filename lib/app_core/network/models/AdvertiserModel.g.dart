// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvertiserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiserModel _$AdvertiserModelFromJson(Map<String, dynamic> json) =>
    AdvertiserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AdvertiserModelToJson(AdvertiserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'image': instance.image,
    };
