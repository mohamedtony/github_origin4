// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponse _$QuestionsResponseFromJson(Map<String, dynamic> json) =>
    QuestionsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsResponseToJson(QuestionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
