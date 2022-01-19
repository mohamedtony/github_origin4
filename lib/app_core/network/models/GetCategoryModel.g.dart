// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryModel _$GetCategoryModelFromJson(Map<String, dynamic> json) =>
    GetCategoryModel(
      user_categories: (json['user_categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      all_categories: (json['all_categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryModelToJson(GetCategoryModel instance) =>
    <String, dynamic>{
      'user_categories': instance.user_categories,
      'all_categories': instance.all_categories,
    };
