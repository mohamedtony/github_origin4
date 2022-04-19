// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddToFavoriteListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToFavoriteListModel _$AddToFavoriteListModelFromJson(
        Map<String, dynamic> json) =>
    AddToFavoriteListModel(
      liked: json['liked'] as int?,
      in_blacklist: json['in_blacklist'] as int?,
      is_liked: json['is_liked'] as int?,
      is_muted: json['is_muted'] as int?,
    );

Map<String, dynamic> _$AddToFavoriteListModelToJson(
        AddToFavoriteListModel instance) =>
    <String, dynamic>{
      'liked': instance.liked,
      'in_blacklist': instance.in_blacklist,
      'is_liked': instance.is_liked,
      'is_muted': instance.is_muted,
    };
