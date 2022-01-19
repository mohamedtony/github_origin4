// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddRemoveBlackListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRemoveBlackListResponse _$AddRemoveBlackListResponseFromJson(
        Map<String, dynamic> json) =>
    AddRemoveBlackListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddRemoveBlackListModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRemoveBlackListResponseToJson(
        AddRemoveBlackListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
