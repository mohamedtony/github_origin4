// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateUserCategoryRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserCategoryRequest _$UpdateUserCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserCategoryRequest(
      categories:
          (json['categories'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$UpdateUserCategoryRequestToJson(
        UpdateUserCategoryRequest instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
