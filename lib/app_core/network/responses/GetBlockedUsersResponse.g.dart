// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetBlockedUsersResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlockedUsersResponse _$GetBlockedUsersResponseFromJson(
        Map<String, dynamic> json) =>
    GetBlockedUsersResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BlockedUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBlockedUsersResponseToJson(
        GetBlockedUsersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
