// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoponModelRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoponModelRequest _$CoponModelRequestFromJson(Map<String, dynamic> json) =>
    CoponModelRequest(
      code: json['code'] as String?,
      name: json['name'] as String?,
      discount: json['discount'] as int?,
      ended_at: json['ended_at'] as String?,
      link: json['link'] as String?,
      uses: json['uses'] as int?,
    );

Map<String, dynamic> _$CoponModelRequestToJson(CoponModelRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'discount': instance.discount,
      'uses': instance.uses,
      'link': instance.link,
      'ended_at': instance.ended_at,
    };
