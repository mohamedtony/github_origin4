// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddCommentRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentRequest _$AddCommentRequestFromJson(Map<String, dynamic> json) =>
    AddCommentRequest(
      comment: json['comment'] as String?,
      clientId: json['clientId'] as int?,
    );

Map<String, dynamic> _$AddCommentRequestToJson(AddCommentRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'clientId': instance.clientId,
    };
