// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListChatResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListChatResponse _$ListChatResponseFromJson(Map<String, dynamic> json) =>
    ListChatResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListChatResponseToJson(ListChatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
