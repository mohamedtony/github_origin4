// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserAdsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAdsList _$UserAdsListFromJson(Map<String, dynamic> json) => UserAdsList(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserAdsListToJson(UserAdsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'address': instance.address,
    };
