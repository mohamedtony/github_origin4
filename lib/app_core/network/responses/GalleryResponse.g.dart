// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryResponse _$GalleryResponseFromJson(Map<String, dynamic> json) =>
    GalleryResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GalleryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GalleryResponseToJson(GalleryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
