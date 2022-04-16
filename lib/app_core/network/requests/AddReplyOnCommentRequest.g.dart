// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddReplyOnCommentRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReplyOnCommentRequest _$AddReplyOnCommentRequestFromJson(
        Map<String, dynamic> json) =>
    AddReplyOnCommentRequest(
      comment: json['comment'] as String?,
      commentId: json['commentId'] as int?,
    );

Map<String, dynamic> _$AddReplyOnCommentRequestToJson(
        AddReplyOnCommentRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'commentId': instance.commentId,
    };
