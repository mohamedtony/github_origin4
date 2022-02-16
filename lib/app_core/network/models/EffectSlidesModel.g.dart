// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EffectSlidesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectSlidesModel _$EffectSlidesModelFromJson(Map<String, dynamic> json) =>
    EffectSlidesModel(
      id: json['id'] as int?,
      name: json['name'] == null
          ? null
          : EffectSlidesNameModel.fromJson(
              json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EffectSlidesModelToJson(EffectSlidesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
