// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddRulesRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRulesRequest _$AddRulesRequestFromJson(Map<String, dynamic> json) =>
    AddRulesRequest(
      roles: (json['roles'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AddRulesRequestToJson(AddRulesRequest instance) =>
    <String, dynamic>{
      'roles': instance.roles,
    };
