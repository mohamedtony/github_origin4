// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartenerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerModel _$PartnerModelFromJson(Map<String, dynamic> json) => PartnerModel(
      name: json['name'] as String?,
      content: json['content'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PartnerModelToJson(PartnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
    };
