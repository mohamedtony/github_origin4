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
      is_liked: json['is_liked'] as bool?,
      time_ago: json['time_ago'] as String?,
      in_blacklist: json['in_blacklist'] as bool?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      rate: json['rate'] as int?,
      is_ads_in_front: json['is_ads_in_front'] as bool?,
      is_notified_user: json['is_notified_user'] as bool?,
    );

Map<String, dynamic> _$UserAdsListToJson(UserAdsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'address': instance.address,
      'is_liked': instance.is_liked,
      'in_blacklist': instance.in_blacklist,
      'rate': instance.rate,
      'is_ads_in_front': instance.is_ads_in_front,
      'is_notified_user': instance.is_notified_user,
      'country': instance.country,
      'time_ago': instance.time_ago,
    };
