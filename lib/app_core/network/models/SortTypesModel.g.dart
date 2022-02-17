// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SortTypesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortTypesModel _$SortTypesModelFromJson(Map<String, dynamic> json) =>
    SortTypesModel(
      title: json['title'] as String?,
      values: json['values'] == null
          ? null
          : FilterValuesModel.fromJson(json['values'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SortTypesModelToJson(SortTypesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'values': instance.values,
    };
