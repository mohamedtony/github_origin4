// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetRulesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRulesResponse _$GetRulesResponseFromJson(Map<String, dynamic> json) =>
    GetRulesResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      rules: (json['rules'] as List<dynamic>?)
          ?.map((e) => Rules.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] as String?,
    );

Map<String, dynamic> _$GetRulesResponseToJson(GetRulesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'rules': instance.rules,
      'pagination': instance.pagination,
    };
