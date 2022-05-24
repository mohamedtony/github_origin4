// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAdvertisersCoponsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdvertisersCoponsRequest _$GetAdvertisersCoponsRequestFromJson(
        Map<String, dynamic> json) =>
    GetAdvertisersCoponsRequest(
      filters: json['filters'] as String?,
      store_name: json['store_name'] as String?,
      page: json['page'] as int?,
      users: json['users'] as String?,
    );

Map<String, dynamic> _$GetAdvertisersCoponsRequestToJson(
        GetAdvertisersCoponsRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'store_name': instance.store_name,
      'page': instance.page,
      'users': instance.users,
    };
