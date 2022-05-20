// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SetRulesRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetRulesRequest _$SetRulesRequestFromJson(Map<String, dynamic> json) =>
    SetRulesRequest(
      roles: (json['roles'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SetRulesRequestToJson(SetRulesRequest instance) =>
    <String, dynamic>{
      'roles': instance.roles,
    };
