// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlockedUserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedUserModel _$BlockedUserModelFromJson(Map<String, dynamic> json) =>
    BlockedUserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      chat: json['chat'] as bool?,
    );

Map<String, dynamic> _$BlockedUserModelToJson(BlockedUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'chat': instance.chat,
    };
