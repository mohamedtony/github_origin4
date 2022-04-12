// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FromUserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FromUserModel _$FromUserModelFromJson(Map<String, dynamic> json) =>
    FromUserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FromUserModelToJson(FromUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
    };
