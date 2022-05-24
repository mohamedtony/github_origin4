// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRequestsSortsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRequestsSortsModel _$MyRequestsSortsModelFromJson(
        Map<String, dynamic> json) =>
    MyRequestsSortsModel(
      oldest: json['oldest'] as String?,
      latest: json['latest'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$MyRequestsSortsModelToJson(
        MyRequestsSortsModel instance) =>
    <String, dynamic>{
      'oldest': instance.oldest,
      'latest': instance.latest,
      'date': instance.date,
    };
