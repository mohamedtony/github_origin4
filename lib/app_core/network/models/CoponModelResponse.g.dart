// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoponModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoponModelResponse _$CoponModelResponseFromJson(Map<String, dynamic> json) =>
    CoponModelResponse(
      id: json['id'] as int?,
      started_at: json['started_at'] as String?,
      ended_at: json['ended_at'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      name: json['name'] as String?,
      uses: json['uses'] as int?,
      discount: json['discount'] as int?,
      code: json['code'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      ads_request_id: json['ads_request_id'] as int?,
      discount_type: json['discount_type'] as String?,
      user_id: json['user_id'] as int?,
    );

Map<String, dynamic> _$CoponModelResponseToJson(CoponModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'code': instance.code,
      'type': instance.type,
      'discount': instance.discount,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'name': instance.name,
      'image': instance.image,
      'uses': instance.uses,
      'description': instance.description,
      'user_id': instance.user_id,
      'ads_request_id': instance.ads_request_id,
      'discount_type': instance.discount_type,
    };